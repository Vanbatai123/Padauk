// softuart.c
// AVR-port of the generic software uart written in C
//
// Generic code from
// Colin Gittins, Software Engineer, Halliburton Energy Services
// (has been available from iar.com web-site -> application notes)
//
// Adapted to AVR using avr-gcc and avr-libc
// by Martin Thomas, Kaiserslautern, Germany
// <eversmith@heizung-thomas.de> 
// http://www.siwawi.arubi.uni-kl.de/avr_projects
//
// AVR-port Version 0.4  10/2010
//
// ---------------------------------------------------------------------
//
// Remarks from Colin Gittins:
//
// Generic software uart written in C, requiring a timer set to 3 times
// the baud rate, and two software read/write pins for the receive and
// transmit functions.
//
// * Received characters are buffered
// * putchar(), getchar(), kbhit() and flush_input_buffer() are available
// * There is a facility for background processing while waiting for input
// The baud rate can be configured by changing the BAUD_RATE macro as
// follows:
//
// #define BAUD_RATE  19200.0
//
// The function init_uart() must be called before any comms can take place
//
// Interface routines required:
// 1. get_rx_pin_status()
//    Returns 0 or 1 dependent on whether the receive pin is high or low.
// 2. set_tx_pin_high()
//    Sets the transmit pin to the high state.
// 3. set_tx_pin_low()
//    Sets the transmit pin to the low state.
// 4. idle()
//    Background functions to execute while waiting for input.
// 5. timer_set( BAUD_RATE )
//    Sets the timer to 3 times the baud rate.
// 6. set_timer_interrupt( timer_isr )
//    Enables the timer interrupt.
//
// Functions provided:
// 1. void flush_input_buffer( void )
//    Clears the contents of the input buffer.
// 2. char kbhit( void )
//    Tests whether an input character has been received.
// 3. char getchar( void )
//    Reads a character from the input buffer, waiting if necessary.
// 4. void turn_rx_on( void )
//    Turns on the receive function.
// 5. void turn_rx_off( void )
//    Turns off the receive function.
// 6. void putchar( char )
//    Writes a character to the serial port.
//
// ---------------------------------------------------------------------

/* 
Remarks by Martin Thomas (avr-gcc/avr-libc):
V0.1 (2/2005)
- stdio.h not used
- AVR-Timer in CTC-Mode ("manual" reload may not be accurate enough)
- Global Interrupt Flag has to be enabled (see demo-application)
- Interface timer_set and set_timer_interrupt not used here
- internal_tx_buffer was defined as uint8_t - thas could not
  work since more than 8 bits are needed, changed to unsigned short
- some variables moved from "global scope" into ISR function-scope
- GPIO initialisation included
- Added functions for string-output inspired by P. Fleury's AVR UART-lib.
V0.2 (3/2007)
- adjusted number of RX-bits
- adapted to avr-libc ISR-macro (replaces SIGNAL)
- disable interrupts during timer-init
- used uint8_t (uint8_t) where apropriate
- removed "magic" char checking (0xc2)
- added softuart_can_transmit()
- Makefile based on template from WinAVR 1/2007
- reformated
- extended demo-application to show various methods to 
  send a string from flash and RAM
- demonstrate usage of avr-libc's stdio in demo-applcation
- tested with ATmega644 @ 3,6864MHz system-clock using
  avr-gcc 4.1.1/avr-libc 1.4.5 (WinAVR 1/2007)
V0.3 (4/2007)
- better configuration options in softuart.h.
  ->should be easier to adapt to different AVRs
- tested with ATtiny85 @ 1MHz (internal RC) with 2400bps
- AVR-Studio Project-File
V0.4 (10/2010)
- added options for ATmega164P, ATmega32P, ATmega64P
- changed some variable-types from char to uint8_t
- changed some comparisons from <= to ==
- small optimization in ISR for RX with temporary variable
- minor modifications in comments and formating
- added compiler options -fno-inline-small-functions, -Wl,--relax
- renamed flag_tx_ready to flag_tx_busy
- replaced softuart_can_transmit() by softuart_transmit_busy()
- tested with ATmega324PV @ 1MHz internal RC and 2400bps
  (options for ATtiny25/45/85 still available)
- added 3BSD license
- removed redundant zero-init in declaration of qin and qout
*/

/* Copyright (c) 2003, Colin Gittins
   Copyright (c) 2005, 2007, 2010, Martin Thomas
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.

   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in
     the documentation and/or other materials provided with the
     distribution.

   * Neither the name of the copyright holders nor the names of
     contributors may be used to endorse or promote products derived
     from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. */



#include "pfs173.h"
#include "pdk_uart.h"

#define SU_TRUE    1
#define SU_FALSE   0

// startbit and stopbit parsed internally (see ISR)
#define RX_NUM_OF_BITS (8)
volatile static char           inbuf[SOFTUART_IN_BUF_SIZE];
volatile uint8_t  qin;
uint8_t           qout;
volatile uint8_t  flag_rx_off;
volatile uint8_t  flag_rx_ready;

// 1 Startbit, 8 Databits, 1 Stopbit = 10 Bits/Frame
#define TX_NUM_OF_BITS (10)
volatile uint8_t  flag_tx_busy;
volatile uint8_t  timer_tx_ctr;
volatile uint8_t  bits_left_in_tx;
volatile static unsigned short internal_tx_buffer; /* ! mt: was type uchar - this was wrong */

#define set_tx_pin_high()      ( SOFTUART_TXPORT |=  ( 1 << SOFTUART_TXBIT ) )
#define set_tx_pin_low()       ( SOFTUART_TXPORT &= ~( 1 << SOFTUART_TXBIT ) )
#define get_rx_pin_status()    ( SOFTUART_RXPIN  &   ( 1 << SOFTUART_RXBIT ) )

void interrupt(void) __interrupt(0) 
{
  	if (INTRQ & INTRQ_TM2) 
	{        // TM2 interrupt request?
		INTRQ &= ~INTRQ_TM2;          // Mark TM2 interrupt request processed

		uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
		uint8_t rx_mask;
		
		uint8_t timer_rx_ctr;
		uint8_t bits_left_in_rx;
		uint8_t internal_rx_buffer;
		
		uint8_t start_bit, flag_in;
		uint8_t tmp;
		
		// Transmitter Section
		if ( flag_tx_busy == SU_TRUE ) {
			tmp = timer_tx_ctr;
			if ( --tmp == 0 ) { // if ( --timer_tx_ctr <= 0 )
				if ( internal_tx_buffer & 0x01 ) {
					set_tx_pin_high();
				}
				else {
					set_tx_pin_low();
				}
				internal_tx_buffer >>= 1;
				tmp = 3; // timer_tx_ctr = 3;
				if ( --bits_left_in_tx == 0 ) {
					flag_tx_busy = SU_FALSE;
				}
			}
			timer_tx_ctr = tmp;
		}

		// Receiver Section
		if ( flag_rx_off == SU_FALSE ) {
			if ( flag_rx_waiting_for_stop_bit ) {
				if ( --timer_rx_ctr == 0 ) {
					flag_rx_waiting_for_stop_bit = SU_FALSE;
					flag_rx_ready = SU_FALSE;
					inbuf[qin] = internal_rx_buffer;
					if ( ++qin >= SOFTUART_IN_BUF_SIZE ) {
						// overflow - reset inbuf-index
						qin = 0;
					}
				}
			}
			else {  // rx_test_busy
				if ( flag_rx_ready == SU_FALSE ) {
					start_bit = get_rx_pin_status();
					// test for start bit
					if ( start_bit == 0 ) {
						flag_rx_ready      = SU_TRUE;
						internal_rx_buffer = 0;
						timer_rx_ctr       = 4;
						bits_left_in_rx    = RX_NUM_OF_BITS;
						rx_mask            = 1;
					}
				}
				else {  // rx_busy
					tmp = timer_rx_ctr;
					if ( --tmp == 0 ) { // if ( --timer_rx_ctr == 0 ) {
						// rcv
						tmp = 3;
						flag_in = get_rx_pin_status();
						if ( flag_in ) {
							internal_rx_buffer |= rx_mask;
						}
						rx_mask <<= 1;
						if ( --bits_left_in_rx == 0 ) {
							flag_rx_waiting_for_stop_bit = SU_TRUE;
						}
					}
					timer_rx_ctr = tmp;
				}
			}
		}
  	}
}

static void io_init(void)
{
	// TX-Pin as output
	SOFTUART_TXDDR |=  ( 1 << SOFTUART_TXBIT );
	// RX-Pin as input
	SOFTUART_RXDDR &= ~( 1 << SOFTUART_RXBIT );
}

static void timer_init(void)
{
	  // Setup timer2 (TM2) interrupt for 115200 baud
  TM2C = TM2C_CLK_IHRC;                         // Use IHRC -> 16 Mhz
  TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2;  // No prescale, scale 2 ~> 8MHz
  TM2B = 69;                                    // Divide by 69 ~> 115942 Hz (apx. 115200)

  //PAC |= (1 << UART_TX_PIN);                  // Enable TX Pin as output
  //txdata = 0xD55F;                              // Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
  INTEN |= INTEN_TM2;                           // Enable TM2 interrupt, send out initial stop bits and autobaud char
}

void softuart_init( void )
{
	flag_tx_busy  = SU_FALSE;
	flag_rx_ready = SU_FALSE;
	flag_rx_off   = SU_FALSE;
	
	set_tx_pin_high(); /* mt: set to high to avoid garbage on init */

	io_init();
	timer_init();
	
	INTRQ = 0;
	__asm__("engint\n");
	
	while ( flag_tx_busy == SU_TRUE );
	// invoke_UART_transmit
	timer_tx_ctr       = 3;
	bits_left_in_tx    = TX_NUM_OF_BITS;
	internal_tx_buffer = 0xD5;
	flag_tx_busy       = SU_TRUE;
	
	while ( flag_tx_busy == SU_TRUE );
	// invoke_UART_transmit
	timer_tx_ctr       = 3;
	bits_left_in_tx    = TX_NUM_OF_BITS;
	internal_tx_buffer = 0x5F;
	flag_tx_busy       = SU_TRUE;
}

static void idle(void)
{
	// timeout handling goes here 
	// - but there is a "softuart_kbhit" in this code...
	// add watchdog-reset here if needed
}

void softuart_turn_rx_on( void )
{
	flag_rx_off = SU_FALSE;
}

void softuart_turn_rx_off( void )
{
	flag_rx_off = SU_TRUE;
}

char softuart_getchar( void )
{
	char ch;

	while ( qout == qin ) {
		idle();
	}
	ch = inbuf[qout];
	if ( ++qout >= SOFTUART_IN_BUF_SIZE ) {
		qout = 0;
	}
	
	return( ch );
}

uint8_t softuart_kbhit( void )
{
	return( qin != qout );
}

void softuart_flush_input_buffer( void )
{
	qin  = 0;
	qout = 0;
}
	
uint8_t softuart_transmit_busy( void ) 
{
	return ( flag_tx_busy == SU_TRUE ) ? 1 : 0;
}

void softuart_putchar( const char ch )
{
	while ( flag_tx_busy == SU_TRUE ) {
		; // wait for transmitter ready
		  // add watchdog-reset here if needed;
	}

	// invoke_UART_transmit
	timer_tx_ctr       = 3;
	bits_left_in_tx    = TX_NUM_OF_BITS;
	internal_tx_buffer = ( ch << 1 ) | 0x200;
	flag_tx_busy       = SU_TRUE;
}
	
void softuart_puts( const char *s )
{
	while ( *s ) {
		softuart_putchar( *s++ );
	}
}
	


