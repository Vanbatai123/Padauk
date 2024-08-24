/*
 * UART.h
 * Created: 2024/08/24
 * Author: taivb
 */

#include "extern.h"
#include "include.h"
#include "pdk_uart.h"


void UART_HandShake(void)
{
	$ UART_In In;
	$ UART_Out High, Out;

	while(1)
	{
		UART_Receive();
		A	=	A + 1;	//	UART_Data_In + 1;
		UART_Send(A);
	}
}

void FPPA0(void)
{
	.ADJUST_IC SYSCLK=IHRC/2		//	SYSCLK=IHRC/4

	//	Insert Initial Code
	UART_begin();
	UART_HandShake();
	
	while (1)
	{
		UART_Send('T');
		UART_Send('A');
		UART_Send('I');
		UART_Send('\r');
		UART_Send('\n');
		_delay_ms(1000);

	}
}