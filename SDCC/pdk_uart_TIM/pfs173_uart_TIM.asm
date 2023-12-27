;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pfs173_uart_TIM
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __sdcc_external_startup
	.globl _interrupt
	.globl _main
	.globl _print_string
	.globl __delay_loop_32
	.globl __delay_loop_16
	.globl __delay_loop_8
	.globl __t16c
	.globl __rop
	.globl __bgtr
	.globl __ilrcr
	.globl __pwmg2dtl
	.globl __pwmg2dth
	.globl __pwmg2c
	.globl __pwmg1dtl
	.globl __pwmg1dth
	.globl __pwmg1c
	.globl __pwmgcubl
	.globl __pwmgcubh
	.globl __pwmg0dtl
	.globl __pwmg0dth
	.globl __pwmgclk
	.globl __pwmg0c
	.globl __tm3b
	.globl __tm3s
	.globl __tm3ct
	.globl __tm3c
	.globl __tm2b
	.globl __tm2s
	.globl __tm2ct
	.globl __tm2c
	.globl __gpcs
	.globl __gpcc
	.globl __misclvr
	.globl __misc2
	.globl __misc
	.globl __adcrgc
	.globl __adcr
	.globl __adcm
	.globl __adcc
	.globl __pcpl
	.globl __pbpl
	.globl __pcph
	.globl __pcc
	.globl __pc
	.globl __pbph
	.globl __pbc
	.globl __pb
	.globl __paph
	.globl __pac
	.globl __pa
	.globl __pcdier
	.globl __pbdier
	.globl __padier
	.globl __integs
	.globl __ihrcr
	.globl __eoscr
	.globl __t16m
	.globl __intrq
	.globl __inten
	.globl __clkmd
	.globl __sp
	.globl __flag
	.globl _print_string_PARM_1
	.globl _SW_UART_Transmit_PARM_1
	.globl _SW_UART_status
	.globl _SW_UART_FRAME_ERROR
	.globl _SW_UART_RX_BUFFER_OVERFLOW
	.globl _SW_UART_RX_BUFFER_FULL
	.globl _SW_UART_TX_BUFFER_FULL
	.globl _RX_data
	.globl _TX_data
	.globl _last_bit_sent
	.globl _state
	.globl _bit_out
	.globl _counter2
	.globl _counter
	.globl __delay_loop_32_PARM_1
	.globl __delay_loop_16_PARM_1
	.globl __delay_loop_8_PARM_1
	.globl _SW_UART_Enable
	.globl _SW_UART_Transmit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG (ABS)
	.org 0x0000
__flag	=	0x0000
__sp	=	0x0002
__clkmd	=	0x0003
__inten	=	0x0004
__intrq	=	0x0005
__t16m	=	0x0006
__eoscr	=	0x000a
__ihrcr	=	0x000b
__integs	=	0x000c
__padier	=	0x000d
__pbdier	=	0x000e
__pcdier	=	0x000f
__pa	=	0x0010
__pac	=	0x0011
__paph	=	0x0012
__pb	=	0x0013
__pbc	=	0x0014
__pbph	=	0x0015
__pc	=	0x0016
__pcc	=	0x0017
__pcph	=	0x0018
__pbpl	=	0x0019
__pcpl	=	0x001a
__adcc	=	0x0020
__adcm	=	0x0021
__adcr	=	0x0022
__adcrgc	=	0x0024
__misc	=	0x0026
__misc2	=	0x0027
__misclvr	=	0x0028
__gpcc	=	0x002b
__gpcs	=	0x002c
__tm2c	=	0x0030
__tm2ct	=	0x0031
__tm2s	=	0x0032
__tm2b	=	0x0033
__tm3c	=	0x0034
__tm3ct	=	0x0035
__tm3s	=	0x0036
__tm3b	=	0x0037
__pwmg0c	=	0x0040
__pwmgclk	=	0x0041
__pwmg0dth	=	0x0042
__pwmg0dtl	=	0x0043
__pwmgcubh	=	0x0044
__pwmgcubl	=	0x0045
__pwmg1c	=	0x0046
__pwmg1dth	=	0x0048
__pwmg1dtl	=	0x0049
__pwmg2c	=	0x004c
__pwmg2dth	=	0x004e
__pwmg2dtl	=	0x004f
__ilrcr	=	0x0062
__bgtr	=	0x0063
__rop	=	0x0067
__t16c::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
__delay_loop_8_PARM_1:
	.ds 1
__delay_loop_16_PARM_1:
	.ds 2
__delay_loop_32_PARM_1:
	.ds 4
_counter::
	.ds 1
_counter2::
	.ds 1
_bit_out::
	.ds 1
_state::
	.ds 1
_last_bit_sent::
	.ds 1
_TX_data::
	.ds 1
_RX_data::
	.ds 1
_SW_UART_TX_BUFFER_FULL::
	.ds 1
_SW_UART_RX_BUFFER_FULL::
	.ds 1
_SW_UART_RX_BUFFER_OVERFLOW::
	.ds 1
_SW_UART_FRAME_ERROR::
	.ds 1
_SW_UART_status::
	.ds 1
_SW_UART_Transmit_PARM_1:
	.ds 1
_print_string_PARM_1:
	.ds 2
_print_string_sloc0_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	.area	HEADER (ABS)
	.org	 0x0020
	goto	_interrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	.area	PREG (ABS)
	.org 0x00
p::
	.ds 2
	.area	HEADER (ABS)
	.org 0x0000
	nop
	clear	p+1
	mov	a, #s_OSEG
	add	a, #l_OSEG + 1
	and	a, #0xfe
	mov.io	sp, a
	call	__sdcc_external_startup
	goto	s_GSINIT
	.area GSINIT
__sdcc_init_data:
	mov	a, #s_DATA
	mov	p, a
	goto	00002$
00001$:
	mov	a, #0x00
	idxm	p, a
	inc	p
	mov	a, #s_DATA
00002$:
	add	a, #l_DATA
	ceqsn	a, p
	goto	00001$
;	pfs173_uart_TIM.c: 22: unsigned char counter = 0;	   //even 2,4,6 when TRANSMIT
	clear	_counter+0
;	pfs173_uart_TIM.c: 23: unsigned char counter2 = 0;	   //even 2,4,6 when TRANSMIT
	clear	_counter2+0
;	pfs173_uart_TIM.c: 24: unsigned char bit_out = 0;	   //
	clear	_bit_out+0
;	pfs173_uart_TIM.c: 25: unsigned char state = 0;		   //
	clear	_state+0
;	pfs173_uart_TIM.c: 26: unsigned char last_bit_sent = 0; //
	clear	_last_bit_sent+0
;	pfs173_uart_TIM.c: 27: unsigned char TX_data = 0;	   //
	clear	_TX_data+0
;	pfs173_uart_TIM.c: 28: unsigned char RX_data = 0;	   //
	clear	_RX_data+0
	.area GSFINAL
	goto	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	goto	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_8
;	-----------------------------------------
__delay_loop_8:
;	delay.h: 44: __endasm;
	00001$:
; 4 cycles per loop
	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 45: }
	ret
;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_16
;	-----------------------------------------
__delay_loop_16:
;	delay.h: 65: __endasm;
	00001$:
; 8 cycles per loop
	nop	; 1 cycle
	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
	t1sn	f, z ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 66: }
	ret
;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_32
;	-----------------------------------------
__delay_loop_32:
;	delay.h: 94: __endasm;
	00001$:
; 12 cycles per loop
	nop	; 1 cycle
	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
	t1sn	f, z ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 95: }
	ret
;	pfs173_uart_TIM.c: 39: void SW_UART_Enable(void)
;	-----------------------------------------
;	 function SW_UART_Enable
;	-----------------------------------------
_SW_UART_Enable:
;	pfs173_uart_TIM.c: 42: setb(PBC, 7);
	set1.io	__pbc, #7
;	pfs173_uart_TIM.c: 43: setb(PB, 7);
	set1.io	__pb, #7
;	pfs173_uart_TIM.c: 46: setb(PBDIER, 5);
	set1.io	__pbdier, #5
;	pfs173_uart_TIM.c: 47: setb(PBPH, 5);
	set1.io	__pbph, #5
;	pfs173_uart_TIM.c: 49: INTEGS = INTEGS_PB5_FALLING;
	mov	a, #0x02
	mov.io	__integs, a
;	pfs173_uart_TIM.c: 52: INTEN &= ~INTEN_TM2;
	set0.io	__inten, #6
;	pfs173_uart_TIM.c: 55: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov.io	__tm2c, a
;	pfs173_uart_TIM.c: 56: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
	mov	a, #0x0f
	mov.io	__tm2s, a
;	pfs173_uart_TIM.c: 57: TM2B = 103;
	mov	a, #0x67
	mov.io	__tm2b, a
;	pfs173_uart_TIM.c: 59: INTEN |= INTEN_PB5;
	set1.io	__inten, #0
;	pfs173_uart_TIM.c: 61: state = IDLE;
	clear	_state+0
;	pfs173_uart_TIM.c: 62: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	pfs173_uart_TIM.c: 63: }
	ret
;	pfs173_uart_TIM.c: 65: void SW_UART_Transmit(unsigned char byte)
;	-----------------------------------------
;	 function SW_UART_Transmit
;	-----------------------------------------
_SW_UART_Transmit:
;	pfs173_uart_TIM.c: 68: while (state != IDLE)
00101$:
	mov	a, _state+0
	ceqsn	a, #0x00
	goto	00101$
;	pfs173_uart_TIM.c: 73: state = TRANSMIT;
	mov	a, #0x01
	mov	_state+0, a
;	pfs173_uart_TIM.c: 75: TX_data = byte; //copy data to tx buffer
	mov	a, _SW_UART_Transmit_PARM_1+0
	mov	_TX_data+0, a
;	pfs173_uart_TIM.c: 76: counter = 0;
	clear	_counter+0
;	pfs173_uart_TIM.c: 78: clrb(PB, 7); //send start bit
	set0.io	__pb, #7
;	pfs173_uart_TIM.c: 79: clrb(PB, 7); //send start bit
	set0.io	__pb, #7
;	pfs173_uart_TIM.c: 81: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	pfs173_uart_TIM.c: 82: INTEN |= INTEN_TM2;
	set1.io	__inten, #6
;	pfs173_uart_TIM.c: 83: }
	ret
;	pfs173_uart_TIM.c: 85: void print_string(char *str)
;	-----------------------------------------
;	 function print_string
;	-----------------------------------------
_print_string:
;	pfs173_uart_TIM.c: 88: while (str[i] != '\0')
	clear	_print_string_sloc0_1_0+0
	clear	_print_string_sloc0_1_0+1
00101$:
	mov	a, _print_string_PARM_1+0
	add	a, _print_string_sloc0_1_0+0
	mov	p, a
	mov	a, _print_string_PARM_1+1
	addc	a, _print_string_sloc0_1_0+1
	call	__gptrget
	cneqsn	a, #0x00
	goto	00104$
;	pfs173_uart_TIM.c: 89: SW_UART_Transmit(str[i++]);
	mov	a, _print_string_PARM_1+0
	add	a, _print_string_sloc0_1_0+0
	mov	p, a
	mov	a, _print_string_PARM_1+1
	addc	a, _print_string_sloc0_1_0+1
	inc	_print_string_sloc0_1_0+0
	addc	_print_string_sloc0_1_0+1
	call	__gptrget
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
	goto	00101$
00104$:
;	pfs173_uart_TIM.c: 90: }
	ret
;	pfs173_uart_TIM.c: 92: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pfs173_uart_TIM.c: 94: SW_UART_Enable();
	call	_SW_UART_Enable
;	pfs173_uart_TIM.c: 95: sei();
	engint
;	pfs173_uart_TIM.c: 96: SW_UART_Transmit('A');
	mov	a, #0x41
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
;	pfs173_uart_TIM.c: 97: SW_UART_Transmit('V');
	mov	a, #0x56
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
;	pfs173_uart_TIM.c: 98: SW_UART_Transmit('R');
	mov	a, #0x52
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
;	pfs173_uart_TIM.c: 99: SW_UART_Transmit('\r');
	mov	a, #0x0d
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
;	pfs173_uart_TIM.c: 100: while (1)
00108$:
;	pfs173_uart_TIM.c: 102: if (state == DATA_PENDING)
	mov	a, _state+0
	ceqsn	a, #0x05
	goto	00108$
;	pfs173_uart_TIM.c: 104: state = IDLE;
	clear	_state+0
;	pfs173_uart_TIM.c: 106: SW_UART_Transmit(RX_data);
	mov	a, _RX_data+0
	mov	_SW_UART_Transmit_PARM_1+0, a
	call	_SW_UART_Transmit
;	pfs173_uart_TIM.c: 107: switch (RX_data)
	mov	a, _RX_data+0
	cneqsn	a, #0x41
	goto	00102$
00128$:
	mov	a, _RX_data+0
	ceqsn	a, #0x61
	goto	00103$
;	pfs173_uart_TIM.c: 111: print_string("atmel avr\r");
	mov	a, #<(___str_0 + 0)
	mov	_print_string_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_print_string_PARM_1+1, a
	call	_print_string
;	pfs173_uart_TIM.c: 112: break;
	goto	00108$
;	pfs173_uart_TIM.c: 114: case 'A':
00102$:
;	pfs173_uart_TIM.c: 115: print_string("Atmel AVR\r");
	mov	a, #<(___str_1 + 0)
	mov	_print_string_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_print_string_PARM_1+1, a
	call	_print_string
;	pfs173_uart_TIM.c: 116: break;
	goto	00108$
;	pfs173_uart_TIM.c: 118: default:
00103$:
;	pfs173_uart_TIM.c: 119: print_string("Unknown command\r");
	mov	a, #<(___str_2 + 0)
	mov	_print_string_PARM_1+0, a
	mov	a, #>(___str_2 + 0x8000 + 0)
	mov	_print_string_PARM_1+1, a
	call	_print_string
;	pfs173_uart_TIM.c: 121: }
	goto	00108$
;	pfs173_uart_TIM.c: 124: }
	ret
;	pfs173_uart_TIM.c: 127: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pfs173_uart_TIM.c: 130: if (INTRQ & INTRQ_TM2)
	mov.io	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00118$
;	pfs173_uart_TIM.c: 132: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0.io	__intrq, #6
;	pfs173_uart_TIM.c: 133: switch (state)
	mov	a, _state+0
	cneqsn	a, #0x01
	goto	00101$
00159$:
	mov	a, _state+0
	cneqsn	a, #0x02
	goto	00109$
00160$:
	mov	a, _state+0
	cneqsn	a, #0x04
	goto	00108$
00161$:
	goto	00115$
;	pfs173_uart_TIM.c: 136: case TRANSMIT:
00101$:
;	pfs173_uart_TIM.c: 138: if (counter < 8)
	mov	a, _counter+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00106$
;	pfs173_uart_TIM.c: 140: if (TX_data & 0x01)
	mov	a, _TX_data+0
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00103$
;	pfs173_uart_TIM.c: 142: setb(PB, 7); // Send a logic 1 on the TX_PIN.
	set1.io	__pb, #7
	goto	00104$
00103$:
;	pfs173_uart_TIM.c: 146: clrb(PB, 7); // Send a logic 0 on the TX_PIN.
	set0.io	__pb, #7
00104$:
;	pfs173_uart_TIM.c: 148: TX_data = TX_data >> 1; // Bitshift the TX buffer and
	sr	_TX_data+0
;	pfs173_uart_TIM.c: 149: counter++;				// increment TX bit counter.
	inc	_counter+0
	goto	00118$
00106$:
;	pfs173_uart_TIM.c: 155: setb(PB, 7); // Output a logic 1.
	set1.io	__pb, #7
;	pfs173_uart_TIM.c: 156: state = TRANSMIT_STOP_BIT;
	mov	a, #0x04
	mov	_state+0, a
;	pfs173_uart_TIM.c: 158: break;
	goto	00118$
;	pfs173_uart_TIM.c: 161: case TRANSMIT_STOP_BIT:
00108$:
;	pfs173_uart_TIM.c: 162: INTEN &= ~INTEN_TM2; // Stop the timer interrupts.
	set0.io	__inten, #6
;	pfs173_uart_TIM.c: 163: state = IDLE;		 // Go back to idle.
	clear	_state+0
;	pfs173_uart_TIM.c: 164: INTEN |= INTEN_PB5;	 // Enable reception again.
	set1.io	__inten, #0
;	pfs173_uart_TIM.c: 165: break;
	goto	00118$
;	pfs173_uart_TIM.c: 168: case RECEIVE:
00109$:
;	pfs173_uart_TIM.c: 169: TM2B = 103; // Count one period after the falling edge is trigged.
	mov	a, #0x67
	mov.io	__tm2b, a
;	pfs173_uart_TIM.c: 171: if (counter2 < 8)
	mov	a, _counter2+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00113$
;	pfs173_uart_TIM.c: 173: counter2++;
	inc	_counter2+0
;	pfs173_uart_TIM.c: 174: RX_data = (RX_data >> 1); // Shift due to receiving LSB first.
	sr	_RX_data+0
;	pfs173_uart_TIM.c: 175: if ((PB & (1 << 5)) != 0)
	mov.io	a, __pb
	and	a, #0x20
	cneqsn	a, #0x00
	goto	00118$
;	pfs173_uart_TIM.c: 177: RX_data |= 0x80; // If a logical 1 is read, let the data mirror this.
	mov	a, #0x80
	or	_RX_data+0, a
	goto	00118$
00113$:
;	pfs173_uart_TIM.c: 184: state = DATA_PENDING; // Enter DATA_PENDING when one byte is received.
	mov	a, #0x05
	mov	_state+0, a
;	pfs173_uart_TIM.c: 185: INTEN &= ~INTEN_TM2;  // Disable this interrupt.
	set0.io	__inten, #6
;	pfs173_uart_TIM.c: 186: INTRQ &= ~INTRQ_PB5;  // Reset flag not to enter the ISR one extra time.
	set0.io	__intrq, #0
;	pfs173_uart_TIM.c: 187: INTEN |= INTEN_PB5;	  // Enable interrupt to receive more bytes.
	set1.io	__inten, #0
;	pfs173_uart_TIM.c: 189: break;
	goto	00118$
;	pfs173_uart_TIM.c: 192: default:
00115$:
;	pfs173_uart_TIM.c: 193: state = IDLE; // Error, should not occur. Going to a safe state.
	clear	_state+0
;	pfs173_uart_TIM.c: 194: }
00118$:
;	pfs173_uart_TIM.c: 197: if (INTRQ & INTRQ_PB5)
	mov.io	a, __intrq
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00121$
;	pfs173_uart_TIM.c: 200: INTRQ &= ~INTRQ_PB5; // Ma
	set0.io	__intrq, #0
;	pfs173_uart_TIM.c: 202: state = RECEIVE;
	mov	a, #0x02
	mov	_state+0, a
;	pfs173_uart_TIM.c: 203: INTEN &= ~INTEN_PB5;
	set0.io	__inten, #0
;	pfs173_uart_TIM.c: 204: INTEN &= ~INTEN_TM2;
	set0.io	__inten, #6
;	pfs173_uart_TIM.c: 205: TM2CT = 9;
	mov	a, #0x09
	mov.io	__tm2ct, a
;	pfs173_uart_TIM.c: 206: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
	mov	a, #0x0f
	mov.io	__tm2s, a
;	pfs173_uart_TIM.c: 207: TM2B = 155;
	mov	a, #0x9b
	mov.io	__tm2b, a
;	pfs173_uart_TIM.c: 208: counter2 = 0;
	clear	_counter2+0
;	pfs173_uart_TIM.c: 209: INTRQ &= ~INTRQ_TM2; // Ma
	set0.io	__intrq, #6
;	pfs173_uart_TIM.c: 210: INTEN |= INTEN_TM2;
	set1.io	__inten, #6
00121$:
;	pfs173_uart_TIM.c: 212: }
	pop	af
	mov	p, a
	pop	af
	reti
;	pfs173_uart_TIM.c: 214: unsigned char _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pfs173_uart_TIM.c: 216: ROP = ROP_INT_SRC_PB5;
	mov	a, #0x02
	mov.io	__rop, a
;	pfs173_uart_TIM.c: 217: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	pfs173_uart_TIM.c: 218: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); //tune SYSCLK to 8MHz @ 4.000V
	and	a, #'R'                        
	and	a, #'C'                        
	and	a, #((1))          
	and	a, #((8000000))     
	and	a, #((8000000)>>8)  
	and	a, #((8000000)>>16) 
	and	a, #((8000000)>>24) 
	and	a, #((4000))     
	and	a, #((4000)>>8)  
	and	a, #((0x0B))           
;	pfs173_uart_TIM.c: 219: return 0;							  //perform normal initialization
;	pfs173_uart_TIM.c: 220: }
	ret	#0x00
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x61	; a
	ret #0x74	; t
	ret #0x6d	; m
	ret #0x65	; e
	ret #0x6c	; l
	ret #0x20	;  
	ret #0x61	; a
	ret #0x76	; v
	ret #0x72	; r
	ret #0x0d
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x41	; A
	ret #0x74	; t
	ret #0x6d	; m
	ret #0x65	; e
	ret #0x6c	; l
	ret #0x20	;  
	ret #0x41	; A
	ret #0x56	; V
	ret #0x52	; R
	ret #0x0d
	ret #0x00
	.area CODE
	.area CONST
___str_2:
	ret #0x55	; U
	ret #0x6e	; n
	ret #0x6b	; k
	ret #0x6e	; n
	ret #0x6f	; o
	ret #0x77	; w
	ret #0x6e	; n
	ret #0x20	;  
	ret #0x63	; c
	ret #0x6f	; o
	ret #0x6d	; m
	ret #0x6d	; m
	ret #0x61	; a
	ret #0x6e	; n
	ret #0x64	; d
	ret #0x0d
	ret #0x00
	.area CODE
	.area CABS (ABS)
