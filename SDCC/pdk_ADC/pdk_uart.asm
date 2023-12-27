;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module pdk_uart
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _UART_printNum_PARM_1
	.globl _UART_print_PARM_1
	.globl _putchar_PARM_1
	.globl _UART_begin
	.globl _TIM2_interrupt
	.globl _putchar
	.globl _UART_print
	.globl _UART_printNum
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
_putchar_PARM_1:
	.ds 2
_UART_print_PARM_1:
	.ds 2
_UART_print_sloc0_1_0:
	.ds 1
_UART_printNum_PARM_1:
	.ds 2
_UART_printNum_dis_65536_22:
	.ds 5
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	pdk_uart.c: 6: void UART_begin()
;	-----------------------------------------
;	 function UART_begin
;	-----------------------------------------
_UART_begin:
;	pdk_uart.c: 9: TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov.io	__tm2c, a
;	pdk_uart.c: 10: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2; // No prescale, scale 2 ~> 8MHz
	mov	a, #0x01
	mov.io	__tm2s, a
;	pdk_uart.c: 11: TM2B = 69;									 // Divide by 69 ~> 115942 Hz (apx. 115200)
	mov	a, #0x45
	mov.io	__tm2b, a
;	pdk_uart.c: 13: PAC |= (1 << UART_TX_PIN); // Enable TX Pin as output
	set1.io	__pac, #7
;	pdk_uart.c: 15: txdata = 0xD55F;	// Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
	mov	a, #0x5f
	mov	_txdata+0, a
	mov	a, #0xd5
	mov	_txdata+1, a
;	pdk_uart.c: 16: INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
	set1.io	__inten, #6
;	pdk_uart.c: 17: }
	ret
;	pdk_uart.c: 20: void TIM2_interrupt()
;	-----------------------------------------
;	 function TIM2_interrupt
;	-----------------------------------------
_TIM2_interrupt:
;	pdk_uart.c: 22: if (txdata)
	mov	a, _txdata+0
	or	a, _txdata+1
	cneqsn	a, #0x00
	goto	00106$
;	pdk_uart.c: 24: if (txdata & 0x01)			 // Check bit (1/0) for sending
	mov	a, _txdata+1
	mov	p, a
	mov	a, _txdata+0
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00102$
;	pdk_uart.c: 25: setb(PA, UART_TX_PIN); // Send 1 on TX Pin
	set1.io	__pa, #7
	goto	00103$
00102$:
;	pdk_uart.c: 27: clrb(PA, UART_TX_PIN); // Send 0 on TX Pin
	set0.io	__pa, #7
00103$:
;	pdk_uart.c: 28: txdata >>= 1;				 // Shift txdata
	sr	_txdata+1
	src	_txdata+0
00106$:
;	pdk_uart.c: 30: }
	ret
;	pdk_uart.c: 32: int putchar(int c)
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
;	pdk_uart.c: 34: while (txdata)
00101$:
	mov	a, _txdata+0
	or	a, _txdata+1
	ceqsn	a, #0x00
	goto	00101$
;	pdk_uart.c: 36: INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
	set0.io	__inten, #6
;	pdk_uart.c: 37: txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
	mov	a, _putchar_PARM_1+1
	mov	p, a
	mov	a, _putchar_PARM_1+0
	sl	a
	slc	p
	set1	p, #1
	mov	_txdata+0, a
	mov	a, p
	mov	_txdata+1, a
;	pdk_uart.c: 38: INTEN |= INTEN_TM2;		   // Enable TM2
	set1.io	__inten, #6
;	pdk_uart.c: 39: return (c);
	mov	a, _putchar_PARM_1+1
	mov	p, a
	mov	a, _putchar_PARM_1+0
;	pdk_uart.c: 40: }
	ret
;	pdk_uart.c: 42: void UART_print(char* str)
;	-----------------------------------------
;	 function UART_print
;	-----------------------------------------
_UART_print:
;	pdk_uart.c: 45: while(str[i]!='\0')
	clear	_UART_print_sloc0_1_0+0
00101$:
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc0_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a
	call	__gptrget
	cneqsn	a, #0x00
	goto	00104$
;	pdk_uart.c: 46: putchar(str[i++]);
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc0_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a
	inc	_UART_print_sloc0_1_0+0
	call	__gptrget
	mov	_putchar_PARM_1+0, a
	clear	_putchar_PARM_1+1
	call	_putchar
	goto	00101$
00104$:
;	pdk_uart.c: 47: }
	ret
;	pdk_uart.c: 48: void UART_printNum(int num)
;	-----------------------------------------
;	 function UART_printNum
;	-----------------------------------------
_UART_printNum:
;	pdk_uart.c: 51: if (num > 999)
	mov	a, #0xe7
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x03
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00108$
;	pdk_uart.c: 53: dis[0] = num / 1000 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0xe8
	mov	__divsint_PARM_2+0, a
	mov	a, #0x03
	mov	__divsint_PARM_2+1, a
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+0, a
;	pdk_uart.c: 54: dis[1] = (num / 100) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x64
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+1, a
;	pdk_uart.c: 55: dis[2] = (num / 10) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+2, a
;	pdk_uart.c: 56: dis[3] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+3, a
;	pdk_uart.c: 57: dis[4] = '\0';
	clear	_UART_printNum_dis_65536_22+4
	goto	00109$
00108$:
;	pdk_uart.c: 59: else if (num > 99)
	mov	a, #0x63
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00105$
;	pdk_uart.c: 61: dis[0] = num / 100 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x64
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+0, a
;	pdk_uart.c: 62: dis[1] = (num / 10) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+1, a
;	pdk_uart.c: 63: dis[2] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+2, a
;	pdk_uart.c: 64: dis[3] = '\0';
	clear	_UART_printNum_dis_65536_22+3
	goto	00109$
00105$:
;	pdk_uart.c: 66: else if (num > 9)
	mov	a, #0x09
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00102$
;	pdk_uart.c: 68: dis[0] = num / 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+0, a
;	pdk_uart.c: 69: dis[1] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+1, a
;	pdk_uart.c: 70: dis[2] = '\0';
	clear	_UART_printNum_dis_65536_22+2
	goto	00109$
00102$:
;	pdk_uart.c: 74: dis[0] = num + 48;
	mov	a, _UART_printNum_PARM_1+0
	add	a, #0x30
	mov	_UART_printNum_dis_65536_22+0, a
;	pdk_uart.c: 75: dis[1] = '\0';
	clear	_UART_printNum_dis_65536_22+1
00109$:
;	pdk_uart.c: 77: UART_print(dis);
	mov	a, #(_UART_printNum_dis_65536_22 + 0)
	mov	_UART_print_PARM_1+0, a
	clear	_UART_print_PARM_1+1
	goto	_UART_print
;	pdk_uart.c: 78: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
