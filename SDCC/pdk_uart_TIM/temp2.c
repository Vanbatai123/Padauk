/*
 * pfs173_uart.c
 * Created: 2021/06/12
 * Author: taivb
*/

#define F_CPU 8000000
#include "include.h"
#include "delay.h"

#define SET_FLAG SW_UART_status = 1;
#define CLEAR_FLAG SW_UART_status = 0;
#define READ_FLAG SW_UART_status

#define IDLE 0
#define TRANSMIT 1
#define RECEIVE 2
#define BUSY 3
#define TRANSMIT_STOP_BIT 4
#define DATA_PENDING 5

uint8_t counter = 0;	   //even 2,4,6 when TRANSMIT
uint8_t counter2 = 0;	   //even 2,4,6 when TRANSMIT
uint8_t bit_out = 0;	   //
uint8_t state = 0;		   //
uint8_t last_bit_sent = 0; //
uint8_t TX_data = 0;	   //
uint8_t RX_data = 0;	   //
uint8_t SW_UART_TX_BUFFER_FULL;
uint8_t SW_UART_RX_BUFFER_FULL;
uint8_t SW_UART_RX_BUFFER_OVERFLOW;
uint8_t SW_UART_FRAME_ERROR;

uint8_t SW_UART_status;

void SW_UART_Enable(void);
void SW_UART_Transmit(uint8_t);

void SW_UART_Enable(void)
{
	//tx
	setb(PBC, 7);
	setb(PB, 7);

	//rx
	setb(PBDIER, 5);
	setb(PBPH, 5);

	INTEGS = INTEGS_PB5_FALLING;

	//CLEAR_FLAG;
	INTEN &= ~INTEN_TM2;

	// TIM2 for 9600 bps
	TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
	TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
	TM2B = 103;

	INTEN |= INTEN_PB5;

	state = IDLE;
	INTRQ = 0;
}

void SW_UART_Transmit(uint8_t byte)
{

	while (state != IDLE)
	{
		; // Don't send while busy receiving or transmitting.
	}

	state = TRANSMIT;
	//SW_UART_TX_BUFFER_FULL = 1; //set txdata full flag
	TX_data = byte; //copy data to tx buffer
	counter = 0;

	clrb(PB, 7); //send start bit
	clrb(PB, 7); //send start bit

	INTRQ = 0;
	INTEN |= INTEN_TM2;
}

void print_string(char *str)
{
	int i = 0;
	while (str[i] != '\0')
		SW_UART_Transmit(str[i++]);
}

void main(void)
{
	SW_UART_Enable();
	sei();
	SW_UART_Transmit('A');
	SW_UART_Transmit('V');
	SW_UART_Transmit('R');
	SW_UART_Transmit('\r');
	while (1)
	{
		if (state == DATA_PENDING)
		{
			state = IDLE;

			SW_UART_Transmit(RX_data);
			switch (RX_data)
			{

			case 'a':
				print_string("atmel avr\r");
				break;

			case 'A':
				print_string("Atmel AVR\r");
				break;

			default:
				print_string("Unknown command\r");
				break;
			}
		}
	}
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
	//timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
		switch (state)
		{
		// Transmit Byte.
		case TRANSMIT:
			// Output the TX buffer.
			if (counter < 8)
			{
				if (TX_data & 0x01)
				{				 // If the LSB of the TX buffer is 1:
					setb(PB, 7); // Send a logic 1 on the TX_PIN.
				}
				else
				{				 // Otherwise:
					clrb(PB, 7); // Send a logic 0 on the TX_PIN.
				}
				TX_data = TX_data >> 1; // Bitshift the TX buffer and
				counter++;				// increment TX bit counter.
			}

			//Send stop bit.
			else
			{
				setb(PB, 7); // Output a logic 1.
				state = TRANSMIT_STOP_BIT;
			}
			break;

		// Go to idle after stop bit was sent.
		case TRANSMIT_STOP_BIT:
			INTEN &= ~INTEN_TM2; // Stop the timer interrupts.
			state = IDLE;		 // Go back to idle.
			INTEN |= INTEN_PB5;	 // Enable reception again.
			break;

		//Receive Byte.
		case RECEIVE:
			TM2B = 103; // Count one period after the falling edge is trigged.
			//Receiving, LSB first.
			if (counter2 < 8)
			{
				counter2++;
				RX_data = (RX_data >> 1); // Shift due to receiving LSB first.
				if ((PB & (1 << 5)) != 0)
				{
					RX_data |= 0x80; // If a logical 1 is read, let the data mirror this.
				}
			}

			//Done receiving
			else
			{
				state = DATA_PENDING; // Enter DATA_PENDING when one byte is received.
				INTEN &= ~INTEN_TM2;  // Disable this interrupt.
				INTRQ &= ~INTRQ_PB5;  // Reset flag not to enter the ISR one extra time.
				INTEN |= INTEN_PB5;	  // Enable interrupt to receive more bytes.
			}
			break;

		// Unknown state.
		default:
			state = IDLE; // Error, should not occur. Going to a safe state.
		}
	}

	if (INTRQ & INTRQ_PB5)
	{
		INTRQ &= ~INTRQ_PB5; // Ma
		state = RECEIVE;
		INTEN &= ~INTEN_PB5;
		INTEN &= ~INTEN_TM2;
		TM2CT = 9;
		TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
		TM2B = 155;
		counter2 = 0;
		INTRQ &= ~INTRQ_TM2; // Ma
		INTEN |= INTEN_TM2;
	}
}

uint8_t _sdcc_external_startup(void)
{
	ROP = ROP_INT_SRC_PB5;
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}