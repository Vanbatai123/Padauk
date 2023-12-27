;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _main
	.globl __sdcc_external_startup
	.globl _UART_printNum
	.globl _UART_print
	.globl _TIM2_interrupt
	.globl _UART_begin
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
	.globl _txdata
	.globl __delay_loop_32_PARM_1
	.globl __delay_loop_16_PARM_1
	.globl __delay_loop_8_PARM_1
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
_txdata::
	.ds 2
_main_sloc0_1_0:
	.ds 4
_main_sloc1_1_0:
	.ds 4
_main_sloc2_1_0:
	.ds 1
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
;	main.c: 13: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	main.c: 15: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 16: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
	and	a, #'R'                        
	and	a, #'C'                        
	and	a, #((1))          
	and	a, #((8000000))     
	and	a, #((8000000)>>8)  
	and	a, #((8000000)>>16) 
	and	a, #((8000000)>>24) 
	and	a, #((5000))     
	and	a, #((5000)>>8)  
	and	a, #((0x0B))           
;	main.c: 17: return 0;							  // perform normal initialization
;	main.c: 18: }
	ret	#0x00
;	main.c: 20: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 23: UART_begin(); // Initialize UART engine
	call	_UART_begin
;	main.c: 25: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	main.c: 26: sei(); // Enable global interrupts
	engint
;	main.c: 29: ADCRGC = ADCRG_ADC_REF_VDD; // ADC reference voltage is VDD
	mov	a, #0x00
	mov.io	__adcrgc, a
;	main.c: 31: ADCM = ADCM_CLK_SYSCLK_DIV16;				   // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
	mov	a, #0x08
	mov.io	__adcm, a
;	main.c: 32: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD16_BANDGAP; // enable ADC and use channel 16 (internal bandgap voltage 1.2V)
	mov	a, #0xbc
	mov.io	__adcc, a
;	main.c: 36: UART_print("Measuring VDD (VBandGap): ");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	main.c: 38: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
	set1.io	__adcc, #6
;	main.c: 39: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
00101$:
	mov.io	a, __adcc
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00101$
;	main.c: 41: uint8_t adcval = ADCR; // read the ADC value
	mov.io	a, __adcr
;	main.c: 44: uint32_t vdd = (1200UL * 255) / adcval;
	mov	__divulong_PARM_2+0, a
	clear	__divulong_PARM_2+1
	clear	__divulong_PARM_2+2
	clear	__divulong_PARM_2+3
	mov	a, #0x50
	mov	__divulong_PARM_1+0, a
	mov	a, #0xab
	mov	__divulong_PARM_1+1, a
	mov	a, #0x04
	mov	__divulong_PARM_1+2, a
	clear	__divulong_PARM_1+3
	mov	a, #_main_sloc0_1_0
	push	af
	call	__divulong
	mov.io	a, sp
	add	a, #-2
	mov.io	sp, a
	mov	a, _main_sloc0_1_0+0
	mov	_main_sloc1_1_0+0, a
	mov	a, _main_sloc0_1_0+1
	mov	_main_sloc1_1_0+1, a
	mov	a, _main_sloc0_1_0+2
	mov	_main_sloc1_1_0+2, a
	mov	a, _main_sloc0_1_0+3
	mov	_main_sloc1_1_0+3, a
;	main.c: 46: UART_printNum(vdd);
	mov	a, _main_sloc1_1_0+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, _main_sloc1_1_0+1
	mov	_UART_printNum_PARM_1+1, a
	call	_UART_printNum
;	main.c: 47: UART_print(" mV\n");
	mov	a, #<(___str_1 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	main.c: 51: PBC &= ~(1 << 0);						   // disable PA.0 GPIO output
	set0.io	__pbc, #0
;	main.c: 52: PBPH &= ~(1 << 0);						   // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
	set0.io	__pbph, #0
;	main.c: 53: PBDIER &= ~(1 << 0);					   // disable PA.0 GPIO input
	set0.io	__pbdier, #0
;	main.c: 54: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
	mov	a, #0x80
	mov.io	__adcc, a
;	main.c: 56: UART_print("Start ADC on PA.0\n");
	mov	a, #<(___str_2 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_2 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	main.c: 57: while (1)
00108$:
;	main.c: 59: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
	set1.io	__adcc, #6
;	main.c: 60: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
00104$:
	mov.io	a, __adcc
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00104$
;	main.c: 63: uint8_t adcval = ADCR; // read the ADC value
	mov.io	a, __adcr
	mov	_main_sloc2_1_0+0, a
;	main.c: 64: UART_print("PA.0 : ");
	mov	a, #<(___str_3 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_3 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	main.c: 65: UART_printNum(adcval);
	mov	a, _main_sloc2_1_0+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	main.c: 66: UART_print("\n");
	mov	a, #<(___str_4 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_4 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	main.c: 67: _delay_ms(50);
	mov	a, #0x4e
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0xc3
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
	goto	00108$
;	main.c: 70: }
	ret
;	main.c: 73: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	main.c: 76: if (INTRQ & INTRQ_TM2)
	mov.io	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00103$
;	main.c: 78: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0.io	__intrq, #6
;	main.c: 80: TIM2_interrupt();
	call	_TIM2_interrupt
00103$:
;	main.c: 82: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x4d	; M
	ret #0x65	; e
	ret #0x61	; a
	ret #0x73	; s
	ret #0x75	; u
	ret #0x72	; r
	ret #0x69	; i
	ret #0x6e	; n
	ret #0x67	; g
	ret #0x20	;  
	ret #0x56	; V
	ret #0x44	; D
	ret #0x44	; D
	ret #0x20	;  
	ret #0x28	; (
	ret #0x56	; V
	ret #0x42	; B
	ret #0x61	; a
	ret #0x6e	; n
	ret #0x64	; d
	ret #0x47	; G
	ret #0x61	; a
	ret #0x70	; p
	ret #0x29	; )
	ret #0x3a	; :
	ret #0x20	;  
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x20	;  
	ret #0x6d	; m
	ret #0x56	; V
	ret #0x0a
	ret #0x00
	.area CODE
	.area CONST
___str_2:
	ret #0x53	; S
	ret #0x74	; t
	ret #0x61	; a
	ret #0x72	; r
	ret #0x74	; t
	ret #0x20	;  
	ret #0x41	; A
	ret #0x44	; D
	ret #0x43	; C
	ret #0x20	;  
	ret #0x6f	; o
	ret #0x6e	; n
	ret #0x20	;  
	ret #0x50	; P
	ret #0x41	; A
	ret #0x2e	; .
	ret #0x30	; 0
	ret #0x0a
	ret #0x00
	.area CODE
	.area CONST
___str_3:
	ret #0x50	; P
	ret #0x41	; A
	ret #0x2e	; .
	ret #0x30	; 0
	ret #0x20	;  
	ret #0x3a	; :
	ret #0x20	;  
	ret #0x00
	.area CODE
	.area CONST
___str_4:
	ret #0x0a
	ret #0x00
	.area CODE
	.area CABS (ABS)
