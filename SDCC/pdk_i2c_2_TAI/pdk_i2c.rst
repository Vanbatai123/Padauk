                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
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
                                     77 	.globl _I2C_write2_PARM_1
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
                                     94 	.globl _I2C_write2
                                     95 	.globl _I2C_writeBuffer
                                     96 	.globl _I2C_endTransmission
                                     97 	.globl _I2C_requestFrom
                                     98 	.globl _I2C_read
                                     99 ;--------------------------------------------------------
                                    100 ; special function registers
                                    101 ;--------------------------------------------------------
                                    102 	.area RSEG (ABS)
      000004                        103 	.org 0x0000
                           000000   104 __flag	=	0x0000
                           000002   105 __sp	=	0x0002
                           000003   106 __clkmd	=	0x0003
                           000004   107 __inten	=	0x0004
                           000005   108 __intrq	=	0x0005
                           000006   109 __t16m	=	0x0006
                           00000A   110 __eoscr	=	0x000a
                           00000B   111 __ihrcr	=	0x000b
                           00000C   112 __integs	=	0x000c
                           00000D   113 __padier	=	0x000d
                           00000E   114 __pbdier	=	0x000e
                           00000F   115 __pcdier	=	0x000f
                           000010   116 __pa	=	0x0010
                           000011   117 __pac	=	0x0011
                           000012   118 __paph	=	0x0012
                           000013   119 __pb	=	0x0013
                           000014   120 __pbc	=	0x0014
                           000015   121 __pbph	=	0x0015
                           000016   122 __pc	=	0x0016
                           000017   123 __pcc	=	0x0017
                           000018   124 __pcph	=	0x0018
                           000019   125 __pbpl	=	0x0019
                           00001A   126 __pcpl	=	0x001a
                           000020   127 __adcc	=	0x0020
                           000021   128 __adcm	=	0x0021
                           000022   129 __adcr	=	0x0022
                           000024   130 __adcrgc	=	0x0024
                           000026   131 __misc	=	0x0026
                           000027   132 __misc2	=	0x0027
                           000028   133 __misclvr	=	0x0028
                           00002B   134 __gpcc	=	0x002b
                           00002C   135 __gpcs	=	0x002c
                           000030   136 __tm2c	=	0x0030
                           000031   137 __tm2ct	=	0x0031
                           000032   138 __tm2s	=	0x0032
                           000033   139 __tm2b	=	0x0033
                           000034   140 __tm3c	=	0x0034
                           000035   141 __tm3ct	=	0x0035
                           000036   142 __tm3s	=	0x0036
                           000037   143 __tm3b	=	0x0037
                           000040   144 __pwmg0c	=	0x0040
                           000041   145 __pwmgclk	=	0x0041
                           000042   146 __pwmg0dth	=	0x0042
                           000043   147 __pwmg0dtl	=	0x0043
                           000044   148 __pwmgcubh	=	0x0044
                           000045   149 __pwmgcubl	=	0x0045
                           000046   150 __pwmg1c	=	0x0046
                           000048   151 __pwmg1dth	=	0x0048
                           000049   152 __pwmg1dtl	=	0x0049
                           00004C   153 __pwmg2c	=	0x004c
                           00004E   154 __pwmg2dth	=	0x004e
                           00004F   155 __pwmg2dtl	=	0x004f
                           000062   156 __ilrcr	=	0x0062
                           000063   157 __bgtr	=	0x0063
                           000067   158 __rop	=	0x0067
      000004                        159 __t16c::
      000004                        160 	.ds 2
                                    161 ;--------------------------------------------------------
                                    162 ; ram data
                                    163 ;--------------------------------------------------------
                                    164 	.area DATA
      000054                        165 _rxBufferIndex::
      000054                        166 	.ds 1
      000055                        167 _rxBufferLength::
      000055                        168 	.ds 1
      000056                        169 _rxBuffer::
      000056                        170 	.ds 16
      000066                        171 _txBufferIndex::
      000066                        172 	.ds 1
      000067                        173 _txBufferLength::
      000067                        174 	.ds 1
      000068                        175 _txBuffer::
      000068                        176 	.ds 16
      000078                        177 _I2C_write_t_PARM_1:
      000078                        178 	.ds 1
      000079                        179 _I2C_write_t_sloc0_1_0:
      000079                        180 	.ds 1
      00007A                        181 _I2C_read_t_PARM_1:
      00007A                        182 	.ds 1
      00007B                        183 _I2C_read_t_sloc1_1_0:
      00007B                        184 	.ds 1
      00007C                        185 _I2C_read_t_sloc2_1_0:
      00007C                        186 	.ds 1
      00007D                        187 _I2C_beginTransmission_PARM_1:
      00007D                        188 	.ds 1
      00007E                        189 _I2C_write2_PARM_1:
      00007E                        190 	.ds 1
      00007F                        191 _I2C_writeBuffer_PARM_1:
      00007F                        192 	.ds 2
      000081                        193 _I2C_writeBuffer_PARM_2:
      000081                        194 	.ds 1
      000082                        195 _I2C_writeBuffer_sloc3_1_0:
      000082                        196 	.ds 1
      000083                        197 _I2C_endTransmission_sloc4_1_0:
      000083                        198 	.ds 1
      000084                        199 _I2C_requestFrom_PARM_1:
      000084                        200 	.ds 1
      000085                        201 _I2C_requestFrom_PARM_2:
      000085                        202 	.ds 1
      000086                        203 _I2C_requestFrom_sloc5_1_0:
      000086                        204 	.ds 1
      000087                        205 _I2C_requestFrom_sloc6_1_0:
      000087                        206 	.ds 2
      000089                        207 _I2C_requestFrom_sloc7_1_0:
      000089                        208 	.ds 1
                                    209 ;--------------------------------------------------------
                                    210 ; overlayable items in ram 
                                    211 ;--------------------------------------------------------
                                    212 ;--------------------------------------------------------
                                    213 ; absolute external ram data
                                    214 ;--------------------------------------------------------
                                    215 	.area DABS (ABS)
                                    216 ;--------------------------------------------------------
                                    217 ; global & static initialisations
                                    218 ;--------------------------------------------------------
                                    219 	.area HOME
                                    220 	.area GSINIT
                                    221 	.area GSFINAL
                                    222 	.area GSINIT
                                    223 ;--------------------------------------------------------
                                    224 ; Home
                                    225 ;--------------------------------------------------------
                                    226 	.area HOME
                                    227 	.area HOME
                                    228 ;--------------------------------------------------------
                                    229 ; code
                                    230 ;--------------------------------------------------------
                                    231 	.area CODE
                                    232 ;	pdk_i2c.c: 19: void I2C_Ack()
                                    233 ;	-----------------------------------------
                                    234 ;	 function I2C_Ack
                                    235 ;	-----------------------------------------
      000540                        236 _I2C_Ack:
                                    237 ;	pdk_i2c.c: 21: _delay_us(4);
      000540 08 57                  238 	mov	a, #0x08
      000542 8A 17                  239 	mov	__delay_loop_8_PARM_1+0, a
      000544 98 73                  240 	call	__delay_loop_8
                                    241 ;	pdk_i2c.c: 22: SDA0;
      000546 13 3B                  242 	set0	__pb, #6
                                    243 ;	pdk_i2c.c: 23: _delay_us(4);
      000548 08 57                  244 	mov	a, #0x08
      00054A 8A 17                  245 	mov	__delay_loop_8_PARM_1+0, a
      00054C 98 73                  246 	call	__delay_loop_8
                                    247 ;	pdk_i2c.c: 24: SCL1;
      00054E 93 3F                  248 	set1	__pb, #7
                                    249 ;	pdk_i2c.c: 25: _delay_us(4);
      000550 08 57                  250 	mov	a, #0x08
      000552 8A 17                  251 	mov	__delay_loop_8_PARM_1+0, a
      000554 98 73                  252 	call	__delay_loop_8
                                    253 ;	pdk_i2c.c: 26: SCL0;
      000556 93 3B                  254 	set0	__pb, #7
                                    255 ;	pdk_i2c.c: 27: _delay_us(4);
      000558 08 57                  256 	mov	a, #0x08
      00055A 8A 17                  257 	mov	__delay_loop_8_PARM_1+0, a
      00055C 98 63                  258 	goto	__delay_loop_8
                                    259 ;	pdk_i2c.c: 28: }
      00055E 7A 00                  260 	ret
                                    261 ;	pdk_i2c.c: 30: void I2C_NoAck()
                                    262 ;	-----------------------------------------
                                    263 ;	 function I2C_NoAck
                                    264 ;	-----------------------------------------
      000560                        265 _I2C_NoAck:
                                    266 ;	pdk_i2c.c: 32: _delay_us(4);
      000560 08 57                  267 	mov	a, #0x08
      000562 8A 17                  268 	mov	__delay_loop_8_PARM_1+0, a
      000564 98 73                  269 	call	__delay_loop_8
                                    270 ;	pdk_i2c.c: 33: SDA1;
      000566 13 3F                  271 	set1	__pb, #6
                                    272 ;	pdk_i2c.c: 34: _delay_us(4);
      000568 08 57                  273 	mov	a, #0x08
      00056A 8A 17                  274 	mov	__delay_loop_8_PARM_1+0, a
      00056C 98 73                  275 	call	__delay_loop_8
                                    276 ;	pdk_i2c.c: 35: SCL1;
      00056E 93 3F                  277 	set1	__pb, #7
                                    278 ;	pdk_i2c.c: 36: _delay_us(4);
      000570 08 57                  279 	mov	a, #0x08
      000572 8A 17                  280 	mov	__delay_loop_8_PARM_1+0, a
      000574 98 73                  281 	call	__delay_loop_8
                                    282 ;	pdk_i2c.c: 37: SCL0;
      000576 93 3B                  283 	set0	__pb, #7
                                    284 ;	pdk_i2c.c: 38: _delay_us(4);
      000578 08 57                  285 	mov	a, #0x08
      00057A 8A 17                  286 	mov	__delay_loop_8_PARM_1+0, a
      00057C 98 63                  287 	goto	__delay_loop_8
                                    288 ;	pdk_i2c.c: 39: }
      00057E 7A 00                  289 	ret
                                    290 ;	pdk_i2c.c: 41: void I2C_start()
                                    291 ;	-----------------------------------------
                                    292 ;	 function I2C_start
                                    293 ;	-----------------------------------------
      000580                        294 _I2C_start:
                                    295 ;	pdk_i2c.c: 43: SCL1;
      000580 93 3F                  296 	set1	__pb, #7
                                    297 ;	pdk_i2c.c: 44: SDA1;
      000582 13 3F                  298 	set1	__pb, #6
                                    299 ;	pdk_i2c.c: 45: _delay_us(4);
      000584 08 57                  300 	mov	a, #0x08
      000586 8A 17                  301 	mov	__delay_loop_8_PARM_1+0, a
      000588 98 73                  302 	call	__delay_loop_8
                                    303 ;	pdk_i2c.c: 46: SDA0;
      00058A 13 3B                  304 	set0	__pb, #6
                                    305 ;	pdk_i2c.c: 47: _delay_us(4);
      00058C 08 57                  306 	mov	a, #0x08
      00058E 8A 17                  307 	mov	__delay_loop_8_PARM_1+0, a
      000590 98 73                  308 	call	__delay_loop_8
                                    309 ;	pdk_i2c.c: 48: SCL0;
      000592 93 3B                  310 	set0	__pb, #7
                                    311 ;	pdk_i2c.c: 49: _delay_us(4);
      000594 08 57                  312 	mov	a, #0x08
      000596 8A 17                  313 	mov	__delay_loop_8_PARM_1+0, a
      000598 98 63                  314 	goto	__delay_loop_8
                                    315 ;	pdk_i2c.c: 50: }
      00059A 7A 00                  316 	ret
                                    317 ;	pdk_i2c.c: 51: void I2C_stop()
                                    318 ;	-----------------------------------------
                                    319 ;	 function I2C_stop
                                    320 ;	-----------------------------------------
      00059C                        321 _I2C_stop:
                                    322 ;	pdk_i2c.c: 53: SCL0;
      00059C 93 3B                  323 	set0	__pb, #7
                                    324 ;	pdk_i2c.c: 54: SDA0;
      00059E 13 3B                  325 	set0	__pb, #6
                                    326 ;	pdk_i2c.c: 55: _delay_us(4);
      0005A0 08 57                  327 	mov	a, #0x08
      0005A2 8A 17                  328 	mov	__delay_loop_8_PARM_1+0, a
      0005A4 98 73                  329 	call	__delay_loop_8
                                    330 ;	pdk_i2c.c: 56: SCL1;
      0005A6 93 3F                  331 	set1	__pb, #7
                                    332 ;	pdk_i2c.c: 57: _delay_us(4);
      0005A8 08 57                  333 	mov	a, #0x08
      0005AA 8A 17                  334 	mov	__delay_loop_8_PARM_1+0, a
      0005AC 98 73                  335 	call	__delay_loop_8
                                    336 ;	pdk_i2c.c: 58: SDA1;
      0005AE 13 3F                  337 	set1	__pb, #6
                                    338 ;	pdk_i2c.c: 59: _delay_us(4);
      0005B0 08 57                  339 	mov	a, #0x08
      0005B2 8A 17                  340 	mov	__delay_loop_8_PARM_1+0, a
      0005B4 98 63                  341 	goto	__delay_loop_8
                                    342 ;	pdk_i2c.c: 60: }
      0005B6 7A 00                  343 	ret
                                    344 ;	pdk_i2c.c: 61: uint8_t I2C_write_t(uint8_t dat)
                                    345 ;	-----------------------------------------
                                    346 ;	 function I2C_write_t
                                    347 ;	-----------------------------------------
      0005B8                        348 _I2C_write_t:
                                    349 ;	pdk_i2c.c: 66: for (i = 0; i < 8; i++)
      0005B8 79 26                  350 	clear	_I2C_write_t_sloc0_1_0+0
      0005BA                        351 00105$:
                                    352 ;	pdk_i2c.c: 69: if (dat & 0x80)
      0005BA 78 1F                  353 	mov	a, _I2C_write_t_PARM_1+0
      0005BC 00 17                  354 	mov	p, a
      0005BE 80 47                  355 	t1sn	p, #7
      0005C0 E3 62                  356 	goto	00102$
                                    357 ;	pdk_i2c.c: 70: SDA1;
      0005C2 13 3F                  358 	set1	__pb, #6
      0005C4 E4 62                  359 	goto	00103$
      0005C6                        360 00102$:
                                    361 ;	pdk_i2c.c: 72: SDA0;
      0005C6 13 3B                  362 	set0	__pb, #6
      0005C8                        363 00103$:
                                    364 ;	pdk_i2c.c: 74: _delay_us(4);
      0005C8 08 57                  365 	mov	a, #0x08
      0005CA 8A 17                  366 	mov	__delay_loop_8_PARM_1+0, a
      0005CC 98 73                  367 	call	__delay_loop_8
                                    368 ;	pdk_i2c.c: 75: SCL1;
      0005CE 93 3F                  369 	set1	__pb, #7
                                    370 ;	pdk_i2c.c: 76: _delay_us(4);
      0005D0 08 57                  371 	mov	a, #0x08
      0005D2 8A 17                  372 	mov	__delay_loop_8_PARM_1+0, a
      0005D4 98 73                  373 	call	__delay_loop_8
                                    374 ;	pdk_i2c.c: 77: SCL0;
      0005D6 93 3B                  375 	set0	__pb, #7
                                    376 ;	pdk_i2c.c: 78: dat <<= 1;
      0005D8 78 2B                  377 	sl	_I2C_write_t_PARM_1+0
                                    378 ;	pdk_i2c.c: 66: for (i = 0; i < 8; i++)
      0005DA 79 24                  379 	inc	_I2C_write_t_sloc0_1_0+0
      0005DC 79 1F                  380 	mov	a, _I2C_write_t_sloc0_1_0+0
      0005DE 08 51                  381 	sub	a, #0x08
      0005E0 80 30                  382 	t0sn	f, c
      0005E2 DD 62                  383 	goto	00105$
                                    384 ;	pdk_i2c.c: 80: SDA0;
      0005E4 13 3B                  385 	set0	__pb, #6
                                    386 ;	pdk_i2c.c: 81: setb(PBPH, SDA);
      0005E6 15 3F                  387 	set1	__pbph, #6
                                    388 ;	pdk_i2c.c: 82: setb(PBDIER, SDA);
      0005E8 0E 3F                  389 	set1	__pbdier, #6
                                    390 ;	pdk_i2c.c: 83: clrb(PBC, SDA);
      0005EA 14 3B                  391 	set0	__pbc, #6
                                    392 ;	pdk_i2c.c: 84: _delay_us(4);
      0005EC 08 57                  393 	mov	a, #0x08
      0005EE 8A 17                  394 	mov	__delay_loop_8_PARM_1+0, a
      0005F0 98 73                  395 	call	__delay_loop_8
                                    396 ;	pdk_i2c.c: 85: SCL1;
      0005F2 93 3F                  397 	set1	__pb, #7
                                    398 ;	pdk_i2c.c: 86: _delay_us(4);
      0005F4 08 57                  399 	mov	a, #0x08
      0005F6 8A 17                  400 	mov	__delay_loop_8_PARM_1+0, a
      0005F8 98 73                  401 	call	__delay_loop_8
                                    402 ;	pdk_i2c.c: 87: SCL0;
      0005FA 93 3B                  403 	set0	__pb, #7
                                    404 ;	pdk_i2c.c: 88: setb(PBC, SDA);
      0005FC 14 3F                  405 	set1	__pbc, #6
                                    406 ;	pdk_i2c.c: 89: return dat;
      0005FE 78 1F                  407 	mov	a, _I2C_write_t_PARM_1+0
                                    408 ;	pdk_i2c.c: 90: }
      000600 7A 00                  409 	ret
                                    410 ;	pdk_i2c.c: 92: uint8_t I2C_read_t(uint8_t ack)
                                    411 ;	-----------------------------------------
                                    412 ;	 function I2C_read_t
                                    413 ;	-----------------------------------------
      000602                        414 _I2C_read_t:
                                    415 ;	pdk_i2c.c: 94: uint8_t dat = 0x00;
      000602 7B 26                  416 	clear	_I2C_read_t_sloc1_1_0+0
                                    417 ;	pdk_i2c.c: 97: clrb(PBC, SDA);
      000604 14 3B                  418 	set0	__pbc, #6
                                    419 ;	pdk_i2c.c: 98: setb(PBPH, SDA);
      000606 15 3F                  420 	set1	__pbph, #6
                                    421 ;	pdk_i2c.c: 99: setb(PBDIER, SDA);
      000608 0E 3F                  422 	set1	__pbdier, #6
                                    423 ;	pdk_i2c.c: 101: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      00060A 7C 26                  424 	clear	_I2C_read_t_sloc2_1_0+0
      00060C                        425 00108$:
      00060C 7C 1F                  426 	mov	a, _I2C_read_t_sloc2_1_0+0
      00060E 08 51                  427 	sub	a, #0x08
      000610 80 34                  428 	t1sn	f, c
      000612 1F 63                  429 	goto	00103$
                                    430 ;	pdk_i2c.c: 103: _delay_us(4);
      000614 08 57                  431 	mov	a, #0x08
      000616 8A 17                  432 	mov	__delay_loop_8_PARM_1+0, a
      000618 98 73                  433 	call	__delay_loop_8
                                    434 ;	pdk_i2c.c: 104: SCL1;
      00061A 93 3F                  435 	set1	__pb, #7
                                    436 ;	pdk_i2c.c: 105: dat = dat << 1;
      00061C 7B 2B                  437 	sl	_I2C_read_t_sloc1_1_0+0
                                    438 ;	pdk_i2c.c: 106: if (inbit(PB, SDA))
      00061E 93 01                  439 	mov	a, __pb
      000620 40 54                  440 	and	a, #0x40
      000622 6E 00                  441 	swap	a
      000624 0F 54                  442 	and	a, #0x0f
      000626 6A 00                  443 	sr	a
      000628 6A 00                  444 	sr	a
      00062A 00 53                  445 	cneqsn	a, #0x00
      00062C 19 63                  446 	goto	00102$
                                    447 ;	pdk_i2c.c: 107: dat = dat | 0x01; /* Keep biit daata in dat */
      00062E 01 57                  448 	mov	a, #0x01
      000630 7B 15                  449 	or	_I2C_read_t_sloc1_1_0+0, a
      000632                        450 00102$:
                                    451 ;	pdk_i2c.c: 109: _delay_us(4);
      000632 08 57                  452 	mov	a, #0x08
      000634 8A 17                  453 	mov	__delay_loop_8_PARM_1+0, a
      000636 98 73                  454 	call	__delay_loop_8
                                    455 ;	pdk_i2c.c: 110: SCL0; /* Clear SCL */
      000638 93 3B                  456 	set0	__pb, #7
                                    457 ;	pdk_i2c.c: 101: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      00063A 7C 24                  458 	inc	_I2C_read_t_sloc2_1_0+0
      00063C 06 63                  459 	goto	00108$
      00063E                        460 00103$:
                                    461 ;	pdk_i2c.c: 112: setb(PBC, SDA);
      00063E 14 3F                  462 	set1	__pbc, #6
                                    463 ;	pdk_i2c.c: 113: if (ack == 0)
      000640 7A 1F                  464 	mov	a, _I2C_read_t_PARM_1+0
      000642 00 52                  465 	ceqsn	a, #0x00
      000644 25 63                  466 	goto	00105$
                                    467 ;	pdk_i2c.c: 114: I2C_NoAck();
      000646 B0 72                  468 	call	_I2C_NoAck
      000648 26 63                  469 	goto	00106$
      00064A                        470 00105$:
                                    471 ;	pdk_i2c.c: 116: I2C_Ack();
      00064A A0 72                  472 	call	_I2C_Ack
      00064C                        473 00106$:
                                    474 ;	pdk_i2c.c: 118: return dat;
      00064C 7B 1F                  475 	mov	a, _I2C_read_t_sloc1_1_0+0
                                    476 ;	pdk_i2c.c: 119: }
      00064E 7A 00                  477 	ret
                                    478 ;	pdk_i2c.c: 121: void I2C_beginTransmission(uint8_t addr)
                                    479 ;	-----------------------------------------
                                    480 ;	 function I2C_beginTransmission
                                    481 ;	-----------------------------------------
      000650                        482 _I2C_beginTransmission:
                                    483 ;	pdk_i2c.c: 123: txBufferIndex = 0;
      000650 66 26                  484 	clear	_txBufferIndex+0
                                    485 ;	pdk_i2c.c: 124: txBufferLength = 0;
      000652 67 26                  486 	clear	_txBufferLength+0
                                    487 ;	pdk_i2c.c: 127: I2C_start();
      000654 C0 72                  488 	call	_I2C_start
                                    489 ;	pdk_i2c.c: 130: I2C_write_t((addr << 1) | I2C_WRITE);
      000656 7D 1F                  490 	mov	a, _I2C_beginTransmission_PARM_1+0
      000658 6B 00                  491 	sl	a
      00065A 78 17                  492 	mov	_I2C_write_t_PARM_1+0, a
      00065C DC 62                  493 	goto	_I2C_write_t
                                    494 ;	pdk_i2c.c: 131: }
      00065E 7A 00                  495 	ret
                                    496 ;	pdk_i2c.c: 133: void I2C_write2(uint8_t data)
                                    497 ;	-----------------------------------------
                                    498 ;	 function I2C_write2
                                    499 ;	-----------------------------------------
      000660                        500 _I2C_write2:
                                    501 ;	pdk_i2c.c: 135: txBuffer[txBufferIndex++] = data;
      000660 66 1F                  502 	mov	a, _txBufferIndex+0
      000662 66 24                  503 	inc	_txBufferIndex+0
      000664 68 50                  504 	add	a, #(_txBuffer + 0)
      000666 00 17                  505 	mov	p, a
      000668 7E 1F                  506 	mov	a, _I2C_write2_PARM_1+0
      00066A 00 07                  507 	idxm	p, a
                                    508 ;	pdk_i2c.c: 136: txBufferLength = txBufferIndex;
      00066C 66 1F                  509 	mov	a, _txBufferIndex+0
      00066E 67 17                  510 	mov	_txBufferLength+0, a
                                    511 ;	pdk_i2c.c: 137: }
      000670 7A 00                  512 	ret
                                    513 ;	pdk_i2c.c: 139: void I2C_writeBuffer(uint8_t *data, uint8_t len)
                                    514 ;	-----------------------------------------
                                    515 ;	 function I2C_writeBuffer
                                    516 ;	-----------------------------------------
      000672                        517 _I2C_writeBuffer:
                                    518 ;	pdk_i2c.c: 141: uint8_t i = 0;
      000672 82 26                  519 	clear	_I2C_writeBuffer_sloc3_1_0+0
      000674                        520 00103$:
                                    521 ;	pdk_i2c.c: 142: for (; i < len; ++i)
      000674 82 1F                  522 	mov	a, _I2C_writeBuffer_sloc3_1_0+0
      000676 81 19                  523 	sub	a, _I2C_writeBuffer_PARM_2+0
      000678 80 34                  524 	t1sn	f, c
      00067A 48 63                  525 	goto	00105$
                                    526 ;	pdk_i2c.c: 144: I2C_write2(data[i]);
      00067C 7F 1F                  527 	mov	a, _I2C_writeBuffer_PARM_1+0
      00067E 82 18                  528 	add	a, _I2C_writeBuffer_sloc3_1_0+0
      000680 00 17                  529 	mov	p, a
      000682 80 1F                  530 	mov	a, _I2C_writeBuffer_PARM_1+1
      000684 60 00                  531 	addc	a
      000686 79 74                  532 	call	__gptrget
      000688 7E 17                  533 	mov	_I2C_write2_PARM_1+0, a
      00068A 30 73                  534 	call	_I2C_write2
                                    535 ;	pdk_i2c.c: 142: for (; i < len; ++i)
      00068C 82 24                  536 	inc	_I2C_writeBuffer_sloc3_1_0+0
      00068E 3A 63                  537 	goto	00103$
      000690                        538 00105$:
                                    539 ;	pdk_i2c.c: 146: }
      000690 7A 00                  540 	ret
                                    541 ;	pdk_i2c.c: 148: void I2C_endTransmission(void)
                                    542 ;	-----------------------------------------
                                    543 ;	 function I2C_endTransmission
                                    544 ;	-----------------------------------------
      000692                        545 _I2C_endTransmission:
                                    546 ;	pdk_i2c.c: 152: for (i = 0; i < txBufferLength; ++i)
      000692 83 26                  547 	clear	_I2C_endTransmission_sloc4_1_0+0
      000694                        548 00103$:
      000694 83 1F                  549 	mov	a, _I2C_endTransmission_sloc4_1_0+0
      000696 67 19                  550 	sub	a, _txBufferLength+0
      000698 80 34                  551 	t1sn	f, c
      00069A 56 63                  552 	goto	00101$
                                    553 ;	pdk_i2c.c: 155: I2C_write_t(txBuffer[i]);
      00069C 68 57                  554 	mov	a, #(_txBuffer + 0)
      00069E 83 18                  555 	add	a, _I2C_endTransmission_sloc4_1_0+0
      0006A0 00 17                  556 	mov	p, a
      0006A2 01 07                  557 	idxm	a, p
      0006A4 78 17                  558 	mov	_I2C_write_t_PARM_1+0, a
      0006A6 DC 72                  559 	call	_I2C_write_t
                                    560 ;	pdk_i2c.c: 152: for (i = 0; i < txBufferLength; ++i)
      0006A8 83 24                  561 	inc	_I2C_endTransmission_sloc4_1_0+0
      0006AA 4A 63                  562 	goto	00103$
      0006AC                        563 00101$:
                                    564 ;	pdk_i2c.c: 159: I2C_stop();
      0006AC CE 62                  565 	goto	_I2C_stop
                                    566 ;	pdk_i2c.c: 160: }
      0006AE 7A 00                  567 	ret
                                    568 ;	pdk_i2c.c: 162: void I2C_requestFrom(uint8_t addr, uint8_t len)
                                    569 ;	-----------------------------------------
                                    570 ;	 function I2C_requestFrom
                                    571 ;	-----------------------------------------
      0006B0                        572 _I2C_requestFrom:
                                    573 ;	pdk_i2c.c: 165: rxBufferLength = len;
      0006B0 85 1F                  574 	mov	a, _I2C_requestFrom_PARM_2+0
      0006B2 55 17                  575 	mov	_rxBufferLength+0, a
                                    576 ;	pdk_i2c.c: 166: rxBufferIndex = 0;
      0006B4 54 26                  577 	clear	_rxBufferIndex+0
                                    578 ;	pdk_i2c.c: 169: I2C_start();
      0006B6 C0 72                  579 	call	_I2C_start
                                    580 ;	pdk_i2c.c: 172: I2C_write_t((addr << 1) | I2C_READ);
      0006B8 84 1F                  581 	mov	a, _I2C_requestFrom_PARM_1+0
      0006BA 6B 00                  582 	sl	a
      0006BC 01 55                  583 	or	a, #0x01
      0006BE 78 17                  584 	mov	_I2C_write_t_PARM_1+0, a
      0006C0 DC 72                  585 	call	_I2C_write_t
                                    586 ;	pdk_i2c.c: 175: for (i = 0; i < rxBufferLength - 1; i++)
      0006C2 86 26                  587 	clear	_I2C_requestFrom_sloc5_1_0+0
      0006C4                        588 00103$:
      0006C4 55 1F                  589 	mov	a, _rxBufferLength+0
      0006C6 01 51                  590 	sub	a, #0x01
      0006C8 87 17                  591 	mov	_I2C_requestFrom_sloc6_1_0+0, a
      0006CA 00 57                  592 	mov	a, #0x00
      0006CC 61 00                  593 	subc	a
      0006CE 88 17                  594 	mov	_I2C_requestFrom_sloc6_1_0+1, a
      0006D0 00 26                  595 	clear	p
      0006D2 86 1F                  596 	mov	a, _I2C_requestFrom_sloc5_1_0+0
      0006D4 87 19                  597 	sub	a, _I2C_requestFrom_sloc6_1_0+0
      0006D6 00 1F                  598 	mov	a, p
      0006D8 88 1B                  599 	subc	a, _I2C_requestFrom_sloc6_1_0+1
      0006DA 80 31                  600 	t0sn	f, ov
      0006DC 80 56                  601 	xor	a, #0x80
      0006DE 6B 00                  602 	sl	a
      0006E0 80 34                  603 	t1sn	f, c
      0006E2 7E 63                  604 	goto	00101$
                                    605 ;	pdk_i2c.c: 177: rxBuffer[i] = I2C_read_t(ACK);
      0006E4 56 57                  606 	mov	a, #(_rxBuffer + 0)
      0006E6 86 18                  607 	add	a, _I2C_requestFrom_sloc5_1_0+0
      0006E8 89 17                  608 	mov	_I2C_requestFrom_sloc7_1_0+0, a
      0006EA 01 57                  609 	mov	a, #0x01
      0006EC 7A 17                  610 	mov	_I2C_read_t_PARM_1+0, a
      0006EE 01 73                  611 	call	_I2C_read_t
      0006F0 00 17                  612 	mov	p, a
      0006F2 89 1F                  613 	mov	a, _I2C_requestFrom_sloc7_1_0+0
      0006F4 00 27                  614 	xch	a, p
      0006F6 00 07                  615 	idxm	p, a
                                    616 ;	pdk_i2c.c: 175: for (i = 0; i < rxBufferLength - 1; i++)
      0006F8 86 24                  617 	inc	_I2C_requestFrom_sloc5_1_0+0
      0006FA 62 63                  618 	goto	00103$
      0006FC                        619 00101$:
                                    620 ;	pdk_i2c.c: 180: rxBuffer[rxBufferLength - 1] = I2C_read_t(NACK);
      0006FC 55 1F                  621 	mov	a, _rxBufferLength+0
      0006FE 01 51                  622 	sub	a, #0x01
      000700 56 50                  623 	add	a, #(_rxBuffer + 0)
      000702 7A 26                  624 	clear	_I2C_read_t_PARM_1+0
      000704 72 00                  625 	push	af
      000706 01 73                  626 	call	_I2C_read_t
      000708 00 17                  627 	mov	p, a
      00070A 73 00                  628 	pop	af
      00070C 00 27                  629 	xch	a, p
      00070E 00 07                  630 	idxm	p, a
                                    631 ;	pdk_i2c.c: 183: I2C_stop();
      000710 CE 62                  632 	goto	_I2C_stop
                                    633 ;	pdk_i2c.c: 184: }
      000712 7A 00                  634 	ret
                                    635 ;	pdk_i2c.c: 186: int8_t I2C_read(void)
                                    636 ;	-----------------------------------------
                                    637 ;	 function I2C_read
                                    638 ;	-----------------------------------------
      000714                        639 _I2C_read:
                                    640 ;	pdk_i2c.c: 188: int8_t value = 5;
      000714 05 57                  641 	mov	a, #0x05
      000716 00 17                  642 	mov	p, a
                                    643 ;	pdk_i2c.c: 190: if (rxBufferIndex < rxBufferLength)
      000718 54 1F                  644 	mov	a, _rxBufferIndex+0
      00071A 55 19                  645 	sub	a, _rxBufferLength+0
      00071C 80 34                  646 	t1sn	f, c
      00071E 96 63                  647 	goto	00102$
                                    648 ;	pdk_i2c.c: 192: value = rxBuffer[rxBufferIndex];
      000720 56 57                  649 	mov	a, #(_rxBuffer + 0)
      000722 54 18                  650 	add	a, _rxBufferIndex+0
      000724 00 17                  651 	mov	p, a
      000726 01 07                  652 	idxm	a, p
      000728 00 17                  653 	mov	p, a
                                    654 ;	pdk_i2c.c: 193: ++rxBufferIndex;
      00072A 54 24                  655 	inc	_rxBufferIndex+0
      00072C                        656 00102$:
                                    657 ;	pdk_i2c.c: 195: return value;
      00072C 00 1F                  658 	mov	a, p
                                    659 ;	pdk_i2c.c: 196: }
      00072E 7A 00                  660 	ret
                                    661 	.area CODE
                                    662 	.area CONST
                                    663 	.area CABS (ABS)
