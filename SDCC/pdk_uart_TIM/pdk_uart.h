/*
 * pdk_uart.h
 * Created: 2021/06/12
 * Author: taivb
*/


#ifndef PDK_UART_H
#define PDK_UART_H

#define SOFTUART_BAUD_RATE      115200

#define UART_Px         PB
#define UART_PxC        PBC
#define UART_PxDIER     PBDIER
#define UART_PxPH       PBPH
#define UART_RX         5
#define UART_TX         7


#define SOFTUART_IN_BUF_SIZE     32

// Init the Software Uart
void UART_begin(void);

// Clears the contents of the input buffer.
void softuart_flush_input_buffer( void );

// Tests whether an input character has been received.
uint8_t softuart_kbhit( void );

// Reads a character from the input buffer, waiting if necessary.
char softuart_getchar( void );

// To check if transmitter is busy
uint8_t softuart_transmit_busy( void );

// Config IO
void UART_IO_config(void);
// Writes a character to the serial port.
void UART_putC( const char );

// Turns on the receive function.
void UART_rx_on( void );

// Turns off the receive function.
void softuart_turn_rx_off( void );

// Write a NULL-terminated string from RAM to the serial port
void softuart_puts( const char *s );

// write a buffer through UART
void UART_print(char* str);

//Timer 2 interrupt function
void TIM2_interrupt(void);

//PB5 external interrupt function
void PB5_interrupt(void);


#endif