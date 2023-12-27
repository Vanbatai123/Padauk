
#define F_CPU 8000000
#include "include.h"
#include "delay.h"

uint16_t counter;

uint8_t _sdcc_external_startup(void)
{
	ROP = ROP_INT_SRC_PB5;
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

void main(void)
{
	setb(PBC, 4);
	setb(PBDIER, 5);
	setb(PBPH, 5);


	INTEN = INTEN_PB5;
	INTEGS = INTEGS_PB5_FALLING;

	INTRQ = 0;
	sei();

	while (1)
	{
		/*if(inbit(PB,5) == 0)
		{
			_delay_ms(300);
			daobit(PB, 4);
		}*/
	}
}

void interrupt(void) __interrupt(0)
{
	if (INTRQ & INTRQ_PB5)
	{
		INTRQ &= ~INTRQ_PB5;

			_delay_ms(300);
			daobit(PB, 4);
	}
}
