;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module pdk_i2c
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _I2C_requestFrom_PARM_2
	.globl _I2C_requestFrom_PARM_1
	.globl _I2C_writeBuffer_PARM_2
	.globl _I2C_writeBuffer_PARM_1
	.globl _I2C_write2_PARM_1
	.globl _I2C_beginTransmission_PARM_1
	.globl _I2C_read_t_PARM_1
	.globl _I2C_write_t_PARM_1
	.globl _txBuffer
	.globl _txBufferLength
	.globl _txBufferIndex
	.globl _rxBuffer
	.globl _rxBufferLength
	.globl _rxBufferIndex
	.globl _I2C_Ack
	.globl _I2C_NoAck
	.globl _I2C_start
	.globl _I2C_stop
	.globl _I2C_write_t
	.globl _I2C_read_t
	.globl _I2C_beginTransmission
	.globl _I2C_write2
	.globl _I2C_writeBuffer
	.globl _I2C_endTransmission
	.globl _I2C_requestFrom
	.globl _I2C_read
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
_rxBufferIndex::
	.ds 1
_rxBufferLength::
	.ds 1
_rxBuffer::
	.ds 16
_txBufferIndex::
	.ds 1
_txBufferLength::
	.ds 1
_txBuffer::
	.ds 16
_I2C_write_t_PARM_1:
	.ds 1
_I2C_write_t_sloc0_1_0:
	.ds 1
_I2C_read_t_PARM_1:
	.ds 1
_I2C_read_t_sloc1_1_0:
	.ds 1
_I2C_read_t_sloc2_1_0:
	.ds 1
_I2C_beginTransmission_PARM_1:
	.ds 1
_I2C_write2_PARM_1:
	.ds 1
_I2C_writeBuffer_PARM_1:
	.ds 2
_I2C_writeBuffer_PARM_2:
	.ds 1
_I2C_writeBuffer_sloc3_1_0:
	.ds 1
_I2C_endTransmission_sloc4_1_0:
	.ds 1
_I2C_requestFrom_PARM_1:
	.ds 1
_I2C_requestFrom_PARM_2:
	.ds 1
_I2C_requestFrom_sloc5_1_0:
	.ds 1
_I2C_requestFrom_sloc6_1_0:
	.ds 2
_I2C_requestFrom_sloc7_1_0:
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	pdk_i2c.c: 19: void I2C_Ack()
;	-----------------------------------------
;	 function I2C_Ack
;	-----------------------------------------
_I2C_Ack:
;	pdk_i2c.c: 21: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 22: SDA0;
	set0	__pb, #6
;	pdk_i2c.c: 23: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 24: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 25: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 26: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 27: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	goto	__delay_loop_8
;	pdk_i2c.c: 28: }
	ret
;	pdk_i2c.c: 30: void I2C_NoAck()
;	-----------------------------------------
;	 function I2C_NoAck
;	-----------------------------------------
_I2C_NoAck:
;	pdk_i2c.c: 32: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 33: SDA1;
	set1	__pb, #6
;	pdk_i2c.c: 34: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 35: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 36: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 37: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 38: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	goto	__delay_loop_8
;	pdk_i2c.c: 39: }
	ret
;	pdk_i2c.c: 41: void I2C_start()
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	pdk_i2c.c: 43: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 44: SDA1;
	set1	__pb, #6
;	pdk_i2c.c: 45: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 46: SDA0;
	set0	__pb, #6
;	pdk_i2c.c: 47: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 48: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 49: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	goto	__delay_loop_8
;	pdk_i2c.c: 50: }
	ret
;	pdk_i2c.c: 51: void I2C_stop()
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	pdk_i2c.c: 53: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 54: SDA0;
	set0	__pb, #6
;	pdk_i2c.c: 55: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 56: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 57: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 58: SDA1;
	set1	__pb, #6
;	pdk_i2c.c: 59: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	goto	__delay_loop_8
;	pdk_i2c.c: 60: }
	ret
;	pdk_i2c.c: 61: uint8_t I2C_write_t(uint8_t dat)
;	-----------------------------------------
;	 function I2C_write_t
;	-----------------------------------------
_I2C_write_t:
;	pdk_i2c.c: 66: for (i = 0; i < 8; i++)
	clear	_I2C_write_t_sloc0_1_0+0
00105$:
;	pdk_i2c.c: 69: if (dat & 0x80)
	mov	a, _I2C_write_t_PARM_1+0
	mov	p, a
	t1sn	p, #7
	goto	00102$
;	pdk_i2c.c: 70: SDA1;
	set1	__pb, #6
	goto	00103$
00102$:
;	pdk_i2c.c: 72: SDA0;
	set0	__pb, #6
00103$:
;	pdk_i2c.c: 74: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 75: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 76: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 77: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 78: dat <<= 1;
	sl	_I2C_write_t_PARM_1+0
;	pdk_i2c.c: 66: for (i = 0; i < 8; i++)
	inc	_I2C_write_t_sloc0_1_0+0
	mov	a, _I2C_write_t_sloc0_1_0+0
	sub	a, #0x08
	t0sn	f, c
	goto	00105$
;	pdk_i2c.c: 80: SDA0;
	set0	__pb, #6
;	pdk_i2c.c: 81: setb(PBPH, SDA);
	set1	__pbph, #6
;	pdk_i2c.c: 82: setb(PBDIER, SDA);
	set1	__pbdier, #6
;	pdk_i2c.c: 83: clrb(PBC, SDA);
	set0	__pbc, #6
;	pdk_i2c.c: 84: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 85: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 86: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 87: SCL0;
	set0	__pb, #7
;	pdk_i2c.c: 88: setb(PBC, SDA);
	set1	__pbc, #6
;	pdk_i2c.c: 89: return dat;
	mov	a, _I2C_write_t_PARM_1+0
;	pdk_i2c.c: 90: }
	ret
;	pdk_i2c.c: 92: uint8_t I2C_read_t(uint8_t ack)
;	-----------------------------------------
;	 function I2C_read_t
;	-----------------------------------------
_I2C_read_t:
;	pdk_i2c.c: 94: uint8_t dat = 0x00;
	clear	_I2C_read_t_sloc1_1_0+0
;	pdk_i2c.c: 97: clrb(PBC, SDA);
	set0	__pbc, #6
;	pdk_i2c.c: 98: setb(PBPH, SDA);
	set1	__pbph, #6
;	pdk_i2c.c: 99: setb(PBDIER, SDA);
	set1	__pbdier, #6
;	pdk_i2c.c: 101: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
	clear	_I2C_read_t_sloc2_1_0+0
00108$:
	mov	a, _I2C_read_t_sloc2_1_0+0
	sub	a, #0x08
	t1sn	f, c
	goto	00103$
;	pdk_i2c.c: 103: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 104: SCL1;
	set1	__pb, #7
;	pdk_i2c.c: 105: dat = dat << 1;
	sl	_I2C_read_t_sloc1_1_0+0
;	pdk_i2c.c: 106: if (inbit(PB, SDA))
	mov	a, __pb
	and	a, #0x40
	swap	a
	and	a, #0x0f
	sr	a
	sr	a
	cneqsn	a, #0x00
	goto	00102$
;	pdk_i2c.c: 107: dat = dat | 0x01; /* Keep biit daata in dat */
	mov	a, #0x01
	or	_I2C_read_t_sloc1_1_0+0, a
00102$:
;	pdk_i2c.c: 109: _delay_us(4);
	mov	a, #0x08
	mov	__delay_loop_8_PARM_1+0, a
	call	__delay_loop_8
;	pdk_i2c.c: 110: SCL0; /* Clear SCL */
	set0	__pb, #7
;	pdk_i2c.c: 101: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
	inc	_I2C_read_t_sloc2_1_0+0
	goto	00108$
00103$:
;	pdk_i2c.c: 112: setb(PBC, SDA);
	set1	__pbc, #6
;	pdk_i2c.c: 113: if (ack == 0)
	mov	a, _I2C_read_t_PARM_1+0
	ceqsn	a, #0x00
	goto	00105$
;	pdk_i2c.c: 114: I2C_NoAck();
	call	_I2C_NoAck
	goto	00106$
00105$:
;	pdk_i2c.c: 116: I2C_Ack();
	call	_I2C_Ack
00106$:
;	pdk_i2c.c: 118: return dat;
	mov	a, _I2C_read_t_sloc1_1_0+0
;	pdk_i2c.c: 119: }
	ret
;	pdk_i2c.c: 121: void I2C_beginTransmission(uint8_t addr)
;	-----------------------------------------
;	 function I2C_beginTransmission
;	-----------------------------------------
_I2C_beginTransmission:
;	pdk_i2c.c: 123: txBufferIndex = 0;
	clear	_txBufferIndex+0
;	pdk_i2c.c: 124: txBufferLength = 0;
	clear	_txBufferLength+0
;	pdk_i2c.c: 127: I2C_start();
	call	_I2C_start
;	pdk_i2c.c: 130: I2C_write_t((addr << 1) | I2C_WRITE);
	mov	a, _I2C_beginTransmission_PARM_1+0
	sl	a
	mov	_I2C_write_t_PARM_1+0, a
	goto	_I2C_write_t
;	pdk_i2c.c: 131: }
	ret
;	pdk_i2c.c: 133: void I2C_write2(uint8_t data)
;	-----------------------------------------
;	 function I2C_write2
;	-----------------------------------------
_I2C_write2:
;	pdk_i2c.c: 135: txBuffer[txBufferIndex++] = data;
	mov	a, _txBufferIndex+0
	inc	_txBufferIndex+0
	add	a, #(_txBuffer + 0)
	mov	p, a
	mov	a, _I2C_write2_PARM_1+0
	idxm	p, a
;	pdk_i2c.c: 136: txBufferLength = txBufferIndex;
	mov	a, _txBufferIndex+0
	mov	_txBufferLength+0, a
;	pdk_i2c.c: 137: }
	ret
;	pdk_i2c.c: 139: void I2C_writeBuffer(uint8_t *data, uint8_t len)
;	-----------------------------------------
;	 function I2C_writeBuffer
;	-----------------------------------------
_I2C_writeBuffer:
;	pdk_i2c.c: 141: uint8_t i = 0;
	clear	_I2C_writeBuffer_sloc3_1_0+0
00103$:
;	pdk_i2c.c: 142: for (; i < len; ++i)
	mov	a, _I2C_writeBuffer_sloc3_1_0+0
	sub	a, _I2C_writeBuffer_PARM_2+0
	t1sn	f, c
	goto	00105$
;	pdk_i2c.c: 144: I2C_write2(data[i]);
	mov	a, _I2C_writeBuffer_PARM_1+0
	add	a, _I2C_writeBuffer_sloc3_1_0+0
	mov	p, a
	mov	a, _I2C_writeBuffer_PARM_1+1
	addc	a
	call	__gptrget
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pdk_i2c.c: 142: for (; i < len; ++i)
	inc	_I2C_writeBuffer_sloc3_1_0+0
	goto	00103$
00105$:
;	pdk_i2c.c: 146: }
	ret
;	pdk_i2c.c: 148: void I2C_endTransmission(void)
;	-----------------------------------------
;	 function I2C_endTransmission
;	-----------------------------------------
_I2C_endTransmission:
;	pdk_i2c.c: 152: for (i = 0; i < txBufferLength; ++i)
	clear	_I2C_endTransmission_sloc4_1_0+0
00103$:
	mov	a, _I2C_endTransmission_sloc4_1_0+0
	sub	a, _txBufferLength+0
	t1sn	f, c
	goto	00101$
;	pdk_i2c.c: 155: I2C_write_t(txBuffer[i]);
	mov	a, #(_txBuffer + 0)
	add	a, _I2C_endTransmission_sloc4_1_0+0
	mov	p, a
	idxm	a, p
	mov	_I2C_write_t_PARM_1+0, a
	call	_I2C_write_t
;	pdk_i2c.c: 152: for (i = 0; i < txBufferLength; ++i)
	inc	_I2C_endTransmission_sloc4_1_0+0
	goto	00103$
00101$:
;	pdk_i2c.c: 159: I2C_stop();
	goto	_I2C_stop
;	pdk_i2c.c: 160: }
	ret
;	pdk_i2c.c: 162: void I2C_requestFrom(uint8_t addr, uint8_t len)
;	-----------------------------------------
;	 function I2C_requestFrom
;	-----------------------------------------
_I2C_requestFrom:
;	pdk_i2c.c: 165: rxBufferLength = len;
	mov	a, _I2C_requestFrom_PARM_2+0
	mov	_rxBufferLength+0, a
;	pdk_i2c.c: 166: rxBufferIndex = 0;
	clear	_rxBufferIndex+0
;	pdk_i2c.c: 169: I2C_start();
	call	_I2C_start
;	pdk_i2c.c: 172: I2C_write_t((addr << 1) | I2C_READ);
	mov	a, _I2C_requestFrom_PARM_1+0
	sl	a
	or	a, #0x01
	mov	_I2C_write_t_PARM_1+0, a
	call	_I2C_write_t
;	pdk_i2c.c: 175: for (i = 0; i < rxBufferLength - 1; i++)
	clear	_I2C_requestFrom_sloc5_1_0+0
00103$:
	mov	a, _rxBufferLength+0
	sub	a, #0x01
	mov	_I2C_requestFrom_sloc6_1_0+0, a
	mov	a, #0x00
	subc	a
	mov	_I2C_requestFrom_sloc6_1_0+1, a
	clear	p
	mov	a, _I2C_requestFrom_sloc5_1_0+0
	sub	a, _I2C_requestFrom_sloc6_1_0+0
	mov	a, p
	subc	a, _I2C_requestFrom_sloc6_1_0+1
	t0sn	f, ov
	xor	a, #0x80
	sl	a
	t1sn	f, c
	goto	00101$
;	pdk_i2c.c: 177: rxBuffer[i] = I2C_read_t(ACK);
	mov	a, #(_rxBuffer + 0)
	add	a, _I2C_requestFrom_sloc5_1_0+0
	mov	_I2C_requestFrom_sloc7_1_0+0, a
	mov	a, #0x01
	mov	_I2C_read_t_PARM_1+0, a
	call	_I2C_read_t
	mov	p, a
	mov	a, _I2C_requestFrom_sloc7_1_0+0
	xch	a, p
	idxm	p, a
;	pdk_i2c.c: 175: for (i = 0; i < rxBufferLength - 1; i++)
	inc	_I2C_requestFrom_sloc5_1_0+0
	goto	00103$
00101$:
;	pdk_i2c.c: 180: rxBuffer[rxBufferLength - 1] = I2C_read_t(NACK);
	mov	a, _rxBufferLength+0
	sub	a, #0x01
	add	a, #(_rxBuffer + 0)
	clear	_I2C_read_t_PARM_1+0
	push	af
	call	_I2C_read_t
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	pdk_i2c.c: 183: I2C_stop();
	goto	_I2C_stop
;	pdk_i2c.c: 184: }
	ret
;	pdk_i2c.c: 186: int8_t I2C_read(void)
;	-----------------------------------------
;	 function I2C_read
;	-----------------------------------------
_I2C_read:
;	pdk_i2c.c: 188: int8_t value = 5;
	mov	a, #0x05
	mov	p, a
;	pdk_i2c.c: 190: if (rxBufferIndex < rxBufferLength)
	mov	a, _rxBufferIndex+0
	sub	a, _rxBufferLength+0
	t1sn	f, c
	goto	00102$
;	pdk_i2c.c: 192: value = rxBuffer[rxBufferIndex];
	mov	a, #(_rxBuffer + 0)
	add	a, _rxBufferIndex+0
	mov	p, a
	idxm	a, p
	mov	p, a
;	pdk_i2c.c: 193: ++rxBufferIndex;
	inc	_rxBufferIndex+0
00102$:
;	pdk_i2c.c: 195: return value;
	mov	a, p
;	pdk_i2c.c: 196: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
