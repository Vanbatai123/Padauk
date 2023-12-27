;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pdk_24c
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __delay_loop_16
	.globl _I2C_available
	.globl _I2C_read
	.globl _I2C_requestFrom
	.globl _I2C_endTransmission
	.globl _I2C_write
	.globl _I2C_beginTransmission
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
	.globl _AT24C_readBuf_PARM_3
	.globl _AT24C_readBuf_PARM_2
	.globl _AT24C_readBuf_PARM_1
	.globl _AT24C_writeBuf_PARM_3
	.globl _AT24C_writeBuf_PARM_2
	.globl _AT24C_writeBuf_PARM_1
	.globl _AT24C_read_PARM_1
	.globl _AT24C_write_PARM_2
	.globl _AT24C_write_PARM_1
	.globl _AT24C_write
	.globl _AT24C_read
	.globl _AT24C_erase
	.globl _AT24C_writeBuf
	.globl _AT24C_readBuf
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
_AT24C_write_PARM_1:
	.ds 2
_AT24C_write_PARM_2:
	.ds 1
_AT24C_write_sloc0_1_0:
	.ds 1
_AT24C_read_PARM_1:
	.ds 2
_AT24C_read_sloc1_1_0:
	.ds 1
_AT24C_erase_sloc2_1_0:
	.ds 2
_AT24C_writeBuf_PARM_1:
	.ds 2
_AT24C_writeBuf_PARM_2:
	.ds 2
_AT24C_writeBuf_PARM_3:
	.ds 1
_AT24C_writeBuf_sloc3_1_0:
	.ds 2
_AT24C_writeBuf_sloc4_1_0:
	.ds 1
_AT24C_readBuf_PARM_1:
	.ds 2
_AT24C_readBuf_PARM_2:
	.ds 2
_AT24C_readBuf_PARM_3:
	.ds 2
_AT24C_readBuf_sloc5_1_0:
	.ds 2
_AT24C_readBuf_sloc6_1_0:
	.ds 1
_AT24C_readBuf_sloc7_1_0:
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
;	pdk_24c.c: 14: void AT24C_write(uint16_t address, uint8_t data)
;	-----------------------------------------
;	 function AT24C_write
;	-----------------------------------------
_AT24C_write:
;	pdk_24c.c: 16: if ((address >= MEM_BYTE) | (AT24C_read(address) == data))
	mov	a, _AT24C_write_PARM_1+1
	mov	p, a
	sub	a, #0x04
	mov	a, #0x00
	slc	a
	xor	a, #0x01
	mov	_AT24C_write_sloc0_1_0+0, a
	mov	a, _AT24C_write_PARM_1+0
	mov	_AT24C_read_PARM_1+0, a
	mov	a, _AT24C_write_PARM_1+1
	mov	_AT24C_read_PARM_1+1, a
	call	_AT24C_read
	ceqsn	a, _AT24C_write_PARM_2+0
	goto	00109$
	mov	a, #0x01
	mov	p, a
	goto	00110$
00109$:
	clear	p
00110$:
	mov	a, _AT24C_write_sloc0_1_0+0
	or	a, p
	cneqsn	a, #0x00
	goto	00102$
;	pdk_24c.c: 18: return; // thoát ngay
	ret
00102$:
;	pdk_24c.c: 26: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
	mov	a, _AT24C_write_PARM_1+1
	and	a, #0x07
	or	a, #0x50
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pdk_24c.c: 27: I2C_write(address & 0xFF);
	mov	a, _AT24C_write_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_24c.c: 34: I2C_write(data);
	mov	a, _AT24C_write_PARM_2+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_24c.c: 35: I2C_endTransmission();
	call	_I2C_endTransmission
;	pdk_24c.c: 36: _delay_ms(5);
	mov	a, #0x86
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x13
	mov	__delay_loop_16_PARM_1+1, a
	goto	__delay_loop_16
;	pdk_24c.c: 37: }
	ret
;	pdk_24c.c: 39: uint8_t AT24C_read(uint16_t address)
;	-----------------------------------------
;	 function AT24C_read
;	-----------------------------------------
_AT24C_read:
;	pdk_24c.c: 42: if (address >= MEM_BYTE)
	mov	a, _AT24C_read_PARM_1+1
	mov	p, a
	sub	a, #0x04
	t0sn.io	f, c
	goto	00102$
;	pdk_24c.c: 44: return 0; // thoát ngay
	ret	#0x00
00102$:
;	pdk_24c.c: 56: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
	mov	a, _AT24C_read_PARM_1+1
	and	a, #0x07
	or	a, #0x50
	mov	_AT24C_read_sloc1_1_0+0, a
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pdk_24c.c: 57: I2C_write(address & 0xFF);
	mov	a, _AT24C_read_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_24c.c: 58: I2C_endTransmission();
	call	_I2C_endTransmission
;	pdk_24c.c: 59: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), 1);
	mov	a, _AT24C_read_sloc1_1_0+0
	mov	_I2C_requestFrom_PARM_1+0, a
	mov	a, #0x01
	mov	_I2C_requestFrom_PARM_2+0, a
	call	_I2C_requestFrom
;	pdk_24c.c: 67: if (I2C_available())
	call	_I2C_available
	cneqsn	a, #0x00
	goto	00104$
;	pdk_24c.c: 69: data = I2C_read();
	call	_I2C_read
;	pdk_24c.c: 70: return data;
	ret
00104$:
;	pdk_24c.c: 72: return -1;
;	pdk_24c.c: 73: }
	ret	#0xff
;	pdk_24c.c: 77: void AT24C_erase(void)
;	-----------------------------------------
;	 function AT24C_erase
;	-----------------------------------------
_AT24C_erase:
;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
	clear	_AT24C_erase_sloc2_1_0+0
	clear	_AT24C_erase_sloc2_1_0+1
00105$:
	mov	a, _AT24C_erase_sloc2_1_0+1
	mov	p, a
	sub	a, #0x04
	t1sn.io	f, c
	goto	00107$
;	pdk_24c.c: 81: if ((AT24C_read(i) != 0xFF))
	mov	a, _AT24C_erase_sloc2_1_0+0
	mov	_AT24C_read_PARM_1+0, a
	mov	a, _AT24C_erase_sloc2_1_0+1
	mov	_AT24C_read_PARM_1+1, a
	call	_AT24C_read
	cneqsn	a, #0xff
	goto	00106$
00122$:
;	pdk_24c.c: 83: AT24C_write(i, 0xFF);
	mov	a, _AT24C_erase_sloc2_1_0+0
	mov	_AT24C_write_PARM_1+0, a
	mov	a, _AT24C_erase_sloc2_1_0+1
	mov	_AT24C_write_PARM_1+1, a
	mov	a, #0xff
	mov	_AT24C_write_PARM_2+0, a
	call	_AT24C_write
00106$:
;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
	inc	_AT24C_erase_sloc2_1_0+0
	addc	_AT24C_erase_sloc2_1_0+1
	goto	00105$
00107$:
;	pdk_24c.c: 86: }
	ret
;	pdk_24c.c: 88: void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len)
;	-----------------------------------------
;	 function AT24C_writeBuf
;	-----------------------------------------
_AT24C_writeBuf:
;	pdk_24c.c: 91: if ((address + len) >= MEM_BYTE)
	clear	p
	mov	a, _AT24C_writeBuf_PARM_3+0
	push	af
	mov	a, _AT24C_writeBuf_PARM_1+0
	mov	_AT24C_writeBuf_sloc3_1_0+0, a
	pop	af
	push	af
	mov	a, _AT24C_writeBuf_PARM_1+1
	mov	_AT24C_writeBuf_sloc3_1_0+1, a
	pop	af
	add	a, _AT24C_writeBuf_sloc3_1_0+0
	push	af
	mov	a, _AT24C_writeBuf_sloc3_1_0+1
	addc	p, a
	pop	af
	mov	a, p
	sub	a, #0x04
	t0sn.io	f, c
	goto	00111$
;	pdk_24c.c: 93: len = (MEM_BYTE - address);
	mov	a, _AT24C_writeBuf_PARM_1+0
	neg	a
	mov	_AT24C_writeBuf_PARM_3+0, a
;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
00111$:
	clear	_AT24C_writeBuf_sloc4_1_0+0
00105$:
	mov	a, _AT24C_writeBuf_sloc4_1_0+0
	sub	a, _AT24C_writeBuf_PARM_3+0
	t1sn.io	f, c
	goto	00107$
;	pdk_24c.c: 98: AT24C_write(address + i, src[i]);
	mov	a, _AT24C_writeBuf_sloc3_1_0+0
	add	a, _AT24C_writeBuf_sloc4_1_0+0
	mov	p, a
	mov	a, _AT24C_writeBuf_sloc3_1_0+1
	addc	a
	mov	_AT24C_write_PARM_1+1, a
	mov	a, p
	mov	_AT24C_write_PARM_1+0, a
	mov	a, _AT24C_writeBuf_PARM_2+0
	add	a, _AT24C_writeBuf_sloc4_1_0+0
	mov	p, a
	mov	a, _AT24C_writeBuf_PARM_2+1
	addc	a
	call	__gptrget
	mov	_AT24C_write_PARM_2+0, a
	call	_AT24C_write
;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
	inc	_AT24C_writeBuf_sloc4_1_0+0
	goto	00105$
00107$:
;	pdk_24c.c: 100: }
	ret
;	pdk_24c.c: 102: void AT24C_readBuf(uint16_t address, uint8_t *dest, int len)
;	-----------------------------------------
;	 function AT24C_readBuf
;	-----------------------------------------
_AT24C_readBuf:
;	pdk_24c.c: 107: if ((address + len) >= MEM_BYTE)
	mov	a, _AT24C_readBuf_PARM_1+0
	mov	_AT24C_readBuf_sloc5_1_0+0, a
	mov	a, _AT24C_readBuf_PARM_1+1
	mov	_AT24C_readBuf_sloc5_1_0+1, a
	mov	a, _AT24C_readBuf_PARM_3+1
	mov	p, a
	mov	a, _AT24C_readBuf_PARM_3+0
	add	a, _AT24C_readBuf_sloc5_1_0+0
	push	af
	mov	a, _AT24C_readBuf_sloc5_1_0+1
	addc	p, a
	pop	af
	mov	a, p
	sub	a, #0x04
	t0sn.io	f, c
	goto	00102$
;	pdk_24c.c: 109: len = (MEM_BYTE - address);
	mov	a, #0x00
	sub	a, _AT24C_readBuf_PARM_1+0
	mov	p, a
	mov	a, #0x04
	subc	a, _AT24C_readBuf_PARM_1+1
	mov	_AT24C_readBuf_PARM_3+1, a
	mov	a, p
	mov	_AT24C_readBuf_PARM_3+0, a
00102$:
;	pdk_24c.c: 118: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
	mov	a, _AT24C_readBuf_PARM_1+1
	and	a, #0x07
	or	a, #0x50
	mov	_AT24C_readBuf_sloc6_1_0+0, a
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pdk_24c.c: 119: I2C_write(address & 0xFF);
	mov	a, _AT24C_readBuf_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_24c.c: 120: I2C_endTransmission();
	call	_I2C_endTransmission
;	pdk_24c.c: 121: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), len);
	mov	a, _AT24C_readBuf_PARM_3+0
	mov	_I2C_requestFrom_PARM_2+0, a
	mov	a, _AT24C_readBuf_sloc6_1_0+0
	mov	_I2C_requestFrom_PARM_1+0, a
	call	_I2C_requestFrom
;	pdk_24c.c: 129: while (I2C_available())
	mov	a, _AT24C_readBuf_PARM_2+0
	mov	_AT24C_readBuf_sloc7_1_0+0, a
	mov	a, _AT24C_readBuf_PARM_2+1
	mov	_AT24C_readBuf_sloc7_1_0+1, a
00103$:
	call	_I2C_available
	cneqsn	a, #0x00
	goto	00106$
;	pdk_24c.c: 131: *dest++ = I2C_read();
	call	_I2C_read
	mov	p, a
	mov	a, _AT24C_readBuf_sloc7_1_0+0
	xch	a, p
	idxm	p, a
	inc	_AT24C_readBuf_sloc7_1_0+0
	addc	_AT24C_readBuf_sloc7_1_0+1
	goto	00103$
00106$:
;	pdk_24c.c: 133: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
