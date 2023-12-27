;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module timer16
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _UART_printNum
	.globl _UART_print
	.globl _interrupt
	.globl __sdcc_external_startup
	.globl _TIM2_interrupt
	.globl _putChar
	.globl _UART_begin
	.globl _millis_irq_handler
	.globl _millis
	.globl _millis_setup
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
	.globl _t
	.globl _UART_printNum_PARM_2
	.globl _UART_printNum_PARM_1
	.globl _UART_print_PARM_1
	.globl _txdata
	.globl _flag
	.globl __millis
	.globl __ticks
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
__ticks::
	.ds 1
__millis::
	.ds 4
_flag::
	.ds 1
_txdata::
	.ds 2
_UART_print_PARM_1:
	.ds 2
_UART_print_sloc2_1_0:
	.ds 1
_UART_printNum_PARM_1:
	.ds 4
_UART_printNum_PARM_2:
	.ds 1
_UART_printNum_dis_65536_23:
	.ds 10
_UART_printNum_sloc3_1_0:
	.ds 4
_UART_printNum_sloc4_1_0:
	.ds 4
_UART_printNum_sloc5_1_0:
	.ds 1
_UART_printNum_sloc6_1_0:
	.ds 1
_UART_printNum_sloc7_1_0:
	.ds 4
_UART_printNum_sloc8_1_0:
	.ds 1
_UART_printNum_sloc9_1_0:
	.ds 1
_UART_printNum_sloc10_1_0:
	.ds 1
_UART_printNum_sloc11_1_0:
	.ds 1
_UART_printNum_sloc12_1_0:
	.ds 1
_UART_printNum_sloc13_1_0:
	.ds 1
_UART_printNum_sloc14_1_0:
	.ds 2
_UART_printNum_sloc15_1_0:
	.ds 1
_UART_printNum_sloc16_1_0:
	.ds 1
_UART_printNum_sloc17_1_0:
	.ds 1
_UART_printNum_sloc18_1_0:
	.ds 1
_t::
	.ds 4
_main_sloc19_1_0:
	.ds 4
_main_sloc20_1_0:
	.ds 4
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
	.area	OSEG (OVR,DATA)
_millis_sloc0_1_0:
	.ds 4
	.area	OSEG (OVR,DATA)
_millis_irq_handler_sloc1_1_0:
	.ds 4
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
;	timer16.c: 13: uint8_t flag = 0;
	clear	_flag+0
;	timer16.c: 97: uint32_t t = 0;
	clear	_t+0
	clear	_t+1
	clear	_t+2
	clear	_t+3
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
;	millis.h: 12: void millis_setup()
;	-----------------------------------------
;	 function millis_setup
;	-----------------------------------------
_millis_setup:
;	millis.h: 18: T16C = 0;
	clear	p
	stt16	p
;	millis.h: 20: }
	ret
;	millis.h: 22: uint32_t millis()
;	-----------------------------------------
;	 function millis
;	-----------------------------------------
_millis:
;	millis.h: 24: INTEN &= ~INTEN_T16;			  // Disable T16 (read of 32 bit value _millis is non-atomic)
	set0.io	__inten, #2
;	millis.h: 25: uint32_t currentMillis = _millis; // Read _millis while T16 interrupt is off (otherwise it might be modified on us!)
	mov	a, __millis+0
	mov	_millis_sloc0_1_0+0, a
	mov	a, __millis+1
	mov	_millis_sloc0_1_0+1, a
	mov	a, __millis+2
	mov	_millis_sloc0_1_0+2, a
	mov	a, __millis+3
	mov	_millis_sloc0_1_0+3, a
;	millis.h: 26: INTEN |= INTEN_T16;				  // Re-enable T16
	set1.io	__inten, #2
;	millis.h: 27: return currentMillis;
	mov.io	a, sp
	add	a, #0xfc
	mov	p, a
	idxm	a, p
	mov	p, a
	mov	a, _millis_sloc0_1_0+0
	idxm	p, a
	inc	p
	mov	a, _millis_sloc0_1_0+1
	idxm	p, a
	inc	p
	mov	a, _millis_sloc0_1_0+2
	idxm	p, a
	inc	p
	mov	a, _millis_sloc0_1_0+3
	idxm	p, a
;	millis.h: 28: }
	ret
;	millis.h: 30: void millis_irq_handler()
;	-----------------------------------------
;	 function millis_irq_handler
;	-----------------------------------------
_millis_irq_handler:
;	millis.h: 32: if (_ticks++ == (uint8_t)(1000 / US_PER_TICK))
	mov	a, __ticks+0
	push	af
	add	a, #0x01
	mov	__ticks+0, a
	pop	af
	ceqsn	a, #0x1f
	goto	00103$
;	millis.h: 34: _ticks = 0;
	clear	__ticks+0
;	millis.h: 35: _millis++;
	mov	a, __millis+0
	mov	_millis_irq_handler_sloc1_1_0+0, a
	mov	a, __millis+1
	mov	_millis_irq_handler_sloc1_1_0+1, a
	mov	a, __millis+2
	mov	_millis_irq_handler_sloc1_1_0+2, a
	mov	a, __millis+3
	mov	_millis_irq_handler_sloc1_1_0+3, a
	mov	a, _millis_irq_handler_sloc1_1_0+0
	add	a, #0x01
	mov	__millis+0, a
	mov	a, _millis_irq_handler_sloc1_1_0+1
	addc	a
	mov	__millis+1, a
	mov	a, _millis_irq_handler_sloc1_1_0+2
	addc	a
	mov	__millis+2, a
	mov	a, _millis_irq_handler_sloc1_1_0+3
	addc	a
	mov	__millis+3, a
00103$:
;	millis.h: 37: }
	ret
;	timer16.c: 16: unsigned char _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	timer16.c: 18: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 1MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	timer16.c: 19: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
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
;	timer16.c: 20: return 0;							  // perform normal initialization
;	timer16.c: 21: }
	ret	#0x00
;	timer16.c: 23: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	timer16.c: 25: if (INTRQ & INTRQ_T16) // TM2 interrupt request?
	mov.io	a, __intrq
	and	a, #0x04
	cneqsn	a, #0x00
	goto	00102$
;	timer16.c: 27: millis_irq_handler();
	call	_millis_irq_handler
;	timer16.c: 28: INTRQ &= ~INTRQ_T16;
	set0.io	__intrq, #2
00102$:
;	timer16.c: 31: if (INTRQ & INTRQ_TM2)
	mov.io	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00105$
;	timer16.c: 33: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0.io	__intrq, #6
;	timer16.c: 35: TIM2_interrupt();
	call	_TIM2_interrupt
00105$:
;	timer16.c: 37: }
	pop	af
	mov	p, a
	pop	af
	reti
;	timer16.c: 39: void UART_print(char *str)
;	-----------------------------------------
;	 function UART_print
;	-----------------------------------------
_UART_print:
;	timer16.c: 42: while (str[i] != '\0')
	clear	_UART_print_sloc2_1_0+0
00101$:
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc2_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a
	call	__gptrget
	cneqsn	a, #0x00
	goto	00104$
;	timer16.c: 43: putChar(str[i++]);
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc2_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a
	inc	_UART_print_sloc2_1_0+0
	call	__gptrget
	mov	_putChar_PARM_1+0, a
	clear	_putChar_PARM_1+1
	call	_putChar
	goto	00101$
00104$:
;	timer16.c: 44: }
	ret
;	timer16.c: 46: void UART_printNum(int32_t num, uint8_t base)
;	-----------------------------------------
;	 function UART_printNum
;	-----------------------------------------
_UART_printNum:
;	timer16.c: 49: int8_t max = 0, flag = 0; // max: index of dis array, flag: = 1 if negative
	clear	p
	clear	_UART_printNum_sloc5_1_0+0
;	timer16.c: 51: if (num == 0) // input 0
	mov	a, _UART_printNum_PARM_1+0
	or	a, _UART_printNum_PARM_1+1
	or	a, _UART_printNum_PARM_1+2
	or	a, _UART_printNum_PARM_1+3
	ceqsn	a, #0x00
	goto	00104$
;	timer16.c: 53: dis[max++] = '0';
	mov	a, #0x01
	mov	p, a
	mov	a, #0x30
	mov	_UART_printNum_dis_65536_23+0, a
	goto	00131$
00104$:
;	timer16.c: 55: else if (num < 0) // negative number
	mov	a, _UART_printNum_PARM_1+3
	sub	a, #0x80
	t0sn.io	f, c
	goto	00131$
;	timer16.c: 57: num = 0 - num;
	mov	a, #0x00
	sub	a, _UART_printNum_PARM_1+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	mov	_UART_printNum_PARM_1+1, a
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+2
	mov	_UART_printNum_PARM_1+2, a
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+3
	mov	_UART_printNum_PARM_1+3, a
;	timer16.c: 58: flag = 1;
	mov	a, #0x01
	mov	_UART_printNum_sloc5_1_0+0, a
;	timer16.c: 60: while (num > 0) // convert to base number and add to dis array
00131$:
	mov	a, p
	mov	_UART_printNum_sloc6_1_0+0, a
00109$:
	mov	a, #0x00
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+2
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+3
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00138$
;	timer16.c: 62: if (num % base >= 10)
	mov	a, _UART_printNum_PARM_2+0
	mov	_UART_printNum_sloc7_1_0+0, a
	clear	_UART_printNum_sloc7_1_0+1
	clear	_UART_printNum_sloc7_1_0+2
	clear	_UART_printNum_sloc7_1_0+3
	mov	a, _UART_printNum_PARM_1+0
	mov	__modslong_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modslong_PARM_1+1, a
	mov	a, _UART_printNum_PARM_1+2
	mov	__modslong_PARM_1+2, a
	mov	a, _UART_printNum_PARM_1+3
	mov	__modslong_PARM_1+3, a
	mov	a, _UART_printNum_sloc7_1_0+0
	mov	__modslong_PARM_2+0, a
	mov	a, _UART_printNum_sloc7_1_0+1
	mov	__modslong_PARM_2+1, a
	mov	a, _UART_printNum_sloc7_1_0+2
	mov	__modslong_PARM_2+2, a
	mov	a, _UART_printNum_sloc7_1_0+3
	mov	__modslong_PARM_2+3, a
	mov	a, #_UART_printNum_sloc3_1_0
	push	af
	call	__modslong
	mov.io	a, sp
	add	a, #-2
	mov.io	sp, a
	mov	a, _UART_printNum_sloc3_1_0+0
	sub	a, #0x0a
	mov	a, _UART_printNum_sloc3_1_0+1
	subc	a
	mov	a, _UART_printNum_sloc3_1_0+2
	subc	a
	mov	a, _UART_printNum_sloc3_1_0+3
	subc	a
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t0sn.io	f, c
	goto	00107$
;	timer16.c: 63: dis[max] = num % base + 55;
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc6_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc3_1_0+0
	add	a, #0x37
	idxm	p, a
	goto	00108$
00107$:
;	timer16.c: 65: dis[max] = num % base + 48;
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc6_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc3_1_0+0
	add	a, #0x30
	idxm	p, a
00108$:
;	timer16.c: 67: num = num / base;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divslong_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divslong_PARM_1+1, a
	mov	a, _UART_printNum_PARM_1+2
	mov	__divslong_PARM_1+2, a
	mov	a, _UART_printNum_PARM_1+3
	mov	__divslong_PARM_1+3, a
	mov	a, _UART_printNum_sloc7_1_0+0
	mov	__divslong_PARM_2+0, a
	mov	a, _UART_printNum_sloc7_1_0+1
	mov	__divslong_PARM_2+1, a
	mov	a, _UART_printNum_sloc7_1_0+2
	mov	__divslong_PARM_2+2, a
	mov	a, _UART_printNum_sloc7_1_0+3
	mov	__divslong_PARM_2+3, a
	mov	a, #_UART_printNum_sloc4_1_0
	push	af
	call	__divslong
	mov.io	a, sp
	add	a, #-2
	mov.io	sp, a
	mov	a, _UART_printNum_sloc4_1_0+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, _UART_printNum_sloc4_1_0+1
	mov	_UART_printNum_PARM_1+1, a
	mov	a, _UART_printNum_sloc4_1_0+2
	mov	_UART_printNum_PARM_1+2, a
	mov	a, _UART_printNum_sloc4_1_0+3
	mov	_UART_printNum_PARM_1+3, a
;	timer16.c: 68: max++;
	inc	_UART_printNum_sloc6_1_0+0
	goto	00109$
00138$:
	mov	a, _UART_printNum_sloc6_1_0+0
	mov	_UART_printNum_sloc8_1_0+0, a
;	timer16.c: 71: if (base == HEX) // add 0x for HEX and 0B for BIN
	mov	a, _UART_printNum_PARM_2+0
	ceqsn	a, #0x10
	goto	00117$
;	timer16.c: 73: if (max % 2 == 1)
	mov	a, _UART_printNum_sloc6_1_0+0
	mov	__modsint_PARM_1+0, a
	sl	a
	mov	a, #0x00
	subc	a
	mov	__modsint_PARM_1+1, a
	mov	a, #0x02
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	ceqsn	a, #0x01
	goto	00113$
	mov	a, p
	ceqsn	a, #0x00
	goto	00113$
;	timer16.c: 74: dis[max++] = '0';
	mov	a, _UART_printNum_sloc6_1_0+0
	add	a, #0x01
	mov	_UART_printNum_sloc8_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc6_1_0+0
	mov	p, a
	mov	a, #0x30
	idxm	p, a
00113$:
;	timer16.c: 76: dis[max++] = 'x';
	mov	a, _UART_printNum_sloc8_1_0+0
	mov	_UART_printNum_sloc9_1_0+0, a
	mov	a, _UART_printNum_sloc8_1_0+0
	add	a, #0x01
	mov	_UART_printNum_sloc10_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc9_1_0+0
	mov	p, a
	mov	a, #0x78
	idxm	p, a
;	timer16.c: 77: dis[max++] = '0';
	mov	a, _UART_printNum_sloc10_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc10_1_0+0
	add	a, #0x01
	mov	_UART_printNum_sloc8_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, p
	mov	p, a
	mov	a, #0x30
	idxm	p, a
	goto	00118$
00117$:
;	timer16.c: 79: else if (base == BIN)
	mov	a, _UART_printNum_PARM_2+0
	ceqsn	a, #0x02
	goto	00118$
;	timer16.c: 81: dis[max++] = 'B';
	mov	a, _UART_printNum_sloc6_1_0+0
	add	a, #0x01
	mov	_UART_printNum_sloc11_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc6_1_0+0
	mov	p, a
	mov	a, #0x42
	idxm	p, a
;	timer16.c: 82: dis[max++] = '0';
	mov	a, _UART_printNum_sloc11_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc11_1_0+0
	add	a, #0x01
	mov	_UART_printNum_sloc8_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, p
	mov	p, a
	mov	a, #0x30
	idxm	p, a
00118$:
;	timer16.c: 85: if (flag == 1) // add minus to negative number
	mov	a, _UART_printNum_sloc5_1_0+0
	ceqsn	a, #0x01
	goto	00137$
;	timer16.c: 86: dis[max++] = '-';
	mov	a, _UART_printNum_sloc8_1_0+0
	inc	_UART_printNum_sloc8_1_0+0
	add	a, #(_UART_printNum_dis_65536_23 + 0)
	mov	p, a
	mov	a, #0x2d
	idxm	p, a
;	timer16.c: 88: for (uint8_t i = 0; i < max / 2; i++) // revert dis array
00137$:
	mov	a, _UART_printNum_sloc8_1_0+0
	sub	a, #0x01
	mov	_UART_printNum_sloc12_1_0+0, a
	clear	_UART_printNum_sloc13_1_0+0
00123$:
	mov	a, _UART_printNum_sloc8_1_0+0
	mov	__divsint_PARM_1+0, a
	sl	a
	mov	a, #0x00
	subc	a
	mov	__divsint_PARM_1+1, a
	mov	a, #0x02
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	_UART_printNum_sloc14_1_0+0, a
	mov	a, p
	mov	_UART_printNum_sloc14_1_0+1, a
	clear	p
	mov	a, _UART_printNum_sloc13_1_0+0
	sub	a, _UART_printNum_sloc14_1_0+0
	mov	a, p
	subc	a, _UART_printNum_sloc14_1_0+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00121$
;	timer16.c: 90: dis[max] = dis[i];
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc8_1_0+0
	mov	_UART_printNum_sloc15_1_0+0, a
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc13_1_0+0
	mov	_UART_printNum_sloc16_1_0+0, a
	mov	p, a
	idxm	a, p
	mov	_UART_printNum_sloc17_1_0+0, a
	mov	a, _UART_printNum_sloc15_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc17_1_0+0
	idxm	p, a
;	timer16.c: 91: dis[i] = dis[max - 1 - i];
	mov	a, _UART_printNum_sloc12_1_0+0
	sub	a, _UART_printNum_sloc13_1_0+0
	add	a, #(_UART_printNum_dis_65536_23 + 0)
	mov	_UART_printNum_sloc18_1_0+0, a
	mov	p, a
	idxm	a, p
	mov	p, a
	mov	a, _UART_printNum_sloc16_1_0+0
	xch	a, p
	idxm	p, a
;	timer16.c: 92: dis[max - 1 - i] = dis[max];
	mov	a, _UART_printNum_sloc18_1_0+0
	mov	p, a
	mov	a, _UART_printNum_sloc17_1_0+0
	idxm	p, a
;	timer16.c: 88: for (uint8_t i = 0; i < max / 2; i++) // revert dis array
	inc	_UART_printNum_sloc13_1_0+0
	goto	00123$
00121$:
;	timer16.c: 94: dis[max] = '\0';  // end string character
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	add	a, _UART_printNum_sloc8_1_0+0
	mov	p, a
	mov	a, #0x00
	idxm	p, a
;	timer16.c: 95: UART_print(dis); // print dis
	mov	a, #(_UART_printNum_dis_65536_23 + 0)
	mov	_UART_print_PARM_1+0, a
	clear	_UART_print_PARM_1+1
	goto	_UART_print
;	timer16.c: 96: }
	ret
;	timer16.c: 98: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	timer16.c: 100: UART_begin();
	call	_UART_begin
;	timer16.c: 101: setb(PBC, 4);
	set1.io	__pbc, #4
;	timer16.c: 102: millis_setup();
	call	_millis_setup
;	timer16.c: 103: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	timer16.c: 104: sei();
	engint
;	timer16.c: 106: UART_print("123\n");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	timer16.c: 108: while (1)
00102$:
;	timer16.c: 113: t = millis();
	mov	a, #_main_sloc19_1_0
	push	af
	call	_millis
	mov.io	a, sp
	add	a, #-2
	mov.io	sp, a
	mov	a, _main_sloc19_1_0+0
	mov	_t+0, a
	mov	a, _main_sloc19_1_0+1
	mov	_t+1, a
	mov	a, _main_sloc19_1_0+2
	mov	_t+2, a
	mov	a, _main_sloc19_1_0+3
	mov	_t+3, a
;	timer16.c: 116: _delay_ms(1000);
	mov	a, #0x29
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x2c
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x0a
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
;	timer16.c: 117: UART_printNum(t-millis(), DEC);
	mov	a, #_main_sloc20_1_0
	push	af
	call	_millis
	mov.io	a, sp
	add	a, #-2
	mov.io	sp, a
	mov	a, _t+0
	sub	a, _main_sloc20_1_0+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, _t+1
	subc	a, _main_sloc20_1_0+1
	mov	_UART_printNum_PARM_1+1, a
	mov	a, _t+2
	subc	a, _main_sloc20_1_0+2
	mov	_UART_printNum_PARM_1+2, a
	mov	a, _t+3
	subc	a, _main_sloc20_1_0+3
	mov	_UART_printNum_PARM_1+3, a
	mov	a, #0x0a
	mov	_UART_printNum_PARM_2+0, a
	call	_UART_printNum
;	timer16.c: 118: UART_print("\n");
	mov	a, #<(___str_1 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
	goto	00102$
;	timer16.c: 121: }
	ret
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x31	; 1
	ret #0x32	; 2
	ret #0x33	; 3
	ret #0x0a
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x0a
	ret #0x00
	.area CODE
	.area CABS (ABS)
