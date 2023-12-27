/*
 * pdk_uart.h
 * Created: 2021/06/12
 * Author: taivb
*/

#include "include.h"
#include "pdk_uart.h"

#define SU_TRUE 1
#define SU_FALSE 0

// startbit and stopbit parsed internally (see ISR)
#define RX_NUM_OF_BITS 8

// 1 Startbit, 8 Databits, 1 Stopbit = 10 Bits/Frame
#define TX_NUM_OF_BITS 10
#define TIMER_ON 		INTEN |= INTEN_TM2;
#define TIMER_OFF 		INTEN &= ~INTEN_TM2;

#define EXTERNAL_ON 	INTEN |= INTEN_PB5;
#define EXTERNAL_OFF		INTEN &= ~INTEN_PB5;

volatile static char inbuf[SOFTUART_IN_BUF_SIZE];
volatile uint8_t qin, start_bit = 1;
uint8_t qout;
volatile uint8_t flag_rx_off;
volatile uint8_t flag_rx_ready;

volatile uint8_t flag_tx_busy;
volatile uint8_t bits_left_in_tx;
uint16_t internal_tx_buffer; /* ! mt: was type uchar - this was wrong */


void TIM2_interrupt(void)
{
	static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
	static uint8_t rx_mask;

	static uint8_t bits_left_in_rx;
	static uint8_t internal_rx_buffer;

	uint8_t flag_in;

	// Transmitter Section
	if (flag_tx_busy == SU_TRUE)
	{
		if (internal_tx_buffer & 0x01)
		{
			setb(UART_Px, UART_TX);
		}
		else
		{
			clrb(UART_Px, UART_TX);
		}
		internal_tx_buffer >>= 1;
		if (--bits_left_in_tx == 0)
		{
			flag_tx_busy = SU_FALSE;
			TIMER_OFF;
		}
	}

	// Receiver Section
	if (flag_rx_off == SU_FALSE)
	{
		if (flag_rx_waiting_for_stop_bit)
		{
			start_bit = 1;
			EXTERNAL_ON;
			flag_rx_waiting_for_stop_bit = SU_FALSE;
			flag_rx_ready = SU_FALSE;
			inbuf[qin] = internal_rx_buffer;
			if (++qin >= SOFTUART_IN_BUF_SIZE)
			{
				qin = 0; // overflow - reset inbuf-index
			}
		}
		else
		{ // rx_test_busy
			if (flag_rx_ready == SU_FALSE)
			{
				//start_bit = inbit(UART_Px, UART_RX);
				// test for start bit
				if (start_bit == 0)
				{
					flag_rx_ready = SU_TRUE;
					internal_rx_buffer = 0;
					bits_left_in_rx = RX_NUM_OF_BITS;
					rx_mask = 1;
				}
			}
			else
			{ // rx_busy
				flag_in = inbit(UART_Px, UART_RX);
				if (flag_in)
				{
					internal_rx_buffer |= rx_mask;
				}
				rx_mask <<= 1;
				if (--bits_left_in_rx == 0)
				{
					flag_rx_waiting_for_stop_bit = SU_TRUE;
				}
			}
		}
	}
}

void UART_IO_config(void)
{
	// TX-Pin as output
	setb(UART_PxC, UART_TX);
	// RX-Pin as input
	setb(UART_PxDIER, UART_RX);
	setb(UART_PxPH, UART_RX);
}

static void TIM2_Config(void)
{
	// Setup timer2 (TM2) interrupt for 115200 baud
	TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
	TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
	TM2B = 103;									 // Divide by 69 ~> 115942 Hz (apx. 115200)

	//PAC |= (1 << UART_TX_PIN);                  // Enable TX Pin as output
	//txdata = 0xD55F;                              // Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
	//INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
}

void UART_begin(void)
{
	flag_tx_busy = SU_FALSE;
	flag_rx_ready = SU_FALSE;
	flag_rx_off = SU_TRUE;
	setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */

	TIM2_Config();
	UART_rx_on();
}

static void idle(void)
{
	// timeout handling goes here
	// - but there is a "softuart_kbhit" in this code...
	// add watchdog-reset here if needed
}

void UART_rx_on(void)
{
	flag_rx_off = SU_FALSE;
}

void softuart_turn_rx_off(void)
{
	flag_rx_off = SU_TRUE;
}

char softuart_getchar(void)
{
	char ch;

	while (qout == qin)
	{
		idle();
	}
	ch = inbuf[qout];
	if (++qout >= SOFTUART_IN_BUF_SIZE)
	{
		qout = 0;
	}

	return (ch);
}

uint8_t softuart_kbhit(void)
{
	return (qin != qout);// 0 neu giong 1 neu khac
}

void softuart_flush_input_buffer(void)
{
	qin = 0;
	qout = 0;
}

uint8_t softuart_transmit_busy(void)
{
	return (flag_tx_busy == SU_TRUE) ? 1 : 0;
}

void UART_putC(const char ch)
{
	while (flag_tx_busy == SU_TRUE)
	{
		;	// wait for transmitter ready
			// add watchdog-reset here if needed;
	}

	// invoke_UART_transmit
	bits_left_in_tx = TX_NUM_OF_BITS;
	TIMER_ON;
	internal_tx_buffer = (ch << 1) | 0x200;
	flag_tx_busy = SU_TRUE;
}

void softuart_puts(const char *s)
{
	while (*s)
	{
		UART_putC(*s++);
	}
}

void UART_print(char* str)
{
	int i = 0;
	while(str[i]!='\0')
		UART_putC(str[i++]);
}


void PB5_interrupt(void)
{
	
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	start_bit = 0;
	
	EXTERNAL_OFF;
	INTRQ &= ~INTRQ_TM2; 
	TIMER_ON;

}
void print(char d)
{
	clrb(UART_Px, UART_TX);
	_delay_us(60);
	for (uint8_t i = 0; i < 8; i++)
	{
		if (inbit(d, i) == 1)
			setb(UART_Px, UART_TX);
		else
			clrb(UART_Px, UART_TX);
		_delay_us(100);
	}
	setb(UART_Px, UART_TX);
	_delay_us(100);
}
