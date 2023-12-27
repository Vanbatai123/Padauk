/*
 * pfs173_uart.c
 * Created: 2021/06/12
 * Author: taivb
 */

#include "include.h"
#include "delay.h"
// #include "pdk_lcdi2c.h"
// #include "pdk_uart.h"

// #define DEBUG

uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}
// Port definitions
#define Px PA
#define PxC PAC
#define PxPH PAPH
#define PxDIER PADIER
// Pin definitions
#define NEO_PIN 3	 // Pin for neopixels
#define IR_PIN 4	 // Pin for IR receiver
#define BUTTON_PIN 6 // Pin for button

// NeoPixel parameter
#define NEO_GRB		  // type of pixel: NEO_GRB, NEO_RGB or NEO_RGBW
#define NEO_PIXELS 24 // number of pixels in the string (max 255)

// IR codes
#define IR_ADDR 0x00 // IR device address

// #define IR_SPEED      0x03    // IR code for animation speed
#define IR_FAIL 0xF1 // IR fail code

#ifndef DEBUG
// COMANDOS CONTROL STANDARD
#define BIR_1 0x45
#define BIR_2 0x46
#define BIR_3 0x47
#define BIR_4 0x44
#define BIR_5 0x40
#define BIR_6 0x43
#define BIR_7 0x07
#define BIR_8 0x15
#define BIR_9 0x09
#define BIR_AST 0x16
#define BIR_0 0x19
#define BIR_GATO 0x0D
#define BIR_IZQ 0x08
#define BIR_DER 0x5A
#define BIR_ARR 0x18
#define BIR_ABA 0x52
#define BIR_OK 0x1C
#else
// COMANDOS CONTROL STANDARD
#define BIR_1 0x30
#define BIR_2 0x18
#define BIR_3 0x7A
#define BIR_4 0x10
#define BIR_5 0x38
#define BIR_6 0x5A
#define BIR_7 0x42
#define BIR_8 0x4A
#define BIR_9 0x52
#define BIR_AST 0xE2 // MENU
#define BIR_0 0x68
#define BIR_GATO 0xC2 // RETURN
#define BIR_IZQ 0xA8  // PLAY
#define BIR_DER 0x02  // +
#define BIR_ARR 0x98  // -
#define BIR_ABA 0x90  // RIGHT
#define BIR_OK 0xA2	  // PWR
#endif
// Global variables
// uint8_t NEO_brightness = 2;   // 0..2
uint8_t button_value;
uint8_t button_flag = 0;
uint8_t button_press = 0;

uint8_t light_mode = 0;
uint8_t command;
uint8_t mode_counter = 0;

const uint8_t mode_delay[4] = {220, 150, 150, 100};

const uint8_t mode[11] = {0x45, 0x46, 0x47, 0x44, 0x40, 0x43, 0x07, 0x08, 0x5A, 0x18, 0x52};

const uint8_t rv[4] = {0, 253, 216, 239};
const uint8_t gv[4] = {228, 84, 0, 0};
const uint8_t bv[4] = {255, 2, 235, 11};
const uint8_t rsv[8] = {0, 255, 55, 253, 255, 255, 239};
const uint8_t gsv[8] = {117, 0, 235, 84, 255, 242, 0};
const uint8_t bsv[8] = {216, 100, 0, 2, 255, 0, 11};
const uint8_t rfv = 0;
const uint8_t gfv = 255;
const uint8_t bfv[6] = {255, 200, 155, 100, 55, 0};
uint8_t hue = 0;
uint8_t hue1 = 0;
uint8_t huef = 0;

uint8_t lm = 0;
uint16_t count_ms, count_ms1;

void my_delay_ms(void);
void changeColor(int r, int g, int b);
void switchColor(void);
void fadeColor(void);
// ===================================================================================
// Neopixel Implementation for 8 MHz MCU Clock and 800 kHz Pixels
// ===================================================================================

// NeoPixel parameter and macros
#define NEO_init() setb(PxC, NEO_PIN) // set pixel DATA pin as output

void BUTTON_init(void)
{
	setb(Px, BUTTON_PIN); // pullup on IR pin
	clrb(PxC, BUTTON_PIN);
	setb(PxPH, BUTTON_PIN);	  // set BUTTON pin as input
	setb(PxDIER, BUTTON_PIN); // set BUTTON pin as input
}

// #define NEO_latch()   _delay_us(281)           // delay to show shifted colors
#ifdef DEBUG
void pr(uint8_t ir)
{
	putChar(ir / 100 + 48);
	putChar((ir / 10) % 10 + 48);
	putChar(ir % 10 + 48);
}
#endif
// Send a byte to the pixels string

void LED__SendZero_()
{
	setb(Px, NEO_PIN);
	__nop();
	__nop();
	clrb(Px, NEO_PIN);
	__nop();
	__nop();
	__nop();
	__nop();
}
void LED__SendOne_()
{
	setb(Px, NEO_PIN);
	__nop();
	__nop();
	__nop();
	__nop();
	__nop();
	__nop();
	__nop();
	clrb(Px, NEO_PIN);
}
void NEO_sendByte(uint8_t dat)
{
	if (dat & 0x80)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x40)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x20)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x10)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x08)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x04)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x02)
		LED__SendOne_();
	else
		LED__SendZero_();
	if (dat & 0x01)
		LED__SendOne_();
	else
		LED__SendZero_();
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
#define IR_available() inbit(Px, IR_PIN)					  // return 1 if IR line is low
#define IR_PRESCALER 1024									  // prescaler of the timer
#define IR_time(t) ((F_CPU / 1000) * t) / IR_PRESCALER / 1000 // convert us to counts
#define IR_TOP IR_time(12000UL)								  // TOP value of timer (timeout)

// IR initialize the receiver
void IR_init(void)
{
	setb(Px, IR_PIN);	  // pullup on IR pin
	clrb(PxC, IR_PIN);	  // set IR pin as input
	setb(PxPH, IR_PIN);	  // set IR pin pull up
	setb(PxDIER, IR_PIN); // set IR pin as input

	// TM3C = TM3C_CLK_IHRC;							 // Use IHRC -> 16 Mhz
	// TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV64; // No prescale, scale 64 ~> 0.25MHz
	// TM3B = 62;										 // Divide by 62 ~> 4000 Hz 0.25ms

	// INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char

	T16M = T16_CLK_SYSCLK | T16_CLK_DIV4 | T16_INTSRC_8BIT; // timer clock=8MHz/4/2^9 => 0.256ms
	T16C = 0;
	INTEN |= INTEN_T16; // enable TM16 interrupt
	INTRQ = 0;
}

// uint8_t arr[33];
// IR read data according to NEC protocol
uint8_t IR_read(void)
{
	uint32_t data = 0x00000000; // variable for received data
	// uint8_t addr = 0x00;		// variable for received address

	count_ms = 0;

	for (uint8_t i = 0; i < 33; i++) // receive 32 bits
	{
		data = data << 1;
		while (inbit(Px, IR_PIN) == 0 && count_ms != 100)
			;
		while (inbit(Px, IR_PIN) == 1 && count_ms != 100)
			;
		count_ms1 = count_ms;
		if (count_ms1 == 100)
		{
			// count_ms = 0;
			return IR_FAIL;
		}
		if (i == 0 && (count_ms1 < 40 || count_ms1 > 65)) // first bit is not a Start bit
		{
			return IR_FAIL;
		}
		else if (7 < count_ms1 && count_ms1 < 11)
		{
			data |= 0x00000001;
		}
		// arr[i] = count_ms1;
		count_ms = 0;
	}

	// uint8_t addr1 = data >> 24; // get first  address byte
	// uint8_t addr2 = data >> 16; // get second address byte
	uint8_t cmd1 = data >> 8; // get first  command byte
	uint8_t cmd2 = data;	  // get second command byte
	if (((uint16_t)cmd1 + (uint16_t)cmd2) < 255)
		return IR_FAIL; // if second command byte is not the inverse of the first
	// if (((uint16_t)addr1 + (uint16_t)addr1) == 255)
	// 	addr = addr1; // check if it's extended NEC-protocol ...
	// else
	// 	addr = data; // ... and get the correct address
	// if(addr != IR_ADDR) return IR_FAIL;         // wrong address
	return cmd1; // return command code
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
#ifdef DEBUG
	// timer2 interrupt  uart
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2;
		TIM2_interrupt();
	}
#endif
	// timer3 interrupt 0.25ms
	if (INTRQ & INTRQ_T16)
	{
		INTRQ &= ~INTRQ_T16;

		count_ms++;
		if (count_ms == 100)
		{
			count_ms = 100;
		}
	}
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
		// PCICR |= (1 << PCIF0); // clear any outstanding interrupts
		//  sleep_mode();                             // sleep until IR interrupt
		if (IR_available() == 0)
			if (IR_read() == BIR_OK)
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

uint16_t txdata;
int main(void)
{
#ifdef DEBUG
	UART_begin();
#endif
	// Setup
	NEO_init();	   // init Neopixels
	IR_init();	   // init IR receiver
	BUTTON_init(); // init Button
	sei();		   // enable global interrupts
	light_mode = 0;
	lm = 0;

#ifdef DEBUG
	while (0)
	{
		if (IR_available() == 0)
		{
			command = IR_read();
			if (command != IR_FAIL)
			{
				for (uint8_t i = 0; i < 33; i++)
				{
					pr(arr[i]);
					putChar('-');
				}

				pr(command);
				putChar('\n');
			}
		}
	}
#endif

	// Loop
	while (1)
	{
		// Button mode change
		button_value = inbit(Px, BUTTON_PIN); // get value of button pin

		if (button_value == 1 && !button_flag)
		{
			button_flag = 1;
		}
		if (button_value == 0 && button_flag)
		{
			button_flag = 0;

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
			if (IR_available() == 0 && button_value == 1)
			{ //! button_press){
				command = IR_read();
				// if (command != IR_FAIL)
				// {
				// 	pr(command);
				// 	putChar('\n');
				// }

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
