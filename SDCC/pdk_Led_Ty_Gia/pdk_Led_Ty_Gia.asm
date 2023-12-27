;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pdk_Led_Ty_Gia
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _main
	.globl _UART_printNum
	.globl __sdcc_external_startup
	.globl _TIM2_interrupt
	.globl _putchar
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
	.globl _UART_printNum_PARM_1
	.globl _sta
	.globl _data2
	.globl _data
	.globl _count_data
	.globl _start_status
	.globl _count_ms1
	.globl _count_ms
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
_count_ms::
	.ds 2
_count_ms1::
	.ds 2
_start_status::
	.ds 2
_count_data::
	.ds 2
_data::
	.ds 4
_data2::
	.ds 4
_sta::
	.ds 2
_UART_printNum_PARM_1:
	.ds 4
_UART_printNum_sloc0_1_0:
	.ds 1
_UART_printNum_sloc1_1_0:
	.ds 4
_main_dis_65536_52:
	.ds 7
_interrupt_sloc2_1_0:
	.ds 2
_interrupt_sloc3_1_0:
	.ds 2
_interrupt_sloc4_1_0:
	.ds 2
_interrupt_sloc5_1_0:
	.ds 4
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
;	pdk_Led_Ty_Gia.c: 25: int sta = 0;
	clear	_sta+0
	clear	_sta+1
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
;	pdk_Led_Ty_Gia.c: 19: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pdk_Led_Ty_Gia.c: 21: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	pdk_Led_Ty_Gia.c: 22: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); // tune SYSCLK to 8MHz @ 4.000V
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
;	pdk_Led_Ty_Gia.c: 23: return 0;							  // perform normal initialization
;	pdk_Led_Ty_Gia.c: 24: }
	ret	#0x00
;	pdk_Led_Ty_Gia.c: 27: void UART_printNum(uint32_t num)
;	-----------------------------------------
;	 function UART_printNum
;	-----------------------------------------
_UART_printNum:
;	pdk_Led_Ty_Gia.c: 30: putchar('0');
	mov	a, #0x30
	mov	_putchar_PARM_1+0, a
	clear	_putchar_PARM_1+1
	call	_putchar
;	pdk_Led_Ty_Gia.c: 31: putchar('x');
	mov	a, #0x78
	mov	_putchar_PARM_1+0, a
	clear	_putchar_PARM_1+1
	call	_putchar
;	pdk_Led_Ty_Gia.c: 32: for (uint8_t i = 0; i < 8; i++)
	clear	_UART_printNum_sloc0_1_0+0
00108$:
	mov	a, _UART_printNum_sloc0_1_0+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00106$
;	pdk_Led_Ty_Gia.c: 34: temp = (uint8_t)((num >> (4 * (7 - i))) & 0x0000000F);
	mov	a, #0x07
	sub	a, _UART_printNum_sloc0_1_0+0
	mov	p, a
	sl	p
	sl	p
	mov	a, _UART_printNum_PARM_1+0
	mov	_UART_printNum_sloc1_1_0+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	_UART_printNum_sloc1_1_0+1, a
	mov	a, _UART_printNum_PARM_1+2
	mov	_UART_printNum_sloc1_1_0+2, a
	mov	a, _UART_printNum_PARM_1+3
	mov	_UART_printNum_sloc1_1_0+3, a
	mov	a, p
00129$:
	sub	a, #1
	t0sn.io	f, c
	goto	00130$
	sr	_UART_printNum_sloc1_1_0+3
	src	_UART_printNum_sloc1_1_0+2
	src	_UART_printNum_sloc1_1_0+1
	src	_UART_printNum_sloc1_1_0+0
	goto	00129$
00130$:
	mov	a, _UART_printNum_sloc1_1_0+0
	and	a, #0x0f
;	pdk_Led_Ty_Gia.c: 35: if (temp <= 9)
	ceqsn	a, #0x0a
	t1sn.io	f, c
	goto	00104$
;	pdk_Led_Ty_Gia.c: 36: putchar(temp + 48);
	add	a, #0x30
	mov	_putchar_PARM_1+0, a
	mov	a, #0x00
	addc	a
	mov	_putchar_PARM_1+1, a
	call	_putchar
	goto	00109$
00104$:
;	pdk_Led_Ty_Gia.c: 37: else if (temp > 9)
	ceqsn	a, #0x0a
	nop
	t0sn.io	f, c
	goto	00109$
;	pdk_Led_Ty_Gia.c: 38: putchar(temp + 55);
	add	a, #0x37
	mov	_putchar_PARM_1+0, a
	mov	a, #0x00
	addc	a
	mov	_putchar_PARM_1+1, a
	call	_putchar
00109$:
;	pdk_Led_Ty_Gia.c: 32: for (uint8_t i = 0; i < 8; i++)
	inc	_UART_printNum_sloc0_1_0+0
	goto	00108$
00106$:
;	pdk_Led_Ty_Gia.c: 40: putchar('\n');
	mov	a, #0x0a
	mov	_putchar_PARM_1+0, a
	clear	_putchar_PARM_1+1
	goto	_putchar
;	pdk_Led_Ty_Gia.c: 41: }
	ret
;	pdk_Led_Ty_Gia.c: 43: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pdk_Led_Ty_Gia.c: 45: char dis[] = "asdasd";
	mov	a, #0x61
	mov	_main_dis_65536_52+0, a
	mov	a, #0x73
	mov	_main_dis_65536_52+1, a
	mov	a, #0x64
	mov	_main_dis_65536_52+2, a
	mov	a, #0x61
	mov	_main_dis_65536_52+3, a
	mov	a, #0x73
	mov	_main_dis_65536_52+4, a
	mov	a, #0x64
	mov	_main_dis_65536_52+5, a
	clear	_main_dis_65536_52+6
;	pdk_Led_Ty_Gia.c: 47: UART_begin(); // Initialize UART engine
	call	_UART_begin
;	pdk_Led_Ty_Gia.c: 50: TM3C = TM3C_CLK_IHRC;							 // Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov.io	__tm3c, a
;	pdk_Led_Ty_Gia.c: 51: TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV64; // No prescale, scale 64 ~> 0.25MHz
	mov	a, #0x60
	mov.io	__tm3s, a
;	pdk_Led_Ty_Gia.c: 52: TM3B = 125;										 // Divide by 125 ~> 2000 Hz 0.5ms
	mov	a, #0x7d
	mov.io	__tm3b, a
;	pdk_Led_Ty_Gia.c: 54: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
	set1.io	__inten, #7
;	pdk_Led_Ty_Gia.c: 56: ROP = ROP_INT_SRC_PB5;
	mov	a, #0x02
	mov.io	__rop, a
;	pdk_Led_Ty_Gia.c: 57: setb(PBDIER, 5);
	set1.io	__pbdier, #5
;	pdk_Led_Ty_Gia.c: 58: setb(PBPH, 5);
	set1.io	__pbph, #5
;	pdk_Led_Ty_Gia.c: 59: INTEGS = INTEGS_PB5_FALLING;
	mov	a, #0x02
	mov.io	__integs, a
;	pdk_Led_Ty_Gia.c: 60: INTEN |= INTEN_PB5;
	set1.io	__inten, #0
;	pdk_Led_Ty_Gia.c: 64: sei(); // Enable global interrupts
	engint
;	pdk_Led_Ty_Gia.c: 65: while (1)
00107$:
;	pdk_Led_Ty_Gia.c: 67: if (sta == 0)
	mov	a, _sta+0
	or	a, _sta+1
	cneqsn	a, #0x00
	goto	00105$
;	pdk_Led_Ty_Gia.c: 71: else if (sta == 1)
	mov	a, _sta+0
	ceqsn	a, #0x01
	goto	00105$
	mov	a, _sta+1
	ceqsn	a, #0x00
	goto	00105$
;	pdk_Led_Ty_Gia.c: 73: UART_printNum(data2);
	mov	a, _data2+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, _data2+1
	mov	_UART_printNum_PARM_1+1, a
	mov	a, _data2+2
	mov	_UART_printNum_PARM_1+2, a
	mov	a, _data2+3
	mov	_UART_printNum_PARM_1+3, a
	call	_UART_printNum
;	pdk_Led_Ty_Gia.c: 74: sta = 0;
	clear	_sta+0
	clear	_sta+1
00105$:
;	pdk_Led_Ty_Gia.c: 76: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
	goto	00107$
;	pdk_Led_Ty_Gia.c: 78: }
	ret
;	pdk_Led_Ty_Gia.c: 81: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pdk_Led_Ty_Gia.c: 84: if (INTRQ & INTRQ_TM2)
	mov.io	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00102$
;	pdk_Led_Ty_Gia.c: 86: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0.io	__intrq, #6
;	pdk_Led_Ty_Gia.c: 87: TIM2_interrupt();
	call	_TIM2_interrupt
00102$:
;	pdk_Led_Ty_Gia.c: 90: if (INTRQ & INTRQ_TM3)
	mov.io	a, __intrq
	and	a, #0x80
	cneqsn	a, #0x00
	goto	00106$
;	pdk_Led_Ty_Gia.c: 92: INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
	set0.io	__intrq, #7
;	pdk_Led_Ty_Gia.c: 95: count_ms++;
	inc	_count_ms+0
	addc	_count_ms+1
;	pdk_Led_Ty_Gia.c: 96: if (count_ms == 50)
	mov	a, _count_ms+1
	mov	p, a
	mov	a, _count_ms+0
	ceqsn	a, #0x32
	goto	00106$
	mov	a, p
	ceqsn	a, #0x00
	goto	00106$
;	pdk_Led_Ty_Gia.c: 97: count_ms = 0;
	clear	_count_ms+0
	clear	_count_ms+1
00106$:
;	pdk_Led_Ty_Gia.c: 100: if (INTRQ & INTRQ_PB5)
	mov.io	a, __intrq
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00134$
;	pdk_Led_Ty_Gia.c: 102: INTRQ &= ~INTRQ_PB5; // Mark PB5 interrupt request processed
	set0.io	__intrq, #0
;	pdk_Led_Ty_Gia.c: 107: count_ms1 = count_ms;
	mov	a, _count_ms+0
	mov	_count_ms1+0, a
	mov	a, _count_ms+1
	mov	_count_ms1+1, a
;	pdk_Led_Ty_Gia.c: 108: count_ms = 0;
	clear	_count_ms+0
	clear	_count_ms+1
;	pdk_Led_Ty_Gia.c: 109: count_data++;
	inc	_count_data+0
	addc	_count_data+1
;	pdk_Led_Ty_Gia.c: 111: if (((count_ms1) >= 25) && ((count_ms1) <= 28)) // 10s-14ms
	mov	a, _count_ms1+0
	mov	_interrupt_sloc2_1_0+0, a
	mov	a, _count_ms1+1
	mov	_interrupt_sloc2_1_0+1, a
	mov	a, _interrupt_sloc2_1_0+0
	sub	a, #0x19
	mov	a, _interrupt_sloc2_1_0+1
	subc	a
	t0sn.io	f, c
	goto	00127$
	mov	a, #0x1c
	sub	a, _interrupt_sloc2_1_0+0
	mov	a, #0x00
	subc	a, _interrupt_sloc2_1_0+1
	t0sn.io	f, c
	goto	00127$
;	pdk_Led_Ty_Gia.c: 113: count_data = -1;
	mov	a, #0xff
	mov	_count_data+0, a
	mov	a, #0xff
	mov	_count_data+1, a
;	pdk_Led_Ty_Gia.c: 114: start_status = 1;
	mov	a, #0x01
	mov	_start_status+0, a
	clear	_start_status+1
;	pdk_Led_Ty_Gia.c: 115: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
	goto	00128$
00127$:
;	pdk_Led_Ty_Gia.c: 117: else if (((count_ms1) >= 20) && ((count_ms1) <= 24)) // 10s-14ms
	mov	a, _interrupt_sloc2_1_0+0
	sub	a, #0x14
	mov	a, _interrupt_sloc2_1_0+1
	subc	a
	t0sn.io	f, c
	goto	00123$
	mov	a, #0x18
	sub	a, _interrupt_sloc2_1_0+0
	mov	a, #0x00
	subc	a, _interrupt_sloc2_1_0+1
	t0sn.io	f, c
	goto	00123$
;	pdk_Led_Ty_Gia.c: 119: sta = 1;
	mov	a, #0x01
	mov	_sta+0, a
	clear	_sta+1
	goto	00128$
00123$:
;	pdk_Led_Ty_Gia.c: 123: else if ((start_status == 1) && (count_data >= 0) && (count_data <= 31))
	mov	a, _start_status+1
	mov	p, a
	mov	a, _start_status+0
	ceqsn	a, #0x01
	goto	00118$
	mov	a, p
	ceqsn	a, #0x00
	goto	00118$
	mov	a, _count_data+0
	mov	_interrupt_sloc3_1_0+0, a
	mov	a, _count_data+1
	mov	_interrupt_sloc3_1_0+1, a
	ceqsn	a, #0x80
	t1sn.io	f, c
	goto	00118$
	mov	a, #0x1f
	sub	a, _interrupt_sloc3_1_0+0
	mov	a, #0x00
	subc	a, _interrupt_sloc3_1_0+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t0sn.io	f, c
	goto	00118$
;	pdk_Led_Ty_Gia.c: 125: if ((count_ms1 >= 4) && (count_ms1 <= 6)) // 2ms->3ms //detect logic 1.
	mov	a, _interrupt_sloc2_1_0+0
	sub	a, #0x04
	mov	a, _interrupt_sloc2_1_0+1
	subc	a
	t0sn.io	f, c
	goto	00111$
	mov	a, #0x06
	sub	a, _interrupt_sloc2_1_0+0
	mov	a, #0x00
	subc	a, _interrupt_sloc2_1_0+1
	t0sn.io	f, c
	goto	00111$
;	pdk_Led_Ty_Gia.c: 127: data |= 1 << (31 - count_data);
	mov	a, _count_data+0
	neg	a
	add	a, #0x1f
	push	af
	mov	a, #0x01
	mov	_interrupt_sloc4_1_0+0, a
	pop	af
	clear	_interrupt_sloc4_1_0+1
00204$:
	sub	a, #1
	t0sn.io	f, c
	goto	00205$
	sl	_interrupt_sloc4_1_0+0
	slc	_interrupt_sloc4_1_0+1
	goto	00204$
00205$:
	mov	a, _interrupt_sloc4_1_0+0
	mov	_interrupt_sloc5_1_0+0, a
	mov	a, _interrupt_sloc4_1_0+1
	mov	_interrupt_sloc5_1_0+1, a
	sl	a
	mov	a, #0x00
	subc	a
	mov	_interrupt_sloc5_1_0+2, a
	mov	_interrupt_sloc5_1_0+3, a
	mov	a, _interrupt_sloc5_1_0+0
	or	_data+0, a
	mov	a, _interrupt_sloc5_1_0+1
	or	_data+1, a
	mov	a, _interrupt_sloc5_1_0+2
	or	_data+2, a
	mov	a, _interrupt_sloc5_1_0+3
	or	_data+3, a
;	pdk_Led_Ty_Gia.c: 128: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
	goto	00128$
00111$:
;	pdk_Led_Ty_Gia.c: 130: else if (count_ms1 < 4) // nho hon <2ms //detect logic 0.
	mov	a, _interrupt_sloc2_1_0+0
	sub	a, #0x04
	mov	a, _interrupt_sloc2_1_0+1
	subc	a
	t1sn.io	f, c
	goto	00108$
;	pdk_Led_Ty_Gia.c: 132: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
	goto	00128$
00108$:
;	pdk_Led_Ty_Gia.c: 136: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
;	pdk_Led_Ty_Gia.c: 137: start_status = 0;
	clear	_start_status+0
	clear	_start_status+1
;	pdk_Led_Ty_Gia.c: 138: count_data = 0;
	clear	_count_data+0
	clear	_count_data+1
;	pdk_Led_Ty_Gia.c: 139: data = 0;
	clear	_data+0
	clear	_data+1
	clear	_data+2
	clear	_data+3
	goto	00128$
00118$:
;	pdk_Led_Ty_Gia.c: 143: else if ((start_status == 0) && ((count_ms1) > 28)) /// error detect xung start
	mov	a, _start_status+0
	or	a, _start_status+1
	ceqsn	a, #0x00
	goto	00128$
	mov	a, #0x1c
	sub	a, _interrupt_sloc2_1_0+0
	mov	a, #0x00
	subc	a, _interrupt_sloc2_1_0+1
	t1sn.io	f, c
	goto	00128$
;	pdk_Led_Ty_Gia.c: 145: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
;	pdk_Led_Ty_Gia.c: 146: start_status = 0;
	clear	_start_status+0
	clear	_start_status+1
;	pdk_Led_Ty_Gia.c: 147: count_data = 0;
	clear	_count_data+0
	clear	_count_data+1
;	pdk_Led_Ty_Gia.c: 148: data = 0;
	clear	_data+0
	clear	_data+1
	clear	_data+2
	clear	_data+3
00128$:
;	pdk_Led_Ty_Gia.c: 151: if (count_data == 32) // reset sau khi detect 32 bit data
	mov	a, _count_data+1
	mov	p, a
	mov	a, _count_data+0
	ceqsn	a, #0x20
	goto	00134$
	mov	a, p
	ceqsn	a, #0x00
	goto	00134$
;	pdk_Led_Ty_Gia.c: 153: sta = 1;
	mov	a, #0x01
	mov	_sta+0, a
	clear	_sta+1
;	pdk_Led_Ty_Gia.c: 154: data2 = data;
	mov	a, _data+0
	mov	_data2+0, a
	mov	a, _data+1
	mov	_data2+1, a
	mov	a, _data+2
	mov	_data2+2, a
	mov	a, _data+3
	mov	_data2+3, a
;	pdk_Led_Ty_Gia.c: 156: count_data = 0;
	clear	_count_data+0
	clear	_count_data+1
;	pdk_Led_Ty_Gia.c: 157: data = 0;
	clear	_data+0
	clear	_data+1
	clear	_data+2
	clear	_data+3
;	pdk_Led_Ty_Gia.c: 158: start_status = 0;
	clear	_start_status+0
	clear	_start_status+1
;	pdk_Led_Ty_Gia.c: 159: count_ms1 = 0;
	clear	_count_ms1+0
	clear	_count_ms1+1
00134$:
;	pdk_Led_Ty_Gia.c: 163: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CABS (ABS)
