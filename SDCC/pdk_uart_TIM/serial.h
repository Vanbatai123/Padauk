/*
 * pfs173_uart.c
 * Created: 2021/06/09
 * Author: taivb
*/

#include <stdint.h>
#include <stdio.h>
#include "include.h"
// #include "PDK_uart.h"


// UART TX is on PA7
#define UART_TX_PIN       7

volatile uint16_t txdata = 0;                       // UART data shift register

void UART_begin() {
  // Setup timer2 (TM2) interrupt for 115200 baud
  TM2C = TM2C_CLK_IHRC;                         // Use IHRC -> 16 Mhz
  TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2;  // No prescale, scale 2 ~> 8MHz
  TM2B = 69;                                    // Divide by 69 ~> 115942 Hz (apx. 115200)

  PAC |= (1 << UART_TX_PIN);                  // Enable TX Pin as output
  //first 2byte to config with programmer
  //txdata = 0xD55F;                              // Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
  INTEN |= INTEN_TM2;                           // Enable TM2 interrupt, send out initial stop bits and autobaud char
}

// txdata = 0xD55F;                              // Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
void interrupt(void) __interrupt(0) 
{
	if (INTRQ & INTRQ_TM2) 
	{        // TM2 interrupt request?
		INTRQ &= ~INTRQ_TM2;          // Mark TM2 interrupt request processed

		if (txdata) 
		{                                 // Does txdata contains bits to send?
			if (txdata & 0x01)                          // Check bit (1/0) for sending
			__set1(PA, UART_TX_PIN);                // Send 1 on TX Pin
			else
			__set0(PA, UART_TX_PIN);                // Send 0 on TX Pin
			txdata >>= 1;                               // Shift txdata
		}
	}
}


int putchar2(int c) {
  while (txdata);                               // Wait for completion of previous transmission
  INTEN &= ~INTEN_TM2;                          // Disable TM2 (setup of 16 bit value txdata is non atomic)
  txdata = (c << 1) | 0x200;                    // Setup txdata with start and stop bit
  INTEN |= INTEN_TM2;                           // Enable TM2
  return (c);
}

uint8_t _sdcc_external_startup(void)
{
  EASY_PDK_INIT_SYSCLOCK_8MHZ();        //use 8MHz sysclock
  EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
  return 0;                             //perform normal initialization
}

int main(void)
{
	// Initialize hardware
	UART_begin();                 // Initialize UART engine

	INTRQ = 0;
	sei();                     // Enable global interrupts
	while (txdata);                               // Wait for completion of previous transmission
  INTEN &= ~INTEN_TM2;                          // Disable TM2 (setup of 16 bit value txdata is non atomic)
  txdata = 0x5F;                    // Setup txdata with start and stop bit
  INTEN |= INTEN_TM2;                           // Enable TM2
  while (txdata);                               // Wait for completion of previous transmission
  INTEN &= ~INTEN_TM2;                          // Disable TM2 (setup of 16 bit value txdata is non atomic)
  txdata = 0xD5;                    // Setup txdata with start and stop bit
  INTEN |= INTEN_TM2;                           // Enable TM2
	while (1)
	{
		putchar2('a');
		putchar2('b');
		putchar2('h');
		putchar2('\n');
		_delay_ms(1000);
	}
	
}
