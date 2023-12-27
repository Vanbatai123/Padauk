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
      000004                        105 	.org 0x0000
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
      000004                        161 __t16c::
      000004                        162 	.ds 2
                                    163 ;--------------------------------------------------------
                                    164 ; ram data
                                    165 ;--------------------------------------------------------
                                    166 	.area DATA
      00004F                        167 _rxBufferIndex::
      00004F                        168 	.ds 1
      000050                        169 _rxBufferLength::
      000050                        170 	.ds 1
      000051                        171 _rxBuffer::
      000051                        172 	.ds 16
      000061                        173 _txBufferIndex::
      000061                        174 	.ds 1
      000062                        175 _txBufferLength::
      000062                        176 	.ds 1
      000063                        177 _txBuffer::
      000063                        178 	.ds 16
      000073                        179 _I2C_write_t_PARM_1:
      000073                        180 	.ds 1
      000074                        181 _I2C_write_t_sloc0_1_0:
      000074                        182 	.ds 1
      000075                        183 _I2C_read_t_PARM_1:
      000075                        184 	.ds 1
      000076                        185 _I2C_read_t_sloc1_1_0:
      000076                        186 	.ds 1
      000077                        187 _I2C_read_t_sloc2_1_0:
      000077                        188 	.ds 1
      000078                        189 _I2C_beginTransmission_PARM_1:
      000078                        190 	.ds 1
      000079                        191 _I2C_write_PARM_1:
      000079                        192 	.ds 1
      00007A                        193 _I2C_writeBuffer_PARM_1:
      00007A                        194 	.ds 2
      00007C                        195 _I2C_writeBuffer_PARM_2:
      00007C                        196 	.ds 1
      00007D                        197 _I2C_writeBuffer_sloc3_1_0:
      00007D                        198 	.ds 1
      00007E                        199 _I2C_endTransmission_sloc4_1_0:
      00007E                        200 	.ds 1
      00007F                        201 _I2C_requestFrom_PARM_1:
      00007F                        202 	.ds 1
      000080                        203 _I2C_requestFrom_PARM_2:
      000080                        204 	.ds 1
      000081                        205 _I2C_requestFrom_sloc5_1_0:
      000081                        206 	.ds 1
      000082                        207 _I2C_requestFrom_sloc6_1_0:
      000082                        208 	.ds 2
      000084                        209 _I2C_requestFrom_sloc7_1_0:
      000084                        210 	.ds 1
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
      0003CE                        238 _I2C_Ack:
                                    239 ;	pdk_i2c.c: 21: _delay_us(4);
      0003CE 08 57                  240 	mov	a, #0x08
      0003D0 85 17                  241 	mov	__delay_loop_8_PARM_1+0, a
      0003D2 DE 72                  242 	call	__delay_loop_8
                                    243 ;	pdk_i2c.c: 22: SDA0;
      0003D4 10 38                  244 	set0.io	__pa, #0
                                    245 ;	pdk_i2c.c: 23: _delay_us(4);
      0003D6 08 57                  246 	mov	a, #0x08
      0003D8 85 17                  247 	mov	__delay_loop_8_PARM_1+0, a
      0003DA DE 72                  248 	call	__delay_loop_8
                                    249 ;	pdk_i2c.c: 24: SCL1;
      0003DC 90 3F                  250 	set1.io	__pa, #7
                                    251 ;	pdk_i2c.c: 25: _delay_us(4);
      0003DE 08 57                  252 	mov	a, #0x08
      0003E0 85 17                  253 	mov	__delay_loop_8_PARM_1+0, a
      0003E2 DE 72                  254 	call	__delay_loop_8
                                    255 ;	pdk_i2c.c: 26: SCL0;
      0003E4 90 3B                  256 	set0.io	__pa, #7
                                    257 ;	pdk_i2c.c: 27: _delay_us(4);
      0003E6 08 57                  258 	mov	a, #0x08
      0003E8 85 17                  259 	mov	__delay_loop_8_PARM_1+0, a
      0003EA DE 62                  260 	goto	__delay_loop_8
                                    261 ;	pdk_i2c.c: 28: }
      0003EC 7A 00                  262 	ret
                                    263 ;	pdk_i2c.c: 30: void I2C_NoAck()
                                    264 ;	-----------------------------------------
                                    265 ;	 function I2C_NoAck
                                    266 ;	-----------------------------------------
      0003EE                        267 _I2C_NoAck:
                                    268 ;	pdk_i2c.c: 32: _delay_us(4);
      0003EE 08 57                  269 	mov	a, #0x08
      0003F0 85 17                  270 	mov	__delay_loop_8_PARM_1+0, a
      0003F2 DE 72                  271 	call	__delay_loop_8
                                    272 ;	pdk_i2c.c: 33: SDA1;
      0003F4 10 3C                  273 	set1.io	__pa, #0
                                    274 ;	pdk_i2c.c: 34: _delay_us(4);
      0003F6 08 57                  275 	mov	a, #0x08
      0003F8 85 17                  276 	mov	__delay_loop_8_PARM_1+0, a
      0003FA DE 72                  277 	call	__delay_loop_8
                                    278 ;	pdk_i2c.c: 35: SCL1;
      0003FC 90 3F                  279 	set1.io	__pa, #7
                                    280 ;	pdk_i2c.c: 36: _delay_us(4);
      0003FE 08 57                  281 	mov	a, #0x08
      000400 85 17                  282 	mov	__delay_loop_8_PARM_1+0, a
      000402 DE 72                  283 	call	__delay_loop_8
                                    284 ;	pdk_i2c.c: 37: SCL0;
      000404 90 3B                  285 	set0.io	__pa, #7
                                    286 ;	pdk_i2c.c: 38: _delay_us(4);
      000406 08 57                  287 	mov	a, #0x08
      000408 85 17                  288 	mov	__delay_loop_8_PARM_1+0, a
      00040A DE 62                  289 	goto	__delay_loop_8
                                    290 ;	pdk_i2c.c: 39: }
      00040C 7A 00                  291 	ret
                                    292 ;	pdk_i2c.c: 41: void I2C_start()
                                    293 ;	-----------------------------------------
                                    294 ;	 function I2C_start
                                    295 ;	-----------------------------------------
      00040E                        296 _I2C_start:
                                    297 ;	pdk_i2c.c: 43: SCL1;
      00040E 90 3F                  298 	set1.io	__pa, #7
                                    299 ;	pdk_i2c.c: 44: SDA1;
      000410 10 3C                  300 	set1.io	__pa, #0
                                    301 ;	pdk_i2c.c: 45: _delay_us(4);
      000412 08 57                  302 	mov	a, #0x08
      000414 85 17                  303 	mov	__delay_loop_8_PARM_1+0, a
      000416 DE 72                  304 	call	__delay_loop_8
                                    305 ;	pdk_i2c.c: 46: SDA0;
      000418 10 38                  306 	set0.io	__pa, #0
                                    307 ;	pdk_i2c.c: 47: _delay_us(4);
      00041A 08 57                  308 	mov	a, #0x08
      00041C 85 17                  309 	mov	__delay_loop_8_PARM_1+0, a
      00041E DE 72                  310 	call	__delay_loop_8
                                    311 ;	pdk_i2c.c: 48: SCL0;
      000420 90 3B                  312 	set0.io	__pa, #7
                                    313 ;	pdk_i2c.c: 49: _delay_us(4);
      000422 08 57                  314 	mov	a, #0x08
      000424 85 17                  315 	mov	__delay_loop_8_PARM_1+0, a
      000426 DE 62                  316 	goto	__delay_loop_8
                                    317 ;	pdk_i2c.c: 50: }
      000428 7A 00                  318 	ret
                                    319 ;	pdk_i2c.c: 51: void I2C_stop()
                                    320 ;	-----------------------------------------
                                    321 ;	 function I2C_stop
                                    322 ;	-----------------------------------------
      00042A                        323 _I2C_stop:
                                    324 ;	pdk_i2c.c: 53: SCL0;
      00042A 90 3B                  325 	set0.io	__pa, #7
                                    326 ;	pdk_i2c.c: 54: SDA0;
      00042C 10 38                  327 	set0.io	__pa, #0
                                    328 ;	pdk_i2c.c: 55: _delay_us(4);
      00042E 08 57                  329 	mov	a, #0x08
      000430 85 17                  330 	mov	__delay_loop_8_PARM_1+0, a
      000432 DE 72                  331 	call	__delay_loop_8
                                    332 ;	pdk_i2c.c: 56: SCL1;
      000434 90 3F                  333 	set1.io	__pa, #7
                                    334 ;	pdk_i2c.c: 57: _delay_us(4);
      000436 08 57                  335 	mov	a, #0x08
      000438 85 17                  336 	mov	__delay_loop_8_PARM_1+0, a
      00043A DE 72                  337 	call	__delay_loop_8
                                    338 ;	pdk_i2c.c: 58: SDA1;
      00043C 10 3C                  339 	set1.io	__pa, #0
                                    340 ;	pdk_i2c.c: 59: _delay_us(4);
      00043E 08 57                  341 	mov	a, #0x08
      000440 85 17                  342 	mov	__delay_loop_8_PARM_1+0, a
      000442 DE 62                  343 	goto	__delay_loop_8
                                    344 ;	pdk_i2c.c: 60: }
      000444 7A 00                  345 	ret
                                    346 ;	pdk_i2c.c: 61: uint8_t I2C_write_t(uint8_t dat)
                                    347 ;	-----------------------------------------
                                    348 ;	 function I2C_write_t
                                    349 ;	-----------------------------------------
      000446                        350 _I2C_write_t:
                                    351 ;	pdk_i2c.c: 63: for (uint8_t i = 0; i < 8; i++)
      000446 74 26                  352 	clear	_I2C_write_t_sloc0_1_0+0
      000448                        353 00106$:
      000448 74 1F                  354 	mov	a, _I2C_write_t_sloc0_1_0+0
      00044A 08 51                  355 	sub	a, #0x08
      00044C 80 34                  356 	t1sn.io	f, c
      00044E 3A 62                  357 	goto	00104$
                                    358 ;	pdk_i2c.c: 66: if (dat & 0x80)
      000450 73 1F                  359 	mov	a, _I2C_write_t_PARM_1+0
      000452 80 54                  360 	and	a, #0x80
      000454 00 53                  361 	cneqsn	a, #0x00
      000456 2E 62                  362 	goto	00102$
                                    363 ;	pdk_i2c.c: 67: SDA1;
      000458 10 3C                  364 	set1.io	__pa, #0
      00045A 2F 62                  365 	goto	00103$
      00045C                        366 00102$:
                                    367 ;	pdk_i2c.c: 69: SDA0;
      00045C 10 38                  368 	set0.io	__pa, #0
      00045E                        369 00103$:
                                    370 ;	pdk_i2c.c: 71: _delay_us(4);
      00045E 08 57                  371 	mov	a, #0x08
      000460 85 17                  372 	mov	__delay_loop_8_PARM_1+0, a
      000462 DE 72                  373 	call	__delay_loop_8
                                    374 ;	pdk_i2c.c: 72: SCL1;
      000464 90 3F                  375 	set1.io	__pa, #7
                                    376 ;	pdk_i2c.c: 73: _delay_us(4);
      000466 08 57                  377 	mov	a, #0x08
      000468 85 17                  378 	mov	__delay_loop_8_PARM_1+0, a
      00046A DE 72                  379 	call	__delay_loop_8
                                    380 ;	pdk_i2c.c: 74: SCL0;
      00046C 90 3B                  381 	set0.io	__pa, #7
                                    382 ;	pdk_i2c.c: 75: dat <<= 1;
      00046E 73 2B                  383 	sl	_I2C_write_t_PARM_1+0
                                    384 ;	pdk_i2c.c: 63: for (uint8_t i = 0; i < 8; i++)
      000470 74 24                  385 	inc	_I2C_write_t_sloc0_1_0+0
      000472 24 62                  386 	goto	00106$
      000474                        387 00104$:
                                    388 ;	pdk_i2c.c: 77: _delay_us(4);
      000474 08 57                  389 	mov	a, #0x08
      000476 85 17                  390 	mov	__delay_loop_8_PARM_1+0, a
      000478 DE 72                  391 	call	__delay_loop_8
                                    392 ;	pdk_i2c.c: 78: SCL1;
      00047A 90 3F                  393 	set1.io	__pa, #7
                                    394 ;	pdk_i2c.c: 79: _delay_us(4);
      00047C 08 57                  395 	mov	a, #0x08
      00047E 85 17                  396 	mov	__delay_loop_8_PARM_1+0, a
      000480 DE 72                  397 	call	__delay_loop_8
                                    398 ;	pdk_i2c.c: 80: SCL0;
      000482 90 3B                  399 	set0.io	__pa, #7
                                    400 ;	pdk_i2c.c: 81: setb(I2C_PxC, I2C_SDA);
      000484 11 3C                  401 	set1.io	__pac, #0
                                    402 ;	pdk_i2c.c: 82: return dat;
      000486 73 1F                  403 	mov	a, _I2C_write_t_PARM_1+0
                                    404 ;	pdk_i2c.c: 83: }
      000488 7A 00                  405 	ret
                                    406 ;	pdk_i2c.c: 85: uint8_t I2C_read_t(uint8_t ack)
                                    407 ;	-----------------------------------------
                                    408 ;	 function I2C_read_t
                                    409 ;	-----------------------------------------
      00048A                        410 _I2C_read_t:
                                    411 ;	pdk_i2c.c: 87: uint8_t dat = 0x00;
      00048A 76 26                  412 	clear	_I2C_read_t_sloc1_1_0+0
                                    413 ;	pdk_i2c.c: 90: clrb(I2C_PxC, I2C_SDA);
      00048C 11 38                  414 	set0.io	__pac, #0
                                    415 ;	pdk_i2c.c: 91: setb(I2C_PxPH, I2C_SDA);
      00048E 12 3C                  416 	set1.io	__paph, #0
                                    417 ;	pdk_i2c.c: 92: setb(I2C_PxDIER, I2C_SDA);
      000490 0D 3C                  418 	set1.io	__padier, #0
                                    419 ;	pdk_i2c.c: 94: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      000492 77 26                  420 	clear	_I2C_read_t_sloc2_1_0+0
      000494                        421 00108$:
      000494 77 1F                  422 	mov	a, _I2C_read_t_sloc2_1_0+0
      000496 08 51                  423 	sub	a, #0x08
      000498 80 34                  424 	t1sn.io	f, c
      00049A 5F 62                  425 	goto	00103$
                                    426 ;	pdk_i2c.c: 96: _delay_us(4);
      00049C 08 57                  427 	mov	a, #0x08
      00049E 85 17                  428 	mov	__delay_loop_8_PARM_1+0, a
      0004A0 DE 72                  429 	call	__delay_loop_8
                                    430 ;	pdk_i2c.c: 97: SCL1;
      0004A2 90 3F                  431 	set1.io	__pa, #7
                                    432 ;	pdk_i2c.c: 98: dat = dat << 1;
      0004A4 76 2B                  433 	sl	_I2C_read_t_sloc1_1_0+0
                                    434 ;	pdk_i2c.c: 99: if (inbit(I2C_Px, I2C_SDA))
      0004A6 90 01                  435 	mov.io	a, __pa
      0004A8 01 54                  436 	and	a, #0x01
      0004AA 00 53                  437 	cneqsn	a, #0x00
      0004AC 59 62                  438 	goto	00102$
                                    439 ;	pdk_i2c.c: 100: dat = dat | 0x01; /* Keep biit daata in dat */
      0004AE 01 57                  440 	mov	a, #0x01
      0004B0 76 15                  441 	or	_I2C_read_t_sloc1_1_0+0, a
      0004B2                        442 00102$:
                                    443 ;	pdk_i2c.c: 102: _delay_us(4);
      0004B2 08 57                  444 	mov	a, #0x08
      0004B4 85 17                  445 	mov	__delay_loop_8_PARM_1+0, a
      0004B6 DE 72                  446 	call	__delay_loop_8
                                    447 ;	pdk_i2c.c: 103: SCL0; /* Clear SCL */
      0004B8 90 3B                  448 	set0.io	__pa, #7
                                    449 ;	pdk_i2c.c: 94: for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
      0004BA 77 24                  450 	inc	_I2C_read_t_sloc2_1_0+0
      0004BC 4A 62                  451 	goto	00108$
      0004BE                        452 00103$:
                                    453 ;	pdk_i2c.c: 105: setb(I2C_PxC, I2C_SDA);
      0004BE 11 3C                  454 	set1.io	__pac, #0
                                    455 ;	pdk_i2c.c: 106: if (ack == 0)
      0004C0 75 1F                  456 	mov	a, _I2C_read_t_PARM_1+0
      0004C2 00 52                  457 	ceqsn	a, #0x00
      0004C4 65 62                  458 	goto	00105$
                                    459 ;	pdk_i2c.c: 107: I2C_NoAck();
      0004C6 F7 71                  460 	call	_I2C_NoAck
      0004C8 66 62                  461 	goto	00106$
      0004CA                        462 00105$:
                                    463 ;	pdk_i2c.c: 109: I2C_Ack();
      0004CA E7 71                  464 	call	_I2C_Ack
      0004CC                        465 00106$:
                                    466 ;	pdk_i2c.c: 111: return dat;
      0004CC 76 1F                  467 	mov	a, _I2C_read_t_sloc1_1_0+0
                                    468 ;	pdk_i2c.c: 112: }
      0004CE 7A 00                  469 	ret
                                    470 ;	pdk_i2c.c: 114: void I2C_beginTransmission(uint8_t addr)
                                    471 ;	-----------------------------------------
                                    472 ;	 function I2C_beginTransmission
                                    473 ;	-----------------------------------------
      0004D0                        474 _I2C_beginTransmission:
                                    475 ;	pdk_i2c.c: 116: txBufferIndex = 0;
      0004D0 61 26                  476 	clear	_txBufferIndex+0
                                    477 ;	pdk_i2c.c: 117: txBufferLength = 0;
      0004D2 62 26                  478 	clear	_txBufferLength+0
                                    479 ;	pdk_i2c.c: 120: I2C_start();
      0004D4 07 72                  480 	call	_I2C_start
                                    481 ;	pdk_i2c.c: 123: I2C_write_t((addr << 1) | I2C_WRITE);
      0004D6 78 1F                  482 	mov	a, _I2C_beginTransmission_PARM_1+0
      0004D8 6B 00                  483 	sl	a
      0004DA 73 17                  484 	mov	_I2C_write_t_PARM_1+0, a
      0004DC 23 62                  485 	goto	_I2C_write_t
                                    486 ;	pdk_i2c.c: 124: }
      0004DE 7A 00                  487 	ret
                                    488 ;	pdk_i2c.c: 126: void I2C_write(uint8_t data)
                                    489 ;	-----------------------------------------
                                    490 ;	 function I2C_write
                                    491 ;	-----------------------------------------
      0004E0                        492 _I2C_write:
                                    493 ;	pdk_i2c.c: 128: txBuffer[txBufferIndex++] = data;
      0004E0 61 1F                  494 	mov	a, _txBufferIndex+0
      0004E2 61 24                  495 	inc	_txBufferIndex+0
      0004E4 63 50                  496 	add	a, #(_txBuffer + 0)
      0004E6 00 17                  497 	mov	p, a
      0004E8 79 1F                  498 	mov	a, _I2C_write_PARM_1+0
      0004EA 00 07                  499 	idxm	p, a
                                    500 ;	pdk_i2c.c: 129: txBufferLength = txBufferIndex;
      0004EC 61 1F                  501 	mov	a, _txBufferIndex+0
      0004EE 62 17                  502 	mov	_txBufferLength+0, a
                                    503 ;	pdk_i2c.c: 130: }
      0004F0 7A 00                  504 	ret
                                    505 ;	pdk_i2c.c: 132: void I2C_writeBuffer(uint8_t *data, uint8_t len)
                                    506 ;	-----------------------------------------
                                    507 ;	 function I2C_writeBuffer
                                    508 ;	-----------------------------------------
      0004F2                        509 _I2C_writeBuffer:
                                    510 ;	pdk_i2c.c: 134: uint8_t i = 0;
      0004F2 7D 26                  511 	clear	_I2C_writeBuffer_sloc3_1_0+0
      0004F4                        512 00103$:
                                    513 ;	pdk_i2c.c: 135: for (; i < len; ++i)
      0004F4 7D 1F                  514 	mov	a, _I2C_writeBuffer_sloc3_1_0+0
      0004F6 7C 19                  515 	sub	a, _I2C_writeBuffer_PARM_2+0
      0004F8 80 34                  516 	t1sn.io	f, c
      0004FA 88 62                  517 	goto	00105$
                                    518 ;	pdk_i2c.c: 137: I2C_write(data[i]);
      0004FC 7A 1F                  519 	mov	a, _I2C_writeBuffer_PARM_1+0
      0004FE 7D 18                  520 	add	a, _I2C_writeBuffer_sloc3_1_0+0
      000500 00 17                  521 	mov	p, a
      000502 7B 1F                  522 	mov	a, _I2C_writeBuffer_PARM_1+1
      000504 60 00                  523 	addc	a
      000506 7E 74                  524 	call	__gptrget
      000508 79 17                  525 	mov	_I2C_write_PARM_1+0, a
      00050A 70 72                  526 	call	_I2C_write
                                    527 ;	pdk_i2c.c: 135: for (; i < len; ++i)
      00050C 7D 24                  528 	inc	_I2C_writeBuffer_sloc3_1_0+0
      00050E 7A 62                  529 	goto	00103$
      000510                        530 00105$:
                                    531 ;	pdk_i2c.c: 139: }
      000510 7A 00                  532 	ret
                                    533 ;	pdk_i2c.c: 141: void I2C_endTransmission(void)
                                    534 ;	-----------------------------------------
                                    535 ;	 function I2C_endTransmission
                                    536 ;	-----------------------------------------
      000512                        537 _I2C_endTransmission:
                                    538 ;	pdk_i2c.c: 145: for (i = 0; i < txBufferLength; ++i)
      000512 7E 26                  539 	clear	_I2C_endTransmission_sloc4_1_0+0
      000514                        540 00103$:
      000514 7E 1F                  541 	mov	a, _I2C_endTransmission_sloc4_1_0+0
      000516 62 19                  542 	sub	a, _txBufferLength+0
      000518 80 34                  543 	t1sn.io	f, c
      00051A 96 62                  544 	goto	00101$
                                    545 ;	pdk_i2c.c: 148: I2C_write_t(txBuffer[i]);
      00051C 63 57                  546 	mov	a, #(_txBuffer + 0)
      00051E 7E 18                  547 	add	a, _I2C_endTransmission_sloc4_1_0+0
      000520 00 17                  548 	mov	p, a
      000522 01 07                  549 	idxm	a, p
      000524 73 17                  550 	mov	_I2C_write_t_PARM_1+0, a
      000526 23 72                  551 	call	_I2C_write_t
                                    552 ;	pdk_i2c.c: 145: for (i = 0; i < txBufferLength; ++i)
      000528 7E 24                  553 	inc	_I2C_endTransmission_sloc4_1_0+0
      00052A 8A 62                  554 	goto	00103$
      00052C                        555 00101$:
                                    556 ;	pdk_i2c.c: 152: I2C_stop();
      00052C 15 62                  557 	goto	_I2C_stop
                                    558 ;	pdk_i2c.c: 153: }
      00052E 7A 00                  559 	ret
                                    560 ;	pdk_i2c.c: 155: void I2C_requestFrom(uint8_t addr, uint8_t len)
                                    561 ;	-----------------------------------------
                                    562 ;	 function I2C_requestFrom
                                    563 ;	-----------------------------------------
      000530                        564 _I2C_requestFrom:
                                    565 ;	pdk_i2c.c: 158: rxBufferLength = len;
      000530 80 1F                  566 	mov	a, _I2C_requestFrom_PARM_2+0
      000532 50 17                  567 	mov	_rxBufferLength+0, a
                                    568 ;	pdk_i2c.c: 159: rxBufferIndex = 0;
      000534 4F 26                  569 	clear	_rxBufferIndex+0
                                    570 ;	pdk_i2c.c: 162: I2C_start();
      000536 07 72                  571 	call	_I2C_start
                                    572 ;	pdk_i2c.c: 165: I2C_write_t((addr << 1) | I2C_READ);
      000538 7F 1F                  573 	mov	a, _I2C_requestFrom_PARM_1+0
      00053A 6B 00                  574 	sl	a
      00053C 01 55                  575 	or	a, #0x01
      00053E 73 17                  576 	mov	_I2C_write_t_PARM_1+0, a
      000540 23 72                  577 	call	_I2C_write_t
                                    578 ;	pdk_i2c.c: 168: for (i = 0; i < rxBufferLength - 1; i++)
      000542 81 26                  579 	clear	_I2C_requestFrom_sloc5_1_0+0
      000544                        580 00103$:
      000544 50 1F                  581 	mov	a, _rxBufferLength+0
      000546 01 51                  582 	sub	a, #0x01
      000548 82 17                  583 	mov	_I2C_requestFrom_sloc6_1_0+0, a
      00054A 00 57                  584 	mov	a, #0x00
      00054C 61 00                  585 	subc	a
      00054E 83 17                  586 	mov	_I2C_requestFrom_sloc6_1_0+1, a
      000550 00 26                  587 	clear	p
      000552 81 1F                  588 	mov	a, _I2C_requestFrom_sloc5_1_0+0
      000554 82 19                  589 	sub	a, _I2C_requestFrom_sloc6_1_0+0
      000556 00 1F                  590 	mov	a, p
      000558 83 1B                  591 	subc	a, _I2C_requestFrom_sloc6_1_0+1
      00055A 80 31                  592 	t0sn.io	f, ov
      00055C 80 56                  593 	xor	a, #0x80
      00055E 6B 00                  594 	sl	a
      000560 80 34                  595 	t1sn.io	f, c
      000562 BE 62                  596 	goto	00101$
                                    597 ;	pdk_i2c.c: 170: rxBuffer[i] = I2C_read_t(ACK);
      000564 51 57                  598 	mov	a, #(_rxBuffer + 0)
      000566 81 18                  599 	add	a, _I2C_requestFrom_sloc5_1_0+0
      000568 84 17                  600 	mov	_I2C_requestFrom_sloc7_1_0+0, a
      00056A 01 57                  601 	mov	a, #0x01
      00056C 75 17                  602 	mov	_I2C_read_t_PARM_1+0, a
      00056E 45 72                  603 	call	_I2C_read_t
      000570 00 17                  604 	mov	p, a
      000572 84 1F                  605 	mov	a, _I2C_requestFrom_sloc7_1_0+0
      000574 00 27                  606 	xch	a, p
      000576 00 07                  607 	idxm	p, a
                                    608 ;	pdk_i2c.c: 168: for (i = 0; i < rxBufferLength - 1; i++)
      000578 81 24                  609 	inc	_I2C_requestFrom_sloc5_1_0+0
      00057A A2 62                  610 	goto	00103$
      00057C                        611 00101$:
                                    612 ;	pdk_i2c.c: 173: rxBuffer[rxBufferLength - 1] = I2C_read_t(NACK);
      00057C 50 1F                  613 	mov	a, _rxBufferLength+0
      00057E 01 51                  614 	sub	a, #0x01
      000580 51 50                  615 	add	a, #(_rxBuffer + 0)
      000582 75 26                  616 	clear	_I2C_read_t_PARM_1+0
      000584 72 00                  617 	push	af
      000586 45 72                  618 	call	_I2C_read_t
      000588 00 17                  619 	mov	p, a
      00058A 73 00                  620 	pop	af
      00058C 00 27                  621 	xch	a, p
      00058E 00 07                  622 	idxm	p, a
                                    623 ;	pdk_i2c.c: 176: I2C_stop();
      000590 15 62                  624 	goto	_I2C_stop
                                    625 ;	pdk_i2c.c: 177: }
      000592 7A 00                  626 	ret
                                    627 ;	pdk_i2c.c: 179: int8_t I2C_read(void)
                                    628 ;	-----------------------------------------
                                    629 ;	 function I2C_read
                                    630 ;	-----------------------------------------
      000594                        631 _I2C_read:
                                    632 ;	pdk_i2c.c: 181: int8_t value = 5;
      000594 05 57                  633 	mov	a, #0x05
      000596 00 17                  634 	mov	p, a
                                    635 ;	pdk_i2c.c: 183: if (rxBufferIndex < rxBufferLength)
      000598 4F 1F                  636 	mov	a, _rxBufferIndex+0
      00059A 50 19                  637 	sub	a, _rxBufferLength+0
      00059C 80 34                  638 	t1sn.io	f, c
      00059E D6 62                  639 	goto	00102$
                                    640 ;	pdk_i2c.c: 185: value = rxBuffer[rxBufferIndex];
      0005A0 51 57                  641 	mov	a, #(_rxBuffer + 0)
      0005A2 4F 18                  642 	add	a, _rxBufferIndex+0
      0005A4 00 17                  643 	mov	p, a
      0005A6 01 07                  644 	idxm	a, p
      0005A8 00 17                  645 	mov	p, a
                                    646 ;	pdk_i2c.c: 186: ++rxBufferIndex;
      0005AA 4F 24                  647 	inc	_rxBufferIndex+0
      0005AC                        648 00102$:
                                    649 ;	pdk_i2c.c: 188: return value;
      0005AC 00 1F                  650 	mov	a, p
                                    651 ;	pdk_i2c.c: 189: }
      0005AE 7A 00                  652 	ret
                                    653 ;	pdk_i2c.c: 190: char I2C_available(void)
                                    654 ;	-----------------------------------------
                                    655 ;	 function I2C_available
                                    656 ;	-----------------------------------------
      0005B0                        657 _I2C_available:
                                    658 ;	pdk_i2c.c: 192: return rxBufferLength - rxBufferIndex;
      0005B0 50 1F                  659 	mov	a, _rxBufferLength+0
      0005B2 4F 19                  660 	sub	a, _rxBufferIndex+0
                                    661 ;	pdk_i2c.c: 193: }
      0005B4 7A 00                  662 	ret
                                    663 ;	pdk_i2c.c: 194: void I2C_begin(void)
                                    664 ;	-----------------------------------------
                                    665 ;	 function I2C_begin
                                    666 ;	-----------------------------------------
      0005B6                        667 _I2C_begin:
                                    668 ;	pdk_i2c.c: 196: I2C_PxC |= (1 << I2C_SDA);
      0005B6 11 3C                  669 	set1.io	__pac, #0
                                    670 ;	pdk_i2c.c: 197: I2C_PxC |= (1 << I2C_SCL);
      0005B8 91 3F                  671 	set1.io	__pac, #7
                                    672 ;	pdk_i2c.c: 198: }
      0005BA 7A 00                  673 	ret
                                    674 	.area CODE
                                    675 	.area CONST
                                    676 	.area CABS (ABS)
