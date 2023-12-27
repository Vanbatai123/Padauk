                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_24c
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
                                     16 	.globl __delay_loop_16
                                     17 	.globl _I2C_available
                                     18 	.globl _I2C_read
                                     19 	.globl _I2C_requestFrom
                                     20 	.globl _I2C_endTransmission
                                     21 	.globl _I2C_write
                                     22 	.globl _I2C_beginTransmission
                                     23 	.globl __t16c
                                     24 	.globl __rop
                                     25 	.globl __bgtr
                                     26 	.globl __ilrcr
                                     27 	.globl __pwmg2dtl
                                     28 	.globl __pwmg2dth
                                     29 	.globl __pwmg2c
                                     30 	.globl __pwmg1dtl
                                     31 	.globl __pwmg1dth
                                     32 	.globl __pwmg1c
                                     33 	.globl __pwmgcubl
                                     34 	.globl __pwmgcubh
                                     35 	.globl __pwmg0dtl
                                     36 	.globl __pwmg0dth
                                     37 	.globl __pwmgclk
                                     38 	.globl __pwmg0c
                                     39 	.globl __tm3b
                                     40 	.globl __tm3s
                                     41 	.globl __tm3ct
                                     42 	.globl __tm3c
                                     43 	.globl __tm2b
                                     44 	.globl __tm2s
                                     45 	.globl __tm2ct
                                     46 	.globl __tm2c
                                     47 	.globl __gpcs
                                     48 	.globl __gpcc
                                     49 	.globl __misclvr
                                     50 	.globl __misc2
                                     51 	.globl __misc
                                     52 	.globl __adcrgc
                                     53 	.globl __adcr
                                     54 	.globl __adcm
                                     55 	.globl __adcc
                                     56 	.globl __pcpl
                                     57 	.globl __pbpl
                                     58 	.globl __pcph
                                     59 	.globl __pcc
                                     60 	.globl __pc
                                     61 	.globl __pbph
                                     62 	.globl __pbc
                                     63 	.globl __pb
                                     64 	.globl __paph
                                     65 	.globl __pac
                                     66 	.globl __pa
                                     67 	.globl __pcdier
                                     68 	.globl __pbdier
                                     69 	.globl __padier
                                     70 	.globl __integs
                                     71 	.globl __ihrcr
                                     72 	.globl __eoscr
                                     73 	.globl __t16m
                                     74 	.globl __intrq
                                     75 	.globl __inten
                                     76 	.globl __clkmd
                                     77 	.globl __sp
                                     78 	.globl __flag
                                     79 	.globl _AT24C_readBuf_PARM_3
                                     80 	.globl _AT24C_readBuf_PARM_2
                                     81 	.globl _AT24C_readBuf_PARM_1
                                     82 	.globl _AT24C_writeBuf_PARM_3
                                     83 	.globl _AT24C_writeBuf_PARM_2
                                     84 	.globl _AT24C_writeBuf_PARM_1
                                     85 	.globl _AT24C_read_PARM_1
                                     86 	.globl _AT24C_write_PARM_2
                                     87 	.globl _AT24C_write_PARM_1
                                     88 	.globl _AT24C_write
                                     89 	.globl _AT24C_read
                                     90 	.globl _AT24C_erase
                                     91 	.globl _AT24C_writeBuf
                                     92 	.globl _AT24C_readBuf
                                     93 ;--------------------------------------------------------
                                     94 ; special function registers
                                     95 ;--------------------------------------------------------
                                     96 	.area RSEG (ABS)
      000006                         97 	.org 0x0000
                           000000    98 __flag	=	0x0000
                           000002    99 __sp	=	0x0002
                           000003   100 __clkmd	=	0x0003
                           000004   101 __inten	=	0x0004
                           000005   102 __intrq	=	0x0005
                           000006   103 __t16m	=	0x0006
                           00000A   104 __eoscr	=	0x000a
                           00000B   105 __ihrcr	=	0x000b
                           00000C   106 __integs	=	0x000c
                           00000D   107 __padier	=	0x000d
                           00000E   108 __pbdier	=	0x000e
                           00000F   109 __pcdier	=	0x000f
                           000010   110 __pa	=	0x0010
                           000011   111 __pac	=	0x0011
                           000012   112 __paph	=	0x0012
                           000013   113 __pb	=	0x0013
                           000014   114 __pbc	=	0x0014
                           000015   115 __pbph	=	0x0015
                           000016   116 __pc	=	0x0016
                           000017   117 __pcc	=	0x0017
                           000018   118 __pcph	=	0x0018
                           000019   119 __pbpl	=	0x0019
                           00001A   120 __pcpl	=	0x001a
                           000020   121 __adcc	=	0x0020
                           000021   122 __adcm	=	0x0021
                           000022   123 __adcr	=	0x0022
                           000024   124 __adcrgc	=	0x0024
                           000026   125 __misc	=	0x0026
                           000027   126 __misc2	=	0x0027
                           000028   127 __misclvr	=	0x0028
                           00002B   128 __gpcc	=	0x002b
                           00002C   129 __gpcs	=	0x002c
                           000030   130 __tm2c	=	0x0030
                           000031   131 __tm2ct	=	0x0031
                           000032   132 __tm2s	=	0x0032
                           000033   133 __tm2b	=	0x0033
                           000034   134 __tm3c	=	0x0034
                           000035   135 __tm3ct	=	0x0035
                           000036   136 __tm3s	=	0x0036
                           000037   137 __tm3b	=	0x0037
                           000040   138 __pwmg0c	=	0x0040
                           000041   139 __pwmgclk	=	0x0041
                           000042   140 __pwmg0dth	=	0x0042
                           000043   141 __pwmg0dtl	=	0x0043
                           000044   142 __pwmgcubh	=	0x0044
                           000045   143 __pwmgcubl	=	0x0045
                           000046   144 __pwmg1c	=	0x0046
                           000048   145 __pwmg1dth	=	0x0048
                           000049   146 __pwmg1dtl	=	0x0049
                           00004C   147 __pwmg2c	=	0x004c
                           00004E   148 __pwmg2dth	=	0x004e
                           00004F   149 __pwmg2dtl	=	0x004f
                           000062   150 __ilrcr	=	0x0062
                           000063   151 __bgtr	=	0x0063
                           000067   152 __rop	=	0x0067
      000006                        153 __t16c::
      000006                        154 	.ds 2
                                    155 ;--------------------------------------------------------
                                    156 ; ram data
                                    157 ;--------------------------------------------------------
                                    158 	.area DATA
      00008C                        159 _AT24C_write_PARM_1:
      00008C                        160 	.ds 2
      00008E                        161 _AT24C_write_PARM_2:
      00008E                        162 	.ds 1
      00008F                        163 _AT24C_write_sloc0_1_0:
      00008F                        164 	.ds 1
      000090                        165 _AT24C_read_PARM_1:
      000090                        166 	.ds 2
      000092                        167 _AT24C_read_sloc1_1_0:
      000092                        168 	.ds 1
      000093                        169 _AT24C_erase_sloc2_1_0:
      000093                        170 	.ds 2
      000095                        171 _AT24C_writeBuf_PARM_1:
      000095                        172 	.ds 2
      000097                        173 _AT24C_writeBuf_PARM_2:
      000097                        174 	.ds 2
      000099                        175 _AT24C_writeBuf_PARM_3:
      000099                        176 	.ds 1
      00009A                        177 _AT24C_writeBuf_sloc3_1_0:
      00009A                        178 	.ds 2
      00009C                        179 _AT24C_writeBuf_sloc4_1_0:
      00009C                        180 	.ds 1
      00009D                        181 _AT24C_readBuf_PARM_1:
      00009D                        182 	.ds 2
      00009F                        183 _AT24C_readBuf_PARM_2:
      00009F                        184 	.ds 2
      0000A1                        185 _AT24C_readBuf_PARM_3:
      0000A1                        186 	.ds 2
      0000A3                        187 _AT24C_readBuf_sloc5_1_0:
      0000A3                        188 	.ds 2
      0000A5                        189 _AT24C_readBuf_sloc6_1_0:
      0000A5                        190 	.ds 1
      0000A6                        191 _AT24C_readBuf_sloc7_1_0:
      0000A6                        192 	.ds 2
                                    193 ;--------------------------------------------------------
                                    194 ; overlayable items in ram
                                    195 ;--------------------------------------------------------
                                    196 ;--------------------------------------------------------
                                    197 ; absolute external ram data
                                    198 ;--------------------------------------------------------
                                    199 	.area DABS (ABS)
                                    200 ;--------------------------------------------------------
                                    201 ; global & static initialisations
                                    202 ;--------------------------------------------------------
                                    203 	.area HOME
                                    204 	.area GSINIT
                                    205 	.area GSFINAL
                                    206 	.area GSINIT
                                    207 ;--------------------------------------------------------
                                    208 ; Home
                                    209 ;--------------------------------------------------------
                                    210 	.area HOME
                                    211 	.area HOME
                                    212 ;--------------------------------------------------------
                                    213 ; code
                                    214 ;--------------------------------------------------------
                                    215 	.area CODE
                                    216 ;	pdk_24c.c: 14: void AT24C_write(uint16_t address, uint8_t data)
                                    217 ;	-----------------------------------------
                                    218 ;	 function AT24C_write
                                    219 ;	-----------------------------------------
      0005EA                        220 _AT24C_write:
                                    221 ;	pdk_24c.c: 16: if ((address >= MEM_BYTE) | (AT24C_read(address) == data))
      0005EA 8D 1F                  222 	mov	a, _AT24C_write_PARM_1+1
      0005EC 00 17                  223 	mov	p, a
      0005EE 04 51                  224 	sub	a, #0x04
      0005F0 00 57                  225 	mov	a, #0x00
      0005F2 6D 00                  226 	slc	a
      0005F4 01 56                  227 	xor	a, #0x01
      0005F6 8F 17                  228 	mov	_AT24C_write_sloc0_1_0+0, a
      0005F8 8C 1F                  229 	mov	a, _AT24C_write_PARM_1+0
      0005FA 90 17                  230 	mov	_AT24C_read_PARM_1+0, a
      0005FC 8D 1F                  231 	mov	a, _AT24C_write_PARM_1+1
      0005FE 91 17                  232 	mov	_AT24C_read_PARM_1+1, a
      000600 1E 73                  233 	call	_AT24C_read
      000602 8E 2E                  234 	ceqsn	a, _AT24C_write_PARM_2+0
      000604 06 63                  235 	goto	00109$
      000606 01 57                  236 	mov	a, #0x01
      000608 00 17                  237 	mov	p, a
      00060A 07 63                  238 	goto	00110$
      00060C                        239 00109$:
      00060C 00 26                  240 	clear	p
      00060E                        241 00110$:
      00060E 8F 1F                  242 	mov	a, _AT24C_write_sloc0_1_0+0
      000610 00 1D                  243 	or	a, p
      000612 00 53                  244 	cneqsn	a, #0x00
      000614 0C 63                  245 	goto	00102$
                                    246 ;	pdk_24c.c: 18: return; // thoát ngay
      000616 7A 00                  247 	ret
      000618                        248 00102$:
                                    249 ;	pdk_24c.c: 26: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
      000618 8D 1F                  250 	mov	a, _AT24C_write_PARM_1+1
      00061A 07 54                  251 	and	a, #0x07
      00061C 50 55                  252 	or	a, #0x50
      00061E 78 17                  253 	mov	_I2C_beginTransmission_PARM_1+0, a
      000620 68 72                  254 	call	_I2C_beginTransmission
                                    255 ;	pdk_24c.c: 27: I2C_write(address & 0xFF);
      000622 8C 1F                  256 	mov	a, _AT24C_write_PARM_1+0
      000624 79 17                  257 	mov	_I2C_write_PARM_1+0, a
      000626 70 72                  258 	call	_I2C_write
                                    259 ;	pdk_24c.c: 34: I2C_write(data);
      000628 8E 1F                  260 	mov	a, _AT24C_write_PARM_2+0
      00062A 79 17                  261 	mov	_I2C_write_PARM_1+0, a
      00062C 70 72                  262 	call	_I2C_write
                                    263 ;	pdk_24c.c: 35: I2C_endTransmission();
      00062E 89 72                  264 	call	_I2C_endTransmission
                                    265 ;	pdk_24c.c: 36: _delay_ms(5);
      000630 86 57                  266 	mov	a, #0x86
      000632 86 17                  267 	mov	__delay_loop_16_PARM_1+0, a
      000634 13 57                  268 	mov	a, #0x13
      000636 87 17                  269 	mov	__delay_loop_16_PARM_1+1, a
      000638 E1 62                  270 	goto	__delay_loop_16
                                    271 ;	pdk_24c.c: 37: }
      00063A 7A 00                  272 	ret
                                    273 ;	pdk_24c.c: 39: uint8_t AT24C_read(uint16_t address)
                                    274 ;	-----------------------------------------
                                    275 ;	 function AT24C_read
                                    276 ;	-----------------------------------------
      00063C                        277 _AT24C_read:
                                    278 ;	pdk_24c.c: 42: if (address >= MEM_BYTE)
      00063C 91 1F                  279 	mov	a, _AT24C_read_PARM_1+1
      00063E 00 17                  280 	mov	p, a
      000640 04 51                  281 	sub	a, #0x04
      000642 80 30                  282 	t0sn.io	f, c
      000644 24 63                  283 	goto	00102$
                                    284 ;	pdk_24c.c: 44: return 0; // thoát ngay
      000646 00 02                  285 	ret	#0x00
      000648                        286 00102$:
                                    287 ;	pdk_24c.c: 56: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      000648 91 1F                  288 	mov	a, _AT24C_read_PARM_1+1
      00064A 07 54                  289 	and	a, #0x07
      00064C 50 55                  290 	or	a, #0x50
      00064E 92 17                  291 	mov	_AT24C_read_sloc1_1_0+0, a
      000650 78 17                  292 	mov	_I2C_beginTransmission_PARM_1+0, a
      000652 68 72                  293 	call	_I2C_beginTransmission
                                    294 ;	pdk_24c.c: 57: I2C_write(address & 0xFF);
      000654 90 1F                  295 	mov	a, _AT24C_read_PARM_1+0
      000656 79 17                  296 	mov	_I2C_write_PARM_1+0, a
      000658 70 72                  297 	call	_I2C_write
                                    298 ;	pdk_24c.c: 58: I2C_endTransmission();
      00065A 89 72                  299 	call	_I2C_endTransmission
                                    300 ;	pdk_24c.c: 59: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), 1);
      00065C 92 1F                  301 	mov	a, _AT24C_read_sloc1_1_0+0
      00065E 7F 17                  302 	mov	_I2C_requestFrom_PARM_1+0, a
      000660 01 57                  303 	mov	a, #0x01
      000662 80 17                  304 	mov	_I2C_requestFrom_PARM_2+0, a
      000664 98 72                  305 	call	_I2C_requestFrom
                                    306 ;	pdk_24c.c: 67: if (I2C_available())
      000666 D8 72                  307 	call	_I2C_available
      000668 00 53                  308 	cneqsn	a, #0x00
      00066A 38 63                  309 	goto	00104$
                                    310 ;	pdk_24c.c: 69: data = I2C_read();
      00066C CA 72                  311 	call	_I2C_read
                                    312 ;	pdk_24c.c: 70: return data;
      00066E 7A 00                  313 	ret
      000670                        314 00104$:
                                    315 ;	pdk_24c.c: 72: return -1;
                                    316 ;	pdk_24c.c: 73: }
      000670 FF 02                  317 	ret	#0xff
                                    318 ;	pdk_24c.c: 77: void AT24C_erase(void)
                                    319 ;	-----------------------------------------
                                    320 ;	 function AT24C_erase
                                    321 ;	-----------------------------------------
      000672                        322 _AT24C_erase:
                                    323 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      000672 93 26                  324 	clear	_AT24C_erase_sloc2_1_0+0
      000674 94 26                  325 	clear	_AT24C_erase_sloc2_1_0+1
      000676                        326 00105$:
      000676 94 1F                  327 	mov	a, _AT24C_erase_sloc2_1_0+1
      000678 00 17                  328 	mov	p, a
      00067A 04 51                  329 	sub	a, #0x04
      00067C 80 34                  330 	t1sn.io	f, c
      00067E 51 63                  331 	goto	00107$
                                    332 ;	pdk_24c.c: 81: if ((AT24C_read(i) != 0xFF))
      000680 93 1F                  333 	mov	a, _AT24C_erase_sloc2_1_0+0
      000682 90 17                  334 	mov	_AT24C_read_PARM_1+0, a
      000684 94 1F                  335 	mov	a, _AT24C_erase_sloc2_1_0+1
      000686 91 17                  336 	mov	_AT24C_read_PARM_1+1, a
      000688 1E 73                  337 	call	_AT24C_read
      00068A FF 53                  338 	cneqsn	a, #0xff
      00068C 4E 63                  339 	goto	00106$
      00068E                        340 00122$:
                                    341 ;	pdk_24c.c: 83: AT24C_write(i, 0xFF);
      00068E 93 1F                  342 	mov	a, _AT24C_erase_sloc2_1_0+0
      000690 8C 17                  343 	mov	_AT24C_write_PARM_1+0, a
      000692 94 1F                  344 	mov	a, _AT24C_erase_sloc2_1_0+1
      000694 8D 17                  345 	mov	_AT24C_write_PARM_1+1, a
      000696 FF 57                  346 	mov	a, #0xff
      000698 8E 17                  347 	mov	_AT24C_write_PARM_2+0, a
      00069A F5 72                  348 	call	_AT24C_write
      00069C                        349 00106$:
                                    350 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      00069C 93 24                  351 	inc	_AT24C_erase_sloc2_1_0+0
      00069E 94 20                  352 	addc	_AT24C_erase_sloc2_1_0+1
      0006A0 3B 63                  353 	goto	00105$
      0006A2                        354 00107$:
                                    355 ;	pdk_24c.c: 86: }
      0006A2 7A 00                  356 	ret
                                    357 ;	pdk_24c.c: 88: void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len)
                                    358 ;	-----------------------------------------
                                    359 ;	 function AT24C_writeBuf
                                    360 ;	-----------------------------------------
      0006A4                        361 _AT24C_writeBuf:
                                    362 ;	pdk_24c.c: 91: if ((address + len) >= MEM_BYTE)
      0006A4 00 26                  363 	clear	p
      0006A6 99 1F                  364 	mov	a, _AT24C_writeBuf_PARM_3+0
      0006A8 72 00                  365 	push	af
      0006AA 95 1F                  366 	mov	a, _AT24C_writeBuf_PARM_1+0
      0006AC 9A 17                  367 	mov	_AT24C_writeBuf_sloc3_1_0+0, a
      0006AE 73 00                  368 	pop	af
      0006B0 72 00                  369 	push	af
      0006B2 96 1F                  370 	mov	a, _AT24C_writeBuf_PARM_1+1
      0006B4 9B 17                  371 	mov	_AT24C_writeBuf_sloc3_1_0+1, a
      0006B6 73 00                  372 	pop	af
      0006B8 9A 18                  373 	add	a, _AT24C_writeBuf_sloc3_1_0+0
      0006BA 72 00                  374 	push	af
      0006BC 9B 1F                  375 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      0006BE 00 12                  376 	addc	p, a
      0006C0 73 00                  377 	pop	af
      0006C2 00 1F                  378 	mov	a, p
      0006C4 04 51                  379 	sub	a, #0x04
      0006C6 80 30                  380 	t0sn.io	f, c
      0006C8 68 63                  381 	goto	00111$
                                    382 ;	pdk_24c.c: 93: len = (MEM_BYTE - address);
      0006CA 95 1F                  383 	mov	a, _AT24C_writeBuf_PARM_1+0
      0006CC 69 00                  384 	neg	a
      0006CE 99 17                  385 	mov	_AT24C_writeBuf_PARM_3+0, a
                                    386 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0006D0                        387 00111$:
      0006D0 9C 26                  388 	clear	_AT24C_writeBuf_sloc4_1_0+0
      0006D2                        389 00105$:
      0006D2 9C 1F                  390 	mov	a, _AT24C_writeBuf_sloc4_1_0+0
      0006D4 99 19                  391 	sub	a, _AT24C_writeBuf_PARM_3+0
      0006D6 80 34                  392 	t1sn.io	f, c
      0006D8 7F 63                  393 	goto	00107$
                                    394 ;	pdk_24c.c: 98: AT24C_write(address + i, src[i]);
      0006DA 9A 1F                  395 	mov	a, _AT24C_writeBuf_sloc3_1_0+0
      0006DC 9C 18                  396 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0006DE 00 17                  397 	mov	p, a
      0006E0 9B 1F                  398 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      0006E2 60 00                  399 	addc	a
      0006E4 8D 17                  400 	mov	_AT24C_write_PARM_1+1, a
      0006E6 00 1F                  401 	mov	a, p
      0006E8 8C 17                  402 	mov	_AT24C_write_PARM_1+0, a
      0006EA 97 1F                  403 	mov	a, _AT24C_writeBuf_PARM_2+0
      0006EC 9C 18                  404 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0006EE 00 17                  405 	mov	p, a
      0006F0 98 1F                  406 	mov	a, _AT24C_writeBuf_PARM_2+1
      0006F2 60 00                  407 	addc	a
      0006F4 7E 74                  408 	call	__gptrget
      0006F6 8E 17                  409 	mov	_AT24C_write_PARM_2+0, a
      0006F8 F5 72                  410 	call	_AT24C_write
                                    411 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0006FA 9C 24                  412 	inc	_AT24C_writeBuf_sloc4_1_0+0
      0006FC 69 63                  413 	goto	00105$
      0006FE                        414 00107$:
                                    415 ;	pdk_24c.c: 100: }
      0006FE 7A 00                  416 	ret
                                    417 ;	pdk_24c.c: 102: void AT24C_readBuf(uint16_t address, uint8_t *dest, int len)
                                    418 ;	-----------------------------------------
                                    419 ;	 function AT24C_readBuf
                                    420 ;	-----------------------------------------
      000700                        421 _AT24C_readBuf:
                                    422 ;	pdk_24c.c: 107: if ((address + len) >= MEM_BYTE)
      000700 9D 1F                  423 	mov	a, _AT24C_readBuf_PARM_1+0
      000702 A3 17                  424 	mov	_AT24C_readBuf_sloc5_1_0+0, a
      000704 9E 1F                  425 	mov	a, _AT24C_readBuf_PARM_1+1
      000706 A4 17                  426 	mov	_AT24C_readBuf_sloc5_1_0+1, a
      000708 A2 1F                  427 	mov	a, _AT24C_readBuf_PARM_3+1
      00070A 00 17                  428 	mov	p, a
      00070C A1 1F                  429 	mov	a, _AT24C_readBuf_PARM_3+0
      00070E A3 18                  430 	add	a, _AT24C_readBuf_sloc5_1_0+0
      000710 72 00                  431 	push	af
      000712 A4 1F                  432 	mov	a, _AT24C_readBuf_sloc5_1_0+1
      000714 00 12                  433 	addc	p, a
      000716 73 00                  434 	pop	af
      000718 00 1F                  435 	mov	a, p
      00071A 04 51                  436 	sub	a, #0x04
      00071C 80 30                  437 	t0sn.io	f, c
      00071E 98 63                  438 	goto	00102$
                                    439 ;	pdk_24c.c: 109: len = (MEM_BYTE - address);
      000720 00 57                  440 	mov	a, #0x00
      000722 9D 19                  441 	sub	a, _AT24C_readBuf_PARM_1+0
      000724 00 17                  442 	mov	p, a
      000726 04 57                  443 	mov	a, #0x04
      000728 9E 1B                  444 	subc	a, _AT24C_readBuf_PARM_1+1
      00072A A2 17                  445 	mov	_AT24C_readBuf_PARM_3+1, a
      00072C 00 1F                  446 	mov	a, p
      00072E A1 17                  447 	mov	_AT24C_readBuf_PARM_3+0, a
      000730                        448 00102$:
                                    449 ;	pdk_24c.c: 118: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      000730 9E 1F                  450 	mov	a, _AT24C_readBuf_PARM_1+1
      000732 07 54                  451 	and	a, #0x07
      000734 50 55                  452 	or	a, #0x50
      000736 A5 17                  453 	mov	_AT24C_readBuf_sloc6_1_0+0, a
      000738 78 17                  454 	mov	_I2C_beginTransmission_PARM_1+0, a
      00073A 68 72                  455 	call	_I2C_beginTransmission
                                    456 ;	pdk_24c.c: 119: I2C_write(address & 0xFF);
      00073C 9D 1F                  457 	mov	a, _AT24C_readBuf_PARM_1+0
      00073E 79 17                  458 	mov	_I2C_write_PARM_1+0, a
      000740 70 72                  459 	call	_I2C_write
                                    460 ;	pdk_24c.c: 120: I2C_endTransmission();
      000742 89 72                  461 	call	_I2C_endTransmission
                                    462 ;	pdk_24c.c: 121: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), len);
      000744 A1 1F                  463 	mov	a, _AT24C_readBuf_PARM_3+0
      000746 80 17                  464 	mov	_I2C_requestFrom_PARM_2+0, a
      000748 A5 1F                  465 	mov	a, _AT24C_readBuf_sloc6_1_0+0
      00074A 7F 17                  466 	mov	_I2C_requestFrom_PARM_1+0, a
      00074C 98 72                  467 	call	_I2C_requestFrom
                                    468 ;	pdk_24c.c: 129: while (I2C_available())
      00074E 9F 1F                  469 	mov	a, _AT24C_readBuf_PARM_2+0
      000750 A6 17                  470 	mov	_AT24C_readBuf_sloc7_1_0+0, a
      000752 A0 1F                  471 	mov	a, _AT24C_readBuf_PARM_2+1
      000754 A7 17                  472 	mov	_AT24C_readBuf_sloc7_1_0+1, a
      000756                        473 00103$:
      000756 D8 72                  474 	call	_I2C_available
      000758 00 53                  475 	cneqsn	a, #0x00
      00075A B6 63                  476 	goto	00106$
                                    477 ;	pdk_24c.c: 131: *dest++ = I2C_read();
      00075C CA 72                  478 	call	_I2C_read
      00075E 00 17                  479 	mov	p, a
      000760 A6 1F                  480 	mov	a, _AT24C_readBuf_sloc7_1_0+0
      000762 00 27                  481 	xch	a, p
      000764 00 07                  482 	idxm	p, a
      000766 A6 24                  483 	inc	_AT24C_readBuf_sloc7_1_0+0
      000768 A7 20                  484 	addc	_AT24C_readBuf_sloc7_1_0+1
      00076A AB 63                  485 	goto	00103$
      00076C                        486 00106$:
                                    487 ;	pdk_24c.c: 133: }
      00076C 7A 00                  488 	ret
                                    489 	.area CODE
                                    490 	.area CONST
                                    491 	.area CABS (ABS)
