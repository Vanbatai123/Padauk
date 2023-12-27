// ===================================================================================
// Project:   TinyNeoController - NeoPixel Controller based on ATtiny10
// Version:   v1.0
// Year:      2021
// Author:    Stefan Wagner
// Github:    https://github.com/wagiminator
// EasyEDA:   https://easyeda.com/wagiminator
// License:   http://creativecommons.org/licenses/by-sa/3.0/
// ===================================================================================
//
// Description:
// ------------
// The NeoController was developed to test 800kHz NeoPixel strings with
// up to 255 pixels. Since there was still so much flash left in the
// ATtiny10, an IR receiver was integrated so that some parameters can
// be controlled with an IR remote control.
//
// References:
// -----------
// The Neopixel implementation is based on NeoCandle.
// https://github.com/wagiminator/ATtiny85-TinyCandle
//
// The IR receiver implementation (NEC protocol) is based on TinyDecoder
// https://github.com/wagiminator/ATtiny13-TinyDecoder
//
// Wiring:
// -------
//                       +-\/-+
// NEOPIXELS ----- PB0  1|°   |6  PB3 ---
//                 GND  2|    |5  Vcc
// IR RECEIVER --- PB1  3|    |4  PB2 ---
//                       +----+
//
// Compilation Settings:
// ---------------------
// Core:        ATtiny10Core (https://github.com/technoblogy/attiny10core)
// Chip:        ATtiny10
// Clock:       8 MHz

// Leave the rest on default settings. Don't forget to "Burn bootloader"!
// No Arduino core functions or libraries are used. Use the makefile if
// you want to compile without Arduino IDE.
//
// Fuse settings: -U BYTE0:w:0xff:m

// ===================================================================================
// Libraries and Definitions
// ===================================================================================

// Libraries
#define F_CPU 8000000UL
#include <avr/io.h> // for GPIO
// #include <avr/sleep.h>        // for sleep functions
#include <avr/interrupt.h> // for interrupts
#include <util/delay.h>	   // for delays

// Pin definitions
#define NEO_PIN 	2	 // Pin for neopixels
#define IR_PIN 		1 	// Pin for IR receiver
#define BUTTON_PIN 	0 	// Pin for button

// NeoPixel parameter
#define NEO_GRB		  // type of pixel: NEO_GRB, NEO_RGB or NEO_RGBW
#define NEO_PIXELS 	24 // number of pixels in the string (max 255)

// IR codes
#define IR_ADDR 	0x00 // IR device address

// #define IR_SPEED      0x03    // IR code for animation speed
#define IR_FAIL 	0xF1 // IR fail code

// COMANDOS CONTROL STANDARD

#define BIR_1 		0x45
#define BIR_2 		0x46
#define BIR_3 		0x47
#define BIR_4 		0x44
#define BIR_5 		0x40
#define BIR_6 		0x43
#define BIR_7 		0x07
#define BIR_8 		0x15
#define BIR_9 		0x09
#define BIR_AST 	0x16
#define BIR_0 		0x19
#define BIR_GATO 	0x0D
#define BIR_IZQ 	0x08
#define BIR_DER 	0x5A
#define BIR_ARR 	0x18
#define BIR_ABA 	0x52
#define BIR_OK 		0x1C

// Global variables
// uint8_t NEO_brightness = 2;   // 0..2
byte button_value;
bool button_flag = false;
bool button_press = false;

uint8_t light_mode = 0;
uint8_t command;
uint8_t mode_counter = 0;

const int PROGMEM mode_delay[4] = {220, 150, 150, 100};

const uint8_t PROGMEM mode[11] = {0x45, 0x46, 0x47, 0x44, 0x40, 0x43, 0x07, 0x08, 0x5A, 0x18, 0x52};

const uint8_t PROGMEM rv[4] = {0, 253, 216, 239};
const uint8_t PROGMEM gv[4] = {228, 84, 0, 0};
const uint8_t PROGMEM bv[4] = {255, 2, 235, 11};
const uint8_t PROGMEM rsv[8] = {0, 255, 55, 253, 255, 255, 239};
const uint8_t PROGMEM gsv[8] = {117, 0, 235, 84, 255, 242, 0};
const uint8_t PROGMEM bsv[8] = {216, 100, 0, 2, 255, 0, 11};
const uint8_t PROGMEM rfv = 0;
const uint8_t PROGMEM gfv = 255;
const uint8_t PROGMEM bfv[6] = {255, 200, 155, 100, 55, 0};
uint8_t hue = 0;
uint8_t hue1 = 0;
uint8_t huef = 0;

uint8_t lm = 0;

// ===================================================================================
// Neopixel Implementation for 8 MHz MCU Clock and 800 kHz Pixels
// ===================================================================================

// NeoPixel parameter and macros
#define NEO_init() DDRB |= (1 << NEO_PIN)		// set pixel DATA pin as output
#define BUTTON_init() DDRB |= (0 << BUTTON_PIN) // set BUTTON pin as input

/*
void BUTTON_init(void) {
  DDRB |= (0<<BUTTON_PIN); // set BUTTON pin as input
  //PORTB  |=  (1<<BUTTON_PIN);                     // pullup on IR pin
  PCMSK  |=  (1<<BUTTON_PIN);                     // enable interrupt on IR pin
}*/

// #define NEO_latch()   _delay_us(281)           // delay to show shifted colors

// Send a byte to the pixels string
void NEO_sendByte(uint8_t byte)
{
	uint8_t bit = 8; // 8 bits, MSB first
	asm volatile(
		"sbi  %[port], %[pin]   \n\t" // DATA HIGH
		"sbrs %[byte], 7        \n\t" // if "1"-bit skip next instruction
		"cbi  %[port], %[pin]   \n\t" // "0"-bit: DATA LOW after 3 cycles
		"add  %[byte], %[byte]  \n\t" // byte <<= 1
		"subi %[bit],  0x01     \n\t" // count--
		"cbi  %[port], %[pin]   \n\t" // "1"-bit: DATA LOW after 6 cycles
		"brne .-14              \n\t" // while(count)
		::
			[port] "I"(_SFR_IO_ADDR(PORTB)),
		[pin] "I"(NEO_PIN),
		[byte] "r"(byte),
		[bit] "r"(bit));
}

// Write color to a single pixel
void NEO_writeColor(uint8_t r, uint8_t g, uint8_t b)
{
#if defined(NEO_GRB)
	NEO_sendByte(g);
	NEO_sendByte(r);
	NEO_sendByte(b);
#elif defined(NEO_RGB)
	NEO_sendByte(r);
	NEO_sendByte(g);
	NEO_sendByte(b);
#elif defined(NEO_RGBW)
	NEO_sendByte(r);
	NEO_sendByte(g);
	NEO_sendByte(b);
	NEO_sendByte(0);
#else
#error Wrong or missing NeoPixel type definition!
#endif
}

// Switch off all pixels
/*
void NEO_clear(void) {
  cli();
  for(uint8_t i = NEO_PIXELS; i; i--) NEO_writeColor(0, 0, 0);
  sei();
}
*/

// Write hue value (0..191) to a single pixel
/*
void NEO_writeHue(uint8_t hue) {
  uint8_t phase = hue >> 6;
  uint8_t step  = (hue & 63) << 2;
  uint8_t nstep = (63 << 2) - step;
  switch(phase) {
	case 0:   NEO_writeColor(nstep,  step,     0); break;
	case 1:   NEO_writeColor(    0, nstep,  step); break;
	case 2:   NEO_writeColor( step,     0, nstep); break;
	default:  break;
  }
}
*/

// ===================================================================================
// IR Receiver Implementation (NEC Protocol) using Timer0
// ===================================================================================

// IR receiver definitions and macros
#define IR_available() 		(~PINB & (1 << IR_PIN))			  			// return true if IR line is low
#define IR_PRESCALER 		1024									  	// prescaler of the timer
#define IR_time(t) 			((F_CPU / 1000) * t) / IR_PRESCALER / 1000 	// convert us to counts
#define IR_TOP 				IR_time(12000UL)							// TOP value of timer (timeout)

// IR global variables
volatile uint8_t IR_dur;  // for storing duration of last burst/pause
volatile uint8_t IR_flag; // gets zero in pin change or time over

// IR initialize the receiver
void IR_init(void)
{
	PORTB |= (1 << IR_PIN);	 // pullup on IR pin
	PCMSK |= (1 << IR_PIN);	 // enable interrupt on IR pin
	PCICR |= (1 << PCIE0);	 // enable pin change interrupts
	OCR0A = IR_TOP;			 // timeout causes OCA interrupt
	TIMSK0 |= (1 << OCIE0A); // enable output compare match interrupt
}

// IR wait for signal change
void IR_wait(void)
{
	IR_flag = 1; // reset flag
	while (IR_flag)
		; // wait for pin change or timeout
}

// IR read data according to NEC protocol
uint8_t IR_read(void)
{
	uint32_t data; // variable for received data
	uint16_t addr; // variable for received address
	if (!IR_available())
		return IR_FAIL; // exit if no signal
	IR_wait();			// wait for end of start burst
	// if(IR_dur < IR_time(8000)) return IR_FAIL;  // exit if no start condition
	IR_wait(); // wait for end of start pause
	// if(IR_dur < IR_time(4000)) return IR_FAIL;  // exit if no start condition
	for (uint8_t i = 32; i; i--)
	{				// receive 32 bits
		data >>= 1; // LSB first
		IR_wait();	// wait for end of burst
		if (!IR_dur)
			return IR_FAIL; // exit if overflow
		IR_wait();			// wait for end of pause
		// if(!IR_dur) return IR_FAIL;               // exit if overflow
		if (IR_dur > IR_time(1124))
			data |= 0x80000000; // bit "0" or "1" depends on pause duration
	}
	IR_wait();				   // wait for end of final burst
	uint8_t addr1 = data;	   // get first  address byte
	uint8_t addr2 = data >> 8; // get second address byte
	uint8_t cmd1 = data >> 16; // get first  command byte
	uint8_t cmd2 = data >> 24; // get second command byte
	if ((cmd1 + cmd2) < 255)
		return IR_FAIL; // if second command byte is not the inverse of the first
	if ((addr1 + addr2) == 255)
		addr = addr1; // check if it's extended NEC-protocol ...
	else
		addr = data; // ... and get the correct address
	// if(addr != IR_ADDR) return IR_FAIL;         // wrong address
	return cmd1; // return command code
}

// Pin change interrupt service routine
ISR(PCINT0_vect)
{
	IR_dur = TCNT0L;                                   // save timer value
	TCNT0 = 0;                                         // reset timer0

	// mode 4 0100 CTC (Clear Timer on Compare) OCR0A Immediate MAX
	TCCR0B = (1 << WGM02) | (1 << CS02) | (1 << CS00); // start timer0 CTC with prescaler 1024
	IR_flag = 0;                                       // raise flag
}

// Timer0 overflow interrupt service routine (timeout)
ISR(TIM0_COMPA_vect)
{
	TCCR0B = 0;		// stop timer0
	TCNT0 = 0;		// reset timer0
	IR_flag = 0;	// raise flag
	IR_dur = 0;		// set duration value to zero
}

// ===================================================================================
// Standby Implementation
// ===================================================================================

// Go to standby mode

void standby(void)
{
	//  NEO_clear();                                // turn off NeoPixels
	changeColor(0, 0, 0);
	while (1)
	{
		PCICR |= (1 << PCIF0); // clear any outstanding interrupts
		// sleep_mode();                             // sleep until IR interrupt
		if ((IR_available()) && (IR_read() == BIR_OK))
			break; // exit on power button
	}
}

// ===================================================================================
// Color and Light Mode Setting Function
// ===================================================================================

void changeColor(int r, int g, int b)
{
	cli();
	for (uint8_t i = NEO_PIXELS; i; i--)
		NEO_writeColor(r, g, b);
	sei();
}

void switchColor(void)
{
	changeColor(rv[hue], gv[hue], bv[hue]);
	hue++;
	if (hue == 4)
		hue = 0;
	my_delay_ms();
	/*
	 changeColor(0, 228, 255);
	 my_delay_ms();
	 changeColor(253, 84, 2);
	 my_delay_ms();
	 changeColor(216, 0, 235);
	 my_delay_ms();
	 changeColor(239, 0, 11);
	 my_delay_ms();
	 */
}

void fadeColor(void)
{
	changeColor(0, gfv, bfv[hue1]);
	if (hue1 == 0)
		huef = 0;
	if (hue1 == 6)
		huef = 1;
	if (huef == 1)
		hue1--;
	if (huef == 0)
		hue1++;
	my_delay_ms();
	//  changeColor(55, 235); //verde
	/*
	while(1){
	  changeColor(55-change1, 235, 0+change2); //verde
	  _delay_ms(50);
	  if (flag==0){
	  change1+=2;
	  change2+=5;
	  }
	  if (flag==1){
	  change1-=2;
	  change2-=5;
	  }
	  if(change2>=250) flag=0;
	  if(change2<=0) flag=1;
	}//changeColor(0, 228, 255); //aqua
  */
}

void my_delay_ms(void)
{
	for (int x = 0; x <= mode_delay[light_mode - 7]; x++)
		_delay_ms(1);
}

// ===================================================================================
// Main Function
// ===================================================================================

int main(void)
{
	// Set clock speed 8 MHz
	CCP = 0xD8; // unlock register protection
	CLKPSR = 0; // set clock prescaler to 0 -> 8 Mhz

	// Setup
	NEO_init();	   // init Neopixels
	IR_init();	   // init IR receiver
	BUTTON_init(); // init Button
	sei();		   // enable global interrupts
	light_mode = 0;
	lm = 0;
	// Loop
	while (1)
	{

		// Button mode change
		button_value = PINB;
		button_value = button_value & B00000001; // isolate value of PB0

		if (button_value == 1 && !button_flag)
		{
			button_flag = true;
		}
		if (button_value == 0 && button_flag)
		{
			button_flag = false;

			light_mode++;
			if (light_mode == 11)
			{
				light_mode = 0;
			}
			/*if(lm) {
			  light_mode=0;
			  lm=0;
			}*/
			// button_press=!button_press;
			// if(button_press){
			// lm+=1;
			// if(lm==10) lm=0;
			// light_mode=lm;
			//}
		}

		// Set the NeoPixels
		/*
		for(uint8_t i = NEO_PIXELS; i; i--) {
		  cli();
		  NEO_writeHue(current);
		  sei();
		  current += 2;
		  if(current >= 192) current -= 192;
		}*/
		if (light_mode <= 6)
		{
			changeColor(rsv[light_mode], gsv[light_mode], bsv[light_mode]);
		}

		if (light_mode == 7 || light_mode == 8)
		{
			switchColor();
		}

		if (light_mode == 9)
		{
			fadeColor();
		}

		// Check IR receiver and change parameters; delay 80ms
		for (uint8_t i = 80; i; i--)
		{
			if (IR_available() && button_value == 0)
			{ //! button_press){
				command = IR_read();

				// command = IR_read();
				// if(button_press==true) {command=BIR_1; button_press=false;}
				// switch(command) {
				if (command == BIR_1)
				{
					light_mode = 0;
				} // red=0; green=117; blue=216; light_mode=0;}
				if (command == BIR_2)
				{
					light_mode = 1;
				} // red=216; green=0; blue=235; light_mode=0;}
				if (command == BIR_3)
				{
					light_mode = 2;
				} // red=55; green=235; blue=0; light_mode=0;}
				if (command == BIR_4)
				{
					light_mode = 3;
				} // red=253; green=84; blue=2; light_mode=0;}
				if (command == BIR_5)
				{
					light_mode = 4;
				} // red=255; green=255; blue=255; light_mode=0;}
				if (command == BIR_6)
				{
					light_mode = 5;
				} // red=255; green=242; blue=0; light_mode=0;}
				if (command == BIR_7)
				{
					light_mode = 6;
				} // red=129; green=228; blue=254; light_mode=0;}
				// if(command==BIR_8){light_mode=7;}//red=239; green=0; blue=11; light_mode=0;}
				if (command == BIR_IZQ)
				{
					light_mode = 7;
				}
				if (command == BIR_DER)
				{
					light_mode = 8;
				}
				if (command == BIR_ARR)
				{
					light_mode = 9;
				}
				// if(command==BIR_ABA){ light_mode=10;}
				if (command == BIR_OK)
				{
					standby();
				}
				// case BIR_1:    red=0; green=117; blue=216; light_mode=0; break;//changeColor(0, 117, 216); break;
				// case BIR_2:    red=216; green=0; blue=235; light_mode=0; break;//changeColor(216, 0, 235); break;
				// case BIR_3:    red=55; green=235; blue=0; light_mode=0; break;//changeColor(55, 235, 0); break;
				// case BIR_4:    red=253; green=84; blue=2; light_mode=0; break;//changeColor(253, 84, 2); break;
				// case BIR_5:    red=255; green=255; blue=255; light_mode=0; break;//changeColor(255, 255, 255); break;
				// case BIR_6:    red=255; green=242; blue=0; light_mode=0; break;  //changeColor(255, 242, 0); break;
				// case BIR_7:    red=129; green=228; blue=254; light_mode=0; break; //changeColor(129, 228, 254); break;
				// case BIR_8:    red=55; green=28; blue=254; light_mode=0; break;  //changeColor(55, 28, 254); break;
				// case BIR_9:    red=239; green=0; blue=11; light_mode=0; break;  //changeColor(55, 28, 254); break;
				// case BIR_IZQ:  light_mode=1; mode_delay=500; break; //switchColor(DELAY_1); break;
				// case BIR_DER:  light_mode=2; mode_delay=200; break; //switchColor(DELAY_2); break;
				// case BIR_ARR:  light_mode=3; break; //fadeColor(1); break;
				// case BIR_ABA:  light_mode=4; break; //fadeColor(2); break;
				// case BIR_OK:   standby(); break;
				// case BIR_ARR:  command++; break;//if(++NEO_brightness > 2) NEO_brightness = 0; break;
				// case BIR_ABA:  command--; break;//if(--NEO_brightness <= 0) NEO_brightness = 2; break;
				// case IR_SPEED:    speed <<= 1; if(++speed > 7) speed = 0; break;
				// default:          break;
			}
			// button_press=false;
			_delay_ms(1);
		}
	}
}
