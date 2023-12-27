;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module pdk_lcdi2c
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_endTransmission
	.globl _I2C_write
	.globl _I2C_beginTransmission
	.globl _I2C_begin
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
	.globl _LCDI2C_blackLight_PARM_1
	.globl _LCDI2C_print_PARM_1
	.globl _LCDI2C_putC_PARM_1
	.globl _LCDI2C_goTo_PARM_2
	.globl _LCDI2C_goTo_PARM_1
	.globl _LCDI2C_writeData_PARM_1
	.globl _LCDI2C_writeCommand_PARM_1
	.globl _LCDI2C_write8_PARM_1
	.globl _lcdReg
	.globl _LCDI2C_config
	.globl _LCDI2C_write8
	.globl _LCDI2C_writeCommand
	.globl _LCDI2C_writeData
	.globl _LCDI2C_goTo
	.globl _LCDI2C_putC
	.globl _LCDI2C_print
	.globl _LCDI2C_blackLight
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
_lcdReg::
	.ds 1
_LCDI2C_write8_PARM_1:
	.ds 1
_LCDI2C_writeCommand_PARM_1:
	.ds 1
_LCDI2C_writeCommand_sloc0_1_0:
	.ds 1
_LCDI2C_writeCommand_sloc1_1_0:
	.ds 1
_LCDI2C_writeData_PARM_1:
	.ds 1
_LCDI2C_writeData_sloc2_1_0:
	.ds 1
_LCDI2C_writeData_sloc3_1_0:
	.ds 1
_LCDI2C_goTo_PARM_1:
	.ds 1
_LCDI2C_goTo_PARM_2:
	.ds 1
_LCDI2C_goTo_sloc4_1_0:
	.ds 1
_LCDI2C_putC_PARM_1:
	.ds 1
_LCDI2C_print_PARM_1:
	.ds 2
_LCDI2C_print_sloc5_1_0:
	.ds 2
_LCDI2C_blackLight_PARM_1:
	.ds 1
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
;	pdk_lcdi2c.c: 13: uint8_t lcdReg = 0;
	clear	_lcdReg+0
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	pdk_lcdi2c.c: 15: void LCDI2C_config(void)
;	-----------------------------------------
;	 function LCDI2C_config
;	-----------------------------------------
_LCDI2C_config:
;	pdk_lcdi2c.c: 17: _delay_ms(100);
	mov	a, #0x69
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x04
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x01
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
;	pdk_lcdi2c.c: 18: lcdReg = 0;
	clear	_lcdReg+0
;	pdk_lcdi2c.c: 19: I2C_begin();
	call	_I2C_begin
;	pdk_lcdi2c.c: 21: LCDI2C_write8(0x00);
	clear	_LCDI2C_write8_PARM_1+0
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 22: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 23: LCDI2C_write8(0x04);
	mov	a, #0x04
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 24: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 25: LCDI2C_write8(0x00);
	clear	_LCDI2C_write8_PARM_1+0
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 26: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 27: LCDI2C_write8(0x04);
	mov	a, #0x04
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 28: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 29: LCDI2C_write8(0x00);
	clear	_LCDI2C_write8_PARM_1+0
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 30: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 31: LCDI2C_write8(0x04);
	mov	a, #0x04
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 32: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 33: LCDI2C_write8(0x00);
	clear	_LCDI2C_write8_PARM_1+0
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 34: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 36: LCDI2C_write8(0x20);// function set// 4 bit mode, 2 line, 5x8 font
	mov	a, #0x20
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 37: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 38: LCDI2C_write8(0x24);
	mov	a, #0x24
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 39: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 40: LCDI2C_write8(0x20);
	mov	a, #0x20
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 41: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 43: LCDI2C_writeCommand(LCD_DISPLAYCONTROL | LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF);// Display control
	mov	a, #0x0c
	mov	_LCDI2C_writeCommand_PARM_1+0, a
	call	_LCDI2C_writeCommand
;	pdk_lcdi2c.c: 44: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 45: LCDI2C_writeCommand(LCD_ENTRYMODESET | LCD_ENTRYLEFT);// Enter mode set
	mov	a, #0x06
	mov	_LCDI2C_writeCommand_PARM_1+0, a
	call	_LCDI2C_writeCommand
;	pdk_lcdi2c.c: 46: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pdk_lcdi2c.c: 49: LCDI2C_writeCommand(LCD_CLEARDISPLAY);
	mov	a, #0x01
	mov	_LCDI2C_writeCommand_PARM_1+0, a
	call	_LCDI2C_writeCommand
;	pdk_lcdi2c.c: 50: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	goto	__delay_loop_16
;	pdk_lcdi2c.c: 51: }
	ret
;	pdk_lcdi2c.c: 53: void LCDI2C_write8(uint8_t cmd)
;	-----------------------------------------
;	 function LCDI2C_write8
;	-----------------------------------------
_LCDI2C_write8:
;	pdk_lcdi2c.c: 55: I2C_beginTransmission(LCDI2C_ADDRESS);
	mov	a, #0x27
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pdk_lcdi2c.c: 56: I2C_write(cmd);
	mov	a, _LCDI2C_write8_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_lcdi2c.c: 57: I2C_endTransmission();	
	call	_I2C_endTransmission
;	pdk_lcdi2c.c: 58: _delay_us(20);
	mov	a, #0x33
	mov	__delay_loop_8_PARM_1+0, a
	goto	__delay_loop_8
;	pdk_lcdi2c.c: 59: }
	ret
;	pdk_lcdi2c.c: 61: void LCDI2C_writeCommand(uint8_t cmd)// cmd = 0, data = 1
;	-----------------------------------------
;	 function LCDI2C_writeCommand
;	-----------------------------------------
_LCDI2C_writeCommand:
;	pdk_lcdi2c.c: 64: temp = lcdReg & 0x0F;
	mov	a, _lcdReg+0
	and	a, #0x0f
;	pdk_lcdi2c.c: 66: temp &= ~LCDI2C_RS;
	and	a, #0xfe
	mov	_LCDI2C_writeCommand_sloc0_1_0+0, a
;	pdk_lcdi2c.c: 68: HNib = cmd & 0xF0;
	mov	a, _LCDI2C_writeCommand_PARM_1+0
	push	af
	and	a, #0xf0
	mov	p, a
	pop	af
;	pdk_lcdi2c.c: 69: LNib = (cmd<<4) & 0xF0;
	swap	a
	and	a, #0xf0
	and	a, #0xf0
	mov	_LCDI2C_writeCommand_sloc1_1_0+0, a
;	pdk_lcdi2c.c: 71: lcdReg = HNib | temp;
	mov	a, p
	or	a, _LCDI2C_writeCommand_sloc0_1_0+0
;	pdk_lcdi2c.c: 72: LCDI2C_write8(lcdReg);
	mov	_lcdReg+0, a
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 73: lcdReg |= LCDI2C_EN;
	mov	a, #0x04
	or	_lcdReg+0, a
;	pdk_lcdi2c.c: 74: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 75: lcdReg &= ~LCDI2C_EN;
	mov	a, #0xfb
	and	_lcdReg+0, a
;	pdk_lcdi2c.c: 76: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 78: lcdReg = LNib | temp;
	mov	a, _LCDI2C_writeCommand_sloc1_1_0+0
	or	a, _LCDI2C_writeCommand_sloc0_1_0+0
;	pdk_lcdi2c.c: 79: LCDI2C_write8(lcdReg);
	mov	_lcdReg+0, a
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 80: lcdReg |= LCDI2C_EN;
	mov	a, #0x04
	or	_lcdReg+0, a
;	pdk_lcdi2c.c: 81: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 82: lcdReg &= ~LCDI2C_EN;
	mov	a, #0xfb
	and	_lcdReg+0, a
;	pdk_lcdi2c.c: 83: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	goto	_LCDI2C_write8
;	pdk_lcdi2c.c: 84: }
	ret
;	pdk_lcdi2c.c: 86: void LCDI2C_writeData(uint8_t data)// cmd = 0, data = 1
;	-----------------------------------------
;	 function LCDI2C_writeData
;	-----------------------------------------
_LCDI2C_writeData:
;	pdk_lcdi2c.c: 89: temp = lcdReg & 0x0F;
	mov	a, _lcdReg+0
	and	a, #0x0f
;	pdk_lcdi2c.c: 90: temp |= LCDI2C_RS;
	or	a, #0x01
	mov	_LCDI2C_writeData_sloc2_1_0+0, a
;	pdk_lcdi2c.c: 92: HNib = data & 0xF0;
	mov	a, _LCDI2C_writeData_PARM_1+0
	push	af
	and	a, #0xf0
	mov	p, a
	pop	af
;	pdk_lcdi2c.c: 93: LNib = (data<<4) & 0xF0;
	swap	a
	and	a, #0xf0
	and	a, #0xf0
	mov	_LCDI2C_writeData_sloc3_1_0+0, a
;	pdk_lcdi2c.c: 95: lcdReg = HNib | temp;
	mov	a, p
	or	a, _LCDI2C_writeData_sloc2_1_0+0
;	pdk_lcdi2c.c: 96: LCDI2C_write8(lcdReg);
	mov	_lcdReg+0, a
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 97: lcdReg |= LCDI2C_EN;
	mov	a, #0x04
	or	_lcdReg+0, a
;	pdk_lcdi2c.c: 98: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 99: lcdReg &= ~LCDI2C_EN;
	mov	a, #0xfb
	and	_lcdReg+0, a
;	pdk_lcdi2c.c: 100: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 102: lcdReg = LNib | temp;
	mov	a, _LCDI2C_writeData_sloc3_1_0+0
	or	a, _LCDI2C_writeData_sloc2_1_0+0
;	pdk_lcdi2c.c: 103: LCDI2C_write8(lcdReg);
	mov	_lcdReg+0, a
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 104: lcdReg |= LCDI2C_EN;
	mov	a, #0x04
	or	_lcdReg+0, a
;	pdk_lcdi2c.c: 105: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	call	_LCDI2C_write8
;	pdk_lcdi2c.c: 106: lcdReg &= ~LCDI2C_EN;
	mov	a, #0xfb
	and	_lcdReg+0, a
;	pdk_lcdi2c.c: 107: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	goto	_LCDI2C_write8
;	pdk_lcdi2c.c: 108: }
	ret
;	pdk_lcdi2c.c: 110: void LCDI2C_goTo(uint8_t y, uint8_t x)
;	-----------------------------------------
;	 function LCDI2C_goTo
;	-----------------------------------------
_LCDI2C_goTo:
;	pdk_lcdi2c.c: 113: if (y > 2)// row 3,4 of 20x4 LCD
	mov	a, #0x02
	sub	a, _LCDI2C_goTo_PARM_1+0
	t1sn.io	f, c
	goto	00102$
;	pdk_lcdi2c.c: 114: ddram = 0x40 * (y-3) + (x-1) + 0x14 + LCD_SETDDRAMADDR;// calculate ddram address
	mov	a, _LCDI2C_goTo_PARM_1+0
	sub	a, #0x03
	mov	_LCDI2C_goTo_sloc4_1_0+0, a
	mov	a, #6
00110$:
	sl	_LCDI2C_goTo_sloc4_1_0+0
	dzsn	a
	goto	00110$
	mov	a, _LCDI2C_goTo_PARM_2+0
	add	a, #0x93
	add	a, _LCDI2C_goTo_sloc4_1_0+0
	goto	00103$
00102$:
;	pdk_lcdi2c.c: 116: ddram = 0x40 * (y-1) + (x-1) + LCD_SETDDRAMADDR; // calculate ddram address
	mov	a, _LCDI2C_goTo_PARM_1+0
	sub	a, #0x01
	swap	a
	and	a, #0xf0
	sl	a
	sl	a
	add	a, #0x7f
	add	a, _LCDI2C_goTo_PARM_2+0
00103$:
;	pdk_lcdi2c.c: 118: LCDI2C_writeCommand(ddram);
	mov	_LCDI2C_writeCommand_PARM_1+0, a
	call	_LCDI2C_writeCommand
;	pdk_lcdi2c.c: 119: _delay_us(100);
	mov	a, #0x62
	mov	__delay_loop_16_PARM_1+0, a
	clear	__delay_loop_16_PARM_1+1
	goto	__delay_loop_16
;	pdk_lcdi2c.c: 120: }
	ret
;	pdk_lcdi2c.c: 122: void LCDI2C_putC(uint8_t chr)
;	-----------------------------------------
;	 function LCDI2C_putC
;	-----------------------------------------
_LCDI2C_putC:
;	pdk_lcdi2c.c: 124: LCDI2C_writeData(chr);
	mov	a, _LCDI2C_putC_PARM_1+0
	mov	_LCDI2C_writeData_PARM_1+0, a
	goto	_LCDI2C_writeData
;	pdk_lcdi2c.c: 125: }
	ret
;	pdk_lcdi2c.c: 126: void LCDI2C_print(char* str)
;	-----------------------------------------
;	 function LCDI2C_print
;	-----------------------------------------
_LCDI2C_print:
;	pdk_lcdi2c.c: 128: while (*str)// loop through entire string
	mov	a, _LCDI2C_print_PARM_1+0
	mov	_LCDI2C_print_sloc5_1_0+0, a
	mov	a, _LCDI2C_print_PARM_1+1
	mov	_LCDI2C_print_sloc5_1_0+1, a
00101$:
	mov	a, _LCDI2C_print_sloc5_1_0+0
	mov	p, a
	mov	a, _LCDI2C_print_sloc5_1_0+1
	call	__gptrget
	cneqsn	a, #0x00
	goto	00104$
;	pdk_lcdi2c.c: 130: LCDI2C_putC(*str);
	mov	_LCDI2C_putC_PARM_1+0, a
	call	_LCDI2C_putC
;	pdk_lcdi2c.c: 131: str++;
	inc	_LCDI2C_print_sloc5_1_0+0
	addc	_LCDI2C_print_sloc5_1_0+1
	goto	00101$
00104$:
;	pdk_lcdi2c.c: 133: }
	ret
;	pdk_lcdi2c.c: 135: void LCDI2C_blackLight(uint8_t stt)
;	-----------------------------------------
;	 function LCDI2C_blackLight
;	-----------------------------------------
_LCDI2C_blackLight:
;	pdk_lcdi2c.c: 137: if (stt) lcdReg |= LCD_BACKLIGHT;
	mov	a, _LCDI2C_blackLight_PARM_1+0
	cneqsn	a, #0x00
	goto	00102$
	mov	a, #0x08
	or	_lcdReg+0, a
	goto	00103$
00102$:
;	pdk_lcdi2c.c: 138: else lcdReg &= ~LCD_BACKLIGHT;
	mov	a, #0xf7
	and	_lcdReg+0, a
00103$:
;	pdk_lcdi2c.c: 139: LCDI2C_write8(lcdReg);
	mov	a, _lcdReg+0
	mov	_LCDI2C_write8_PARM_1+0, a
	goto	_LCDI2C_write8
;	pdk_lcdi2c.c: 140: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
