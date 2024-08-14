
#include	"extern.h"


// Delay
#define _delay_ms(x) .delay x*System_Clock/1000
#define _delay_us(x) .delay x*System_Clock/1000000

#define PIN_TEST	PA.4


void	FPPA0 (void)
{
	.ADJUST_IC	SYSCLK=IHRC/2		//	SYSCLK=IHRC/4
	//clkmd.En_Reset	=	1;			//	PA.5 as Reset pin

	//	Insert Initial Code
	$ PIN_TEST Out, Low

	while (1)
	{
		PIN_TEST = 1;
		_delay_ms(500);
		PIN_TEST = 0;
		_delay_ms(500);
	}
}


void	Interrupt (void)
{
	pushaf;

	if (Intrq.T16)
	{	//	T16 Trig
		//	User can add code
		Intrq.T16	=	0;
		//...
	}

	popaf;
}

