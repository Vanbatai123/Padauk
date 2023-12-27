                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
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
                                     21 	.globl _I2C_writeBuf
                                     22 	.globl _I2C_write
                                     23 	.globl _I2C_beginTransmission
                                     24 	.globl __t16c
                                     25 	.globl __rop
                                     26 	.globl __bgtr
                                     27 	.globl __ilrcr
                                     28 	.globl __pwmg2dtl
                                     29 	.globl __pwmg2dth
                                     30 	.globl __pwmg2c
                                     31 	.globl __pwmg1dtl
                                     32 	.globl __pwmg1dth
                                     33 	.globl __pwmg1c
                                     34 	.globl __pwmgcubl
                                     35 	.globl __pwmgcubh
                                     36 	.globl __pwmg0dtl
                                     37 	.globl __pwmg0dth
                                     38 	.globl __pwmgclk
                                     39 	.globl __pwmg0c
                                     40 	.globl __tm3b
                                     41 	.globl __tm3s
                                     42 	.globl __tm3ct
                                     43 	.globl __tm3c
                                     44 	.globl __tm2b
                                     45 	.globl __tm2s
                                     46 	.globl __tm2ct
                                     47 	.globl __tm2c
                                     48 	.globl __gpcs
                                     49 	.globl __gpcc
                                     50 	.globl __misclvr
                                     51 	.globl __misc2
                                     52 	.globl __misc
                                     53 	.globl __adcrgc
                                     54 	.globl __adcr
                                     55 	.globl __adcm
                                     56 	.globl __adcc
                                     57 	.globl __pcpl
                                     58 	.globl __pbpl
                                     59 	.globl __pcph
                                     60 	.globl __pcc
                                     61 	.globl __pc
                                     62 	.globl __pbph
                                     63 	.globl __pbc
                                     64 	.globl __pb
                                     65 	.globl __paph
                                     66 	.globl __pac
                                     67 	.globl __pa
                                     68 	.globl __pcdier
                                     69 	.globl __pbdier
                                     70 	.globl __padier
                                     71 	.globl __integs
                                     72 	.globl __ihrcr
                                     73 	.globl __eoscr
                                     74 	.globl __t16m
                                     75 	.globl __intrq
                                     76 	.globl __inten
                                     77 	.globl __clkmd
                                     78 	.globl __sp
                                     79 	.globl __flag
                                     80 	.globl _AT24C_readBuf_PARM_3
                                     81 	.globl _AT24C_readBuf_PARM_2
                                     82 	.globl _AT24C_readBuf_PARM_1
                                     83 	.globl _AT24C_writeBuf2_PARM_3
                                     84 	.globl _AT24C_writeBuf2_PARM_2
                                     85 	.globl _AT24C_writeBuf2_PARM_1
                                     86 	.globl _AT24C_writeBuf_PARM_3
                                     87 	.globl _AT24C_writeBuf_PARM_2
                                     88 	.globl _AT24C_writeBuf_PARM_1
                                     89 	.globl _AT24C_read_PARM_1
                                     90 	.globl _AT24C_write_PARM_2
                                     91 	.globl _AT24C_write_PARM_1
                                     92 	.globl _AT24C_write
                                     93 	.globl _AT24C_read
                                     94 	.globl _AT24C_erase
                                     95 	.globl _AT24C_writeBuf
                                     96 	.globl _AT24C_writeBuf2
                                     97 	.globl _AT24C_readBuf
                                     98 ;--------------------------------------------------------
                                     99 ; special function registers
                                    100 ;--------------------------------------------------------
                                    101 	.area RSEG (ABS)
      000006                        102 	.org 0x0000
                           000000   103 __flag	=	0x0000
                           000002   104 __sp	=	0x0002
                           000003   105 __clkmd	=	0x0003
                           000004   106 __inten	=	0x0004
                           000005   107 __intrq	=	0x0005
                           000006   108 __t16m	=	0x0006
                           00000A   109 __eoscr	=	0x000a
                           00000B   110 __ihrcr	=	0x000b
                           00000C   111 __integs	=	0x000c
                           00000D   112 __padier	=	0x000d
                           00000E   113 __pbdier	=	0x000e
                           00000F   114 __pcdier	=	0x000f
                           000010   115 __pa	=	0x0010
                           000011   116 __pac	=	0x0011
                           000012   117 __paph	=	0x0012
                           000013   118 __pb	=	0x0013
                           000014   119 __pbc	=	0x0014
                           000015   120 __pbph	=	0x0015
                           000016   121 __pc	=	0x0016
                           000017   122 __pcc	=	0x0017
                           000018   123 __pcph	=	0x0018
                           000019   124 __pbpl	=	0x0019
                           00001A   125 __pcpl	=	0x001a
                           000020   126 __adcc	=	0x0020
                           000021   127 __adcm	=	0x0021
                           000022   128 __adcr	=	0x0022
                           000024   129 __adcrgc	=	0x0024
                           000026   130 __misc	=	0x0026
                           000027   131 __misc2	=	0x0027
                           000028   132 __misclvr	=	0x0028
                           00002B   133 __gpcc	=	0x002b
                           00002C   134 __gpcs	=	0x002c
                           000030   135 __tm2c	=	0x0030
                           000031   136 __tm2ct	=	0x0031
                           000032   137 __tm2s	=	0x0032
                           000033   138 __tm2b	=	0x0033
                           000034   139 __tm3c	=	0x0034
                           000035   140 __tm3ct	=	0x0035
                           000036   141 __tm3s	=	0x0036
                           000037   142 __tm3b	=	0x0037
                           000040   143 __pwmg0c	=	0x0040
                           000041   144 __pwmgclk	=	0x0041
                           000042   145 __pwmg0dth	=	0x0042
                           000043   146 __pwmg0dtl	=	0x0043
                           000044   147 __pwmgcubh	=	0x0044
                           000045   148 __pwmgcubl	=	0x0045
                           000046   149 __pwmg1c	=	0x0046
                           000048   150 __pwmg1dth	=	0x0048
                           000049   151 __pwmg1dtl	=	0x0049
                           00004C   152 __pwmg2c	=	0x004c
                           00004E   153 __pwmg2dth	=	0x004e
                           00004F   154 __pwmg2dtl	=	0x004f
                           000062   155 __ilrcr	=	0x0062
                           000063   156 __bgtr	=	0x0063
                           000067   157 __rop	=	0x0067
      000006                        158 __t16c::
      000006                        159 	.ds 2
                                    160 ;--------------------------------------------------------
                                    161 ; ram data
                                    162 ;--------------------------------------------------------
                                    163 	.area DATA
      0000AE                        164 _AT24C_write_PARM_1:
      0000AE                        165 	.ds 2
      0000B0                        166 _AT24C_write_PARM_2:
      0000B0                        167 	.ds 1
      0000B1                        168 _AT24C_write_sloc0_1_0:
      0000B1                        169 	.ds 1
      0000B2                        170 _AT24C_read_PARM_1:
      0000B2                        171 	.ds 2
      0000B4                        172 _AT24C_read_sloc1_1_0:
      0000B4                        173 	.ds 1
      0000B5                        174 _AT24C_erase_sloc2_1_0:
      0000B5                        175 	.ds 2
      0000B7                        176 _AT24C_writeBuf_PARM_1:
      0000B7                        177 	.ds 2
      0000B9                        178 _AT24C_writeBuf_PARM_2:
      0000B9                        179 	.ds 2
      0000BB                        180 _AT24C_writeBuf_PARM_3:
      0000BB                        181 	.ds 1
      0000BC                        182 _AT24C_writeBuf_sloc3_1_0:
      0000BC                        183 	.ds 2
      0000BE                        184 _AT24C_writeBuf_sloc4_1_0:
      0000BE                        185 	.ds 1
      0000BF                        186 _AT24C_writeBuf2_PARM_1:
      0000BF                        187 	.ds 2
      0000C1                        188 _AT24C_writeBuf2_PARM_2:
      0000C1                        189 	.ds 2
      0000C3                        190 _AT24C_writeBuf2_PARM_3:
      0000C3                        191 	.ds 1
      0000C4                        192 _AT24C_writeBuf2_sloc5_1_0:
      0000C4                        193 	.ds 2
      0000C6                        194 _AT24C_readBuf_PARM_1:
      0000C6                        195 	.ds 2
      0000C8                        196 _AT24C_readBuf_PARM_2:
      0000C8                        197 	.ds 2
      0000CA                        198 _AT24C_readBuf_PARM_3:
      0000CA                        199 	.ds 2
      0000CC                        200 _AT24C_readBuf_sloc6_1_0:
      0000CC                        201 	.ds 2
      0000CE                        202 _AT24C_readBuf_sloc7_1_0:
      0000CE                        203 	.ds 1
      0000CF                        204 _AT24C_readBuf_sloc8_1_0:
      0000CF                        205 	.ds 2
                                    206 ;--------------------------------------------------------
                                    207 ; overlayable items in ram 
                                    208 ;--------------------------------------------------------
                                    209 ;--------------------------------------------------------
                                    210 ; absolute external ram data
                                    211 ;--------------------------------------------------------
                                    212 	.area DABS (ABS)
                                    213 ;--------------------------------------------------------
                                    214 ; global & static initialisations
                                    215 ;--------------------------------------------------------
                                    216 	.area HOME
                                    217 	.area GSINIT
                                    218 	.area GSFINAL
                                    219 	.area GSINIT
                                    220 ;--------------------------------------------------------
                                    221 ; Home
                                    222 ;--------------------------------------------------------
                                    223 	.area HOME
                                    224 	.area HOME
                                    225 ;--------------------------------------------------------
                                    226 ; code
                                    227 ;--------------------------------------------------------
                                    228 	.area CODE
                                    229 ;	pdk_24c.c: 14: void AT24C_write(uint16_t address, uint8_t data)
                                    230 ;	-----------------------------------------
                                    231 ;	 function AT24C_write
                                    232 ;	-----------------------------------------
      0006BA                        233 _AT24C_write:
                                    234 ;	pdk_24c.c: 16: if ((address >= MEM_BYTE) | (AT24C_read(address) == data))
      0006BA AF 1F                  235 	mov	a, _AT24C_write_PARM_1+1
      0006BC 00 17                  236 	mov	p, a
      0006BE 04 51                  237 	sub	a, #0x04
      0006C0 00 57                  238 	mov	a, #0x00
      0006C2 6D 00                  239 	slc	a
      0006C4 01 56                  240 	xor	a, #0x01
      0006C6 B1 17                  241 	mov	_AT24C_write_sloc0_1_0+0, a
      0006C8 AE 1F                  242 	mov	a, _AT24C_write_PARM_1+0
      0006CA B2 17                  243 	mov	_AT24C_read_PARM_1+0, a
      0006CC AF 1F                  244 	mov	a, _AT24C_write_PARM_1+1
      0006CE B3 17                  245 	mov	_AT24C_read_PARM_1+1, a
      0006D0 87 73                  246 	call	_AT24C_read
      0006D2 B0 2E                  247 	ceqsn	a, _AT24C_write_PARM_2+0
      0006D4 6E 63                  248 	goto	00109$
      0006D6 01 57                  249 	mov	a, #0x01
      0006D8 00 17                  250 	mov	p, a
      0006DA 6F 63                  251 	goto	00110$
      0006DC                        252 00109$:
      0006DC 00 26                  253 	clear	p
      0006DE                        254 00110$:
      0006DE B1 1F                  255 	mov	a, _AT24C_write_sloc0_1_0+0
      0006E0 00 1D                  256 	or	a, p
      0006E2 00 53                  257 	cneqsn	a, #0x00
      0006E4 74 63                  258 	goto	00102$
                                    259 ;	pdk_24c.c: 18: return; // thoát ngay
      0006E6 7A 00                  260 	ret
      0006E8                        261 00102$:
                                    262 ;	pdk_24c.c: 26: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
      0006E8 00 26                  263 	clear	p
      0006EA AF 1F                  264 	mov	a, _AT24C_write_PARM_1+1
      0006EC 07 54                  265 	and	a, #0x07
      0006EE 50 55                  266 	or	a, #0x50
      0006F0 9A 17                  267 	mov	_I2C_beginTransmission_PARM_1+0, a
      0006F2 D0 72                  268 	call	_I2C_beginTransmission
                                    269 ;	pdk_24c.c: 27: I2C_write(address & 0xFF);
      0006F4 AE 1F                  270 	mov	a, _AT24C_write_PARM_1+0
      0006F6 9B 17                  271 	mov	_I2C_write_PARM_1+0, a
      0006F8 D8 72                  272 	call	_I2C_write
                                    273 ;	pdk_24c.c: 34: I2C_write(data);
      0006FA B0 1F                  274 	mov	a, _AT24C_write_PARM_2+0
      0006FC 9B 17                  275 	mov	_I2C_write_PARM_1+0, a
      0006FE D8 72                  276 	call	_I2C_write
                                    277 ;	pdk_24c.c: 35: I2C_endTransmission();
      000700 F1 72                  278 	call	_I2C_endTransmission
                                    279 ;	pdk_24c.c: 36: _delay_ms(5);
      000702 86 57                  280 	mov	a, #0x86
      000704 A8 17                  281 	mov	__delay_loop_16_PARM_1+0, a
      000706 13 57                  282 	mov	a, #0x13
      000708 A9 17                  283 	mov	__delay_loop_16_PARM_1+1, a
      00070A 49 63                  284 	goto	__delay_loop_16
                                    285 ;	pdk_24c.c: 37: }
      00070C 7A 00                  286 	ret
                                    287 ;	pdk_24c.c: 39: uint8_t AT24C_read(uint16_t address)
                                    288 ;	-----------------------------------------
                                    289 ;	 function AT24C_read
                                    290 ;	-----------------------------------------
      00070E                        291 _AT24C_read:
                                    292 ;	pdk_24c.c: 42: if (address >= MEM_BYTE)
      00070E B3 1F                  293 	mov	a, _AT24C_read_PARM_1+1
      000710 00 17                  294 	mov	p, a
      000712 04 51                  295 	sub	a, #0x04
      000714 80 30                  296 	t0sn	f, c
      000716 8D 63                  297 	goto	00102$
                                    298 ;	pdk_24c.c: 44: return 0; // thoát ngay
      000718 00 02                  299 	ret	#0x00
      00071A                        300 00102$:
                                    301 ;	pdk_24c.c: 56: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      00071A 00 26                  302 	clear	p
      00071C B3 1F                  303 	mov	a, _AT24C_read_PARM_1+1
      00071E 07 54                  304 	and	a, #0x07
      000720 50 55                  305 	or	a, #0x50
      000722 B4 17                  306 	mov	_AT24C_read_sloc1_1_0+0, a
      000724 9A 17                  307 	mov	_I2C_beginTransmission_PARM_1+0, a
      000726 D0 72                  308 	call	_I2C_beginTransmission
                                    309 ;	pdk_24c.c: 57: I2C_write(address & 0xFF);
      000728 B2 1F                  310 	mov	a, _AT24C_read_PARM_1+0
      00072A 9B 17                  311 	mov	_I2C_write_PARM_1+0, a
      00072C D8 72                  312 	call	_I2C_write
                                    313 ;	pdk_24c.c: 58: I2C_endTransmission();
      00072E F1 72                  314 	call	_I2C_endTransmission
                                    315 ;	pdk_24c.c: 59: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), 1);
      000730 B4 1F                  316 	mov	a, _AT24C_read_sloc1_1_0+0
      000732 A1 17                  317 	mov	_I2C_requestFrom_PARM_1+0, a
      000734 01 57                  318 	mov	a, #0x01
      000736 A2 17                  319 	mov	_I2C_requestFrom_PARM_2+0, a
      000738 00 73                  320 	call	_I2C_requestFrom
                                    321 ;	pdk_24c.c: 67: if (I2C_available())
      00073A 40 73                  322 	call	_I2C_available
      00073C 00 53                  323 	cneqsn	a, #0x00
      00073E A2 63                  324 	goto	00104$
                                    325 ;	pdk_24c.c: 69: data = I2C_read();
      000740 32 73                  326 	call	_I2C_read
                                    327 ;	pdk_24c.c: 70: return data;
      000742 7A 00                  328 	ret
      000744                        329 00104$:
                                    330 ;	pdk_24c.c: 72: return -1;
                                    331 ;	pdk_24c.c: 73: }
      000744 FF 02                  332 	ret	#0xff
                                    333 ;	pdk_24c.c: 77: void AT24C_erase(void)
                                    334 ;	-----------------------------------------
                                    335 ;	 function AT24C_erase
                                    336 ;	-----------------------------------------
      000746                        337 _AT24C_erase:
                                    338 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      000746 B5 26                  339 	clear	_AT24C_erase_sloc2_1_0+0
      000748 B6 26                  340 	clear	_AT24C_erase_sloc2_1_0+1
      00074A                        341 00105$:
      00074A B6 1F                  342 	mov	a, _AT24C_erase_sloc2_1_0+1
      00074C 00 17                  343 	mov	p, a
      00074E 04 51                  344 	sub	a, #0x04
      000750 80 34                  345 	t1sn	f, c
      000752 BB 63                  346 	goto	00107$
                                    347 ;	pdk_24c.c: 81: if ((AT24C_read(i) != 0xFF))
      000754 B5 1F                  348 	mov	a, _AT24C_erase_sloc2_1_0+0
      000756 B2 17                  349 	mov	_AT24C_read_PARM_1+0, a
      000758 B6 1F                  350 	mov	a, _AT24C_erase_sloc2_1_0+1
      00075A B3 17                  351 	mov	_AT24C_read_PARM_1+1, a
      00075C 87 73                  352 	call	_AT24C_read
      00075E FF 53                  353 	cneqsn	a, #0xff
      000760 B8 63                  354 	goto	00106$
      000762                        355 00122$:
                                    356 ;	pdk_24c.c: 83: AT24C_write(i, 0xFF);
      000762 B5 1F                  357 	mov	a, _AT24C_erase_sloc2_1_0+0
      000764 AE 17                  358 	mov	_AT24C_write_PARM_1+0, a
      000766 B6 1F                  359 	mov	a, _AT24C_erase_sloc2_1_0+1
      000768 AF 17                  360 	mov	_AT24C_write_PARM_1+1, a
      00076A FF 57                  361 	mov	a, #0xff
      00076C B0 17                  362 	mov	_AT24C_write_PARM_2+0, a
      00076E 5D 73                  363 	call	_AT24C_write
      000770                        364 00106$:
                                    365 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      000770 B5 24                  366 	inc	_AT24C_erase_sloc2_1_0+0
      000772 B6 20                  367 	addc	_AT24C_erase_sloc2_1_0+1
      000774 A5 63                  368 	goto	00105$
      000776                        369 00107$:
                                    370 ;	pdk_24c.c: 86: }
      000776 7A 00                  371 	ret
                                    372 ;	pdk_24c.c: 88: void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len)
                                    373 ;	-----------------------------------------
                                    374 ;	 function AT24C_writeBuf
                                    375 ;	-----------------------------------------
      000778                        376 _AT24C_writeBuf:
                                    377 ;	pdk_24c.c: 91: if ((address + len) >= MEM_BYTE)
      000778 00 26                  378 	clear	p
      00077A BB 1F                  379 	mov	a, _AT24C_writeBuf_PARM_3+0
      00077C 72 00                  380 	push	af
      00077E B7 1F                  381 	mov	a, _AT24C_writeBuf_PARM_1+0
      000780 BC 17                  382 	mov	_AT24C_writeBuf_sloc3_1_0+0, a
      000782 73 00                  383 	pop	af
      000784 72 00                  384 	push	af
      000786 B8 1F                  385 	mov	a, _AT24C_writeBuf_PARM_1+1
      000788 BD 17                  386 	mov	_AT24C_writeBuf_sloc3_1_0+1, a
      00078A 73 00                  387 	pop	af
      00078C BC 18                  388 	add	a, _AT24C_writeBuf_sloc3_1_0+0
      00078E 72 00                  389 	push	af
      000790 BD 1F                  390 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      000792 00 12                  391 	addc	p, a
      000794 73 00                  392 	pop	af
      000796 00 1F                  393 	mov	a, p
      000798 04 51                  394 	sub	a, #0x04
      00079A 80 30                  395 	t0sn	f, c
      00079C D2 63                  396 	goto	00111$
                                    397 ;	pdk_24c.c: 93: len = (MEM_BYTE - address);
      00079E B7 1F                  398 	mov	a, _AT24C_writeBuf_PARM_1+0
      0007A0 69 00                  399 	neg	a
      0007A2 BB 17                  400 	mov	_AT24C_writeBuf_PARM_3+0, a
                                    401 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0007A4                        402 00111$:
      0007A4 BE 26                  403 	clear	_AT24C_writeBuf_sloc4_1_0+0
      0007A6                        404 00105$:
      0007A6 BE 1F                  405 	mov	a, _AT24C_writeBuf_sloc4_1_0+0
      0007A8 BB 19                  406 	sub	a, _AT24C_writeBuf_PARM_3+0
      0007AA 80 34                  407 	t1sn	f, c
      0007AC E9 63                  408 	goto	00107$
                                    409 ;	pdk_24c.c: 98: AT24C_write(address + i, src[i]);
      0007AE BC 1F                  410 	mov	a, _AT24C_writeBuf_sloc3_1_0+0
      0007B0 BE 18                  411 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0007B2 00 17                  412 	mov	p, a
      0007B4 BD 1F                  413 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      0007B6 60 00                  414 	addc	a
      0007B8 AF 17                  415 	mov	_AT24C_write_PARM_1+1, a
      0007BA 00 1F                  416 	mov	a, p
      0007BC AE 17                  417 	mov	_AT24C_write_PARM_1+0, a
      0007BE B9 1F                  418 	mov	a, _AT24C_writeBuf_PARM_2+0
      0007C0 BE 18                  419 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0007C2 00 17                  420 	mov	p, a
      0007C4 BA 1F                  421 	mov	a, _AT24C_writeBuf_PARM_2+1
      0007C6 60 00                  422 	addc	a
      0007C8 19 75                  423 	call	__gptrget
      0007CA B0 17                  424 	mov	_AT24C_write_PARM_2+0, a
      0007CC 5D 73                  425 	call	_AT24C_write
                                    426 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0007CE BE 24                  427 	inc	_AT24C_writeBuf_sloc4_1_0+0
      0007D0 D3 63                  428 	goto	00105$
      0007D2                        429 00107$:
                                    430 ;	pdk_24c.c: 100: }
      0007D2 7A 00                  431 	ret
                                    432 ;	pdk_24c.c: 102: void AT24C_writeBuf2(uint16_t address, uint8_t *src, uint8_t len)
                                    433 ;	-----------------------------------------
                                    434 ;	 function AT24C_writeBuf2
                                    435 ;	-----------------------------------------
      0007D4                        436 _AT24C_writeBuf2:
                                    437 ;	pdk_24c.c: 105: if ((address + len) >= MEM_BYTE)
      0007D4 00 26                  438 	clear	p
      0007D6 C3 1F                  439 	mov	a, _AT24C_writeBuf2_PARM_3+0
      0007D8 72 00                  440 	push	af
      0007DA BF 1F                  441 	mov	a, _AT24C_writeBuf2_PARM_1+0
      0007DC C4 17                  442 	mov	_AT24C_writeBuf2_sloc5_1_0+0, a
      0007DE 73 00                  443 	pop	af
      0007E0 72 00                  444 	push	af
      0007E2 C0 1F                  445 	mov	a, _AT24C_writeBuf2_PARM_1+1
      0007E4 C5 17                  446 	mov	_AT24C_writeBuf2_sloc5_1_0+1, a
      0007E6 73 00                  447 	pop	af
      0007E8 C4 18                  448 	add	a, _AT24C_writeBuf2_sloc5_1_0+0
      0007EA 72 00                  449 	push	af
      0007EC C5 1F                  450 	mov	a, _AT24C_writeBuf2_sloc5_1_0+1
      0007EE 00 12                  451 	addc	p, a
      0007F0 73 00                  452 	pop	af
      0007F2 00 1F                  453 	mov	a, p
      0007F4 04 51                  454 	sub	a, #0x04
      0007F6 80 30                  455 	t0sn	f, c
      0007F8 00 64                  456 	goto	00102$
                                    457 ;	pdk_24c.c: 107: len = (MEM_BYTE - address);
      0007FA BF 1F                  458 	mov	a, _AT24C_writeBuf2_PARM_1+0
      0007FC 69 00                  459 	neg	a
      0007FE C3 17                  460 	mov	_AT24C_writeBuf2_PARM_3+0, a
      000800                        461 00102$:
                                    462 ;	pdk_24c.c: 115: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
      000800 00 26                  463 	clear	p
      000802 C0 1F                  464 	mov	a, _AT24C_writeBuf2_PARM_1+1
      000804 07 54                  465 	and	a, #0x07
      000806 50 55                  466 	or	a, #0x50
      000808 9A 17                  467 	mov	_I2C_beginTransmission_PARM_1+0, a
      00080A D0 72                  468 	call	_I2C_beginTransmission
                                    469 ;	pdk_24c.c: 116: I2C_write(address & 0xFF);
      00080C BF 1F                  470 	mov	a, _AT24C_writeBuf2_PARM_1+0
      00080E 9B 17                  471 	mov	_I2C_write_PARM_1+0, a
      000810 D8 72                  472 	call	_I2C_write
                                    473 ;	pdk_24c.c: 122: I2C_writeBuf(src, len);
      000812 C1 1F                  474 	mov	a, _AT24C_writeBuf2_PARM_2+0
      000814 9C 17                  475 	mov	_I2C_writeBuf_PARM_1+0, a
      000816 C2 1F                  476 	mov	a, _AT24C_writeBuf2_PARM_2+1
      000818 9D 17                  477 	mov	_I2C_writeBuf_PARM_1+1, a
      00081A C3 1F                  478 	mov	a, _AT24C_writeBuf2_PARM_3+0
      00081C 9E 17                  479 	mov	_I2C_writeBuf_PARM_2+0, a
      00081E E1 72                  480 	call	_I2C_writeBuf
                                    481 ;	pdk_24c.c: 124: I2C_endTransmission();
      000820 F1 72                  482 	call	_I2C_endTransmission
                                    483 ;	pdk_24c.c: 125: _delay_ms(5);
      000822 86 57                  484 	mov	a, #0x86
      000824 A8 17                  485 	mov	__delay_loop_16_PARM_1+0, a
      000826 13 57                  486 	mov	a, #0x13
      000828 A9 17                  487 	mov	__delay_loop_16_PARM_1+1, a
      00082A 49 63                  488 	goto	__delay_loop_16
                                    489 ;	pdk_24c.c: 126: }
      00082C 7A 00                  490 	ret
                                    491 ;	pdk_24c.c: 128: void AT24C_readBuf(uint16_t address, uint8_t *dest, int len)
                                    492 ;	-----------------------------------------
                                    493 ;	 function AT24C_readBuf
                                    494 ;	-----------------------------------------
      00082E                        495 _AT24C_readBuf:
                                    496 ;	pdk_24c.c: 133: if ((address + len) >= MEM_BYTE)
      00082E C6 1F                  497 	mov	a, _AT24C_readBuf_PARM_1+0
      000830 CC 17                  498 	mov	_AT24C_readBuf_sloc6_1_0+0, a
      000832 C7 1F                  499 	mov	a, _AT24C_readBuf_PARM_1+1
      000834 CD 17                  500 	mov	_AT24C_readBuf_sloc6_1_0+1, a
      000836 CB 1F                  501 	mov	a, _AT24C_readBuf_PARM_3+1
      000838 00 17                  502 	mov	p, a
      00083A CA 1F                  503 	mov	a, _AT24C_readBuf_PARM_3+0
      00083C CC 18                  504 	add	a, _AT24C_readBuf_sloc6_1_0+0
      00083E 72 00                  505 	push	af
      000840 CD 1F                  506 	mov	a, _AT24C_readBuf_sloc6_1_0+1
      000842 00 12                  507 	addc	p, a
      000844 73 00                  508 	pop	af
      000846 00 1F                  509 	mov	a, p
      000848 04 51                  510 	sub	a, #0x04
      00084A 80 30                  511 	t0sn	f, c
      00084C 2F 64                  512 	goto	00102$
                                    513 ;	pdk_24c.c: 135: len = (MEM_BYTE - address);
      00084E 00 57                  514 	mov	a, #0x00
      000850 C6 19                  515 	sub	a, _AT24C_readBuf_PARM_1+0
      000852 00 17                  516 	mov	p, a
      000854 04 57                  517 	mov	a, #0x04
      000856 C7 1B                  518 	subc	a, _AT24C_readBuf_PARM_1+1
      000858 CB 17                  519 	mov	_AT24C_readBuf_PARM_3+1, a
      00085A 00 1F                  520 	mov	a, p
      00085C CA 17                  521 	mov	_AT24C_readBuf_PARM_3+0, a
      00085E                        522 00102$:
                                    523 ;	pdk_24c.c: 144: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      00085E 00 26                  524 	clear	p
      000860 C7 1F                  525 	mov	a, _AT24C_readBuf_PARM_1+1
      000862 07 54                  526 	and	a, #0x07
      000864 50 55                  527 	or	a, #0x50
      000866 CE 17                  528 	mov	_AT24C_readBuf_sloc7_1_0+0, a
      000868 9A 17                  529 	mov	_I2C_beginTransmission_PARM_1+0, a
      00086A D0 72                  530 	call	_I2C_beginTransmission
                                    531 ;	pdk_24c.c: 145: I2C_write(address & 0xFF);
      00086C C6 1F                  532 	mov	a, _AT24C_readBuf_PARM_1+0
      00086E 9B 17                  533 	mov	_I2C_write_PARM_1+0, a
      000870 D8 72                  534 	call	_I2C_write
                                    535 ;	pdk_24c.c: 146: I2C_endTransmission();
      000872 F1 72                  536 	call	_I2C_endTransmission
                                    537 ;	pdk_24c.c: 147: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), len);
      000874 CA 1F                  538 	mov	a, _AT24C_readBuf_PARM_3+0
      000876 A2 17                  539 	mov	_I2C_requestFrom_PARM_2+0, a
      000878 CE 1F                  540 	mov	a, _AT24C_readBuf_sloc7_1_0+0
      00087A A1 17                  541 	mov	_I2C_requestFrom_PARM_1+0, a
      00087C 00 73                  542 	call	_I2C_requestFrom
                                    543 ;	pdk_24c.c: 155: while (I2C_available())
      00087E C8 1F                  544 	mov	a, _AT24C_readBuf_PARM_2+0
      000880 CF 17                  545 	mov	_AT24C_readBuf_sloc8_1_0+0, a
      000882 C9 1F                  546 	mov	a, _AT24C_readBuf_PARM_2+1
      000884 D0 17                  547 	mov	_AT24C_readBuf_sloc8_1_0+1, a
      000886                        548 00103$:
      000886 40 73                  549 	call	_I2C_available
      000888 00 53                  550 	cneqsn	a, #0x00
      00088A 4E 64                  551 	goto	00106$
                                    552 ;	pdk_24c.c: 157: *dest++ = I2C_read();
      00088C 32 73                  553 	call	_I2C_read
      00088E 00 17                  554 	mov	p, a
      000890 CF 1F                  555 	mov	a, _AT24C_readBuf_sloc8_1_0+0
      000892 00 27                  556 	xch	a, p
      000894 00 07                  557 	idxm	p, a
      000896 CF 24                  558 	inc	_AT24C_readBuf_sloc8_1_0+0
      000898 D0 20                  559 	addc	_AT24C_readBuf_sloc8_1_0+1
      00089A 43 64                  560 	goto	00103$
      00089C                        561 00106$:
                                    562 ;	pdk_24c.c: 159: }
      00089C 7A 00                  563 	ret
                                    564 	.area CODE
                                    565 	.area CONST
                                    566 	.area CABS (ABS)
