
// program test GPIO

#ifndef F_CPU
#define F_CPU 8000000
#endif

#include "include.h"

uint32_t cnt = 0;
uint8_t flag = 0;

void interrupt(void) __interrupt(0)
{
	if (INTRQ & INTRQ_TM2) // TM2 interrupt request?
	{
		INTRQ &= ~INTRQ_TM2; // mark TM2 interrupt request processed
		daobit(PB, 4);
	}
}

unsigned char _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}

void main(void)
{

	setb(PBC, 4);

	TM2C = TM2C_CLK_IHRC;						   // use IHRC -> 16 Mhz
	TM2S = TM2S_PRESCALE_DIV64 | TM2S_SCALE_DIV5; // no prescale, scale 64 ~> 8MHz/64
	TM2B = 25;									   // divide by 69 ~> 115942 Hz (apx. 115200)

	INTEN = INTEN_TM2; // enable TM2 interrupt, send out initial stop bits and autobaud char
	sei();			   // enable global interrupts

	while (1)
	{
	}
}