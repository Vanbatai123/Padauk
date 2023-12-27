                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_i2c
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
                                     16 	.globl _interrupt
                                     17 	.globl _main
                                     18 	.globl _setTime
                                     19 	.globl _digitalClockDisplay
                                     20 	.globl _readDS1307
                                     21 	.globl _dec2bcd
                                     22 	.globl _bcd2dec
                                     23 	.globl __sdcc_external_startup
                                     24 	.globl _I2C_read
                                     25 	.globl _I2C_requestFrom
                                     26 	.globl _I2C_endTransmission
                                     27 	.globl _I2C_write2
                                     28 	.globl _I2C_beginTransmission
                                     29 	.globl _UART_printNum
                                     30 	.globl _PB5_interrupt
                                     31 	.globl _TIM2_interrupt
                                     32 	.globl _UART_print
                                     33 	.globl _UART_rx_off
                                     34 	.globl _UART_IO_config
                                     35 	.globl _UART_begin
                                     36 	.globl __delay_loop_32
                                     37 	.globl __t16c
                                     38 	.globl __rop
                                     39 	.globl __bgtr
                                     40 	.globl __ilrcr
                                     41 	.globl __pwmg2dtl
                                     42 	.globl __pwmg2dth
                                     43 	.globl __pwmg2c
                                     44 	.globl __pwmg1dtl
                                     45 	.globl __pwmg1dth
                                     46 	.globl __pwmg1c
                                     47 	.globl __pwmgcubl
                                     48 	.globl __pwmgcubh
                                     49 	.globl __pwmg0dtl
                                     50 	.globl __pwmg0dth
                                     51 	.globl __pwmgclk
                                     52 	.globl __pwmg0c
                                     53 	.globl __tm3b
                                     54 	.globl __tm3s
                                     55 	.globl __tm3ct
                                     56 	.globl __tm3c
                                     57 	.globl __tm2b
                                     58 	.globl __tm2s
                                     59 	.globl __tm2ct
                                     60 	.globl __tm2c
                                     61 	.globl __gpcs
                                     62 	.globl __gpcc
                                     63 	.globl __misclvr
                                     64 	.globl __misc2
                                     65 	.globl __misc
                                     66 	.globl __adcrgc
                                     67 	.globl __adcr
                                     68 	.globl __adcm
                                     69 	.globl __adcc
                                     70 	.globl __pcpl
                                     71 	.globl __pbpl
                                     72 	.globl __pcph
                                     73 	.globl __pcc
                                     74 	.globl __pc
                                     75 	.globl __pbph
                                     76 	.globl __pbc
                                     77 	.globl __pb
                                     78 	.globl __paph
                                     79 	.globl __pac
                                     80 	.globl __pa
                                     81 	.globl __pcdier
                                     82 	.globl __pbdier
                                     83 	.globl __padier
                                     84 	.globl __integs
                                     85 	.globl __ihrcr
                                     86 	.globl __eoscr
                                     87 	.globl __t16m
                                     88 	.globl __intrq
                                     89 	.globl __inten
                                     90 	.globl __clkmd
                                     91 	.globl __sp
                                     92 	.globl __flag
                                     93 	.globl _setTime_PARM_7
                                     94 	.globl _setTime_PARM_6
                                     95 	.globl _setTime_PARM_5
                                     96 	.globl _setTime_PARM_4
                                     97 	.globl _setTime_PARM_3
                                     98 	.globl _setTime_PARM_2
                                     99 	.globl _setTime_PARM_1
                                    100 	.globl _dec2bcd_PARM_1
                                    101 	.globl _bcd2dec_PARM_1
                                    102 	.globl _year
                                    103 	.globl _month
                                    104 	.globl _wday
                                    105 	.globl _day2
                                    106 	.globl _hour
                                    107 	.globl _minute
                                    108 	.globl _second
                                    109 	.globl _aaa
                                    110 	.globl _i
                                    111 ;--------------------------------------------------------
                                    112 ; special function registers
                                    113 ;--------------------------------------------------------
                                    114 	.area RSEG (ABS)
      000000                        115 	.org 0x0000
                           000000   116 __flag	=	0x0000
                           000002   117 __sp	=	0x0002
                           000003   118 __clkmd	=	0x0003
                           000004   119 __inten	=	0x0004
                           000005   120 __intrq	=	0x0005
                           000006   121 __t16m	=	0x0006
                           00000A   122 __eoscr	=	0x000a
                           00000B   123 __ihrcr	=	0x000b
                           00000C   124 __integs	=	0x000c
                           00000D   125 __padier	=	0x000d
                           00000E   126 __pbdier	=	0x000e
                           00000F   127 __pcdier	=	0x000f
                           000010   128 __pa	=	0x0010
                           000011   129 __pac	=	0x0011
                           000012   130 __paph	=	0x0012
                           000013   131 __pb	=	0x0013
                           000014   132 __pbc	=	0x0014
                           000015   133 __pbph	=	0x0015
                           000016   134 __pc	=	0x0016
                           000017   135 __pcc	=	0x0017
                           000018   136 __pcph	=	0x0018
                           000019   137 __pbpl	=	0x0019
                           00001A   138 __pcpl	=	0x001a
                           000020   139 __adcc	=	0x0020
                           000021   140 __adcm	=	0x0021
                           000022   141 __adcr	=	0x0022
                           000024   142 __adcrgc	=	0x0024
                           000026   143 __misc	=	0x0026
                           000027   144 __misc2	=	0x0027
                           000028   145 __misclvr	=	0x0028
                           00002B   146 __gpcc	=	0x002b
                           00002C   147 __gpcs	=	0x002c
                           000030   148 __tm2c	=	0x0030
                           000031   149 __tm2ct	=	0x0031
                           000032   150 __tm2s	=	0x0032
                           000033   151 __tm2b	=	0x0033
                           000034   152 __tm3c	=	0x0034
                           000035   153 __tm3ct	=	0x0035
                           000036   154 __tm3s	=	0x0036
                           000037   155 __tm3b	=	0x0037
                           000040   156 __pwmg0c	=	0x0040
                           000041   157 __pwmgclk	=	0x0041
                           000042   158 __pwmg0dth	=	0x0042
                           000043   159 __pwmg0dtl	=	0x0043
                           000044   160 __pwmgcubh	=	0x0044
                           000045   161 __pwmgcubl	=	0x0045
                           000046   162 __pwmg1c	=	0x0046
                           000048   163 __pwmg1dth	=	0x0048
                           000049   164 __pwmg1dtl	=	0x0049
                           00004C   165 __pwmg2c	=	0x004c
                           00004E   166 __pwmg2dth	=	0x004e
                           00004F   167 __pwmg2dtl	=	0x004f
                           000062   168 __ilrcr	=	0x0062
                           000063   169 __bgtr	=	0x0063
                           000067   170 __rop	=	0x0067
      000000                        171 __t16c::
      000000                        172 	.ds 2
                                    173 ;--------------------------------------------------------
                                    174 ; ram data
                                    175 ;--------------------------------------------------------
                                    176 	.area DATA
      000002                        177 _i::
      000002                        178 	.ds 1
      000003                        179 _aaa::
      000003                        180 	.ds 1
      000004                        181 _second::
      000004                        182 	.ds 1
      000005                        183 _minute::
      000005                        184 	.ds 1
      000006                        185 _hour::
      000006                        186 	.ds 1
      000007                        187 _day2::
      000007                        188 	.ds 1
      000008                        189 _wday::
      000008                        190 	.ds 1
      000009                        191 _month::
      000009                        192 	.ds 1
      00000A                        193 _year::
      00000A                        194 	.ds 2
      00000C                        195 _bcd2dec_PARM_1:
      00000C                        196 	.ds 1
      00000D                        197 _bcd2dec_sloc0_1_0:
      00000D                        198 	.ds 2
      00000F                        199 _bcd2dec_sloc1_1_0:
      00000F                        200 	.ds 1
      000010                        201 _dec2bcd_PARM_1:
      000010                        202 	.ds 1
      000011                        203 _dec2bcd_sloc2_1_0:
      000011                        204 	.ds 2
      000013                        205 _dec2bcd_sloc3_1_0:
      000013                        206 	.ds 1
      000014                        207 _setTime_PARM_1:
      000014                        208 	.ds 1
      000015                        209 _setTime_PARM_2:
      000015                        210 	.ds 1
      000016                        211 _setTime_PARM_3:
      000016                        212 	.ds 1
      000017                        213 _setTime_PARM_4:
      000017                        214 	.ds 1
      000018                        215 _setTime_PARM_5:
      000018                        216 	.ds 1
      000019                        217 _setTime_PARM_6:
      000019                        218 	.ds 1
      00001A                        219 _setTime_PARM_7:
      00001A                        220 	.ds 1
                                    221 ;--------------------------------------------------------
                                    222 ; overlayable items in ram 
                                    223 ;--------------------------------------------------------
                                    224 ;--------------------------------------------------------
                                    225 ; Stack segment in internal ram 
                                    226 ;--------------------------------------------------------
                                    227 	.area	SSEG
      FFFFFF                        228 __start__stack:
      FFFFFF                        229 	.ds	1
                                    230 
                                    231 ;--------------------------------------------------------
                                    232 ; absolute external ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DABS (ABS)
                                    235 ;--------------------------------------------------------
                                    236 ; interrupt vector 
                                    237 ;--------------------------------------------------------
                                    238 	.area HOME
      000022                        239 __interrupt_vect:
                                    240 	.area	HEADER (ABS)
      000020                        241 	.org	 0x0020
      000020 2C 61                  242 	goto	_interrupt
                                    243 ;--------------------------------------------------------
                                    244 ; global & static initialisations
                                    245 ;--------------------------------------------------------
                                    246 	.area HOME
                                    247 	.area GSINIT
                                    248 	.area GSFINAL
                                    249 	.area GSINIT
                                    250 	.area	PREG (ABS)
      000000                        251 	.org 0x00
      000000                        252 p::
      000000                        253 	.ds 2
                                    254 	.area	HEADER (ABS)
      000000                        255 	.org 0x0000
      000000 00 00                  256 	nop
      000002 01 26                  257 	clear	p+1
      000004 AC 57                  258 	mov	a, #s_OSEG
      000006 04 50                  259 	add	a, #l_OSEG + 1
      000008 FE 54                  260 	and	a, #0xfe
      00000A 02 01                  261 	mov	sp, a
      00000C 22 70                  262 	call	__sdcc_external_startup
      00000E 12 60                  263 	goto	__sdcc_gs_init_startup
                                    264 	.area GSINIT
      000024                        265 __sdcc_gs_init_startup:
      000024                        266 __sdcc_init_data:
      000024 02 57                  267 	mov	a, #s_DATA
      000026 00 17                  268 	mov	p, a
      000028 19 60                  269 	goto	00002$
      00002A                        270 00001$:
      00002A 00 57                  271 	mov	a, #0x00
      00002C 00 07                  272 	idxm	p, a
      00002E 00 24                  273 	inc	p
      000030 02 57                  274 	mov	a, #s_DATA
      000032                        275 00002$:
      000032 AA 50                  276 	add	a, #l_DATA
      000034 00 2E                  277 	ceqsn	a, p
      000036 15 60                  278 	goto	00001$
                                    279 ;	pfs173_i2c.c: 17: uint8_t i = 0;
      000038 02 26                  280 	clear	_i+0
                                    281 ;	pfs173_i2c.c: 18: uint8_t aaa = 0;
      00003A 03 26                  282 	clear	_aaa+0
                                    283 	.area GSFINAL
      000042 11 60                  284 	goto	__sdcc_program_startup
                                    285 ;--------------------------------------------------------
                                    286 ; Home
                                    287 ;--------------------------------------------------------
                                    288 	.area HOME
                                    289 	.area HOME
      000022                        290 __sdcc_program_startup:
      000022 F4 60                  291 	goto	_main
                                    292 ;	return from main will return to caller
                                    293 ;--------------------------------------------------------
                                    294 ; code
                                    295 ;--------------------------------------------------------
                                    296 	.area CODE
                                    297 ;	pfs173_i2c.c: 22: uint8_t _sdcc_external_startup(void)
                                    298 ;	-----------------------------------------
                                    299 ;	 function _sdcc_external_startup
                                    300 ;	-----------------------------------------
      000044                        301 __sdcc_external_startup:
                                    302 ;	pfs173_i2c.c: 24: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000044 34 57                  303 	mov	a, #0x34
      000046 03 01                  304 	mov	__clkmd, a
                                    305 ;	pfs173_i2c.c: 25: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      000048 52 54                  306 	and	a, #'R'                        
      00004A 43 54                  307 	and	a, #'C'                        
      00004C 01 54                  308 	and	a, #((1))          
      00004E 00 54                  309 	and	a, #((8000000))     
      000050 12 54                  310 	and	a, #((8000000)>>8)  
      000052 7A 54                  311 	and	a, #((8000000)>>16) 
      000054 00 54                  312 	and	a, #((8000000)>>24) 
      000056 88 54                  313 	and	a, #((5000))     
      000058 13 54                  314 	and	a, #((5000)>>8)  
      00005A 0B 54                  315 	and	a, #((0x0B))           
                                    316 ;	pfs173_i2c.c: 26: return 0;							  //perform normal initialization
                                    317 ;	pfs173_i2c.c: 27: }
      00005C 00 02                  318 	ret	#0x00
                                    319 ;	pfs173_i2c.c: 30: uint8_t bcd2dec(uint8_t num)
                                    320 ;	-----------------------------------------
                                    321 ;	 function bcd2dec
                                    322 ;	-----------------------------------------
      00005E                        323 _bcd2dec:
                                    324 ;	pfs173_i2c.c: 32: return ((num / 16 * 10) + (num % 16));
      00005E 0C 1F                  325 	mov	a, _bcd2dec_PARM_1+0
      000060 0D 17                  326 	mov	_bcd2dec_sloc0_1_0+0, a
      000062 0E 26                  327 	clear	_bcd2dec_sloc0_1_0+1
      000064 0D 1F                  328 	mov	a, _bcd2dec_sloc0_1_0+0
      000066 9E 17                  329 	mov	__divsint_PARM_1+0, a
      000068 0E 1F                  330 	mov	a, _bcd2dec_sloc0_1_0+1
      00006A 9F 17                  331 	mov	__divsint_PARM_1+1, a
      00006C 10 57                  332 	mov	a, #0x10
      00006E A0 17                  333 	mov	__divsint_PARM_2+0, a
      000070 A1 26                  334 	clear	__divsint_PARM_2+1
      000072 16 74                  335 	call	__divsint
      000074 00 17                  336 	mov	p, a
      000076 6B 00                  337 	sl	a
      000078 6B 00                  338 	sl	a
      00007A 00 18                  339 	add	a, p
      00007C 6B 00                  340 	sl	a
      00007E 0F 17                  341 	mov	_bcd2dec_sloc1_1_0+0, a
      000080 0D 1F                  342 	mov	a, _bcd2dec_sloc0_1_0+0
      000082 0F 54                  343 	and	a, #0x0f
      000084 0F 18                  344 	add	a, _bcd2dec_sloc1_1_0+0
                                    345 ;	pfs173_i2c.c: 33: }
      000086 7A 00                  346 	ret
                                    347 ;	pfs173_i2c.c: 35: uint8_t dec2bcd(uint8_t num)
                                    348 ;	-----------------------------------------
                                    349 ;	 function dec2bcd
                                    350 ;	-----------------------------------------
      000088                        351 _dec2bcd:
                                    352 ;	pfs173_i2c.c: 37: return ((num / 10 * 16) + (num % 10));
      000088 10 1F                  353 	mov	a, _dec2bcd_PARM_1+0
      00008A 11 17                  354 	mov	_dec2bcd_sloc2_1_0+0, a
      00008C 12 26                  355 	clear	_dec2bcd_sloc2_1_0+1
      00008E 11 1F                  356 	mov	a, _dec2bcd_sloc2_1_0+0
      000090 9E 17                  357 	mov	__divsint_PARM_1+0, a
      000092 12 1F                  358 	mov	a, _dec2bcd_sloc2_1_0+1
      000094 9F 17                  359 	mov	__divsint_PARM_1+1, a
      000096 0A 57                  360 	mov	a, #0x0a
      000098 A0 17                  361 	mov	__divsint_PARM_2+0, a
      00009A A1 26                  362 	clear	__divsint_PARM_2+1
      00009C 16 74                  363 	call	__divsint
      00009E 13 17                  364 	mov	_dec2bcd_sloc3_1_0+0, a
      0000A0 13 2B                  365 	sl	_dec2bcd_sloc3_1_0+0
      0000A2 13 2B                  366 	sl	_dec2bcd_sloc3_1_0+0
      0000A4 13 2B                  367 	sl	_dec2bcd_sloc3_1_0+0
      0000A6 13 2B                  368 	sl	_dec2bcd_sloc3_1_0+0
      0000A8 11 1F                  369 	mov	a, _dec2bcd_sloc2_1_0+0
      0000AA 91 17                  370 	mov	__modsint_PARM_1+0, a
      0000AC 12 1F                  371 	mov	a, _dec2bcd_sloc2_1_0+1
      0000AE 92 17                  372 	mov	__modsint_PARM_1+1, a
      0000B0 0A 57                  373 	mov	a, #0x0a
      0000B2 93 17                  374 	mov	__modsint_PARM_2+0, a
      0000B4 94 26                  375 	clear	__modsint_PARM_2+1
      0000B6 AF 73                  376 	call	__modsint
      0000B8 13 18                  377 	add	a, _dec2bcd_sloc3_1_0+0
                                    378 ;	pfs173_i2c.c: 38: }
      0000BA 7A 00                  379 	ret
                                    380 ;	pfs173_i2c.c: 39: void readDS1307()
                                    381 ;	-----------------------------------------
                                    382 ;	 function readDS1307
                                    383 ;	-----------------------------------------
      0000BC                        384 _readDS1307:
                                    385 ;	pfs173_i2c.c: 41: I2C_beginTransmission(DS1307);
      0000BC 68 57                  386 	mov	a, #0x68
      0000BE 7D 17                  387 	mov	_I2C_beginTransmission_PARM_1+0, a
      0000C0 28 73                  388 	call	_I2C_beginTransmission
                                    389 ;	pfs173_i2c.c: 42: I2C_write2(0x00);
      0000C2 7E 26                  390 	clear	_I2C_write2_PARM_1+0
      0000C4 30 73                  391 	call	_I2C_write2
                                    392 ;	pfs173_i2c.c: 43: I2C_endTransmission();
      0000C6 49 73                  393 	call	_I2C_endTransmission
                                    394 ;	pfs173_i2c.c: 44: I2C_requestFrom(DS1307, NumberOfFields);
      0000C8 68 57                  395 	mov	a, #0x68
      0000CA 84 17                  396 	mov	_I2C_requestFrom_PARM_1+0, a
      0000CC 07 57                  397 	mov	a, #0x07
      0000CE 85 17                  398 	mov	_I2C_requestFrom_PARM_2+0, a
      0000D0 58 73                  399 	call	_I2C_requestFrom
                                    400 ;	pfs173_i2c.c: 45: second = bcd2dec(I2C_read() & 0x7f);
      0000D2 8A 73                  401 	call	_I2C_read
      0000D4 7F 54                  402 	and	a, #0x7f
      0000D6 0C 17                  403 	mov	_bcd2dec_PARM_1+0, a
      0000D8 2F 70                  404 	call	_bcd2dec
      0000DA 04 17                  405 	mov	_second+0, a
                                    406 ;	pfs173_i2c.c: 46: minute = bcd2dec(I2C_read());
      0000DC 8A 73                  407 	call	_I2C_read
      0000DE 0C 17                  408 	mov	_bcd2dec_PARM_1+0, a
      0000E0 2F 70                  409 	call	_bcd2dec
      0000E2 05 17                  410 	mov	_minute+0, a
                                    411 ;	pfs173_i2c.c: 47: hour = bcd2dec(I2C_read() & 0x3f); // chế độ 24h.
      0000E4 8A 73                  412 	call	_I2C_read
      0000E6 3F 54                  413 	and	a, #0x3f
      0000E8 0C 17                  414 	mov	_bcd2dec_PARM_1+0, a
      0000EA 2F 70                  415 	call	_bcd2dec
      0000EC 06 17                  416 	mov	_hour+0, a
                                    417 ;	pfs173_i2c.c: 48: wday = bcd2dec(I2C_read());
      0000EE 8A 73                  418 	call	_I2C_read
      0000F0 0C 17                  419 	mov	_bcd2dec_PARM_1+0, a
      0000F2 2F 70                  420 	call	_bcd2dec
      0000F4 08 17                  421 	mov	_wday+0, a
                                    422 ;	pfs173_i2c.c: 49: day2 = bcd2dec(I2C_read());
      0000F6 8A 73                  423 	call	_I2C_read
      0000F8 0C 17                  424 	mov	_bcd2dec_PARM_1+0, a
      0000FA 2F 70                  425 	call	_bcd2dec
      0000FC 07 17                  426 	mov	_day2+0, a
                                    427 ;	pfs173_i2c.c: 50: month = bcd2dec(I2C_read());
      0000FE 8A 73                  428 	call	_I2C_read
      000100 0C 17                  429 	mov	_bcd2dec_PARM_1+0, a
      000102 2F 70                  430 	call	_bcd2dec
      000104 09 17                  431 	mov	_month+0, a
                                    432 ;	pfs173_i2c.c: 51: year = bcd2dec(I2C_read());
      000106 8A 73                  433 	call	_I2C_read
      000108 0C 17                  434 	mov	_bcd2dec_PARM_1+0, a
      00010A 2F 70                  435 	call	_bcd2dec
      00010C 0A 17                  436 	mov	_year+0, a
      00010E 0B 26                  437 	clear	_year+1
                                    438 ;	pfs173_i2c.c: 52: year += 2000;
      000110 0A 1F                  439 	mov	a, _year+0
      000112 D0 50                  440 	add	a, #0xd0
      000114 00 17                  441 	mov	p, a
      000116 0B 1F                  442 	mov	a, _year+1
      000118 60 00                  443 	addc	a
      00011A 07 50                  444 	add	a, #0x07
      00011C 0B 17                  445 	mov	_year+1, a
      00011E 00 1F                  446 	mov	a, p
      000120 0A 17                  447 	mov	_year+0, a
                                    448 ;	pfs173_i2c.c: 53: }
      000122 7A 00                  449 	ret
                                    450 ;	pfs173_i2c.c: 55: void digitalClockDisplay()
                                    451 ;	-----------------------------------------
                                    452 ;	 function digitalClockDisplay
                                    453 ;	-----------------------------------------
      000124                        454 _digitalClockDisplay:
                                    455 ;	pfs173_i2c.c: 58: UART_printNum(hour);
      000124 06 1F                  456 	mov	a, _hour+0
      000126 49 17                  457 	mov	_UART_printNum_PARM_1+0, a
      000128 4A 26                  458 	clear	_UART_printNum_PARM_1+1
      00012A AF 71                  459 	call	_UART_printNum
                                    460 ;	pfs173_i2c.c: 59: UART_print("-");
      00012C 85 57                  461 	mov	a, #<(___str_0 + 0)
      00012E 45 17                  462 	mov	_UART_print_PARM_1+0, a
      000130 84 57                  463 	mov	a, #>(___str_0 + 0x8000 + 0)
      000132 46 17                  464 	mov	_UART_print_PARM_1+1, a
      000134 99 71                  465 	call	_UART_print
                                    466 ;	pfs173_i2c.c: 60: UART_printNum(minute);
      000136 05 1F                  467 	mov	a, _minute+0
      000138 49 17                  468 	mov	_UART_printNum_PARM_1+0, a
      00013A 4A 26                  469 	clear	_UART_printNum_PARM_1+1
      00013C AF 71                  470 	call	_UART_printNum
                                    471 ;	pfs173_i2c.c: 61: UART_print("-");
      00013E 85 57                  472 	mov	a, #<(___str_0 + 0)
      000140 45 17                  473 	mov	_UART_print_PARM_1+0, a
      000142 84 57                  474 	mov	a, #>(___str_0 + 0x8000 + 0)
      000144 46 17                  475 	mov	_UART_print_PARM_1+1, a
      000146 99 71                  476 	call	_UART_print
                                    477 ;	pfs173_i2c.c: 62: UART_printNum(second);
      000148 04 1F                  478 	mov	a, _second+0
      00014A 49 17                  479 	mov	_UART_printNum_PARM_1+0, a
      00014C 4A 26                  480 	clear	_UART_printNum_PARM_1+1
      00014E AF 71                  481 	call	_UART_printNum
                                    482 ;	pfs173_i2c.c: 63: UART_print("-");
      000150 85 57                  483 	mov	a, #<(___str_0 + 0)
      000152 45 17                  484 	mov	_UART_print_PARM_1+0, a
      000154 84 57                  485 	mov	a, #>(___str_0 + 0x8000 + 0)
      000156 46 17                  486 	mov	_UART_print_PARM_1+1, a
      000158 99 71                  487 	call	_UART_print
                                    488 ;	pfs173_i2c.c: 64: UART_printNum(day2);
      00015A 07 1F                  489 	mov	a, _day2+0
      00015C 49 17                  490 	mov	_UART_printNum_PARM_1+0, a
      00015E 4A 26                  491 	clear	_UART_printNum_PARM_1+1
      000160 AF 71                  492 	call	_UART_printNum
                                    493 ;	pfs173_i2c.c: 65: UART_print("-");
      000162 85 57                  494 	mov	a, #<(___str_0 + 0)
      000164 45 17                  495 	mov	_UART_print_PARM_1+0, a
      000166 84 57                  496 	mov	a, #>(___str_0 + 0x8000 + 0)
      000168 46 17                  497 	mov	_UART_print_PARM_1+1, a
      00016A 99 71                  498 	call	_UART_print
                                    499 ;	pfs173_i2c.c: 66: UART_printNum(month);
      00016C 09 1F                  500 	mov	a, _month+0
      00016E 49 17                  501 	mov	_UART_printNum_PARM_1+0, a
      000170 4A 26                  502 	clear	_UART_printNum_PARM_1+1
      000172 AF 71                  503 	call	_UART_printNum
                                    504 ;	pfs173_i2c.c: 67: UART_print("-");
      000174 85 57                  505 	mov	a, #<(___str_0 + 0)
      000176 45 17                  506 	mov	_UART_print_PARM_1+0, a
      000178 84 57                  507 	mov	a, #>(___str_0 + 0x8000 + 0)
      00017A 46 17                  508 	mov	_UART_print_PARM_1+1, a
      00017C 99 71                  509 	call	_UART_print
                                    510 ;	pfs173_i2c.c: 68: UART_printNum(year);
      00017E 0A 1F                  511 	mov	a, _year+0
      000180 49 17                  512 	mov	_UART_printNum_PARM_1+0, a
      000182 0B 1F                  513 	mov	a, _year+1
      000184 4A 17                  514 	mov	_UART_printNum_PARM_1+1, a
      000186 AF 71                  515 	call	_UART_printNum
                                    516 ;	pfs173_i2c.c: 69: UART_print("\r");
      000188 87 57                  517 	mov	a, #<(___str_1 + 0)
      00018A 45 17                  518 	mov	_UART_print_PARM_1+0, a
      00018C 84 57                  519 	mov	a, #>(___str_1 + 0x8000 + 0)
      00018E 46 17                  520 	mov	_UART_print_PARM_1+1, a
      000190 99 61                  521 	goto	_UART_print
                                    522 ;	pfs173_i2c.c: 70: }
      000192 7A 00                  523 	ret
                                    524 ;	pfs173_i2c.c: 73: void setTime(uint8_t hr, uint8_t min, uint8_t sec, uint8_t wd, uint8_t d, uint8_t mth, uint8_t yr)
                                    525 ;	-----------------------------------------
                                    526 ;	 function setTime
                                    527 ;	-----------------------------------------
      000194                        528 _setTime:
                                    529 ;	pfs173_i2c.c: 75: I2C_beginTransmission(DS1307);
      000194 68 57                  530 	mov	a, #0x68
      000196 7D 17                  531 	mov	_I2C_beginTransmission_PARM_1+0, a
      000198 28 73                  532 	call	_I2C_beginTransmission
                                    533 ;	pfs173_i2c.c: 76: I2C_write2(0x00); // đặt lại pointer
      00019A 7E 26                  534 	clear	_I2C_write2_PARM_1+0
      00019C 30 73                  535 	call	_I2C_write2
                                    536 ;	pfs173_i2c.c: 77: I2C_write2(dec2bcd(sec));
      00019E 16 1F                  537 	mov	a, _setTime_PARM_3+0
      0001A0 10 17                  538 	mov	_dec2bcd_PARM_1+0, a
      0001A2 44 70                  539 	call	_dec2bcd
      0001A4 7E 17                  540 	mov	_I2C_write2_PARM_1+0, a
      0001A6 30 73                  541 	call	_I2C_write2
                                    542 ;	pfs173_i2c.c: 78: I2C_write2(dec2bcd(min));
      0001A8 15 1F                  543 	mov	a, _setTime_PARM_2+0
      0001AA 10 17                  544 	mov	_dec2bcd_PARM_1+0, a
      0001AC 44 70                  545 	call	_dec2bcd
      0001AE 7E 17                  546 	mov	_I2C_write2_PARM_1+0, a
      0001B0 30 73                  547 	call	_I2C_write2
                                    548 ;	pfs173_i2c.c: 79: I2C_write2(dec2bcd(hr));
      0001B2 14 1F                  549 	mov	a, _setTime_PARM_1+0
      0001B4 10 17                  550 	mov	_dec2bcd_PARM_1+0, a
      0001B6 44 70                  551 	call	_dec2bcd
      0001B8 7E 17                  552 	mov	_I2C_write2_PARM_1+0, a
      0001BA 30 73                  553 	call	_I2C_write2
                                    554 ;	pfs173_i2c.c: 80: I2C_write2(dec2bcd(wd)); // day2 of week: Sunday2 = 1, Saturday2 = 7
      0001BC 17 1F                  555 	mov	a, _setTime_PARM_4+0
      0001BE 10 17                  556 	mov	_dec2bcd_PARM_1+0, a
      0001C0 44 70                  557 	call	_dec2bcd
      0001C2 7E 17                  558 	mov	_I2C_write2_PARM_1+0, a
      0001C4 30 73                  559 	call	_I2C_write2
                                    560 ;	pfs173_i2c.c: 81: I2C_write2(dec2bcd(d));
      0001C6 18 1F                  561 	mov	a, _setTime_PARM_5+0
      0001C8 10 17                  562 	mov	_dec2bcd_PARM_1+0, a
      0001CA 44 70                  563 	call	_dec2bcd
      0001CC 7E 17                  564 	mov	_I2C_write2_PARM_1+0, a
      0001CE 30 73                  565 	call	_I2C_write2
                                    566 ;	pfs173_i2c.c: 82: I2C_write2(dec2bcd(mth));
      0001D0 19 1F                  567 	mov	a, _setTime_PARM_6+0
      0001D2 10 17                  568 	mov	_dec2bcd_PARM_1+0, a
      0001D4 44 70                  569 	call	_dec2bcd
      0001D6 7E 17                  570 	mov	_I2C_write2_PARM_1+0, a
      0001D8 30 73                  571 	call	_I2C_write2
                                    572 ;	pfs173_i2c.c: 83: I2C_write2(dec2bcd(yr));
      0001DA 1A 1F                  573 	mov	a, _setTime_PARM_7+0
      0001DC 10 17                  574 	mov	_dec2bcd_PARM_1+0, a
      0001DE 44 70                  575 	call	_dec2bcd
      0001E0 7E 17                  576 	mov	_I2C_write2_PARM_1+0, a
      0001E2 30 73                  577 	call	_I2C_write2
                                    578 ;	pfs173_i2c.c: 84: I2C_endTransmission();
      0001E4 49 63                  579 	goto	_I2C_endTransmission
                                    580 ;	pfs173_i2c.c: 85: }
      0001E6 7A 00                  581 	ret
                                    582 ;	pfs173_i2c.c: 87: int main(void)
                                    583 ;	-----------------------------------------
                                    584 ;	 function main
                                    585 ;	-----------------------------------------
      0001E8                        586 _main:
                                    587 ;	pfs173_i2c.c: 89: UART_IO_config();
      0001E8 3F 71                  588 	call	_UART_IO_config
                                    589 ;	pfs173_i2c.c: 90: UART_begin();
      0001EA 51 71                  590 	call	_UART_begin
                                    591 ;	pfs173_i2c.c: 91: INTRQ = 0;
      0001EC 00 57                  592 	mov	a, #0x00
      0001EE 05 01                  593 	mov	__intrq, a
                                    594 ;	pfs173_i2c.c: 92: sei();
      0001F0 78 00                  595 	engint
                                    596 ;	pfs173_i2c.c: 93: UART_rx_off();
      0001F2 5C 71                  597 	call	_UART_rx_off
                                    598 ;	pfs173_i2c.c: 94: UART_print("\rOK\r");
      0001F4 89 57                  599 	mov	a, #<(___str_2 + 0)
      0001F6 45 17                  600 	mov	_UART_print_PARM_1+0, a
      0001F8 84 57                  601 	mov	a, #>(___str_2 + 0x8000 + 0)
      0001FA 46 17                  602 	mov	_UART_print_PARM_1+1, a
      0001FC 99 71                  603 	call	_UART_print
                                    604 ;	pfs173_i2c.c: 96: PBC |= (1 << SDA);
      0001FE 14 3F                  605 	set1	__pbc, #6
                                    606 ;	pfs173_i2c.c: 97: PBC |= (1 << SCL);
      000200 94 3F                  607 	set1	__pbc, #7
                                    608 ;	pfs173_i2c.c: 99: setTime(12, 30, 45, 1, 8, 2, 15); // 12:30:45 CN 08-02-2015
      000202 0C 57                  609 	mov	a, #0x0c
      000204 14 17                  610 	mov	_setTime_PARM_1+0, a
      000206 1E 57                  611 	mov	a, #0x1e
      000208 15 17                  612 	mov	_setTime_PARM_2+0, a
      00020A 2D 57                  613 	mov	a, #0x2d
      00020C 16 17                  614 	mov	_setTime_PARM_3+0, a
      00020E 01 57                  615 	mov	a, #0x01
      000210 17 17                  616 	mov	_setTime_PARM_4+0, a
      000212 08 57                  617 	mov	a, #0x08
      000214 18 17                  618 	mov	_setTime_PARM_5+0, a
      000216 02 57                  619 	mov	a, #0x02
      000218 19 17                  620 	mov	_setTime_PARM_6+0, a
      00021A 0F 57                  621 	mov	a, #0x0f
      00021C 1A 17                  622 	mov	_setTime_PARM_7+0, a
      00021E CA 70                  623 	call	_setTime
                                    624 ;	pfs173_i2c.c: 101: while (1)
      000220                        625 00102$:
                                    626 ;	pfs173_i2c.c: 104: readDS1307();
      000220 5E 70                  627 	call	_readDS1307
                                    628 ;	pfs173_i2c.c: 107: digitalClockDisplay();
      000222 92 70                  629 	call	_digitalClockDisplay
                                    630 ;	pfs173_i2c.c: 109: _delay_ms(900);
      000224 BE 57                  631 	mov	a, #0xbe
      000226 8D 17                  632 	mov	__delay_loop_32_PARM_1+0, a
      000228 27 57                  633 	mov	a, #0x27
      00022A 8E 17                  634 	mov	__delay_loop_32_PARM_1+1, a
      00022C 09 57                  635 	mov	a, #0x09
      00022E 8F 17                  636 	mov	__delay_loop_32_PARM_1+2, a
      000230 90 26                  637 	clear	__delay_loop_32_PARM_1+3
      000232 A3 73                  638 	call	__delay_loop_32
                                    639 ;	pfs173_i2c.c: 110: _delay_ms(900);
      000234 BE 57                  640 	mov	a, #0xbe
      000236 8D 17                  641 	mov	__delay_loop_32_PARM_1+0, a
      000238 27 57                  642 	mov	a, #0x27
      00023A 8E 17                  643 	mov	__delay_loop_32_PARM_1+1, a
      00023C 09 57                  644 	mov	a, #0x09
      00023E 8F 17                  645 	mov	__delay_loop_32_PARM_1+2, a
      000240 90 26                  646 	clear	__delay_loop_32_PARM_1+3
      000242 A3 73                  647 	call	__delay_loop_32
                                    648 ;	pfs173_i2c.c: 111: _delay_ms(900);
      000244 BE 57                  649 	mov	a, #0xbe
      000246 8D 17                  650 	mov	__delay_loop_32_PARM_1+0, a
      000248 27 57                  651 	mov	a, #0x27
      00024A 8E 17                  652 	mov	__delay_loop_32_PARM_1+1, a
      00024C 09 57                  653 	mov	a, #0x09
      00024E 8F 17                  654 	mov	__delay_loop_32_PARM_1+2, a
      000250 90 26                  655 	clear	__delay_loop_32_PARM_1+3
      000252 A3 73                  656 	call	__delay_loop_32
      000254 10 61                  657 	goto	00102$
                                    658 ;	pfs173_i2c.c: 113: }
      000256 7A 00                  659 	ret
                                    660 ;	pfs173_i2c.c: 116: void interrupt(void) __interrupt(0)
                                    661 ;	-----------------------------------------
                                    662 ;	 function interrupt
                                    663 ;	-----------------------------------------
      000258                        664 _interrupt:
      000258 72 00                  665 	push	af
      00025A 00 1F                  666 	mov	a, p
      00025C 72 00                  667 	push	af
                                    668 ;	pfs173_i2c.c: 119: if (INTRQ & INTRQ_TM2)
      00025E 85 01                  669 	mov	a, __intrq
      000260 40 54                  670 	and	a, #0x40
      000262 00 53                  671 	cneqsn	a, #0x00
      000264 35 61                  672 	goto	00102$
                                    673 ;	pfs173_i2c.c: 121: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      000266 05 3B                  674 	set0	__intrq, #6
                                    675 ;	pfs173_i2c.c: 122: TIM2_interrupt();
      000268 49 72                  676 	call	_TIM2_interrupt
      00026A                        677 00102$:
                                    678 ;	pfs173_i2c.c: 125: if (INTRQ & INTRQ_PB5)
      00026A 85 01                  679 	mov	a, __intrq
      00026C 01 54                  680 	and	a, #0x01
      00026E 00 53                  681 	cneqsn	a, #0x00
      000270 3B 61                  682 	goto	00105$
                                    683 ;	pfs173_i2c.c: 127: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
      000272 05 38                  684 	set0	__intrq, #0
                                    685 ;	pfs173_i2c.c: 128: PB5_interrupt();
      000274 96 72                  686 	call	_PB5_interrupt
      000276                        687 00105$:
                                    688 ;	pfs173_i2c.c: 130: }
      000276 73 00                  689 	pop	af
      000278 00 17                  690 	mov	p, a
      00027A 73 00                  691 	pop	af
      00027C 7B 00                  692 	reti
                                    693 	.area CODE
                                    694 	.area CONST
                                    695 	.area CONST
      00090A                        696 ___str_0:
      00090A 2D 02                  697 	ret #0x2d	; -
      00090C 00 02                  698 	ret #0x00
                                    699 	.area CODE
                                    700 	.area CONST
      00090E                        701 ___str_1:
      00090E 0D 02                  702 	ret #0x0d
      000910 00 02                  703 	ret #0x00
                                    704 	.area CODE
                                    705 	.area CONST
      000912                        706 ___str_2:
      000912 0D 02                  707 	ret #0x0d
      000914 4F 02                  708 	ret #0x4f	; O
      000916 4B 02                  709 	ret #0x4b	; K
      000918 0D 02                  710 	ret #0x0d
      00091A 00 02                  711 	ret #0x00
                                    712 	.area CODE
                                    713 	.area CABS (ABS)
