;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module delay
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __delay_loop_32
	.globl __delay_loop_16
	.globl __delay_loop_8
	.globl __delay_loop_32_PARM_1
	.globl __delay_loop_16_PARM_1
	.globl __delay_loop_8_PARM_1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG (ABS)
	.org 0x0000
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
;	delay.c: 4: void _delay_loop_8(uint8_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_8
;	-----------------------------------------
__delay_loop_8:
;	delay.c: 14: __endasm;
	00001$:
; 4 cycles per loop
	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.c: 15: }
	ret
;	delay.c: 18: void _delay_loop_16(uint16_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_16
;	-----------------------------------------
__delay_loop_16:
;	delay.c: 35: __endasm;
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
;	delay.c: 36: }
	ret
;	delay.c: 39: void _delay_loop_32(uint32_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_32
;	-----------------------------------------
__delay_loop_32:
;	delay.c: 64: __endasm;
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
;	delay.c: 65: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
