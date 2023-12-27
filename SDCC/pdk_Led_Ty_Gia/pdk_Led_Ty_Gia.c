/*
 * pdk_Led_Ty_Gia.c
 * Created: 2022/02/25
 * Author: taivb
 */

#define F_CPU 8000000
#include "delay.h"
#include "include.h"
#include "PDK_uart.h"
//#include "PDK_irremote.h"

#include <stdio.h>
#include <string.h>
uint16_t txdata;
uint16_t count_ms, count_ms1, start_status;
int16_t count_data;
uint32_t data, data2;
uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}
int sta = 0;

void UART_printNum(uint32_t num)
{
	uint8_t temp = 0;
	putchar('0');
	putchar('x');
	for (uint8_t i = 0; i < 8; i++)
	{
		temp = (uint8_t)((num >> (4 * (7 - i))) & 0x0000000F);
		if (temp <= 9)
			putchar(temp + 48);
		else if (temp > 9)
			putchar(temp + 55);
	}
	putchar('\n');
}

int main(void)
{
	char dis[] = "asdasd";
	// Initialize hardware
	UART_begin(); // Initialize UART engine

	// Setup timer3 (TM3) interrupt for 115200 baud
	TM3C = TM3C_CLK_IHRC;							 // Use IHRC -> 16 Mhz
	TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV64; // No prescale, scale 64 ~> 0.25MHz
	TM3B = 125;										 // Divide by 125 ~> 2000 Hz 0.5ms

	INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char

	ROP = ROP_INT_SRC_PB5;
	setb(PBDIER, 5);
	setb(PBPH, 5);
	INTEGS = INTEGS_PB5_FALLING;
	INTEN |= INTEN_PB5;

	// IR_config();
	// TIM4_begin(3, 100); // prescaler: 2^3, 100 ticks: 50us
	sei(); // Enable global interrupts
	while (1)
	{
		if (sta == 0)
		{
			//UART_print("Waiting!!!\n");
		}
		else if (sta == 1)
		{
			UART_printNum(data2);
			sta = 0;
		}
		_delay_ms(1);
	}
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
	// timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
		TIM2_interrupt();
	}
	// timer3 interrupt 0.5ms
	if (INTRQ & INTRQ_TM3)
	{
		INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
							 // TIM3_interrupt();

		count_ms++;
		if (count_ms == 50)
			count_ms = 0;
	}
	// PB5 interrupt
	if (INTRQ & INTRQ_PB5)
	{
		INTRQ &= ~INTRQ_PB5; // Mark PB5 interrupt request processed
							 // sta = 1;
							 // if (0)

		// puts("1");
		count_ms1 = count_ms;
		count_ms = 0;
		count_data++;
		//if (((count_ms1) >= 20) && ((count_ms1) <= 28)) // 10s-14ms
		if (((count_ms1) >= 25) && ((count_ms1) <= 28)) // 10s-14ms
		{
			count_data = -1;
			start_status = 1;
			count_ms1 = 0;
		}
		else if (((count_ms1) >= 20) && ((count_ms1) <= 24)) // 10s-14ms
		{
			sta = 1;
			//data2 =0xFFFFFFFF;
			
		}
		else if ((start_status == 1) && (count_data >= 0) && (count_data <= 31))
		{
			if ((count_ms1 >= 4) && (count_ms1 <= 6)) // 2ms->3ms //detect logic 1.
			{
				data |= 1 << (31 - count_data);
				count_ms1 = 0;
			}
			else if (count_ms1 < 4) // nho hon <2ms //detect logic 0.
			{
				count_ms1 = 0;
			}
			else // error data reset all
			{
				count_ms1 = 0;
				start_status = 0;
				count_data = 0;
				data = 0;
			}
			////
		}
		else if ((start_status == 0) && ((count_ms1) > 28)) /// error detect xung start
		{
			count_ms1 = 0;
			start_status = 0;
			count_data = 0;
			data = 0;
		}
		///
		if (count_data == 32) // reset sau khi detect 32 bit data
		{
			sta = 1;
			data2 = data;

			count_data = 0;
			data = 0;
			start_status = 0;
			count_ms1 = 0;
			////////
		}
	}
}
