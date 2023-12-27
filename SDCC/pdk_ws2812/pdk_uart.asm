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
	.globl _putChar_PARM_1
	.globl _UART_begin
	.globl _TIM2_interrupt
	.globl _putChar
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
_putChar_PARM_1:
	.ds 2
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
;	pdk_uart.c: 32: int putChar(int c)
;	-----------------------------------------
;	 function putChar
;	-----------------------------------------
_putChar:
;	pdk_uart.c: 34: while (txdata)
00101$:
	mov	a, _txdata+0
	or	a, _txdata+1
	ceqsn	a, #0x00
	goto	00101$
;	pdk_uart.c: 36: INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
	set0.io	__inten, #6
;	pdk_uart.c: 37: txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
	mov	a, _putChar_PARM_1+1
	mov	p, a
	mov	a, _putChar_PARM_1+0
	sl	a
	slc	p
	set1	p, #1
	mov	_txdata+0, a
	mov	a, p
	mov	_txdata+1, a
;	pdk_uart.c: 38: INTEN |= INTEN_TM2;		   // Enable TM2
	set1.io	__inten, #6
;	pdk_uart.c: 39: return (c);
	mov	a, _putChar_PARM_1+1
	mov	p, a
	mov	a, _putChar_PARM_1+0
;	pdk_uart.c: 40: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
