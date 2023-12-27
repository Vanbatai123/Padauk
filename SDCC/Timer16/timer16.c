
// program test GPIO

#ifndef F_CPU
#define F_CPU 8000000
#endif

#include "delay.h"
#include "include.h"
#include "millis.h"
#include "pdk_uart.h"

uint8_t flag = 0;
uint16_t txdata;

unsigned char _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 1MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}

void interrupt(void) __interrupt(0)
{
	if (INTRQ & INTRQ_T16) // TM2 interrupt request?
	{
		millis_irq_handler();
		INTRQ &= ~INTRQ_T16;
	}
	// timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed

		TIM2_interrupt();
	}
}

void UART_print(char *str)
{
	uint8_t i = 0;
	while (str[i] != '\0')
		putChar(str[i++]);
}

void UART_printNum(int32_t num, uint8_t base)
{
	char dis[10];	  // array of converted number
	int8_t max = 0, flag = 0; // max: index of dis array, flag: = 1 if negative

	if (num == 0) // input 0
{
		dis[max++] = '0';
	}
	else if (num < 0) // negative number
	{
		num = 0 - num;
		flag = 1;
	}
	while (num > 0) // convert to base number and add to dis array
	{
		if (num % base >= 10)
			dis[max] = num % base + 55;
		else
			dis[max] = num % base + 48;

		num = num / base;
		max++;
	}

	if (base == HEX) // add 0x for HEX and 0B for BIN
	{
		if (max % 2 == 1)
			dis[max++] = '0';

		dis[max++] = 'x';
		dis[max++] = '0';
	}
	else if (base == BIN)
	{
		dis[max++] = 'B';
		dis[max++] = '0';
	}

	if (flag == 1) // add minus to negative number
		dis[max++] = '-';

	for (uint8_t i = 0; i < max / 2; i++) // revert dis array
	{
		dis[max] = dis[i];
		dis[i] = dis[max - 1 - i];
		dis[max - 1 - i] = dis[max];
	}
	dis[max] = '\0';  // end string character
	UART_print(dis); // print dis
}
uint32_t t = 0;
void main(void)
{
	UART_begin();
	setb(PBC, 4);
	millis_setup();
	INTRQ = 0;
	sei();
	// INTEN &= ~INTEN_T16;
	UART_print("123\n");
	// INTEN |= INTEN_T16;		
	while (1)
	{
		// if (flag == 1)
		// {
			// tcnt = T16C;
			t = millis();
			// UART_printNum(t, DEC);
			// UART_print("\n");
			_delay_ms(1000);
			UART_printNum(t-millis(), DEC);
			UART_print("\n");
		// }
	}
}