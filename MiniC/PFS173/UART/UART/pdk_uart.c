/*
 * pdk_uart.c
 * Created: 2024/08/24
 * Author: taivb
 */

#include "extern.h"
#include "include.h"
#include "pdk_uart.h"

static BYTE UART_Data_In;

void UART_Send(uint8_t UART_Data_Out)
{
	BYTE cnt;
	//BYTE UART_Data_Out;

	UART_Data_Out = A;

	// Start Bit
	set0 UART_Out;			// 1

#if FPPA_Duty == 1
	cnt = 8;				// 2 ~ 3
	.Delay 3;				// 4 ~ 6
	do
	{ // Data Bit * 8
		.Delay UART_Delay - 10;
		sr UART_Data_Out;	// 7
		if (CF)
		{
			nop;			// 10
			UART_Out = 1;	// 1
		}
		else
		{
			UART_Out = 0;	// 1
			.delay 2;		// 2 ~ 3
		}
	} while (--cnt); 		// 4 ~ 6
	.Delay UART_Delay - 5;
#else
	.Delay UART_Delay - 4;
	cnt = 8;				// 2 ~ 3

	// Data Bit * 8
	do
	{
		sr		UART_Data_Out;	// 4  4
		swapc	UART_Out;		// 1
		.Delay	UART_Delay - 4;
	} while (--cnt);			// 2, 3

	.Delay 2;					// 3 ~ 4
#endif

	// Stop Bit
	set1 UART_Out; // 1
	.Delay 2 * UART_Delay - 2;
} // 2

void UART_Receive(void)
{
	BYTE cnt;

	while (1)
	{
		cnt = 8;

		if (!UART_In)
		{
		err: // receive UART error, so ...;
			continue;
		}
		// Wait Start Bit
		while (UART_In)
			NULL;

#if FPPA_Duty == 1
		.Delay(UART_Delay / 2) - 2;
		if (UART_In)
			goto err;			// 1, 2
		.Delay UART_Delay - 3;
		CF = 0;					// 3
		do
		{
			t0sn UART_In;		// 1
			CF = 1;				// 2
			src UART_Data_In;	// 3
			.Delay UART_Delay - 6;
		} while (--cnt);		// 4 ~ 6
#else
		.Delay UART_Delay / 2;
		if (UART_In)
			goto err;			// 1

		.Delay UART_Delay - 1;
		do
		{
			swapc UART_In;		// 1
			src UART_Data_In	// 2
			.Delay UART_Delay -	4;
		} while (--cnt);		// 3, 4
#endif

		A = UART_Data_In;		// 4
		// Check Stop Bit
		if (!UART_In)
			goto err;
		return;
	}
}

void	UART_begin(void)
{
	$ UART_In In;
	$ UART_Out High, Out;
}