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
      0000A2                        164 _AT24C_write_PARM_1:
      0000A2                        165 	.ds 2
      0000A4                        166 _AT24C_write_PARM_2:
      0000A4                        167 	.ds 1
      0000A5                        168 _AT24C_write_sloc0_1_0:
      0000A5                        169 	.ds 1
      0000A6                        170 _AT24C_read_PARM_1:
      0000A6                        171 	.ds 2
      0000A8                        172 _AT24C_read_sloc1_1_0:
      0000A8                        173 	.ds 1
      0000A9                        174 _AT24C_erase_sloc2_1_0:
      0000A9                        175 	.ds 2
      0000AB                        176 _AT24C_writeBuf_PARM_1:
      0000AB                        177 	.ds 2
      0000AD                        178 _AT24C_writeBuf_PARM_2:
      0000AD                        179 	.ds 2
      0000AF                        180 _AT24C_writeBuf_PARM_3:
      0000AF                        181 	.ds 1
      0000B0                        182 _AT24C_writeBuf_sloc3_1_0:
      0000B0                        183 	.ds 2
      0000B2                        184 _AT24C_writeBuf_sloc4_1_0:
      0000B2                        185 	.ds 1
      0000B3                        186 _AT24C_writeBuf2_PARM_1:
      0000B3                        187 	.ds 2
      0000B5                        188 _AT24C_writeBuf2_PARM_2:
      0000B5                        189 	.ds 2
      0000B7                        190 _AT24C_writeBuf2_PARM_3:
      0000B7                        191 	.ds 1
      0000B8                        192 _AT24C_writeBuf2_sloc5_1_0:
      0000B8                        193 	.ds 2
      0000BA                        194 _AT24C_readBuf_PARM_1:
      0000BA                        195 	.ds 2
      0000BC                        196 _AT24C_readBuf_PARM_2:
      0000BC                        197 	.ds 2
      0000BE                        198 _AT24C_readBuf_PARM_3:
      0000BE                        199 	.ds 2
      0000C0                        200 _AT24C_readBuf_sloc6_1_0:
      0000C0                        201 	.ds 2
      0000C2                        202 _AT24C_readBuf_sloc7_1_0:
      0000C2                        203 	.ds 1
      0000C3                        204 _AT24C_readBuf_sloc8_1_0:
      0000C3                        205 	.ds 2
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
      0005C8                        233 _AT24C_write:
                                    234 ;	pdk_24c.c: 16: if ((address >= MEM_BYTE) | (AT24C_read(address) == data))
      0005C8 A3 1F                  235 	mov	a, _AT24C_write_PARM_1+1
      0005CA 00 17                  236 	mov	p, a
      0005CC 04 51                  237 	sub	a, #0x04
      0005CE 00 57                  238 	mov	a, #0x00
      0005D0 6D 00                  239 	slc	a
      0005D2 01 56                  240 	xor	a, #0x01
      0005D4 A5 17                  241 	mov	_AT24C_write_sloc0_1_0+0, a
      0005D6 A2 1F                  242 	mov	a, _AT24C_write_PARM_1+0
      0005D8 A6 17                  243 	mov	_AT24C_read_PARM_1+0, a
      0005DA A3 1F                  244 	mov	a, _AT24C_write_PARM_1+1
      0005DC A7 17                  245 	mov	_AT24C_read_PARM_1+1, a
      0005DE 0D 73                  246 	call	_AT24C_read
      0005E0 A4 2E                  247 	ceqsn	a, _AT24C_write_PARM_2+0
      0005E2 F5 62                  248 	goto	00109$
      0005E4 01 57                  249 	mov	a, #0x01
      0005E6 00 17                  250 	mov	p, a
      0005E8 F6 62                  251 	goto	00110$
      0005EA                        252 00109$:
      0005EA 00 26                  253 	clear	p
      0005EC                        254 00110$:
      0005EC A5 1F                  255 	mov	a, _AT24C_write_sloc0_1_0+0
      0005EE 00 1D                  256 	or	a, p
      0005F0 00 53                  257 	cneqsn	a, #0x00
      0005F2 FB 62                  258 	goto	00102$
                                    259 ;	pdk_24c.c: 18: return; // thoát ngay
      0005F4 7A 00                  260 	ret
      0005F6                        261 00102$:
                                    262 ;	pdk_24c.c: 26: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
      0005F6 A3 1F                  263 	mov	a, _AT24C_write_PARM_1+1
      0005F8 07 54                  264 	and	a, #0x07
      0005FA 50 55                  265 	or	a, #0x50
      0005FC 8E 17                  266 	mov	_I2C_beginTransmission_PARM_1+0, a
      0005FE 57 72                  267 	call	_I2C_beginTransmission
                                    268 ;	pdk_24c.c: 27: I2C_write(address & 0xFF);
      000600 A2 1F                  269 	mov	a, _AT24C_write_PARM_1+0
      000602 8F 17                  270 	mov	_I2C_write_PARM_1+0, a
      000604 5F 72                  271 	call	_I2C_write
                                    272 ;	pdk_24c.c: 34: I2C_write(data);
      000606 A4 1F                  273 	mov	a, _AT24C_write_PARM_2+0
      000608 8F 17                  274 	mov	_I2C_write_PARM_1+0, a
      00060A 5F 72                  275 	call	_I2C_write
                                    276 ;	pdk_24c.c: 35: I2C_endTransmission();
      00060C 78 72                  277 	call	_I2C_endTransmission
                                    278 ;	pdk_24c.c: 36: _delay_ms(5);
      00060E 86 57                  279 	mov	a, #0x86
      000610 9C 17                  280 	mov	__delay_loop_16_PARM_1+0, a
      000612 13 57                  281 	mov	a, #0x13
      000614 9D 17                  282 	mov	__delay_loop_16_PARM_1+1, a
      000616 D0 62                  283 	goto	__delay_loop_16
                                    284 ;	pdk_24c.c: 37: }
      000618 7A 00                  285 	ret
                                    286 ;	pdk_24c.c: 39: uint8_t AT24C_read(uint16_t address)
                                    287 ;	-----------------------------------------
                                    288 ;	 function AT24C_read
                                    289 ;	-----------------------------------------
      00061A                        290 _AT24C_read:
                                    291 ;	pdk_24c.c: 42: if (address >= MEM_BYTE)
      00061A A7 1F                  292 	mov	a, _AT24C_read_PARM_1+1
      00061C 00 17                  293 	mov	p, a
      00061E 04 51                  294 	sub	a, #0x04
      000620 80 30                  295 	t0sn.io	f, c
      000622 13 63                  296 	goto	00102$
                                    297 ;	pdk_24c.c: 44: return 0; // thoát ngay
      000624 00 02                  298 	ret	#0x00
      000626                        299 00102$:
                                    300 ;	pdk_24c.c: 56: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      000626 A7 1F                  301 	mov	a, _AT24C_read_PARM_1+1
      000628 07 54                  302 	and	a, #0x07
      00062A 50 55                  303 	or	a, #0x50
      00062C A8 17                  304 	mov	_AT24C_read_sloc1_1_0+0, a
      00062E 8E 17                  305 	mov	_I2C_beginTransmission_PARM_1+0, a
      000630 57 72                  306 	call	_I2C_beginTransmission
                                    307 ;	pdk_24c.c: 57: I2C_write(address & 0xFF);
      000632 A6 1F                  308 	mov	a, _AT24C_read_PARM_1+0
      000634 8F 17                  309 	mov	_I2C_write_PARM_1+0, a
      000636 5F 72                  310 	call	_I2C_write
                                    311 ;	pdk_24c.c: 58: I2C_endTransmission();
      000638 78 72                  312 	call	_I2C_endTransmission
                                    313 ;	pdk_24c.c: 59: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), 1);
      00063A A8 1F                  314 	mov	a, _AT24C_read_sloc1_1_0+0
      00063C 95 17                  315 	mov	_I2C_requestFrom_PARM_1+0, a
      00063E 01 57                  316 	mov	a, #0x01
      000640 96 17                  317 	mov	_I2C_requestFrom_PARM_2+0, a
      000642 87 72                  318 	call	_I2C_requestFrom
                                    319 ;	pdk_24c.c: 67: if (I2C_available())
      000644 C7 72                  320 	call	_I2C_available
      000646 00 53                  321 	cneqsn	a, #0x00
      000648 27 63                  322 	goto	00104$
                                    323 ;	pdk_24c.c: 69: data = I2C_read();
      00064A B9 72                  324 	call	_I2C_read
                                    325 ;	pdk_24c.c: 70: return data;
      00064C 7A 00                  326 	ret
      00064E                        327 00104$:
                                    328 ;	pdk_24c.c: 72: return -1;
                                    329 ;	pdk_24c.c: 73: }
      00064E FF 02                  330 	ret	#0xff
                                    331 ;	pdk_24c.c: 77: void AT24C_erase(void)
                                    332 ;	-----------------------------------------
                                    333 ;	 function AT24C_erase
                                    334 ;	-----------------------------------------
      000650                        335 _AT24C_erase:
                                    336 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      000650 A9 26                  337 	clear	_AT24C_erase_sloc2_1_0+0
      000652 AA 26                  338 	clear	_AT24C_erase_sloc2_1_0+1
      000654                        339 00105$:
      000654 AA 1F                  340 	mov	a, _AT24C_erase_sloc2_1_0+1
      000656 00 17                  341 	mov	p, a
      000658 04 51                  342 	sub	a, #0x04
      00065A 80 34                  343 	t1sn.io	f, c
      00065C 40 63                  344 	goto	00107$
                                    345 ;	pdk_24c.c: 81: if ((AT24C_read(i) != 0xFF))
      00065E A9 1F                  346 	mov	a, _AT24C_erase_sloc2_1_0+0
      000660 A6 17                  347 	mov	_AT24C_read_PARM_1+0, a
      000662 AA 1F                  348 	mov	a, _AT24C_erase_sloc2_1_0+1
      000664 A7 17                  349 	mov	_AT24C_read_PARM_1+1, a
      000666 0D 73                  350 	call	_AT24C_read
      000668 FF 53                  351 	cneqsn	a, #0xff
      00066A 3D 63                  352 	goto	00106$
      00066C                        353 00122$:
                                    354 ;	pdk_24c.c: 83: AT24C_write(i, 0xFF);
      00066C A9 1F                  355 	mov	a, _AT24C_erase_sloc2_1_0+0
      00066E A2 17                  356 	mov	_AT24C_write_PARM_1+0, a
      000670 AA 1F                  357 	mov	a, _AT24C_erase_sloc2_1_0+1
      000672 A3 17                  358 	mov	_AT24C_write_PARM_1+1, a
      000674 FF 57                  359 	mov	a, #0xff
      000676 A4 17                  360 	mov	_AT24C_write_PARM_2+0, a
      000678 E4 72                  361 	call	_AT24C_write
      00067A                        362 00106$:
                                    363 ;	pdk_24c.c: 79: for (uint16_t i = 0; i < MEM_BYTE; i++)
      00067A A9 24                  364 	inc	_AT24C_erase_sloc2_1_0+0
      00067C AA 20                  365 	addc	_AT24C_erase_sloc2_1_0+1
      00067E 2A 63                  366 	goto	00105$
      000680                        367 00107$:
                                    368 ;	pdk_24c.c: 86: }
      000680 7A 00                  369 	ret
                                    370 ;	pdk_24c.c: 88: void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len)
                                    371 ;	-----------------------------------------
                                    372 ;	 function AT24C_writeBuf
                                    373 ;	-----------------------------------------
      000682                        374 _AT24C_writeBuf:
                                    375 ;	pdk_24c.c: 91: if ((address + len) >= MEM_BYTE)
      000682 00 26                  376 	clear	p
      000684 AF 1F                  377 	mov	a, _AT24C_writeBuf_PARM_3+0
      000686 72 00                  378 	push	af
      000688 AB 1F                  379 	mov	a, _AT24C_writeBuf_PARM_1+0
      00068A B0 17                  380 	mov	_AT24C_writeBuf_sloc3_1_0+0, a
      00068C 73 00                  381 	pop	af
      00068E 72 00                  382 	push	af
      000690 AC 1F                  383 	mov	a, _AT24C_writeBuf_PARM_1+1
      000692 B1 17                  384 	mov	_AT24C_writeBuf_sloc3_1_0+1, a
      000694 73 00                  385 	pop	af
      000696 B0 18                  386 	add	a, _AT24C_writeBuf_sloc3_1_0+0
      000698 72 00                  387 	push	af
      00069A B1 1F                  388 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      00069C 00 12                  389 	addc	p, a
      00069E 73 00                  390 	pop	af
      0006A0 00 1F                  391 	mov	a, p
      0006A2 04 51                  392 	sub	a, #0x04
      0006A4 80 30                  393 	t0sn.io	f, c
      0006A6 57 63                  394 	goto	00111$
                                    395 ;	pdk_24c.c: 93: len = (MEM_BYTE - address);
      0006A8 AB 1F                  396 	mov	a, _AT24C_writeBuf_PARM_1+0
      0006AA 69 00                  397 	neg	a
      0006AC AF 17                  398 	mov	_AT24C_writeBuf_PARM_3+0, a
                                    399 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0006AE                        400 00111$:
      0006AE B2 26                  401 	clear	_AT24C_writeBuf_sloc4_1_0+0
      0006B0                        402 00105$:
      0006B0 B2 1F                  403 	mov	a, _AT24C_writeBuf_sloc4_1_0+0
      0006B2 AF 19                  404 	sub	a, _AT24C_writeBuf_PARM_3+0
      0006B4 80 34                  405 	t1sn.io	f, c
      0006B6 6E 63                  406 	goto	00107$
                                    407 ;	pdk_24c.c: 98: AT24C_write(address + i, src[i]);
      0006B8 B0 1F                  408 	mov	a, _AT24C_writeBuf_sloc3_1_0+0
      0006BA B2 18                  409 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0006BC 00 17                  410 	mov	p, a
      0006BE B1 1F                  411 	mov	a, _AT24C_writeBuf_sloc3_1_0+1
      0006C0 60 00                  412 	addc	a
      0006C2 A3 17                  413 	mov	_AT24C_write_PARM_1+1, a
      0006C4 00 1F                  414 	mov	a, p
      0006C6 A2 17                  415 	mov	_AT24C_write_PARM_1+0, a
      0006C8 AD 1F                  416 	mov	a, _AT24C_writeBuf_PARM_2+0
      0006CA B2 18                  417 	add	a, _AT24C_writeBuf_sloc4_1_0+0
      0006CC 00 17                  418 	mov	p, a
      0006CE AE 1F                  419 	mov	a, _AT24C_writeBuf_PARM_2+1
      0006D0 60 00                  420 	addc	a
      0006D2 99 74                  421 	call	__gptrget
      0006D4 A4 17                  422 	mov	_AT24C_write_PARM_2+0, a
      0006D6 E4 72                  423 	call	_AT24C_write
                                    424 ;	pdk_24c.c: 96: for (uint8_t i = 0; i < len; i++)
      0006D8 B2 24                  425 	inc	_AT24C_writeBuf_sloc4_1_0+0
      0006DA 58 63                  426 	goto	00105$
      0006DC                        427 00107$:
                                    428 ;	pdk_24c.c: 100: }
      0006DC 7A 00                  429 	ret
                                    430 ;	pdk_24c.c: 102: void AT24C_writeBuf2(uint16_t address, uint8_t *src, uint8_t len)
                                    431 ;	-----------------------------------------
                                    432 ;	 function AT24C_writeBuf2
                                    433 ;	-----------------------------------------
      0006DE                        434 _AT24C_writeBuf2:
                                    435 ;	pdk_24c.c: 105: if ((address + len) >= MEM_BYTE)
      0006DE 00 26                  436 	clear	p
      0006E0 B7 1F                  437 	mov	a, _AT24C_writeBuf2_PARM_3+0
      0006E2 72 00                  438 	push	af
      0006E4 B3 1F                  439 	mov	a, _AT24C_writeBuf2_PARM_1+0
      0006E6 B8 17                  440 	mov	_AT24C_writeBuf2_sloc5_1_0+0, a
      0006E8 73 00                  441 	pop	af
      0006EA 72 00                  442 	push	af
      0006EC B4 1F                  443 	mov	a, _AT24C_writeBuf2_PARM_1+1
      0006EE B9 17                  444 	mov	_AT24C_writeBuf2_sloc5_1_0+1, a
      0006F0 73 00                  445 	pop	af
      0006F2 B8 18                  446 	add	a, _AT24C_writeBuf2_sloc5_1_0+0
      0006F4 72 00                  447 	push	af
      0006F6 B9 1F                  448 	mov	a, _AT24C_writeBuf2_sloc5_1_0+1
      0006F8 00 12                  449 	addc	p, a
      0006FA 73 00                  450 	pop	af
      0006FC 00 1F                  451 	mov	a, p
      0006FE 04 51                  452 	sub	a, #0x04
      000700 80 30                  453 	t0sn.io	f, c
      000702 85 63                  454 	goto	00102$
                                    455 ;	pdk_24c.c: 107: len = (MEM_BYTE - address);
      000704 B3 1F                  456 	mov	a, _AT24C_writeBuf2_PARM_1+0
      000706 69 00                  457 	neg	a
      000708 B7 17                  458 	mov	_AT24C_writeBuf2_PARM_3+0, a
      00070A                        459 00102$:
                                    460 ;	pdk_24c.c: 115: I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
      00070A B4 1F                  461 	mov	a, _AT24C_writeBuf2_PARM_1+1
      00070C 07 54                  462 	and	a, #0x07
      00070E 50 55                  463 	or	a, #0x50
      000710 8E 17                  464 	mov	_I2C_beginTransmission_PARM_1+0, a
      000712 57 72                  465 	call	_I2C_beginTransmission
                                    466 ;	pdk_24c.c: 116: I2C_write(address & 0xFF);
      000714 B3 1F                  467 	mov	a, _AT24C_writeBuf2_PARM_1+0
      000716 8F 17                  468 	mov	_I2C_write_PARM_1+0, a
      000718 5F 72                  469 	call	_I2C_write
                                    470 ;	pdk_24c.c: 122: I2C_writeBuf(src, len);
      00071A B5 1F                  471 	mov	a, _AT24C_writeBuf2_PARM_2+0
      00071C 90 17                  472 	mov	_I2C_writeBuf_PARM_1+0, a
      00071E B6 1F                  473 	mov	a, _AT24C_writeBuf2_PARM_2+1
      000720 91 17                  474 	mov	_I2C_writeBuf_PARM_1+1, a
      000722 B7 1F                  475 	mov	a, _AT24C_writeBuf2_PARM_3+0
      000724 92 17                  476 	mov	_I2C_writeBuf_PARM_2+0, a
      000726 68 72                  477 	call	_I2C_writeBuf
                                    478 ;	pdk_24c.c: 124: I2C_endTransmission();
      000728 78 72                  479 	call	_I2C_endTransmission
                                    480 ;	pdk_24c.c: 125: _delay_ms(5);
      00072A 86 57                  481 	mov	a, #0x86
      00072C 9C 17                  482 	mov	__delay_loop_16_PARM_1+0, a
      00072E 13 57                  483 	mov	a, #0x13
      000730 9D 17                  484 	mov	__delay_loop_16_PARM_1+1, a
      000732 D0 62                  485 	goto	__delay_loop_16
                                    486 ;	pdk_24c.c: 126: }
      000734 7A 00                  487 	ret
                                    488 ;	pdk_24c.c: 128: void AT24C_readBuf(uint16_t address, uint8_t *dest, int len)
                                    489 ;	-----------------------------------------
                                    490 ;	 function AT24C_readBuf
                                    491 ;	-----------------------------------------
      000736                        492 _AT24C_readBuf:
                                    493 ;	pdk_24c.c: 133: if ((address + len) >= MEM_BYTE)
      000736 BA 1F                  494 	mov	a, _AT24C_readBuf_PARM_1+0
      000738 C0 17                  495 	mov	_AT24C_readBuf_sloc6_1_0+0, a
      00073A BB 1F                  496 	mov	a, _AT24C_readBuf_PARM_1+1
      00073C C1 17                  497 	mov	_AT24C_readBuf_sloc6_1_0+1, a
      00073E BF 1F                  498 	mov	a, _AT24C_readBuf_PARM_3+1
      000740 00 17                  499 	mov	p, a
      000742 BE 1F                  500 	mov	a, _AT24C_readBuf_PARM_3+0
      000744 C0 18                  501 	add	a, _AT24C_readBuf_sloc6_1_0+0
      000746 72 00                  502 	push	af
      000748 C1 1F                  503 	mov	a, _AT24C_readBuf_sloc6_1_0+1
      00074A 00 12                  504 	addc	p, a
      00074C 73 00                  505 	pop	af
      00074E 00 1F                  506 	mov	a, p
      000750 04 51                  507 	sub	a, #0x04
      000752 80 30                  508 	t0sn.io	f, c
      000754 B3 63                  509 	goto	00102$
                                    510 ;	pdk_24c.c: 135: len = (MEM_BYTE - address);
      000756 00 57                  511 	mov	a, #0x00
      000758 BA 19                  512 	sub	a, _AT24C_readBuf_PARM_1+0
      00075A 00 17                  513 	mov	p, a
      00075C 04 57                  514 	mov	a, #0x04
      00075E BB 1B                  515 	subc	a, _AT24C_readBuf_PARM_1+1
      000760 BF 17                  516 	mov	_AT24C_readBuf_PARM_3+1, a
      000762 00 1F                  517 	mov	a, p
      000764 BE 17                  518 	mov	_AT24C_readBuf_PARM_3+0, a
      000766                        519 00102$:
                                    520 ;	pdk_24c.c: 144: I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
      000766 BB 1F                  521 	mov	a, _AT24C_readBuf_PARM_1+1
      000768 07 54                  522 	and	a, #0x07
      00076A 50 55                  523 	or	a, #0x50
      00076C C2 17                  524 	mov	_AT24C_readBuf_sloc7_1_0+0, a
      00076E 8E 17                  525 	mov	_I2C_beginTransmission_PARM_1+0, a
      000770 57 72                  526 	call	_I2C_beginTransmission
                                    527 ;	pdk_24c.c: 145: I2C_write(address & 0xFF);
      000772 BA 1F                  528 	mov	a, _AT24C_readBuf_PARM_1+0
      000774 8F 17                  529 	mov	_I2C_write_PARM_1+0, a
      000776 5F 72                  530 	call	_I2C_write
                                    531 ;	pdk_24c.c: 146: I2C_endTransmission();
      000778 78 72                  532 	call	_I2C_endTransmission
                                    533 ;	pdk_24c.c: 147: I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), len);
      00077A BE 1F                  534 	mov	a, _AT24C_readBuf_PARM_3+0
      00077C 96 17                  535 	mov	_I2C_requestFrom_PARM_2+0, a
      00077E C2 1F                  536 	mov	a, _AT24C_readBuf_sloc7_1_0+0
      000780 95 17                  537 	mov	_I2C_requestFrom_PARM_1+0, a
      000782 87 72                  538 	call	_I2C_requestFrom
                                    539 ;	pdk_24c.c: 155: while (I2C_available())
      000784 BC 1F                  540 	mov	a, _AT24C_readBuf_PARM_2+0
      000786 C3 17                  541 	mov	_AT24C_readBuf_sloc8_1_0+0, a
      000788 BD 1F                  542 	mov	a, _AT24C_readBuf_PARM_2+1
      00078A C4 17                  543 	mov	_AT24C_readBuf_sloc8_1_0+1, a
      00078C                        544 00103$:
      00078C C7 72                  545 	call	_I2C_available
      00078E 00 53                  546 	cneqsn	a, #0x00
      000790 D1 63                  547 	goto	00106$
                                    548 ;	pdk_24c.c: 157: *dest++ = I2C_read();
      000792 B9 72                  549 	call	_I2C_read
      000794 00 17                  550 	mov	p, a
      000796 C3 1F                  551 	mov	a, _AT24C_readBuf_sloc8_1_0+0
      000798 00 27                  552 	xch	a, p
      00079A 00 07                  553 	idxm	p, a
      00079C C3 24                  554 	inc	_AT24C_readBuf_sloc8_1_0+0
      00079E C4 20                  555 	addc	_AT24C_readBuf_sloc8_1_0+1
      0007A0 C6 63                  556 	goto	00103$
      0007A2                        557 00106$:
                                    558 ;	pdk_24c.c: 159: }
      0007A2 7A 00                  559 	ret
                                    560 	.area CODE
                                    561 	.area CONST
                                    562 	.area CABS (ABS)
