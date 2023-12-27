/*
 * pfs173_uart.c
 * Created: 2021/06/09
 * Author: taivb
*/

#define F_CPU 8000000
#include "delay.h"
#include "include.h"
#include "PDK_uart.h"

uint16_t txdata;
uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

int main(void)
{
	// Initialize hardware
	UART_begin(); // Initialize UART engine

	INTRQ = 0;
	sei(); // Enable global interrupts
	while (1)
	{
		puts("Hello World!");
		_delay_ms(1000);
	}
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
	//timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed

		TIM2_interrupt();
	}
}
