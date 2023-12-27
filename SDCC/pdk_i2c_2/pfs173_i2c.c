/*
 * pfs173_uart.c
 * Created: 2021/06/12
 * Author: taivb
*/

#define F_CPU 8000000
#include "include.h"
#include "delay.h"
#include "pdk_uart.h"
#include "pdk_i2c.h"

char u[20];
int i = 0;
int aaa = 0;

void display2()
{
	UART_printNum(DS1307_Read(DS1307_DATE));
	UART_print("-");
	UART_printNum(DS1307_Read(DS1307_MONTH));
	UART_print("-");
	UART_printNum(DS1307_Read(DS1307_YEAR));
	UART_print("-");
	UART_printNum(DS1307_Read(DS1307_HOUR));
	UART_print("-");
	UART_printNum(DS1307_Read(DS1307_MIN));
	UART_print("-");
	UART_printNum(DS1307_Read(DS1307_SEC));
	UART_print("\r");
}
uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

int main(void)
{
	UART_IO_config();
	UART_begin();
	INTRQ = 0;
	sei();
	UART_rx_off();
	UART_print("\rOK\r");

	PBC |= (1 << SDA);
	PBC |= (1 << SCL);
	DS1307_Set(1, 2, 3, 4, 5, 6);

	while (1)
	{
		display2();
		_delay_ms(1100);
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
