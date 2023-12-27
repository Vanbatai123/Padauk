/*
 * pfs173_uart.c
 * Created: 2021/06/12
 * Author: taivb
*/

#define F_CPU 8000000
#include "include.h"
#include "delay.h"
#include "pdk_uart.h"

uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

char x = 'G';
char u[20];
int i = 0;

int main(void)
{
	UART_IO_config();
	INTEGS = INTEGS_PB5_FALLING;
	INTEN |= INTEN_PB5;
	UART_begin();
	INTRQ = 0;
	sei();
	//UART_turn_rx_off();
	while(1)
	UART_print("\rOK\r");

	while (1)
	{
		i = 0;
		while (UART_kbhit())
		{
			u[i++] = UART_getchar();
		}
		u[i++] = '\r';
		u[i] = '\0';
		if (i != 1)
			UART_print(u);
		_delay_ms(500);
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
	//external PB5 interrupt
	if (INTRQ & INTRQ_PB5)
	{
		INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
		PB5_interrupt();
	}
}
