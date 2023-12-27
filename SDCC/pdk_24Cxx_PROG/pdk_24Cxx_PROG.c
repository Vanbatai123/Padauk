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

#define TIMER3_ON INTEN |= INTEN_TM3;
#define TIMER3_OFF INTEN &= ~INTEN_TM3;

static void TIM3_Config(void)
{
	// Setup timer2 (TM2) interrupt for 9600 baud
	TM3C = TM3C_CLK_IHRC;						   // Use IHRC -> 16 Mhz
	TM3S = TM3S_PRESCALE_DIV64 | TM3S_SCALE_DIV32; // No prescale, scale 2 ~> 8MHz
	TM3B = 254;									   // Divide by 69 ~> 9600 Hz (apx. 115200)
	INTEN |= INTEN_TM3;
}
uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
uint8_t arr2[10];

char u[22];
int i = 0;
uint8_t aaa = 0, temp = 0, ret = 0, newline = 0;
uint8_t hex_byteCount;
uint16_t hex_address;

uint8_t readline()
{
	uint8_t cnt_t = 0;
	while (1)
	{
		while (UART_kbhit())
		{
			u[cnt_t] = UART_getchar();
			if (u[cnt_t] == 'T' && u[cnt_t - 1] == 'S')
			{
				return cnt_t - 1;
			}
			cnt_t++;
		}
	}
}

int main(void)
{
	setb(PBC, 4);
	TIM3_Config();
	I2C_begin();
	UART_IO_config();
	UART_begin();
	INTRQ = 0;
	sei();
	UART_print("\rOK\r");
	//  AT24C_writeBuf(0x0050, arr, 10);
	//AT24C_erase();
	while (1)
	{

		i = 0;
		while (UART_kbhit())
		{
			u[i++] = UART_getchar();
		}
		u[i++] = '\r';
		u[i] = '\0';
		/*if (i != 1)
		{

			UART_print(u);

			UART_print("\r\n");
		}*/
		if (u[0] == '5' && u[1] == '2') // match signal
		{
			UART_print("PFS173\r\n"); //send signal back to PC
			while (!ret)
			{
				temp = readline();
				u[temp] = '\0';
				UART_print(u);
				UART_print("\r\n");
			}
		}
		if (aaa == 1)
		{
			setb(PB, 4);
			/* code */
		}
		else
		{
			clrb(PB, 4);
			/* code */
		}

		_delay_ms(900);
	}
}
void TIM3_interrupt()
{
	if (aaa == 1)
	{
		aaa = 0;
	}
	else
	{
		aaa = 1;
	}
}
// interrupt vector
void interrupt(void) __interrupt(0)
{
	//timer2 interrupt for UART
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
		TIM2_interrupt();
	}
	// timer3 interrupt for display LEDs
	if (INTRQ & INTRQ_TM3)
	{
		INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
		TIM3_interrupt();
	}
	//external PA4 interrupt for uart
	if (INTRQ & INTRQ_PA4)
	{
		INTRQ &= ~INTRQ_PA4;
		TM3B = 0;
		PA4_interrupt();
	}
}
