;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pdk_i2c
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
	.globl _DS1307_Set_PARM_6
	.globl _DS1307_Set_PARM_5
	.globl _DS1307_Set_PARM_4
	.globl _DS1307_Set_PARM_3
	.globl _DS1307_Set_PARM_2
	.globl _DS1307_Set_PARM_1
	.globl _DS1307_Read_PARM_1
	.globl _DS1307_Write_PARM_2
	.globl _DS1307_Write_PARM_1
	.globl _I2C_write_PARM_1
	.globl _I2C_start
	.globl _I2C_stop
	.globl _I2C_write
	.globl _I2C_read
	.globl _DS1307_Write
	.globl _DS1307_Read
	.globl _DS1307_Set
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
_I2C_write_PARM_1:
	.ds 1
_DS1307_Write_PARM_1:
	.ds 1
_DS1307_Write_PARM_2:
	.ds 1
_DS1307_Write_sloc1_1_0:
	.ds 2
_DS1307_Write_sloc2_1_0:
	.ds 1
_DS1307_Write_sloc3_1_0:
	.ds 1
_DS1307_Read_PARM_1:
	.ds 1
_DS1307_Read_sloc4_1_0:
	.ds 1
_DS1307_Set_PARM_1:
	.ds 1
_DS1307_Set_PARM_2:
	.ds 1
_DS1307_Set_PARM_3:
	.ds 1
_DS1307_Set_PARM_4:
	.ds 1
_DS1307_Set_PARM_5:
	.ds 1
_DS1307_Set_PARM_6:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
	.area	OSEG (OVR,DATA)
_I2C_read_sloc0_1_0:
	.ds 1
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
;	pdk_i2c.c: 11: void I2C_start()
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	pdk_i2c.c: 13: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 14: SDA1;
	set1.io	__pb, #6
;	pdk_i2c.c: 15: SDA0;
	set0.io	__pb, #6
;	pdk_i2c.c: 16: SCL0;
	set0.io	__pb, #7
;	pdk_i2c.c: 17: }
	ret
;	pdk_i2c.c: 18: void I2C_stop()
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	pdk_i2c.c: 20: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 21: SDA0;
	set0.io	__pb, #6
;	pdk_i2c.c: 22: SDA1;
	set1.io	__pb, #6
;	pdk_i2c.c: 23: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 24: }
	ret
;	pdk_i2c.c: 25: uint8_t I2C_write(uint8_t dat)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
;	pdk_i2c.c: 28: for (i = 0; i < 8; i++)
	clear	p
00105$:
;	pdk_i2c.c: 31: if (dat & 0x80)
	mov	a, _I2C_write_PARM_1+0
	and	a, #0x80
	cneqsn	a, #0x00
	goto	00102$
;	pdk_i2c.c: 32: SDA1;
	set1.io	__pb, #6
	goto	00103$
00102$:
;	pdk_i2c.c: 34: SDA0;
	set0.io	__pb, #6
00103$:
;	pdk_i2c.c: 35: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 36: SCL0;
	set0.io	__pb, #7
;	pdk_i2c.c: 37: dat <<= 1;
	sl	_I2C_write_PARM_1+0
;	pdk_i2c.c: 28: for (i = 0; i < 8; i++)
	inc	p
	mov	a, p
	sub	a, #0x08
	t0sn.io	f, c
	goto	00105$
;	pdk_i2c.c: 39: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 40: SCL0;
	set0.io	__pb, #7
;	pdk_i2c.c: 41: return dat;
	mov	a, _I2C_write_PARM_1+0
;	pdk_i2c.c: 42: }
	ret
;	pdk_i2c.c: 43: uint8_t I2C_read(void)
;	-----------------------------------------
;	 function I2C_read
;	-----------------------------------------
_I2C_read:
;	pdk_i2c.c: 45: uint8_t dat = 0x00;;
	clear	p
;	pdk_i2c.c: 47: SDA1;
	set1.io	__pb, #6
;	pdk_i2c.c: 48: setb(PBPH, SDA);
	set1.io	__pbph, #6
;	pdk_i2c.c: 49: setb(PBDIER, SDA);
	set1.io	__pbdier, #6
;	pdk_i2c.c: 50: clrb(PBC, SDA);
	set0.io	__pbc, #6
;	pdk_i2c.c: 52: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
	clear	_I2C_read_sloc0_1_0+0
00105$:
	mov	a, _I2C_read_sloc0_1_0+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00103$
;	pdk_i2c.c: 54: SCL1;
	set1.io	__pb, #7
;	pdk_i2c.c: 56: dat = dat << 1;
	sl	p
;	pdk_i2c.c: 57: if (inbit(PB, SDA))
	mov.io	a, __pb
	and	a, #0x40
	swap	a
	and	a, #0x0f
	sr	a
	sr	a
	cneqsn	a, #0x00
	goto	00102$
;	pdk_i2c.c: 58: dat = dat | 0x01; /* Keep biit daata in dat */
	set1	p, #0
00102$:
;	pdk_i2c.c: 59: SCL0;                   /* Clear SCL */
	set0.io	__pb, #7
;	pdk_i2c.c: 52: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
	inc	_I2C_read_sloc0_1_0+0
	goto	00105$
00103$:
;	pdk_i2c.c: 61: setb(PBC, SDA);
	set1.io	__pbc, #6
;	pdk_i2c.c: 62: return dat;
	mov	a, p
;	pdk_i2c.c: 63: }
	ret
;	pdk_i2c.c: 66: void DS1307_Write(uint8_t addr, uint8_t dat)
;	-----------------------------------------
;	 function DS1307_Write
;	-----------------------------------------
_DS1307_Write:
;	pdk_i2c.c: 68: dat = (((dat / 10) * 16) | (dat % 10)); /*for Led 7seg*/
	mov	a, _DS1307_Write_PARM_2+0
	mov	_DS1307_Write_sloc1_1_0+0, a
	clear	_DS1307_Write_sloc1_1_0+1
	mov	a, _DS1307_Write_sloc1_1_0+0
	mov	__divsint_PARM_1+0, a
	mov	a, _DS1307_Write_sloc1_1_0+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	_DS1307_Write_sloc2_1_0+0, a
	sl	_DS1307_Write_sloc2_1_0+0
	sl	_DS1307_Write_sloc2_1_0+0
	sl	_DS1307_Write_sloc2_1_0+0
	sl	_DS1307_Write_sloc2_1_0+0
	mov	a, _DS1307_Write_sloc1_1_0+0
	mov	__modsint_PARM_1+0, a
	mov	a, _DS1307_Write_sloc1_1_0+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	push	af
	mov	a, _DS1307_Write_sloc2_1_0+0
	mov	_DS1307_Write_sloc3_1_0+0, a
	pop	af
	or	a, _DS1307_Write_sloc3_1_0+0
	mov	_DS1307_Write_PARM_2+0, a
;	pdk_i2c.c: 69: I2C_start();                       /* time_start i2c bus */
	call	_I2C_start
;	pdk_i2c.c: 70: I2C_write(0XD0);                        /* Connect to DS1307 */
	mov	a, #0xd0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 71: I2C_write(addr);                        /* Requetime_5 RAM address on DS1307 */
	mov	a, _DS1307_Write_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 72: I2C_write(dat);
	mov	a, _DS1307_Write_PARM_2+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 73: I2C_stop();
	goto	_I2C_stop
;	pdk_i2c.c: 74: }
	ret
;	pdk_i2c.c: 75: uint8_t DS1307_Read(uint8_t addr)
;	-----------------------------------------
;	 function DS1307_Read
;	-----------------------------------------
_DS1307_Read:
;	pdk_i2c.c: 78: I2C_start(); /* time_start i2c bus */
	call	_I2C_start
;	pdk_i2c.c: 79: I2C_write(0xD0);  /* Connect to DS1307 */
	mov	a, #0xd0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 80: I2C_write(addr);  /* Requetime_5 RAM address on DS1307 */
	mov	a, _DS1307_Read_PARM_1+0
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 81: I2C_start(); /* time_start i2c bus */
	call	_I2C_start
;	pdk_i2c.c: 82: I2C_write(0XD1);  /* Connect to DS1307 for Read */
	mov	a, #0xd1
	mov	_I2C_write_PARM_1+0, a
	call	_I2C_write
;	pdk_i2c.c: 83: ret = I2C_read(); /* Receive data */
	call	_I2C_read
	mov	_DS1307_Read_sloc4_1_0+0, a
;	pdk_i2c.c: 84: I2C_stop();
	call	_I2C_stop
;	pdk_i2c.c: 85: ret = (((ret / 16) * 10) + (ret & 0x0f)); /*for Led 7seg*/
	mov	a, _DS1307_Read_sloc4_1_0+0
	mov	__divsint_PARM_1+0, a
	clear	__divsint_PARM_1+1
	mov	a, #0x10
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	p, a
	sl	a
	sl	a
	add	a, p
	sl	a
	mov	p, a
	mov	a, _DS1307_Read_sloc4_1_0+0
	and	a, #0x0f
	add	a, p
;	pdk_i2c.c: 86: return ret;
;	pdk_i2c.c: 87: }
	ret
;	pdk_i2c.c: 88: void DS1307_Set(uint8_t sec, uint8_t min, uint8_t hour, uint8_t day, uint8_t month, uint8_t year)
;	-----------------------------------------
;	 function DS1307_Set
;	-----------------------------------------
_DS1307_Set:
;	pdk_i2c.c: 91: DS1307_Write(DS1307_SEC, sec);
	clear	_DS1307_Write_PARM_1+0
	mov	a, _DS1307_Set_PARM_1+0
	mov	_DS1307_Write_PARM_2+0, a
	call	_DS1307_Write
;	pdk_i2c.c: 92: DS1307_Write(DS1307_MIN, min);
	mov	a, #0x01
	mov	_DS1307_Write_PARM_1+0, a
	mov	a, _DS1307_Set_PARM_2+0
	mov	_DS1307_Write_PARM_2+0, a
	call	_DS1307_Write
;	pdk_i2c.c: 93: DS1307_Write(DS1307_HOUR, hour);
	mov	a, #0x02
	mov	_DS1307_Write_PARM_1+0, a
	mov	a, _DS1307_Set_PARM_3+0
	mov	_DS1307_Write_PARM_2+0, a
	call	_DS1307_Write
;	pdk_i2c.c: 94: DS1307_Write(DS1307_DATE, day);
	mov	a, #0x04
	mov	_DS1307_Write_PARM_1+0, a
	mov	a, _DS1307_Set_PARM_4+0
	mov	_DS1307_Write_PARM_2+0, a
	call	_DS1307_Write
;	pdk_i2c.c: 95: DS1307_Write(DS1307_MONTH, month);
	mov	a, #0x05
	mov	_DS1307_Write_PARM_1+0, a
	mov	a, _DS1307_Set_PARM_5+0
	mov	_DS1307_Write_PARM_2+0, a
	call	_DS1307_Write
;	pdk_i2c.c: 96: DS1307_Write(DS1307_YEAR, year);
	mov	a, #0x06
	mov	_DS1307_Write_PARM_1+0, a
	mov	a, _DS1307_Set_PARM_6+0
	mov	_DS1307_Write_PARM_2+0, a
	goto	_DS1307_Write
;	pdk_i2c.c: 97: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
