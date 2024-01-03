
#include	"extern.h"

// Delay
#define _delay_ms(x) .delay x*System_Clock/1000
#define _delay_us(x) .delay x*System_Clock/1000000


Byte Pulse_Count_1 = 0;
Byte Pulse_Count_2 = 0;
Byte Pulse_A = 31; // 31*0.032ms ~ 0.1ms
Byte Pulse_B = 47; // 47*0.032ms ~ 0.15ms
Byte Pulse_C = 63; // 63*0.032ms ~ 0.2ms

void	FPPA0 (void)
{
	.ADJUST_IC	SYSCLK=IHRC/4		//	SYSCLK=IHRC/4

	//	Insert Initial Code
	PA = 0b_0000_0000; // Port A Data register
	PAC = 0b_1111_1111; // Port A Control register, 0/1: input/output
	PAPH = 0b_0000_0000; // Port A Pull-high register, 0/1: disable/enable
	PADIER = 0b_1111_1001; // Port A Digital input enable register, 0/1: disable/enable, Bit 2:1 is reserved

	T16M = 0b_1000_0000; // Timer 16 mode clock:IHRC, Pre-devider: /1, Interrupt: bit8 // timer clock=16MHz/1/2^9 => 0.032ms

	INTEN = 0b_0000_0100; // Enable the timer 16 Interrupt
	INTRQ = 0; // Clear the INTRQ register
	ENGINT; // Enable global interrupt

	while (1)
	{
		
//		...
//		wdreset;

	}
}

// The name of the interrupt function is fixed and it will set the DISGINT // (disable gloable interrupt) bit automatically when it enters the interrupt // function.

void	Interrupt (void)
{
	pushaf; // Reserve the ALU and FLAG registers

	if (Intrq.T16)
	{	//	T16 Trig
		//	User can add code
		Intrq.T16	=	0; // clear the interrupt associated with 16-bit timer
		// Does not do conversions from binary to value, i.e pa.3 = !pa.3 doesn't work

		Pulse_Count_1 = Pulse_Count_1 + 1;
		if (Pulse_Count_1 == 208)
		{
			Pulse_Count_1 = 0;
			Pulse_Count_2 = Pulse_Count_2 + 1;
		}
		if (Pulse_Count_1 == Pulse_A)
		{
			pa.3 = 0;
		}
		if (Pulse_Count_1 == Pulse_B)
		{
			pa.4 = 0;
		}
		if (Pulse_Count_1 == Pulse_C)
		{
			pa.0 = 0;
		}
		if (Pulse_Count_2 == 3)
		{
			pa.3 = 1;
			pa.4 = 1;
			pa.0 = 1;
			Pulse_Count_1 = 0;
			Pulse_Count_2 = 0;
		}

	}

	popaf;// Restore the ALU and FLAG registers
}
