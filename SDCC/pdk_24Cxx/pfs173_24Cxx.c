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
#include "pdk_24C.h"

uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}
uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
uint8_t arr2[10];

int main(void)
{
	I2C_begin();
	UART_IO_config();
	UART_begin();
	INTRQ = 0;
	sei();
	UART_rx_off();
	UART_print("\rOK\r");
	 AT24C_writeBuf(0x0050, arr, 10);
	//AT24C_erase();
	while (1)
	{
		AT24C_readBuf(0x0052, arr2, 10);
		UART_printNum(arr2[7]);
		UART_print("\r");
		_delay_ms(900);
		_delay_ms(900);
		_delay_ms(900);
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
