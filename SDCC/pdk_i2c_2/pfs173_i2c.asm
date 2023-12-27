;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pfs173_i2c
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
	.globl _display2
	.globl _DS1307_Set
	.globl _DS1307_Read
	.globl _UART_printNum
	.globl _PB5_interrupt
	.globl _TIM2_interrupt
	.globl _UART_print
	.globl _UART_rx_off
	.globl _UART_IO_config
	.globl _UART_begin
	.globl __delay_loop_32
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
	.globl _aaa
	.globl _i
	.globl _u
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
_u::
	.ds 20
_i::
	.ds 2
_aaa::
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
;	pfs173_i2c.c: 14: int i = 0;
	clear	_i+0
	clear	_i+1
;	pfs173_i2c.c: 15: int aaa = 0;
	clear	_aaa+0
	clear	_aaa+1
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
;	pfs173_i2c.c: 17: void display2()
;	-----------------------------------------
;	 function display2
;	-----------------------------------------
_display2:
;	pfs173_i2c.c: 19: UART_printNum(DS1307_Read(DS1307_DATE));
	mov	a, #0x04
	mov	_DS1307_Read_PARM_1+0, a
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 20: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 21: UART_printNum(DS1307_Read(DS1307_MONTH));
	mov	a, #0x05
	mov	_DS1307_Read_PARM_1+0, a
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 22: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 23: UART_printNum(DS1307_Read(DS1307_YEAR));
	mov	a, #0x06
	mov	_DS1307_Read_PARM_1+0, a
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 24: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 25: UART_printNum(DS1307_Read(DS1307_HOUR));
	mov	a, #0x02
	mov	_DS1307_Read_PARM_1+0, a
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 26: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 27: UART_printNum(DS1307_Read(DS1307_MIN));
	mov	a, #0x01
	mov	_DS1307_Read_PARM_1+0, a
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 28: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 29: UART_printNum(DS1307_Read(DS1307_SEC));
	clear	_DS1307_Read_PARM_1+0
	call	_DS1307_Read
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 30: UART_print("\r");
	mov	a, #<(___str_1 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	goto	_UART_print
;	pfs173_i2c.c: 31: }
	ret
;	pfs173_i2c.c: 32: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pfs173_i2c.c: 34: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	pfs173_i2c.c: 35: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
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
;	pfs173_i2c.c: 36: return 0;							  //perform normal initialization
;	pfs173_i2c.c: 37: }
	ret	#0x00
;	pfs173_i2c.c: 39: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pfs173_i2c.c: 41: UART_IO_config();
	call	_UART_IO_config
;	pfs173_i2c.c: 42: UART_begin();
	call	_UART_begin
;	pfs173_i2c.c: 43: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	pfs173_i2c.c: 44: sei();
	engint
;	pfs173_i2c.c: 45: UART_rx_off();
	call	_UART_rx_off
;	pfs173_i2c.c: 46: UART_print("\rOK\r");
	mov	a, #<(___str_2 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_2 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 48: PBC |= (1 << SDA);
	set1.io	__pbc, #6
;	pfs173_i2c.c: 49: PBC |= (1 << SCL);
	set1.io	__pbc, #7
;	pfs173_i2c.c: 50: DS1307_Set(1, 2, 3, 4, 5, 6);
	mov	a, #0x01
	mov	_DS1307_Set_PARM_1+0, a
	mov	a, #0x02
	mov	_DS1307_Set_PARM_2+0, a
	mov	a, #0x03
	mov	_DS1307_Set_PARM_3+0, a
	mov	a, #0x04
	mov	_DS1307_Set_PARM_4+0, a
	mov	a, #0x05
	mov	_DS1307_Set_PARM_5+0, a
	mov	a, #0x06
	mov	_DS1307_Set_PARM_6+0, a
	call	_DS1307_Set
;	pfs173_i2c.c: 52: while (1)
00102$:
;	pfs173_i2c.c: 54: display2();
	call	_display2
;	pfs173_i2c.c: 55: _delay_ms(1100);
	mov	a, #0x94
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x30
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x0b
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
	goto	00102$
;	pfs173_i2c.c: 57: }
	ret
;	pfs173_i2c.c: 60: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pfs173_i2c.c: 63: if (INTRQ & INTRQ_TM2)
	mov.io	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00102$
;	pfs173_i2c.c: 65: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0.io	__intrq, #6
;	pfs173_i2c.c: 66: TIM2_interrupt();
	call	_TIM2_interrupt
00102$:
;	pfs173_i2c.c: 69: if (INTRQ & INTRQ_PB5)
	mov.io	a, __intrq
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00105$
;	pfs173_i2c.c: 71: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
	set0.io	__intrq, #0
;	pfs173_i2c.c: 72: PB5_interrupt();
	call	_PB5_interrupt
00105$:
;	pfs173_i2c.c: 74: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x2d	; -
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x0d
	ret #0x00
	.area CODE
	.area CONST
___str_2:
	ret #0x0d
	ret #0x4f	; O
	ret #0x4b	; K
	ret #0x0d
	ret #0x00
	.area CODE
	.area CABS (ABS)
