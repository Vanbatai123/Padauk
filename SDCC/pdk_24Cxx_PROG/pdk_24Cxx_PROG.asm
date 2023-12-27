;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module pdk_24Cxx_PROG
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _TIM3_interrupt
	.globl _main
	.globl _readline
	.globl __sdcc_external_startup
	.globl _I2C_begin
	.globl _PA4_interrupt
	.globl _TIM2_interrupt
	.globl _UART_print
	.globl _UART_IO_config
	.globl _UART_getchar
	.globl _UART_kbhit
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
	.globl _hex_address
	.globl _hex_byteCount
	.globl _newline
	.globl _ret
	.globl _temp
	.globl _aaa
	.globl _i
	.globl _u
	.globl _arr2
	.globl _arr
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
_arr::
	.ds 10
_arr2::
	.ds 10
_u::
	.ds 22
_i::
	.ds 2
_aaa::
	.ds 1
_temp::
	.ds 1
_ret::
	.ds 1
_newline::
	.ds 1
_hex_byteCount::
	.ds 1
_hex_address::
	.ds 2
_readline_sloc0_1_0:
	.ds 1
_readline_sloc1_1_0:
	.ds 1
_readline_sloc2_1_0:
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
	mov	sp, a
	call	__sdcc_external_startup
	goto	__sdcc_gs_init_startup
	.area GSINIT
__sdcc_gs_init_startup:
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
;	pdk_24Cxx_PROG.c: 32: uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
	mov	a, #0x04
	mov	_arr+0, a
	mov	a, #0x32
	mov	_arr+1, a
	mov	a, #0x0b
	mov	_arr+2, a
	mov	a, #0x1e
	mov	_arr+3, a
	mov	a, #0x06
	mov	_arr+4, a
	mov	a, #0x08
	mov	_arr+5, a
	mov	a, #0x0b
	mov	_arr+6, a
	clear	_arr+7
	clear	_arr+8
	mov	a, #0x05
	mov	_arr+9, a
;	pdk_24Cxx_PROG.c: 36: int i = 0;
	clear	_i+0
	clear	_i+1
;	pdk_24Cxx_PROG.c: 37: uint8_t aaa = 0, temp = 0, ret = 0, newline = 0;
	clear	_aaa+0
;	pdk_24Cxx_PROG.c: 37: uint8_t hex_byteCount;
	clear	_temp+0
;	pdk_24Cxx_PROG.c: 37: uint8_t aaa = 0, temp = 0, ret = 0, newline = 0;
	clear	_ret+0
;	pdk_24Cxx_PROG.c: 37: uint8_t hex_byteCount;
	clear	_newline+0
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
;	pdk_24Cxx_PROG.c: 17: static void TIM3_Config(void)
;	-----------------------------------------
;	 function TIM3_Config
;	-----------------------------------------
_TIM3_Config:
;	pdk_24Cxx_PROG.c: 20: TM3C = TM3C_CLK_IHRC;						   // Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov	__tm3c, a
;	pdk_24Cxx_PROG.c: 21: TM3S = TM3S_PRESCALE_DIV64 | TM3S_SCALE_DIV32; // No prescale, scale 2 ~> 8MHz
	mov	a, #0x7f
	mov	__tm3s, a
;	pdk_24Cxx_PROG.c: 22: TM3B = 254;									   // Divide by 69 ~> 9600 Hz (apx. 115200)
	mov	a, #0xfe
	mov	__tm3b, a
;	pdk_24Cxx_PROG.c: 23: INTEN |= INTEN_TM3;
	mov	a, __inten
	or	a, #0x80
	mov	__inten, a
;	pdk_24Cxx_PROG.c: 24: }
	ret
;	pdk_24Cxx_PROG.c: 25: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pdk_24Cxx_PROG.c: 27: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	mov	a, #0x34
	mov	__clkmd, a
;	pdk_24Cxx_PROG.c: 28: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
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
;	pdk_24Cxx_PROG.c: 29: return 0;							  //perform normal initialization
;	pdk_24Cxx_PROG.c: 30: }
	ret	#0x00
;	pdk_24Cxx_PROG.c: 41: uint8_t readline()
;	-----------------------------------------
;	 function readline
;	-----------------------------------------
_readline:
;	pdk_24Cxx_PROG.c: 46: while (UART_kbhit())
	clear	_readline_sloc0_1_0+0
00104$:
	call	_UART_kbhit
	cneqsn	a, #0x00
	goto	00104$
;	pdk_24Cxx_PROG.c: 48: u[cnt_t] = UART_getchar();
	mov	a, #(_u + 0)
	add	a, _readline_sloc0_1_0+0
	push	af
	call	_UART_getchar
	mov	_readline_sloc1_1_0+0, a
	pop	af
	mov	p, a
	mov	a, _readline_sloc1_1_0+0
	idxm	p, a
;	pdk_24Cxx_PROG.c: 49: if (u[cnt_t] == 'T' && u[cnt_t - 1] == 'S')
	mov	a, _readline_sloc1_1_0+0
	ceqsn	a, #0x54
	goto	00102$
	mov	a, _readline_sloc0_1_0+0
	sub	a, #0x01
	mov	_readline_sloc2_1_0+0, a
	mov	a, #(_u + 0)
	add	a, _readline_sloc2_1_0+0
	mov	p, a
	idxm	a, p
	ceqsn	a, #0x53
	goto	00102$
;	pdk_24Cxx_PROG.c: 51: return cnt_t - 1;
	mov	a, _readline_sloc2_1_0+0
	ret
00102$:
;	pdk_24Cxx_PROG.c: 53: cnt_t++;
	inc	_readline_sloc0_1_0+0
	goto	00104$
;	pdk_24Cxx_PROG.c: 56: }
	ret
;	pdk_24Cxx_PROG.c: 58: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pdk_24Cxx_PROG.c: 60: setb(PBC, 4);
	set1	__pbc, #4
;	pdk_24Cxx_PROG.c: 61: TIM3_Config();
	call	_TIM3_Config
;	pdk_24Cxx_PROG.c: 62: I2C_begin();
	call	_I2C_begin
;	pdk_24Cxx_PROG.c: 63: UART_IO_config();
	call	_UART_IO_config
;	pdk_24Cxx_PROG.c: 64: UART_begin();
	call	_UART_begin
;	pdk_24Cxx_PROG.c: 65: INTRQ = 0;
	mov	a, #0x00
	mov	__intrq, a
;	pdk_24Cxx_PROG.c: 66: sei();
	engint
;	pdk_24Cxx_PROG.c: 67: UART_print("\rOK\r");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pdk_24Cxx_PROG.c: 70: while (1)
00114$:
;	pdk_24Cxx_PROG.c: 73: i = 0;
	clear	_i+0
	clear	_i+1
;	pdk_24Cxx_PROG.c: 74: while (UART_kbhit())
00101$:
	call	_UART_kbhit
	cneqsn	a, #0x00
	goto	00103$
;	pdk_24Cxx_PROG.c: 76: u[i++] = UART_getchar();
	mov	a, _i+1
	mov	p, a
	mov	a, _i+0
	inc	_i+0
	addc	_i+1
	add	a, #(_u + 0)
	push	af
	call	_UART_getchar
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
	goto	00101$
00103$:
;	pdk_24Cxx_PROG.c: 78: u[i++] = '\r';
	mov	a, _i+1
	mov	p, a
	mov	a, _i+0
	inc	_i+0
	addc	_i+1
	add	a, #(_u + 0)
	mov	p, a
	mov	a, #0x0d
	idxm	p, a
;	pdk_24Cxx_PROG.c: 79: u[i] = '\0';
	mov	a, #(_u + 0)
	add	a, _i+0
	mov	p, a
	mov	a, #0x00
	idxm	p, a
;	pdk_24Cxx_PROG.c: 87: if (u[0] == '5' && u[1] == '2') // match signal
	mov	a, _u+0
	ceqsn	a, #0x35
	goto	00108$
	mov	a, _u+1
	ceqsn	a, #0x32
	goto	00108$
;	pdk_24Cxx_PROG.c: 89: UART_print("PFS173\r\n"); //send signal back to PC
	mov	a, #<(___str_1 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pdk_24Cxx_PROG.c: 90: while (!ret)
00104$:
	mov	a, _ret+0
	ceqsn	a, #0x00
	goto	00108$
;	pdk_24Cxx_PROG.c: 92: temp = readline();
	call	_readline
	mov	_temp+0, a
;	pdk_24Cxx_PROG.c: 93: u[temp] = '\0';
	mov	a, #(_u + 0)
	add	a, _temp+0
	mov	p, a
	mov	a, #0x00
	idxm	p, a
;	pdk_24Cxx_PROG.c: 94: UART_print(u);
	mov	a, #(_u + 0)
	mov	_UART_print_PARM_1+0, a
	clear	_UART_print_PARM_1+1
	call	_UART_print
;	pdk_24Cxx_PROG.c: 95: UART_print("\r\n");
	mov	a, #<(___str_2 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_2 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
	goto	00104$
00108$:
;	pdk_24Cxx_PROG.c: 98: if (aaa == 1)
	mov	a, _aaa+0
	ceqsn	a, #0x01
	goto	00111$
;	pdk_24Cxx_PROG.c: 100: setb(PB, 4);
	set1	__pb, #4
	goto	00112$
00111$:
;	pdk_24Cxx_PROG.c: 105: clrb(PB, 4);
	set0	__pb, #4
00112$:
;	pdk_24Cxx_PROG.c: 109: _delay_ms(900);
	mov	a, #0xbe
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x27
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x09
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
	goto	00114$
;	pdk_24Cxx_PROG.c: 111: }
	ret
;	pdk_24Cxx_PROG.c: 112: void TIM3_interrupt()
;	-----------------------------------------
;	 function TIM3_interrupt
;	-----------------------------------------
_TIM3_interrupt:
;	pdk_24Cxx_PROG.c: 114: if (aaa == 1)
	mov	a, _aaa+0
	ceqsn	a, #0x01
	goto	00102$
;	pdk_24Cxx_PROG.c: 116: aaa = 0;
	clear	_aaa+0
	goto	00104$
00102$:
;	pdk_24Cxx_PROG.c: 120: aaa = 1;
	mov	a, #0x01
	mov	_aaa+0, a
00104$:
;	pdk_24Cxx_PROG.c: 122: }
	ret
;	pdk_24Cxx_PROG.c: 124: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pdk_24Cxx_PROG.c: 127: if (INTRQ & INTRQ_TM2)
	mov	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00102$
;	pdk_24Cxx_PROG.c: 129: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0	__intrq, #6
;	pdk_24Cxx_PROG.c: 130: TIM2_interrupt();
	call	_TIM2_interrupt
00102$:
;	pdk_24Cxx_PROG.c: 133: if (INTRQ & INTRQ_TM3)
	mov	a, __intrq
	and	a, #0x80
	cneqsn	a, #0x00
	goto	00104$
;	pdk_24Cxx_PROG.c: 135: INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
	set0	__intrq, #7
;	pdk_24Cxx_PROG.c: 136: TIM3_interrupt();
	call	_TIM3_interrupt
00104$:
;	pdk_24Cxx_PROG.c: 139: if (INTRQ & INTRQ_PA4)
	mov	a, __intrq
	and	a, #0x02
	cneqsn	a, #0x00
	goto	00107$
;	pdk_24Cxx_PROG.c: 141: INTRQ &= ~INTRQ_PA4;
	set0	__intrq, #1
;	pdk_24Cxx_PROG.c: 142: TM3B = 0;
	mov	a, #0x00
	mov	__tm3b, a
;	pdk_24Cxx_PROG.c: 143: PA4_interrupt();
	call	_PA4_interrupt
00107$:
;	pdk_24Cxx_PROG.c: 145: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x0d
	ret #0x4f	; O
	ret #0x4b	; K
	ret #0x0d
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x50	; P
	ret #0x46	; F
	ret #0x53	; S
	ret #0x31	; 1
	ret #0x37	; 7
	ret #0x33	; 3
	ret #0x0d
	ret #0x0a
	ret #0x00
	.area CODE
	.area CONST
___str_2:
	ret #0x0d
	ret #0x0a
	ret #0x00
	.area CODE
	.area CABS (ABS)
