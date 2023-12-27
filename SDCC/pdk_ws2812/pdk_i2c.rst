                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_i2c
                                      6 	.optsdcc -mpdk15
                                      7 	
                                      8 
                                      9 ; default segment ordering in RAM for linker
                                     10 	.area DATA
                                     11 	.area OSEG (OVR,DATA)
                                     12 
                                     13 ;--------------------------------------------------------
                                     14 ; Public variables in this module
                                     15 ;--------------------------------------------------------
                                     16 	.globl __delay_loop_8
                                     17 	.globl __t16c
                                     18 	.globl __rop
                                     19 	.globl __bgtr
                                     20 	.globl __ilrcr
                                     21 	.globl __pwmg2dtl
                                     22 	.globl __pwmg2dth
                                     23 	.globl __pwmg2c
                                     24 	.globl __pwmg1dtl
                                     25 	.globl __pwmg1dth
                                     26 	.globl __pwmg1c
                                     27 	.globl __pwmgcubl
                                     28 	.globl __pwmgcubh
                                     29 	.globl __pwmg0dtl
                                     30 	.globl __pwmg0dth
                                     31 	.globl __pwmgclk
                                     32 	.globl __pwmg0c
                                     33 	.globl __tm3b
                                     34 	.globl __tm3s
                                     35 	.globl __tm3ct
                                     36 	.globl __tm3c
                                     37 	.globl __tm2b
                                     38 	.globl __tm2s
                                     39 	.globl __tm2ct
                                     40 	.globl __tm2c
                                     41 	.globl __gpcs
                                     42 	.globl __gpcc
                                     43 	.globl __misclvr
                                     44 	.globl __misc2
                                     45 	.globl __misc
                                     46 	.globl __adcrgc
                                     47 	.globl __adcr
                                     48 	.globl __adcm
                                     49 	.globl __adcc
                                     50 	.globl __pcpl
                                     51 	.globl __pbpl
                                     52 	.globl __pcph
                                     53 	.globl __pcc
                                     54 	.globl __pc
                                     55 	.globl __pbph
                                     56 	.globl __pbc
                                     57 	.globl __pb
                                     58 	.globl __paph
                                     59 	.globl __pac
                                     60 	.globl __pa
                                     61 	.globl __pcdier
                                     62 	.globl __pbdier
                                     63 	.globl __padier
                                     64 	.globl __integs
                                     65 	.globl __ihrcr
                                     66 	.globl __eoscr
                                     67 	.globl __t16m
                                     68 	.globl __intrq
                                     69 	.globl __inten
                                     70 	.globl __clkmd
                                     71 	.globl __sp
                                     72 	.globl __flag
                                     73 	.globl _I2C_requestFrom_PARM_2
                                     74 	.globl _I2C_requestFrom_PARM_1
                                     75 	.globl _I2C_writeBuffer_PARM_2
                                     76 	.globl _I2C_writeBuffer_PARM_1
                                     77 	.globl _I2C_write_PARM_1
                                     78 	.globl _I2C_beginTransmission_PARM_1
                                     79 	.globl _I2C_read_t_PARM_1
                                     80 	.globl _I2C_write_t_PARM_1
                                     81 	.globl _txBuffer
                                     82 	.globl _txBufferLength
                                     83 	.globl _txBufferIndex
                                     84 	.globl _rxBuffer
                                     85 	.globl _rxBufferLength
                                     86 	.globl _rxBufferIndex
                                     87 	.globl _I2C_Ack
                                     88 	.globl _I2C_NoAck
                                     89 	.globl _I2C_start
                                     90 	.globl _I2C_stop
                                     91 	.globl _I2C_write_t
                                     92 	.globl _I2C_read_t
                                     93 	.globl _I2C_beginTransmission
                                     94 	.globl _I2C_write
                                     95 	.globl _I2C_writeBuffer
                                     96 	.globl _I2C_endTransmission
                                     97 	.globl _I2C_requestFrom
                                     98 	.globl _I2C_read
                                     99 	.globl _I2C_available
                                    100 	.globl _I2C_begin
                                    101 ;--------------------------------------------------------
                                    102 ; special function registers
                                    103 ;--------------------------------------------------------
                                    104 	.area RSEG (ABS)
      000002                        105 	.org 0x0000
                           000000   106 __flag	=	0x0000
                           000002   107 __sp	=	0x0002
                           000003   108 __clkmd	=	0x0003
                           000004   109 __inten	=	0x0004
                           000005   110 __intrq	=	0x0005
                           000006   111 __t16m	=	0x0006
                           00000A   112 __eoscr	=	0x000a
                           00000B   113 __ihrcr	=	0x000b
                           00000C   114 __integs	=	0x000c
                           00000D   115 __padier	=	0x000d
                           00000E   116 __pbdier	=	0x000e
                           00000F   117 __pcdier	=	0x000f
                           000010   118 __pa	=	0x0010
                           000011   119 __pac	=	0x0011
                           000012   120 __paph	=	0x0012
                           000013   121 __pb	=	0x0013
                           000014   122 __pbc	=	0x0014
                           000015   123 __pbph	=	0x0015
                           000016   124 __pc	=	0x0016
                           000017   125 __pcc	=	0x0017
                           000018   126 __pcph	=	0x0018
                           000019   127 __pbpl	=	0x0019
                           00001A   128 __pcpl	=	0x001a
                           000020   129 __adcc	=	0x0020
                           000021   130 __adcm	=	0x0021
                           000022   131 __adcr	=	0x0022
                           000024   132 __adcrgc	=	0x0024
                           000026   133 __misc	=	0x0026
                           000027   134 __misc2	=	0x0027
                           000028   135 __misclvr	=	0x0028
                           00002B   136 __gpcc	=	0x002b
                           00002C   137 __gpcs	=	0x002c
                           000030   138 __tm2c	=	0x0030
                           000031   139 __tm2ct	=	0x0031
                           000032   140 __tm2s	=	0x0032
                           000033   141 __tm2b	=	0x0033
                           000034   142 __tm3c	=	0x0034
                           000035   143 __tm3ct	=	0x0035
                           000036   144 __tm3s	=	0x0036
                           000037   145 __tm3b	=	0x0037
                           000040   146 __pwmg0c	=	0x0040
                           000041   147 __pwmgclk	=	0x0041
                           000042   148 __pwmg0dth	=	0x0042
                           000043   149 __pwmg0dtl	=	0x0043
                           000044   150 __pwmgcubh	=	0x0044
                           000045   151 __pwmgcubl	=	0x0045
                           000046   152 __pwmg1c	=	0x0046
                           000048   153 __pwmg1dth	=	0x0048
                           000049   154 __pwmg1dtl	=	0x0049
                           00004C   155 __pwmg2c	=	0x004c
                           00004E   156 __pwmg2dth	=	0x004e
                           00004F   157 __pwmg2dtl	=	0x004f
                           000062   158 __ilrcr	=	0x0062
                           000063   159 __bgtr	=	0x0063
                           000067   160 __rop	=	0x0067
      000002                        161 __t16c::
      000002                        162 	.ds 2
                                    163 ;--------------------------------------------------------
                                    164 ; ram data
                                    165 ;--------------------------------------------------------
                                    166 	.area DATA
      000021                        167 _rxBufferIndex::
      000021                        168 	.ds 1
      000022                        169 _rxBufferLength::
      000022                        170 	.ds 1
      000023                        171 _rxBuffer::
      000023                        172 	.ds 16
      000033                        173 _txBufferIndex::
      000033                        174 	.ds 1
      000034                        175 _txBufferLength::
      000034                        176 	.ds 1
      000035                        177 _txBuffer::
      000035                        178 	.ds 16
      000045                        179 _I2C_write_t_PARM_1:
      000045                        180 	.ds 1
      000046                        181 _I2C_write_t_sloc0_1_0:
      000046                        182 	.ds 1
      000047                        183 _I2C_read_t_PARM_1:
      000047                        184 	.ds 1
      000048                        185 _I2C_read_t_sloc1_1_0:
      000048                        186 	.ds 1
      000049                        187 _I2C_read_t_sloc2_1_0:
      000049                        188 	.ds 1
      00004A                        189 _I2C_beginTransmission_PARM_1:
      00004A                        190 	.ds 1
      00004B                        191 _I2C_write_PARM_1:
      00004B                        192 	.ds 1
      00004C                        193 _I2C_writeBuffer_PARM_1:
      00004C                        194 	.ds 2
      00004E                        195 _I2C_writeBuffer_PARM_2:
      00004E                        196 	.ds 1
      00004F                        197 _I2C_writeBuffer_sloc3_1_0:
      00004F                        198 	.ds 1
      000050                        199 _I2C_endTransmission_sloc4_1_0:
      000050                        200 	.ds 1
      000051                        201 _I2C_requestFrom_PARM_1:
      000051                        202 	.ds 1
      000052                        203 _I2C_requestFrom_PARM_2:
      000052                        204 	.ds 1
      000053                        205 _I2C_requestFrom_sloc5_1_0:
      000053                        206 	.ds 1
      000054                        207 _I2C_requestFrom_sloc6_1_0:
      000054                        208 	.ds 2
      000056                        209 _I2C_requestFrom_sloc7_1_0:
      000056                        210 	.ds 1
                                    211 ;--------------------------------------------------------
                                    212 ; overlayable items in ram
                                    213 ;--------------------------------------------------------
                                    214 ;--------------------------------------------------------
                                    215 ; absolute external ram data
                                    216 ;--------------------------------------------------------
                                    217 	.area DABS (ABS)
                                    218 ;--------------------------------------------------------
                                    219 ; global & static initialisations
                                    220 ;--------------------------------------------------------
                                    221 	.area HOME
                                    222 	.area GSINIT
                                    223 	.area GSFINAL
                                    224 	.area GSINIT
                                    225 ;--------------------------------------------------------
                                    226 ; Home
                                    227 ;--------------------------------------------------------
                                    228 	.area HOME
                                    229 	.area HOME
                                    230 ;--------------------------------------------------------
                                    231 ; code
                                    232 ;--------------------------------------------------------
                                    233 	.area CODE
                                    234 ;	pdk_i2c.c: 19: void I2C_Ack()
                                    235 ;	-----------------------------------------
                                    236 ;	 function I2C_Ack
                                    237 ;	-----------------------------------------
      000478                        238 _I2C_Ack:
                                    239 ;	pdk_i2c.c: 21: _delay_us(4);
      000478 08 57                  240 	mov	a, #0x08
      00047A 57 17                  241 	mov	__delay_loop_8_PARM_1+0, a
      00047C 36 73                  242 	call	__delay_loop_8
                                    243 ;	pdk_i2c.c: 22: SDA0;
      00047E 93 39                  244 	set0.io	__pb, #3
                                    245 ;	pdk_i2c.c: 23: _delay_us(4);
      000480 08 57                  246 	mov	a, #0x08
      000482 57 17                  247 	mov	__delay_loop_8_PARM_1+0, a
      000484 36 73                  248 	call	__delay_loop_8
                                    249 ;	pdk_i2c.c: 24: SCL1;
      000486 13 3D                  250 	set1.io	__pb, #2
                                    251 ;	pdk_i2c.c: 25: _delay_us(4);
      000488 08 57                  252 	mov	a, #0x08
      00048A 57 17                  253 	mov	__delay_loop_8_PARM_1+0, a
      00048C 36 73                  254 	call	__delay_loop_8
                                    255 ;	pdk_i2c.c: 26: SCL0;
      00048E 13 39                  256 	set0.io	__pb, #2
                                    257 ;	pdk_i2c.c: 27: _delay_us(4);
      000490 08 57                  258 	mov	a, #0x08
      000492 57 17                  259 	mov	__delay_loop_8_PARM_1+0, a
      000494 36 63                  260 	goto	__delay_loop_8
                                    261 ;	pdk_i2c.c: 28: }
      000496 7A 00                  262 	ret
                                    263 ;	pdk_i2c.c: 30: void I2C_NoAck()
                                    264 ;	-----------------------------------------
                                    265 ;	 function I2C_NoAck
                                    266 ;	-----------------------------------------
      000498                        267 _I2C_NoAck:
                                    268 ;	pdk_i2c.c: 32: _delay_us(4);
      000498 08 57                  269 	mov	a, #0x08
      00049A 57 17                  270 	mov	__delay_loop_8_PARM_1+0, a
      00049C 36 73                  271 	call	__delay_loop_8
                                    272 ;	pdk_i2c.c: 33: SDA1;
      00049E 93 3D                  273 	set1.io	__pb, #3
                                    274 ;	pdk_i2c.c: 34: _delay_us(4);
      0004A0 08 57                  275 	mov	a, #0x08
      0004A2 57 17                  276 	mov	__delay_loop_8_PARM_1+0, a
      0004A4 36 73                  277 	call	__delay_loop_8
                                    278 ;	pdk_i2c.c: 35: SCL1;
      0004A6 13 3D                  279 	set1.io	__pb, #2
                                    280 ;	pdk_i2c.c: 36: _delay_us(4);
      0004A8 08 57                  281 	mov	a, #0x08
      0004AA 57 17                  282 	mov	__delay_loop_8_PARM_1+0, a
      0004AC 36 73                  283 	call	__delay_loop_8
                                    284 ;	pdk_i2c.c: 37: SCL0;
      0004AE 13 39                  285 	set0.io	__pb, #2
                                    286 ;	pdk_i2c.c: 38: _delay_us(4);
      0004B0 08 57                  287 	mov	a, #0x08
      0004B2 57 17                  288 	mov	__delay_loop_8_PARM_1+0, a
      0004B4 36 63                  289 	goto	__delay_loop_8
                                    290 ;	pdk_i2c.c: 39: }
      0004B6 7A 00                  291 	ret
                                    292 ;	pdk_i2c.c: 41: void I2C_start()
                                    293 ;	-----------------------------------------
                                    294 ;	 function I2C_start
                                    295 ;	-----------------------------------------
      0004B8                        296 _I2C_start:
                                    297 ;	pdk_i2c.c: 43: SCL1;
      0004B8 13 3D                  298 	set1.io	__pb, #2
                                    299 ;	pdk_i2c.c: 44: SDA1;
      0004BA 93 3D                  300 	set1.io	__pb, #3
                                    301 ;	pdk_i2c.c: 45: _delay_us(4);
      0004BC 08 57                  302 	mov	a, #0x08
      0004BE 57 17                  303 	mov	__delay_loop_8_PARM_1+0, a
      0004C0 36 73                  304 	call	__delay_loop_8
                                    305 ;	pdk_i2c.c: 46: SDA0;
      0004C2 93 39                  306 	set0.io	__pb, #3
                                    307 ;	pdk_i2c.c: 47: _delay_us(4);
      0004C4 08 57                  308 	mov	a, #0x08
      0004C6 57 17                  309 	mov	__delay_loop_8_PARM_1+0, a
      0004C8 36 73                  310 	call	__delay_loop_8
                                    311 ;	pdk_i2c.c: 48: SCL0;
      0004CA 13 39                  312 	set0.io	__pb, #2
                                    313 ;	pdk_i2c.c: 49: _delay_us(4);
      0004CC 08 57                  314 	mov	a, #0x08
      0004CE 57 17                  315 	mov	__delay_loop_8_PARM_1+0, a
      0004D0 36 63                  316 	goto	__delay_loop_8
                                    317 ;	pdk_i2c.c: 50: }
      0004D2 7A 00                  318 	ret
                                    319 ;	pdk_i2c.c: 51: void I2C_stop()
                                    320 ;	-----------------------------------------
                                    321 ;	 function I2C_stop
                                    322 ;	-----------------------------------------
      0004D4                        323 _I2C_stop:
                                    324 ;	pdk_i2c.c: 53: SCL0;
      0004D4 13 39                  325 	set0.io	__pb, #2
                                    326 ;	pdk_i2c.c: 54: SDA0;
      0004D6 93 39                  327 	set0.io	__pb, #3
                                    328 ;	pdk_i2c.c: 55: _delay_us(4);
      0004D8 08 57                  329 	mov	a, #0x08
      0004DA 57 17                  330 	mov	__delay_loop_8_PARM_1+0, a
      0004DC 36 73                  331 	call	__delay_loop_8
                                    332 ;	pdk_i2c.c: 56: SCL1;
      0004DE 13 3D                  333 	set1.io	__pb, #2
                                    334 ;	pdk_i2c.c: 57: _delay_us(4);
      0004E0 08 57                  335 	mov	a, #0x08
      0004E2 57 17                  336 	mov	__delay_loop_8_PARM_1+0, a
      0004E4 36 73                  337 	call	__delay_loop_8
                                    338 ;	pdk_i2c.c: 58: SDA1;
      0004E6 93 3D                  339 	set1.io	__pb, #3
                                    340 ;	pdk_i2c.c: 59: _delay_us(4);
      0004E8 08 57                  341 	mov	a, #0x08
      0004EA 57 17                  342 	mov	__delay_loop_8_PARM_1+0, a
      0004EC 36 63                  343 	goto	__delay_loop_8
                                    344 ;	pdk_i2c.c: 60: }
      0004EE 7A 00                  345 	ret
                                    346 ;	pdk_i2c.c: 61: uint8_t I2C_write_t(uint8_t dat)
                                    347 ;	-----------------------------------------
                                    348 ;	 function I2C_write_t
                                    349 ;	-----------------------------------------
      0004F0                        350 _I2C_write_t:
                                    351 ;	pdk_i2c.c: 63: for (uint8_t i = 0; i < 8; i++)
      0004F0 46 26                  352 	clear	_I2C_write_t_sloc0_1_0+0
      0004F2                        353 00106$:
      0004F2 46 1F                  354 	mov	a, _I2C_write_t_sloc0_1_0+0
      0004F4 08 51                  355 	sub	a, #0x08
      0004F6 80 34                  356 	t1sn.io	f, c
      0004F8 8F 62                  357 	goto	00104$
                                    358 ;	pdk_i2c.c: 66: if (dat & 0x80)
      0004FA 45 1F                  359 	mov	a, _I2C_write_t_PARM_1+0
      0004FC 80 54                  360 	and	a, #0x80
      0004FE 00 53                  361 	cneqsn	a, #0x00
      000500 83 62                  362 	goto	00102$
                                    363 ;	pdk_i2c.c: 67: SDA1;
      000502 93 3D                  364 	set1.io	__pb, #3
      000504 84 62                  365 	goto	00103$
      000506                        366 00102$:
                                    367 ;	pdk_i2c.c: 69: SDA0;
      000506 93 39                  368 	set0.io	__pb, #3
      000508                        369 00103$:
                                    370 ;	pdk_i2c.c: 71: _delay_us(4);
      000508 08 57                  371 	mov	a, #0x08
      00050A 57 17                  372 	mov	__delay_loop_8_PARM_1+0, a
      00050C 36 73                  373 	call	__delay_loop_8
                                    374 ;	pdk_i2c.c: 72: SCL1;
      00050E 13 3D                  375 	set1.io	__pb, #2
                                    376 ;	pdk_i2c.c: 73: _delay_us(4);
      000510 08 57                  377 	mov	a, #0x08
      000512 57 17                  378 	mov	__delay_loop_8_PARM_1+0, a
      000514 36 73                  379 	call	__delay_loop_8
                                    380 ;	pdk_i2c.c: 74: SCL0;
      000516 13 39                  381 	set0.io	__pb, #2
                                    382 ;	pdk_i2c.c: 75: dat <<= 1;
      000518 45 2B                  383 	sl	_I2C_write_t_PARM_1+0
                                    384 ;	pdk_i2c.c: 63: for (uint8_t i = 0; i < 8; i++)
      00051A 46 24                  385 	inc	_I2C_write_t_sloc0_1_0+0
      00051C 79 62                  386 	goto	00106$
      00051E                        387 00104$:
                                    388 ;	pdk_i2c.c: 77: _delay_us(4);
      00051E 08 57                  389 	mov	a, #0x08
      000520 57 17                  390 	mov	__delay_loop_8_PARM_1+0, a
      000522 36 73                  391 	call	__delay_loop_8
                                    392 ;	pdk_i2c.c: 78: SCL1;
      000524 13 3D                  393 	set1.io	__pb, #2
                                    394 ;	pdk_i2c.c: 79: _delay_us(4);
      000526 08 57                  395 	mov	a, #0x08
      000528 57 17                  396 	mov	__delay_loop_8_PARM_1+0, a
      00052A 36 73                  397 	call	__delay_loop_8
                                    398 ;	pdk_i2c.c: 80: SCL0;
      00052C 13 39                  399 	set0.io	__pb, #2
                                    400 ;	pdk_i2c.c: 81: setb(I2C_PxC, I2C_SDA);
      00052E 94 3D                  401 	set1.io	__pbc, #3
                                    402 ;	pdk_i2c.c: 82: return dat;
      000530 45 1F                  403 	mov	a, _I2C_write_t_PARM_1+0
                                    404 ;	pdk_i2c.c: 83: }
      000532 7A 00                  405 	ret
                                    406 ;	pdk_i2c.c: 85: uint8_t I2C_read_t(uint8_t ack)
                                    407 ;	-----------------------------------------
                                    408 ;	 function I2C_read_t
                                    409 ;	-----------------------------------------
      000534                        410 _I2C_read_t:
                                    411 ;	pdk_i2c.c: 87: uint8_t dat = 0x00;
      000534 48 26                  412 	clear	_I2C_read_t_sloc1_1_0+0
                                    413 ;	pdk_i2c.c: 90: clrb(I2C_PxC, I2C_SDA);
      000536 94 39                  414 	set0.io	__pbc, #3
                                    415 ;	pdk_i2c.c: 91: setb(I2C_PxPH, I2C_SDA);
      000538 95 3D                  416 	set1.io	__pbph, #3
                                    417 ;	pdk_i2c.c: 92: setb(I2C_PxDIER, I2C_SDA);
      00053A 8E 3D                  418 	set1.io	__pbdier, #3
                                    419 ;	pdk_i2c.c: 94: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      00053C 49 26                  420 	clear	_I2C_read_t_sloc2_1_0+0
      00053E                        421 00108$:
      00053E 49 1F                  422 	mov	a, _I2C_read_t_sloc2_1_0+0
      000540 08 51                  423 	sub	a, #0x08
      000542 80 34                  424 	t1sn.io	f, c
      000544 B7 62                  425 	goto	00103$
                                    426 ;	pdk_i2c.c: 96: _delay_us(4);
      000546 08 57                  427 	mov	a, #0x08
      000548 57 17                  428 	mov	__delay_loop_8_PARM_1+0, a
      00054A 36 73                  429 	call	__delay_loop_8
                                    430 ;	pdk_i2c.c: 97: SCL1;
      00054C 13 3D                  431 	set1.io	__pb, #2
                                    432 ;	pdk_i2c.c: 98: dat = dat << 1;
      00054E 48 2B                  433 	sl	_I2C_read_t_sloc1_1_0+0
                                    434 ;	pdk_i2c.c: 99: if (inbit(I2C_Px, I2C_SDA))
      000550 93 01                  435 	mov.io	a, __pb
      000552 08 54                  436 	and	a, #0x08
      000554 6A 00                  437 	sr	a
      000556 6A 00                  438 	sr	a
      000558 6A 00                  439 	sr	a
      00055A 00 53                  440 	cneqsn	a, #0x00
      00055C B1 62                  441 	goto	00102$
                                    442 ;	pdk_i2c.c: 100: dat = dat | 0x01; /* Keep biit daata in dat */
      00055E 01 57                  443 	mov	a, #0x01
      000560 48 15                  444 	or	_I2C_read_t_sloc1_1_0+0, a
      000562                        445 00102$:
                                    446 ;	pdk_i2c.c: 102: _delay_us(4);
      000562 08 57                  447 	mov	a, #0x08
      000564 57 17                  448 	mov	__delay_loop_8_PARM_1+0, a
      000566 36 73                  449 	call	__delay_loop_8
                                    450 ;	pdk_i2c.c: 103: SCL0; /* Clear SCL */
      000568 13 39                  451 	set0.io	__pb, #2
                                    452 ;	pdk_i2c.c: 94: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      00056A 49 24                  453 	inc	_I2C_read_t_sloc2_1_0+0
      00056C 9F 62                  454 	goto	00108$
      00056E                        455 00103$:
                                    456 ;	pdk_i2c.c: 105: setb(I2C_PxC, I2C_SDA);
      00056E 94 3D                  457 	set1.io	__pbc, #3
                                    458 ;	pdk_i2c.c: 106: if (ack == 0)
      000570 47 1F                  459 	mov	a, _I2C_read_t_PARM_1+0
      000572 00 52                  460 	ceqsn	a, #0x00
      000574 BD 62                  461 	goto	00105$
                                    462 ;	pdk_i2c.c: 107: I2C_NoAck();
      000576 4C 72                  463 	call	_I2C_NoAck
      000578 BE 62                  464 	goto	00106$
      00057A                        465 00105$:
                                    466 ;	pdk_i2c.c: 109: I2C_Ack();
      00057A 3C 72                  467 	call	_I2C_Ack
      00057C                        468 00106$:
                                    469 ;	pdk_i2c.c: 111: return dat;
      00057C 48 1F                  470 	mov	a, _I2C_read_t_sloc1_1_0+0
                                    471 ;	pdk_i2c.c: 112: }
      00057E 7A 00                  472 	ret
                                    473 ;	pdk_i2c.c: 114: void I2C_beginTransmission(uint8_t addr)
                                    474 ;	-----------------------------------------
                                    475 ;	 function I2C_beginTransmission
                                    476 ;	-----------------------------------------
      000580                        477 _I2C_beginTransmission:
                                    478 ;	pdk_i2c.c: 116: txBufferIndex = 0;
      000580 33 26                  479 	clear	_txBufferIndex+0
                                    480 ;	pdk_i2c.c: 117: txBufferLength = 0;
      000582 34 26                  481 	clear	_txBufferLength+0
                                    482 ;	pdk_i2c.c: 120: I2C_start();
      000584 5C 72                  483 	call	_I2C_start
                                    484 ;	pdk_i2c.c: 123: I2C_write_t((addr << 1) | I2C_WRITE);
      000586 4A 1F                  485 	mov	a, _I2C_beginTransmission_PARM_1+0
      000588 6B 00                  486 	sl	a
      00058A 45 17                  487 	mov	_I2C_write_t_PARM_1+0, a
      00058C 78 62                  488 	goto	_I2C_write_t
                                    489 ;	pdk_i2c.c: 124: }
      00058E 7A 00                  490 	ret
                                    491 ;	pdk_i2c.c: 126: void I2C_write(uint8_t data)
                                    492 ;	-----------------------------------------
                                    493 ;	 function I2C_write
                                    494 ;	-----------------------------------------
      000590                        495 _I2C_write:
                                    496 ;	pdk_i2c.c: 128: txBuffer[txBufferIndex++] = data;
      000590 33 1F                  497 	mov	a, _txBufferIndex+0
      000592 33 24                  498 	inc	_txBufferIndex+0
      000594 35 50                  499 	add	a, #(_txBuffer + 0)
      000596 00 17                  500 	mov	p, a
      000598 4B 1F                  501 	mov	a, _I2C_write_PARM_1+0
      00059A 00 07                  502 	idxm	p, a
                                    503 ;	pdk_i2c.c: 129: txBufferLength = txBufferIndex;
      00059C 33 1F                  504 	mov	a, _txBufferIndex+0
      00059E 34 17                  505 	mov	_txBufferLength+0, a
                                    506 ;	pdk_i2c.c: 130: }
      0005A0 7A 00                  507 	ret
                                    508 ;	pdk_i2c.c: 132: void I2C_writeBuffer(uint8_t *data, uint8_t len)
                                    509 ;	-----------------------------------------
                                    510 ;	 function I2C_writeBuffer
                                    511 ;	-----------------------------------------
      0005A2                        512 _I2C_writeBuffer:
                                    513 ;	pdk_i2c.c: 134: uint8_t i = 0;
      0005A2 4F 26                  514 	clear	_I2C_writeBuffer_sloc3_1_0+0
      0005A4                        515 00103$:
                                    516 ;	pdk_i2c.c: 135: for (; i < len; ++i)
      0005A4 4F 1F                  517 	mov	a, _I2C_writeBuffer_sloc3_1_0+0
      0005A6 4E 19                  518 	sub	a, _I2C_writeBuffer_PARM_2+0
      0005A8 80 34                  519 	t1sn.io	f, c
      0005AA E0 62                  520 	goto	00105$
                                    521 ;	pdk_i2c.c: 137: I2C_write(data[i]);
      0005AC 4C 1F                  522 	mov	a, _I2C_writeBuffer_PARM_1+0
      0005AE 4F 18                  523 	add	a, _I2C_writeBuffer_sloc3_1_0+0
      0005B0 00 17                  524 	mov	p, a
      0005B2 4D 1F                  525 	mov	a, _I2C_writeBuffer_PARM_1+1
      0005B4 60 00                  526 	addc	a
      0005B6 4D 73                  527 	call	__gptrget
      0005B8 4B 17                  528 	mov	_I2C_write_PARM_1+0, a
      0005BA C8 72                  529 	call	_I2C_write
                                    530 ;	pdk_i2c.c: 135: for (; i < len; ++i)
      0005BC 4F 24                  531 	inc	_I2C_writeBuffer_sloc3_1_0+0
      0005BE D2 62                  532 	goto	00103$
      0005C0                        533 00105$:
                                    534 ;	pdk_i2c.c: 139: }
      0005C0 7A 00                  535 	ret
                                    536 ;	pdk_i2c.c: 141: void I2C_endTransmission(void)
                                    537 ;	-----------------------------------------
                                    538 ;	 function I2C_endTransmission
                                    539 ;	-----------------------------------------
      0005C2                        540 _I2C_endTransmission:
                                    541 ;	pdk_i2c.c: 145: for (i = 0; i < txBufferLength; ++i)
      0005C2 50 26                  542 	clear	_I2C_endTransmission_sloc4_1_0+0
      0005C4                        543 00103$:
      0005C4 50 1F                  544 	mov	a, _I2C_endTransmission_sloc4_1_0+0
      0005C6 34 19                  545 	sub	a, _txBufferLength+0
      0005C8 80 34                  546 	t1sn.io	f, c
      0005CA EE 62                  547 	goto	00101$
                                    548 ;	pdk_i2c.c: 148: I2C_write_t(txBuffer[i]);
      0005CC 35 57                  549 	mov	a, #(_txBuffer + 0)
      0005CE 50 18                  550 	add	a, _I2C_endTransmission_sloc4_1_0+0
      0005D0 00 17                  551 	mov	p, a
      0005D2 01 07                  552 	idxm	a, p
      0005D4 45 17                  553 	mov	_I2C_write_t_PARM_1+0, a
      0005D6 78 72                  554 	call	_I2C_write_t
                                    555 ;	pdk_i2c.c: 145: for (i = 0; i < txBufferLength; ++i)
      0005D8 50 24                  556 	inc	_I2C_endTransmission_sloc4_1_0+0
      0005DA E2 62                  557 	goto	00103$
      0005DC                        558 00101$:
                                    559 ;	pdk_i2c.c: 152: I2C_stop();
      0005DC 6A 62                  560 	goto	_I2C_stop
                                    561 ;	pdk_i2c.c: 153: }
      0005DE 7A 00                  562 	ret
                                    563 ;	pdk_i2c.c: 155: void I2C_requestFrom(uint8_t addr, uint8_t len)
                                    564 ;	-----------------------------------------
                                    565 ;	 function I2C_requestFrom
                                    566 ;	-----------------------------------------
      0005E0                        567 _I2C_requestFrom:
                                    568 ;	pdk_i2c.c: 158: rxBufferLength = len;
      0005E0 52 1F                  569 	mov	a, _I2C_requestFrom_PARM_2+0
      0005E2 22 17                  570 	mov	_rxBufferLength+0, a
                                    571 ;	pdk_i2c.c: 159: rxBufferIndex = 0;
      0005E4 21 26                  572 	clear	_rxBufferIndex+0
                                    573 ;	pdk_i2c.c: 162: I2C_start();
      0005E6 5C 72                  574 	call	_I2C_start
                                    575 ;	pdk_i2c.c: 165: I2C_write_t((addr << 1) | I2C_READ);
      0005E8 51 1F                  576 	mov	a, _I2C_requestFrom_PARM_1+0
      0005EA 6B 00                  577 	sl	a
      0005EC 01 55                  578 	or	a, #0x01
      0005EE 45 17                  579 	mov	_I2C_write_t_PARM_1+0, a
      0005F0 78 72                  580 	call	_I2C_write_t
                                    581 ;	pdk_i2c.c: 168: for (i = 0; i < rxBufferLength - 1; i++)
      0005F2 53 26                  582 	clear	_I2C_requestFrom_sloc5_1_0+0
      0005F4                        583 00103$:
      0005F4 22 1F                  584 	mov	a, _rxBufferLength+0
      0005F6 01 51                  585 	sub	a, #0x01
      0005F8 54 17                  586 	mov	_I2C_requestFrom_sloc6_1_0+0, a
      0005FA 00 57                  587 	mov	a, #0x00
      0005FC 61 00                  588 	subc	a
      0005FE 55 17                  589 	mov	_I2C_requestFrom_sloc6_1_0+1, a
      000600 00 26                  590 	clear	p
      000602 53 1F                  591 	mov	a, _I2C_requestFrom_sloc5_1_0+0
      000604 54 19                  592 	sub	a, _I2C_requestFrom_sloc6_1_0+0
      000606 00 1F                  593 	mov	a, p
      000608 55 1B                  594 	subc	a, _I2C_requestFrom_sloc6_1_0+1
      00060A 80 31                  595 	t0sn.io	f, ov
      00060C 80 56                  596 	xor	a, #0x80
      00060E 6B 00                  597 	sl	a
      000610 80 34                  598 	t1sn.io	f, c
      000612 16 63                  599 	goto	00101$
                                    600 ;	pdk_i2c.c: 170: rxBuffer[i] = I2C_read_t(ACK);
      000614 23 57                  601 	mov	a, #(_rxBuffer + 0)
      000616 53 18                  602 	add	a, _I2C_requestFrom_sloc5_1_0+0
      000618 56 17                  603 	mov	_I2C_requestFrom_sloc7_1_0+0, a
      00061A 01 57                  604 	mov	a, #0x01
      00061C 47 17                  605 	mov	_I2C_read_t_PARM_1+0, a
      00061E 9A 72                  606 	call	_I2C_read_t
      000620 00 17                  607 	mov	p, a
      000622 56 1F                  608 	mov	a, _I2C_requestFrom_sloc7_1_0+0
      000624 00 27                  609 	xch	a, p
      000626 00 07                  610 	idxm	p, a
                                    611 ;	pdk_i2c.c: 168: for (i = 0; i < rxBufferLength - 1; i++)
      000628 53 24                  612 	inc	_I2C_requestFrom_sloc5_1_0+0
      00062A FA 62                  613 	goto	00103$
      00062C                        614 00101$:
                                    615 ;	pdk_i2c.c: 173: rxBuffer[rxBufferLength - 1] = I2C_read_t(NACK);
      00062C 22 1F                  616 	mov	a, _rxBufferLength+0
      00062E 01 51                  617 	sub	a, #0x01
      000630 23 50                  618 	add	a, #(_rxBuffer + 0)
      000632 47 26                  619 	clear	_I2C_read_t_PARM_1+0
      000634 72 00                  620 	push	af
      000636 9A 72                  621 	call	_I2C_read_t
      000638 00 17                  622 	mov	p, a
      00063A 73 00                  623 	pop	af
      00063C 00 27                  624 	xch	a, p
      00063E 00 07                  625 	idxm	p, a
                                    626 ;	pdk_i2c.c: 176: I2C_stop();
      000640 6A 62                  627 	goto	_I2C_stop
                                    628 ;	pdk_i2c.c: 177: }
      000642 7A 00                  629 	ret
                                    630 ;	pdk_i2c.c: 179: int8_t I2C_read(void)
                                    631 ;	-----------------------------------------
                                    632 ;	 function I2C_read
                                    633 ;	-----------------------------------------
      000644                        634 _I2C_read:
                                    635 ;	pdk_i2c.c: 181: int8_t value = 5;
      000644 05 57                  636 	mov	a, #0x05
      000646 00 17                  637 	mov	p, a
                                    638 ;	pdk_i2c.c: 183: if (rxBufferIndex < rxBufferLength)
      000648 21 1F                  639 	mov	a, _rxBufferIndex+0
      00064A 22 19                  640 	sub	a, _rxBufferLength+0
      00064C 80 34                  641 	t1sn.io	f, c
      00064E 2E 63                  642 	goto	00102$
                                    643 ;	pdk_i2c.c: 185: value = rxBuffer[rxBufferIndex];
      000650 23 57                  644 	mov	a, #(_rxBuffer + 0)
      000652 21 18                  645 	add	a, _rxBufferIndex+0
      000654 00 17                  646 	mov	p, a
      000656 01 07                  647 	idxm	a, p
      000658 00 17                  648 	mov	p, a
                                    649 ;	pdk_i2c.c: 186: ++rxBufferIndex;
      00065A 21 24                  650 	inc	_rxBufferIndex+0
      00065C                        651 00102$:
                                    652 ;	pdk_i2c.c: 188: return value;
      00065C 00 1F                  653 	mov	a, p
                                    654 ;	pdk_i2c.c: 189: }
      00065E 7A 00                  655 	ret
                                    656 ;	pdk_i2c.c: 190: char I2C_available(void)
                                    657 ;	-----------------------------------------
                                    658 ;	 function I2C_available
                                    659 ;	-----------------------------------------
      000660                        660 _I2C_available:
                                    661 ;	pdk_i2c.c: 192: return rxBufferLength - rxBufferIndex;
      000660 22 1F                  662 	mov	a, _rxBufferLength+0
      000662 21 19                  663 	sub	a, _rxBufferIndex+0
                                    664 ;	pdk_i2c.c: 193: }
      000664 7A 00                  665 	ret
                                    666 ;	pdk_i2c.c: 194: void I2C_begin(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function I2C_begin
                                    669 ;	-----------------------------------------
      000666                        670 _I2C_begin:
                                    671 ;	pdk_i2c.c: 196: I2C_PxC |= (1 << I2C_SDA);
      000666 94 3D                  672 	set1.io	__pbc, #3
                                    673 ;	pdk_i2c.c: 197: I2C_PxC |= (1 << I2C_SCL);
      000668 14 3D                  674 	set1.io	__pbc, #2
                                    675 ;	pdk_i2c.c: 198: }
      00066A 7A 00                  676 	ret
                                    677 	.area CODE
                                    678 	.area CONST
                                    679 	.area CABS (ABS)
