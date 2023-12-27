                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_lcdi2c
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
                                     16 	.globl _I2C_endTransmission
                                     17 	.globl _I2C_write
                                     18 	.globl _I2C_beginTransmission
                                     19 	.globl _I2C_begin
                                     20 	.globl __delay_loop_32
                                     21 	.globl __delay_loop_16
                                     22 	.globl __delay_loop_8
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
                                     79 	.globl _LCDI2C_blackLight_PARM_1
                                     80 	.globl _LCDI2C_print_PARM_1
                                     81 	.globl _LCDI2C_putC_PARM_1
                                     82 	.globl _LCDI2C_goTo_PARM_2
                                     83 	.globl _LCDI2C_goTo_PARM_1
                                     84 	.globl _LCDI2C_writeData_PARM_1
                                     85 	.globl _LCDI2C_writeCommand_PARM_1
                                     86 	.globl _LCDI2C_write8_PARM_1
                                     87 	.globl _lcdReg
                                     88 	.globl _LCDI2C_config
                                     89 	.globl _LCDI2C_write8
                                     90 	.globl _LCDI2C_writeCommand
                                     91 	.globl _LCDI2C_writeData
                                     92 	.globl _LCDI2C_goTo
                                     93 	.globl _LCDI2C_putC
                                     94 	.globl _LCDI2C_print
                                     95 	.globl _LCDI2C_blackLight
                                     96 ;--------------------------------------------------------
                                     97 ; special function registers
                                     98 ;--------------------------------------------------------
                                     99 	.area RSEG (ABS)
      000004                        100 	.org 0x0000
                           000000   101 __flag	=	0x0000
                           000002   102 __sp	=	0x0002
                           000003   103 __clkmd	=	0x0003
                           000004   104 __inten	=	0x0004
                           000005   105 __intrq	=	0x0005
                           000006   106 __t16m	=	0x0006
                           00000A   107 __eoscr	=	0x000a
                           00000B   108 __ihrcr	=	0x000b
                           00000C   109 __integs	=	0x000c
                           00000D   110 __padier	=	0x000d
                           00000E   111 __pbdier	=	0x000e
                           00000F   112 __pcdier	=	0x000f
                           000010   113 __pa	=	0x0010
                           000011   114 __pac	=	0x0011
                           000012   115 __paph	=	0x0012
                           000013   116 __pb	=	0x0013
                           000014   117 __pbc	=	0x0014
                           000015   118 __pbph	=	0x0015
                           000016   119 __pc	=	0x0016
                           000017   120 __pcc	=	0x0017
                           000018   121 __pcph	=	0x0018
                           000019   122 __pbpl	=	0x0019
                           00001A   123 __pcpl	=	0x001a
                           000020   124 __adcc	=	0x0020
                           000021   125 __adcm	=	0x0021
                           000022   126 __adcr	=	0x0022
                           000024   127 __adcrgc	=	0x0024
                           000026   128 __misc	=	0x0026
                           000027   129 __misc2	=	0x0027
                           000028   130 __misclvr	=	0x0028
                           00002B   131 __gpcc	=	0x002b
                           00002C   132 __gpcs	=	0x002c
                           000030   133 __tm2c	=	0x0030
                           000031   134 __tm2ct	=	0x0031
                           000032   135 __tm2s	=	0x0032
                           000033   136 __tm2b	=	0x0033
                           000034   137 __tm3c	=	0x0034
                           000035   138 __tm3ct	=	0x0035
                           000036   139 __tm3s	=	0x0036
                           000037   140 __tm3b	=	0x0037
                           000040   141 __pwmg0c	=	0x0040
                           000041   142 __pwmgclk	=	0x0041
                           000042   143 __pwmg0dth	=	0x0042
                           000043   144 __pwmg0dtl	=	0x0043
                           000044   145 __pwmgcubh	=	0x0044
                           000045   146 __pwmgcubl	=	0x0045
                           000046   147 __pwmg1c	=	0x0046
                           000048   148 __pwmg1dth	=	0x0048
                           000049   149 __pwmg1dtl	=	0x0049
                           00004C   150 __pwmg2c	=	0x004c
                           00004E   151 __pwmg2dth	=	0x004e
                           00004F   152 __pwmg2dtl	=	0x004f
                           000062   153 __ilrcr	=	0x0062
                           000063   154 __bgtr	=	0x0063
                           000067   155 __rop	=	0x0067
      000004                        156 __t16c::
      000004                        157 	.ds 2
                                    158 ;--------------------------------------------------------
                                    159 ; ram data
                                    160 ;--------------------------------------------------------
                                    161 	.area DATA
      00008D                        162 _lcdReg::
      00008D                        163 	.ds 1
      00008E                        164 _LCDI2C_write8_PARM_1:
      00008E                        165 	.ds 1
      00008F                        166 _LCDI2C_writeCommand_PARM_1:
      00008F                        167 	.ds 1
      000090                        168 _LCDI2C_writeCommand_sloc0_1_0:
      000090                        169 	.ds 1
      000091                        170 _LCDI2C_writeCommand_sloc1_1_0:
      000091                        171 	.ds 1
      000092                        172 _LCDI2C_writeData_PARM_1:
      000092                        173 	.ds 1
      000093                        174 _LCDI2C_writeData_sloc2_1_0:
      000093                        175 	.ds 1
      000094                        176 _LCDI2C_writeData_sloc3_1_0:
      000094                        177 	.ds 1
      000095                        178 _LCDI2C_goTo_PARM_1:
      000095                        179 	.ds 1
      000096                        180 _LCDI2C_goTo_PARM_2:
      000096                        181 	.ds 1
      000097                        182 _LCDI2C_goTo_sloc4_1_0:
      000097                        183 	.ds 1
      000098                        184 _LCDI2C_putC_PARM_1:
      000098                        185 	.ds 1
      000099                        186 _LCDI2C_print_PARM_1:
      000099                        187 	.ds 2
      00009B                        188 _LCDI2C_print_sloc5_1_0:
      00009B                        189 	.ds 2
      00009D                        190 _LCDI2C_blackLight_PARM_1:
      00009D                        191 	.ds 1
                                    192 ;--------------------------------------------------------
                                    193 ; overlayable items in ram
                                    194 ;--------------------------------------------------------
                                    195 ;--------------------------------------------------------
                                    196 ; absolute external ram data
                                    197 ;--------------------------------------------------------
                                    198 	.area DABS (ABS)
                                    199 ;--------------------------------------------------------
                                    200 ; global & static initialisations
                                    201 ;--------------------------------------------------------
                                    202 	.area HOME
                                    203 	.area GSINIT
                                    204 	.area GSFINAL
                                    205 	.area GSINIT
                                    206 ;	pdk_lcdi2c.c: 13: uint8_t lcdReg = 0;
      000054 8D 26                  207 	clear	_lcdReg+0
                                    208 ;--------------------------------------------------------
                                    209 ; Home
                                    210 ;--------------------------------------------------------
                                    211 	.area HOME
                                    212 	.area HOME
                                    213 ;--------------------------------------------------------
                                    214 ; code
                                    215 ;--------------------------------------------------------
                                    216 	.area CODE
                                    217 ;	pdk_lcdi2c.c: 15: void LCDI2C_config(void)
                                    218 ;	-----------------------------------------
                                    219 ;	 function LCDI2C_config
                                    220 ;	-----------------------------------------
      000688                        221 _LCDI2C_config:
                                    222 ;	pdk_lcdi2c.c: 17: _delay_ms(100);
      000688 69 57                  223 	mov	a, #0x69
      00068A A1 17                  224 	mov	__delay_loop_32_PARM_1+0, a
      00068C 04 57                  225 	mov	a, #0x04
      00068E A2 17                  226 	mov	__delay_loop_32_PARM_1+1, a
      000690 01 57                  227 	mov	a, #0x01
      000692 A3 17                  228 	mov	__delay_loop_32_PARM_1+2, a
      000694 A4 26                  229 	clear	__delay_loop_32_PARM_1+3
      000696 5F 74                  230 	call	__delay_loop_32
                                    231 ;	pdk_lcdi2c.c: 18: lcdReg = 0;
      000698 8D 26                  232 	clear	_lcdReg+0
                                    233 ;	pdk_lcdi2c.c: 19: I2C_begin();
      00069A 41 73                  234 	call	_I2C_begin
                                    235 ;	pdk_lcdi2c.c: 21: LCDI2C_write8(0x00);
      00069C 8E 26                  236 	clear	_LCDI2C_write8_PARM_1+0
      00069E B3 73                  237 	call	_LCDI2C_write8
                                    238 ;	pdk_lcdi2c.c: 22: _delay_ms(1);
      0006A0 E6 57                  239 	mov	a, #0xe6
      0006A2 9F 17                  240 	mov	__delay_loop_16_PARM_1+0, a
      0006A4 03 57                  241 	mov	a, #0x03
      0006A6 A0 17                  242 	mov	__delay_loop_16_PARM_1+1, a
      0006A8 57 74                  243 	call	__delay_loop_16
                                    244 ;	pdk_lcdi2c.c: 23: LCDI2C_write8(0x04);
      0006AA 04 57                  245 	mov	a, #0x04
      0006AC 8E 17                  246 	mov	_LCDI2C_write8_PARM_1+0, a
      0006AE B3 73                  247 	call	_LCDI2C_write8
                                    248 ;	pdk_lcdi2c.c: 24: _delay_ms(1);
      0006B0 E6 57                  249 	mov	a, #0xe6
      0006B2 9F 17                  250 	mov	__delay_loop_16_PARM_1+0, a
      0006B4 03 57                  251 	mov	a, #0x03
      0006B6 A0 17                  252 	mov	__delay_loop_16_PARM_1+1, a
      0006B8 57 74                  253 	call	__delay_loop_16
                                    254 ;	pdk_lcdi2c.c: 25: LCDI2C_write8(0x00);
      0006BA 8E 26                  255 	clear	_LCDI2C_write8_PARM_1+0
      0006BC B3 73                  256 	call	_LCDI2C_write8
                                    257 ;	pdk_lcdi2c.c: 26: _delay_ms(1);
      0006BE E6 57                  258 	mov	a, #0xe6
      0006C0 9F 17                  259 	mov	__delay_loop_16_PARM_1+0, a
      0006C2 03 57                  260 	mov	a, #0x03
      0006C4 A0 17                  261 	mov	__delay_loop_16_PARM_1+1, a
      0006C6 57 74                  262 	call	__delay_loop_16
                                    263 ;	pdk_lcdi2c.c: 27: LCDI2C_write8(0x04);
      0006C8 04 57                  264 	mov	a, #0x04
      0006CA 8E 17                  265 	mov	_LCDI2C_write8_PARM_1+0, a
      0006CC B3 73                  266 	call	_LCDI2C_write8
                                    267 ;	pdk_lcdi2c.c: 28: _delay_ms(1);
      0006CE E6 57                  268 	mov	a, #0xe6
      0006D0 9F 17                  269 	mov	__delay_loop_16_PARM_1+0, a
      0006D2 03 57                  270 	mov	a, #0x03
      0006D4 A0 17                  271 	mov	__delay_loop_16_PARM_1+1, a
      0006D6 57 74                  272 	call	__delay_loop_16
                                    273 ;	pdk_lcdi2c.c: 29: LCDI2C_write8(0x00);
      0006D8 8E 26                  274 	clear	_LCDI2C_write8_PARM_1+0
      0006DA B3 73                  275 	call	_LCDI2C_write8
                                    276 ;	pdk_lcdi2c.c: 30: _delay_ms(1);
      0006DC E6 57                  277 	mov	a, #0xe6
      0006DE 9F 17                  278 	mov	__delay_loop_16_PARM_1+0, a
      0006E0 03 57                  279 	mov	a, #0x03
      0006E2 A0 17                  280 	mov	__delay_loop_16_PARM_1+1, a
      0006E4 57 74                  281 	call	__delay_loop_16
                                    282 ;	pdk_lcdi2c.c: 31: LCDI2C_write8(0x04);
      0006E6 04 57                  283 	mov	a, #0x04
      0006E8 8E 17                  284 	mov	_LCDI2C_write8_PARM_1+0, a
      0006EA B3 73                  285 	call	_LCDI2C_write8
                                    286 ;	pdk_lcdi2c.c: 32: _delay_ms(1);
      0006EC E6 57                  287 	mov	a, #0xe6
      0006EE 9F 17                  288 	mov	__delay_loop_16_PARM_1+0, a
      0006F0 03 57                  289 	mov	a, #0x03
      0006F2 A0 17                  290 	mov	__delay_loop_16_PARM_1+1, a
      0006F4 57 74                  291 	call	__delay_loop_16
                                    292 ;	pdk_lcdi2c.c: 33: LCDI2C_write8(0x00);
      0006F6 8E 26                  293 	clear	_LCDI2C_write8_PARM_1+0
      0006F8 B3 73                  294 	call	_LCDI2C_write8
                                    295 ;	pdk_lcdi2c.c: 34: _delay_ms(1);
      0006FA E6 57                  296 	mov	a, #0xe6
      0006FC 9F 17                  297 	mov	__delay_loop_16_PARM_1+0, a
      0006FE 03 57                  298 	mov	a, #0x03
      000700 A0 17                  299 	mov	__delay_loop_16_PARM_1+1, a
      000702 57 74                  300 	call	__delay_loop_16
                                    301 ;	pdk_lcdi2c.c: 36: LCDI2C_write8(0x20);// function set// 4 bit mode, 2 line, 5x8 font
      000704 20 57                  302 	mov	a, #0x20
      000706 8E 17                  303 	mov	_LCDI2C_write8_PARM_1+0, a
      000708 B3 73                  304 	call	_LCDI2C_write8
                                    305 ;	pdk_lcdi2c.c: 37: _delay_ms(1);
      00070A E6 57                  306 	mov	a, #0xe6
      00070C 9F 17                  307 	mov	__delay_loop_16_PARM_1+0, a
      00070E 03 57                  308 	mov	a, #0x03
      000710 A0 17                  309 	mov	__delay_loop_16_PARM_1+1, a
      000712 57 74                  310 	call	__delay_loop_16
                                    311 ;	pdk_lcdi2c.c: 38: LCDI2C_write8(0x24);
      000714 24 57                  312 	mov	a, #0x24
      000716 8E 17                  313 	mov	_LCDI2C_write8_PARM_1+0, a
      000718 B3 73                  314 	call	_LCDI2C_write8
                                    315 ;	pdk_lcdi2c.c: 39: _delay_ms(1);
      00071A E6 57                  316 	mov	a, #0xe6
      00071C 9F 17                  317 	mov	__delay_loop_16_PARM_1+0, a
      00071E 03 57                  318 	mov	a, #0x03
      000720 A0 17                  319 	mov	__delay_loop_16_PARM_1+1, a
      000722 57 74                  320 	call	__delay_loop_16
                                    321 ;	pdk_lcdi2c.c: 40: LCDI2C_write8(0x20);
      000724 20 57                  322 	mov	a, #0x20
      000726 8E 17                  323 	mov	_LCDI2C_write8_PARM_1+0, a
      000728 B3 73                  324 	call	_LCDI2C_write8
                                    325 ;	pdk_lcdi2c.c: 41: _delay_ms(1);
      00072A E6 57                  326 	mov	a, #0xe6
      00072C 9F 17                  327 	mov	__delay_loop_16_PARM_1+0, a
      00072E 03 57                  328 	mov	a, #0x03
      000730 A0 17                  329 	mov	__delay_loop_16_PARM_1+1, a
      000732 57 74                  330 	call	__delay_loop_16
                                    331 ;	pdk_lcdi2c.c: 43: LCDI2C_writeCommand(LCD_DISPLAYCONTROL | LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF);// Display control
      000734 0C 57                  332 	mov	a, #0x0c
      000736 8F 17                  333 	mov	_LCDI2C_writeCommand_PARM_1+0, a
      000738 BE 73                  334 	call	_LCDI2C_writeCommand
                                    335 ;	pdk_lcdi2c.c: 44: _delay_ms(1);
      00073A E6 57                  336 	mov	a, #0xe6
      00073C 9F 17                  337 	mov	__delay_loop_16_PARM_1+0, a
      00073E 03 57                  338 	mov	a, #0x03
      000740 A0 17                  339 	mov	__delay_loop_16_PARM_1+1, a
      000742 57 74                  340 	call	__delay_loop_16
                                    341 ;	pdk_lcdi2c.c: 45: LCDI2C_writeCommand(LCD_ENTRYMODESET | LCD_ENTRYLEFT);// Enter mode set
      000744 06 57                  342 	mov	a, #0x06
      000746 8F 17                  343 	mov	_LCDI2C_writeCommand_PARM_1+0, a
      000748 BE 73                  344 	call	_LCDI2C_writeCommand
                                    345 ;	pdk_lcdi2c.c: 46: _delay_ms(1);
      00074A E6 57                  346 	mov	a, #0xe6
      00074C 9F 17                  347 	mov	__delay_loop_16_PARM_1+0, a
      00074E 03 57                  348 	mov	a, #0x03
      000750 A0 17                  349 	mov	__delay_loop_16_PARM_1+1, a
      000752 57 74                  350 	call	__delay_loop_16
                                    351 ;	pdk_lcdi2c.c: 49: LCDI2C_writeCommand(LCD_CLEARDISPLAY);
      000754 01 57                  352 	mov	a, #0x01
      000756 8F 17                  353 	mov	_LCDI2C_writeCommand_PARM_1+0, a
      000758 BE 73                  354 	call	_LCDI2C_writeCommand
                                    355 ;	pdk_lcdi2c.c: 50: _delay_ms(1);
      00075A E6 57                  356 	mov	a, #0xe6
      00075C 9F 17                  357 	mov	__delay_loop_16_PARM_1+0, a
      00075E 03 57                  358 	mov	a, #0x03
      000760 A0 17                  359 	mov	__delay_loop_16_PARM_1+1, a
      000762 57 64                  360 	goto	__delay_loop_16
                                    361 ;	pdk_lcdi2c.c: 51: }
      000764 7A 00                  362 	ret
                                    363 ;	pdk_lcdi2c.c: 53: void LCDI2C_write8(uint8_t cmd)
                                    364 ;	-----------------------------------------
                                    365 ;	 function LCDI2C_write8
                                    366 ;	-----------------------------------------
      000766                        367 _LCDI2C_write8:
                                    368 ;	pdk_lcdi2c.c: 55: I2C_beginTransmission(LCDI2C_ADDRESS);
      000766 27 57                  369 	mov	a, #0x27
      000768 80 17                  370 	mov	_I2C_beginTransmission_PARM_1+0, a
      00076A CE 72                  371 	call	_I2C_beginTransmission
                                    372 ;	pdk_lcdi2c.c: 56: I2C_write(cmd);
      00076C 8E 1F                  373 	mov	a, _LCDI2C_write8_PARM_1+0
      00076E 81 17                  374 	mov	_I2C_write_PARM_1+0, a
      000770 D6 72                  375 	call	_I2C_write
                                    376 ;	pdk_lcdi2c.c: 57: I2C_endTransmission();	
      000772 EF 72                  377 	call	_I2C_endTransmission
                                    378 ;	pdk_lcdi2c.c: 58: _delay_us(20);
      000774 33 57                  379 	mov	a, #0x33
      000776 9E 17                  380 	mov	__delay_loop_8_PARM_1+0, a
      000778 54 64                  381 	goto	__delay_loop_8
                                    382 ;	pdk_lcdi2c.c: 59: }
      00077A 7A 00                  383 	ret
                                    384 ;	pdk_lcdi2c.c: 61: void LCDI2C_writeCommand(uint8_t cmd)// cmd = 0, data = 1
                                    385 ;	-----------------------------------------
                                    386 ;	 function LCDI2C_writeCommand
                                    387 ;	-----------------------------------------
      00077C                        388 _LCDI2C_writeCommand:
                                    389 ;	pdk_lcdi2c.c: 64: temp = lcdReg & 0x0F;
      00077C 8D 1F                  390 	mov	a, _lcdReg+0
      00077E 0F 54                  391 	and	a, #0x0f
                                    392 ;	pdk_lcdi2c.c: 66: temp &= ~LCDI2C_RS;
      000780 FE 54                  393 	and	a, #0xfe
      000782 90 17                  394 	mov	_LCDI2C_writeCommand_sloc0_1_0+0, a
                                    395 ;	pdk_lcdi2c.c: 68: HNib = cmd & 0xF0;
      000784 8F 1F                  396 	mov	a, _LCDI2C_writeCommand_PARM_1+0
      000786 72 00                  397 	push	af
      000788 F0 54                  398 	and	a, #0xf0
      00078A 00 17                  399 	mov	p, a
      00078C 73 00                  400 	pop	af
                                    401 ;	pdk_lcdi2c.c: 69: LNib = (cmd<<4) & 0xF0;
      00078E 6E 00                  402 	swap	a
      000790 F0 54                  403 	and	a, #0xf0
      000792 F0 54                  404 	and	a, #0xf0
      000794 91 17                  405 	mov	_LCDI2C_writeCommand_sloc1_1_0+0, a
                                    406 ;	pdk_lcdi2c.c: 71: lcdReg = HNib | temp;
      000796 00 1F                  407 	mov	a, p
      000798 90 1D                  408 	or	a, _LCDI2C_writeCommand_sloc0_1_0+0
                                    409 ;	pdk_lcdi2c.c: 72: LCDI2C_write8(lcdReg);
      00079A 8D 17                  410 	mov	_lcdReg+0, a
      00079C 8E 17                  411 	mov	_LCDI2C_write8_PARM_1+0, a
      00079E B3 73                  412 	call	_LCDI2C_write8
                                    413 ;	pdk_lcdi2c.c: 73: lcdReg |= LCDI2C_EN;
      0007A0 04 57                  414 	mov	a, #0x04
      0007A2 8D 15                  415 	or	_lcdReg+0, a
                                    416 ;	pdk_lcdi2c.c: 74: LCDI2C_write8(lcdReg);
      0007A4 8D 1F                  417 	mov	a, _lcdReg+0
      0007A6 8E 17                  418 	mov	_LCDI2C_write8_PARM_1+0, a
      0007A8 B3 73                  419 	call	_LCDI2C_write8
                                    420 ;	pdk_lcdi2c.c: 75: lcdReg &= ~LCDI2C_EN;
      0007AA FB 57                  421 	mov	a, #0xfb
      0007AC 8D 14                  422 	and	_lcdReg+0, a
                                    423 ;	pdk_lcdi2c.c: 76: LCDI2C_write8(lcdReg);
      0007AE 8D 1F                  424 	mov	a, _lcdReg+0
      0007B0 8E 17                  425 	mov	_LCDI2C_write8_PARM_1+0, a
      0007B2 B3 73                  426 	call	_LCDI2C_write8
                                    427 ;	pdk_lcdi2c.c: 78: lcdReg = LNib | temp;
      0007B4 91 1F                  428 	mov	a, _LCDI2C_writeCommand_sloc1_1_0+0
      0007B6 90 1D                  429 	or	a, _LCDI2C_writeCommand_sloc0_1_0+0
                                    430 ;	pdk_lcdi2c.c: 79: LCDI2C_write8(lcdReg);
      0007B8 8D 17                  431 	mov	_lcdReg+0, a
      0007BA 8E 17                  432 	mov	_LCDI2C_write8_PARM_1+0, a
      0007BC B3 73                  433 	call	_LCDI2C_write8
                                    434 ;	pdk_lcdi2c.c: 80: lcdReg |= LCDI2C_EN;
      0007BE 04 57                  435 	mov	a, #0x04
      0007C0 8D 15                  436 	or	_lcdReg+0, a
                                    437 ;	pdk_lcdi2c.c: 81: LCDI2C_write8(lcdReg);
      0007C2 8D 1F                  438 	mov	a, _lcdReg+0
      0007C4 8E 17                  439 	mov	_LCDI2C_write8_PARM_1+0, a
      0007C6 B3 73                  440 	call	_LCDI2C_write8
                                    441 ;	pdk_lcdi2c.c: 82: lcdReg &= ~LCDI2C_EN;
      0007C8 FB 57                  442 	mov	a, #0xfb
      0007CA 8D 14                  443 	and	_lcdReg+0, a
                                    444 ;	pdk_lcdi2c.c: 83: LCDI2C_write8(lcdReg);
      0007CC 8D 1F                  445 	mov	a, _lcdReg+0
      0007CE 8E 17                  446 	mov	_LCDI2C_write8_PARM_1+0, a
      0007D0 B3 63                  447 	goto	_LCDI2C_write8
                                    448 ;	pdk_lcdi2c.c: 84: }
      0007D2 7A 00                  449 	ret
                                    450 ;	pdk_lcdi2c.c: 86: void LCDI2C_writeData(uint8_t data)// cmd = 0, data = 1
                                    451 ;	-----------------------------------------
                                    452 ;	 function LCDI2C_writeData
                                    453 ;	-----------------------------------------
      0007D4                        454 _LCDI2C_writeData:
                                    455 ;	pdk_lcdi2c.c: 89: temp = lcdReg & 0x0F;
      0007D4 8D 1F                  456 	mov	a, _lcdReg+0
      0007D6 0F 54                  457 	and	a, #0x0f
                                    458 ;	pdk_lcdi2c.c: 90: temp |= LCDI2C_RS;
      0007D8 01 55                  459 	or	a, #0x01
      0007DA 93 17                  460 	mov	_LCDI2C_writeData_sloc2_1_0+0, a
                                    461 ;	pdk_lcdi2c.c: 92: HNib = data & 0xF0;
      0007DC 92 1F                  462 	mov	a, _LCDI2C_writeData_PARM_1+0
      0007DE 72 00                  463 	push	af
      0007E0 F0 54                  464 	and	a, #0xf0
      0007E2 00 17                  465 	mov	p, a
      0007E4 73 00                  466 	pop	af
                                    467 ;	pdk_lcdi2c.c: 93: LNib = (data<<4) & 0xF0;
      0007E6 6E 00                  468 	swap	a
      0007E8 F0 54                  469 	and	a, #0xf0
      0007EA F0 54                  470 	and	a, #0xf0
      0007EC 94 17                  471 	mov	_LCDI2C_writeData_sloc3_1_0+0, a
                                    472 ;	pdk_lcdi2c.c: 95: lcdReg = HNib | temp;
      0007EE 00 1F                  473 	mov	a, p
      0007F0 93 1D                  474 	or	a, _LCDI2C_writeData_sloc2_1_0+0
                                    475 ;	pdk_lcdi2c.c: 96: LCDI2C_write8(lcdReg);
      0007F2 8D 17                  476 	mov	_lcdReg+0, a
      0007F4 8E 17                  477 	mov	_LCDI2C_write8_PARM_1+0, a
      0007F6 B3 73                  478 	call	_LCDI2C_write8
                                    479 ;	pdk_lcdi2c.c: 97: lcdReg |= LCDI2C_EN;
      0007F8 04 57                  480 	mov	a, #0x04
      0007FA 8D 15                  481 	or	_lcdReg+0, a
                                    482 ;	pdk_lcdi2c.c: 98: LCDI2C_write8(lcdReg);
      0007FC 8D 1F                  483 	mov	a, _lcdReg+0
      0007FE 8E 17                  484 	mov	_LCDI2C_write8_PARM_1+0, a
      000800 B3 73                  485 	call	_LCDI2C_write8
                                    486 ;	pdk_lcdi2c.c: 99: lcdReg &= ~LCDI2C_EN;
      000802 FB 57                  487 	mov	a, #0xfb
      000804 8D 14                  488 	and	_lcdReg+0, a
                                    489 ;	pdk_lcdi2c.c: 100: LCDI2C_write8(lcdReg);
      000806 8D 1F                  490 	mov	a, _lcdReg+0
      000808 8E 17                  491 	mov	_LCDI2C_write8_PARM_1+0, a
      00080A B3 73                  492 	call	_LCDI2C_write8
                                    493 ;	pdk_lcdi2c.c: 102: lcdReg = LNib | temp;
      00080C 94 1F                  494 	mov	a, _LCDI2C_writeData_sloc3_1_0+0
      00080E 93 1D                  495 	or	a, _LCDI2C_writeData_sloc2_1_0+0
                                    496 ;	pdk_lcdi2c.c: 103: LCDI2C_write8(lcdReg);
      000810 8D 17                  497 	mov	_lcdReg+0, a
      000812 8E 17                  498 	mov	_LCDI2C_write8_PARM_1+0, a
      000814 B3 73                  499 	call	_LCDI2C_write8
                                    500 ;	pdk_lcdi2c.c: 104: lcdReg |= LCDI2C_EN;
      000816 04 57                  501 	mov	a, #0x04
      000818 8D 15                  502 	or	_lcdReg+0, a
                                    503 ;	pdk_lcdi2c.c: 105: LCDI2C_write8(lcdReg);
      00081A 8D 1F                  504 	mov	a, _lcdReg+0
      00081C 8E 17                  505 	mov	_LCDI2C_write8_PARM_1+0, a
      00081E B3 73                  506 	call	_LCDI2C_write8
                                    507 ;	pdk_lcdi2c.c: 106: lcdReg &= ~LCDI2C_EN;
      000820 FB 57                  508 	mov	a, #0xfb
      000822 8D 14                  509 	and	_lcdReg+0, a
                                    510 ;	pdk_lcdi2c.c: 107: LCDI2C_write8(lcdReg);
      000824 8D 1F                  511 	mov	a, _lcdReg+0
      000826 8E 17                  512 	mov	_LCDI2C_write8_PARM_1+0, a
      000828 B3 63                  513 	goto	_LCDI2C_write8
                                    514 ;	pdk_lcdi2c.c: 108: }
      00082A 7A 00                  515 	ret
                                    516 ;	pdk_lcdi2c.c: 110: void LCDI2C_goTo(uint8_t y, uint8_t x)
                                    517 ;	-----------------------------------------
                                    518 ;	 function LCDI2C_goTo
                                    519 ;	-----------------------------------------
      00082C                        520 _LCDI2C_goTo:
                                    521 ;	pdk_lcdi2c.c: 113: if (y > 2)// row 3,4 of 20x4 LCD
      00082C 02 57                  522 	mov	a, #0x02
      00082E 95 19                  523 	sub	a, _LCDI2C_goTo_PARM_1+0
      000830 80 34                  524 	t1sn.io	f, c
      000832 25 64                  525 	goto	00102$
                                    526 ;	pdk_lcdi2c.c: 114: ddram = 0x40 * (y-3) + (x-1) + 0x14 + LCD_SETDDRAMADDR;// calculate ddram address
      000834 95 1F                  527 	mov	a, _LCDI2C_goTo_PARM_1+0
      000836 03 51                  528 	sub	a, #0x03
      000838 97 17                  529 	mov	_LCDI2C_goTo_sloc4_1_0+0, a
      00083A 06 57                  530 	mov	a, #6
      00083C                        531 00110$:
      00083C 97 2B                  532 	sl	_LCDI2C_goTo_sloc4_1_0+0
      00083E 63 00                  533 	dzsn	a
      000840 1E 64                  534 	goto	00110$
      000842 96 1F                  535 	mov	a, _LCDI2C_goTo_PARM_2+0
      000844 93 50                  536 	add	a, #0x93
      000846 97 18                  537 	add	a, _LCDI2C_goTo_sloc4_1_0+0
      000848 2D 64                  538 	goto	00103$
      00084A                        539 00102$:
                                    540 ;	pdk_lcdi2c.c: 116: ddram = 0x40 * (y-1) + (x-1) + LCD_SETDDRAMADDR; // calculate ddram address
      00084A 95 1F                  541 	mov	a, _LCDI2C_goTo_PARM_1+0
      00084C 01 51                  542 	sub	a, #0x01
      00084E 6E 00                  543 	swap	a
      000850 F0 54                  544 	and	a, #0xf0
      000852 6B 00                  545 	sl	a
      000854 6B 00                  546 	sl	a
      000856 7F 50                  547 	add	a, #0x7f
      000858 96 18                  548 	add	a, _LCDI2C_goTo_PARM_2+0
      00085A                        549 00103$:
                                    550 ;	pdk_lcdi2c.c: 118: LCDI2C_writeCommand(ddram);
      00085A 8F 17                  551 	mov	_LCDI2C_writeCommand_PARM_1+0, a
      00085C BE 73                  552 	call	_LCDI2C_writeCommand
                                    553 ;	pdk_lcdi2c.c: 119: _delay_us(100);
      00085E 62 57                  554 	mov	a, #0x62
      000860 9F 17                  555 	mov	__delay_loop_16_PARM_1+0, a
      000862 A0 26                  556 	clear	__delay_loop_16_PARM_1+1
      000864 57 64                  557 	goto	__delay_loop_16
                                    558 ;	pdk_lcdi2c.c: 120: }
      000866 7A 00                  559 	ret
                                    560 ;	pdk_lcdi2c.c: 122: void LCDI2C_putC(uint8_t chr)
                                    561 ;	-----------------------------------------
                                    562 ;	 function LCDI2C_putC
                                    563 ;	-----------------------------------------
      000868                        564 _LCDI2C_putC:
                                    565 ;	pdk_lcdi2c.c: 124: LCDI2C_writeData(chr);
      000868 98 1F                  566 	mov	a, _LCDI2C_putC_PARM_1+0
      00086A 92 17                  567 	mov	_LCDI2C_writeData_PARM_1+0, a
      00086C EA 63                  568 	goto	_LCDI2C_writeData
                                    569 ;	pdk_lcdi2c.c: 125: }
      00086E 7A 00                  570 	ret
                                    571 ;	pdk_lcdi2c.c: 126: void LCDI2C_print(char* str)
                                    572 ;	-----------------------------------------
                                    573 ;	 function LCDI2C_print
                                    574 ;	-----------------------------------------
      000870                        575 _LCDI2C_print:
                                    576 ;	pdk_lcdi2c.c: 128: while (*str)// loop through entire string
      000870 99 1F                  577 	mov	a, _LCDI2C_print_PARM_1+0
      000872 9B 17                  578 	mov	_LCDI2C_print_sloc5_1_0+0, a
      000874 9A 1F                  579 	mov	a, _LCDI2C_print_PARM_1+1
      000876 9C 17                  580 	mov	_LCDI2C_print_sloc5_1_0+1, a
      000878                        581 00101$:
      000878 9B 1F                  582 	mov	a, _LCDI2C_print_sloc5_1_0+0
      00087A 00 17                  583 	mov	p, a
      00087C 9C 1F                  584 	mov	a, _LCDI2C_print_sloc5_1_0+1
      00087E D7 75                  585 	call	__gptrget
      000880 00 53                  586 	cneqsn	a, #0x00
      000882 47 64                  587 	goto	00104$
                                    588 ;	pdk_lcdi2c.c: 130: LCDI2C_putC(*str);
      000884 98 17                  589 	mov	_LCDI2C_putC_PARM_1+0, a
      000886 34 74                  590 	call	_LCDI2C_putC
                                    591 ;	pdk_lcdi2c.c: 131: str++;
      000888 9B 24                  592 	inc	_LCDI2C_print_sloc5_1_0+0
      00088A 9C 20                  593 	addc	_LCDI2C_print_sloc5_1_0+1
      00088C 3C 64                  594 	goto	00101$
      00088E                        595 00104$:
                                    596 ;	pdk_lcdi2c.c: 133: }
      00088E 7A 00                  597 	ret
                                    598 ;	pdk_lcdi2c.c: 135: void LCDI2C_blackLight(uint8_t stt)
                                    599 ;	-----------------------------------------
                                    600 ;	 function LCDI2C_blackLight
                                    601 ;	-----------------------------------------
      000890                        602 _LCDI2C_blackLight:
                                    603 ;	pdk_lcdi2c.c: 137: if (stt) lcdReg |= LCD_BACKLIGHT;
      000890 9D 1F                  604 	mov	a, _LCDI2C_blackLight_PARM_1+0
      000892 00 53                  605 	cneqsn	a, #0x00
      000894 4E 64                  606 	goto	00102$
      000896 08 57                  607 	mov	a, #0x08
      000898 8D 15                  608 	or	_lcdReg+0, a
      00089A 50 64                  609 	goto	00103$
      00089C                        610 00102$:
                                    611 ;	pdk_lcdi2c.c: 138: else lcdReg &= ~LCD_BACKLIGHT;
      00089C F7 57                  612 	mov	a, #0xf7
      00089E 8D 14                  613 	and	_lcdReg+0, a
      0008A0                        614 00103$:
                                    615 ;	pdk_lcdi2c.c: 139: LCDI2C_write8(lcdReg);
      0008A0 8D 1F                  616 	mov	a, _lcdReg+0
      0008A2 8E 17                  617 	mov	_LCDI2C_write8_PARM_1+0, a
      0008A4 B3 63                  618 	goto	_LCDI2C_write8
                                    619 ;	pdk_lcdi2c.c: 140: }
      0008A6 7A 00                  620 	ret
                                    621 	.area CODE
                                    622 	.area CONST
                                    623 	.area CABS (ABS)
