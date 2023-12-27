

#include "include.h"
#include "pdk_uart.h"

void UART_begin()
{
	// Setup timer2 (TM2) interrupt for 115200 baud
	TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
	TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2; // No prescale, scale 2 ~> 8MHz
	TM2B = 69;									 // Divide by 69 ~> 115942 Hz (apx. 115200)

	PAC |= (1 << UART_TX_PIN); // Enable TX Pin as output
	// first 2byte to config with programmer
	txdata = 0xD55F;	// Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
	INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
}

// txdata = 0xD55F;                              // Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
void TIM2_interrupt()
{
	if (txdata)
	{								 // Does txdata contains bits to send?
		if (txdata & 0x01)			 // Check bit (1/0) for sending
			setb(PA, UART_TX_PIN); // Send 1 on TX Pin
		else
			clrb(PA, UART_TX_PIN); // Send 0 on TX Pin
		txdata >>= 1;				 // Shift txdata
	}
}

int putChar(int c)
{
	while (txdata)
		;					   // Wait for completion of previous transmission
	INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
	txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
	INTEN |= INTEN_TM2;		   // Enable TM2
	return (c);
}
