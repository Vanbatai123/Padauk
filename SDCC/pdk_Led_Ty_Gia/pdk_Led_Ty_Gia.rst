                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_Led_Ty_Gia
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
                                     18 	.globl _UART_printNum
                                     19 	.globl __sdcc_external_startup
                                     20 	.globl _TIM2_interrupt
                                     21 	.globl _putchar
                                     22 	.globl _UART_begin
                                     23 	.globl __delay_loop_32
                                     24 	.globl __delay_loop_16
                                     25 	.globl __delay_loop_8
                                     26 	.globl __t16c
                                     27 	.globl __rop
                                     28 	.globl __bgtr
                                     29 	.globl __ilrcr
                                     30 	.globl __pwmg2dtl
                                     31 	.globl __pwmg2dth
                                     32 	.globl __pwmg2c
                                     33 	.globl __pwmg1dtl
                                     34 	.globl __pwmg1dth
                                     35 	.globl __pwmg1c
                                     36 	.globl __pwmgcubl
                                     37 	.globl __pwmgcubh
                                     38 	.globl __pwmg0dtl
                                     39 	.globl __pwmg0dth
                                     40 	.globl __pwmgclk
                                     41 	.globl __pwmg0c
                                     42 	.globl __tm3b
                                     43 	.globl __tm3s
                                     44 	.globl __tm3ct
                                     45 	.globl __tm3c
                                     46 	.globl __tm2b
                                     47 	.globl __tm2s
                                     48 	.globl __tm2ct
                                     49 	.globl __tm2c
                                     50 	.globl __gpcs
                                     51 	.globl __gpcc
                                     52 	.globl __misclvr
                                     53 	.globl __misc2
                                     54 	.globl __misc
                                     55 	.globl __adcrgc
                                     56 	.globl __adcr
                                     57 	.globl __adcm
                                     58 	.globl __adcc
                                     59 	.globl __pcpl
                                     60 	.globl __pbpl
                                     61 	.globl __pcph
                                     62 	.globl __pcc
                                     63 	.globl __pc
                                     64 	.globl __pbph
                                     65 	.globl __pbc
                                     66 	.globl __pb
                                     67 	.globl __paph
                                     68 	.globl __pac
                                     69 	.globl __pa
                                     70 	.globl __pcdier
                                     71 	.globl __pbdier
                                     72 	.globl __padier
                                     73 	.globl __integs
                                     74 	.globl __ihrcr
                                     75 	.globl __eoscr
                                     76 	.globl __t16m
                                     77 	.globl __intrq
                                     78 	.globl __inten
                                     79 	.globl __clkmd
                                     80 	.globl __sp
                                     81 	.globl __flag
                                     82 	.globl _UART_printNum_PARM_1
                                     83 	.globl _sta
                                     84 	.globl _data2
                                     85 	.globl _data
                                     86 	.globl _count_data
                                     87 	.globl _start_status
                                     88 	.globl _count_ms1
                                     89 	.globl _count_ms
                                     90 	.globl _txdata
                                     91 	.globl __delay_loop_32_PARM_1
                                     92 	.globl __delay_loop_16_PARM_1
                                     93 	.globl __delay_loop_8_PARM_1
                                     94 ;--------------------------------------------------------
                                     95 ; special function registers
                                     96 ;--------------------------------------------------------
                                     97 	.area RSEG (ABS)
      000000                         98 	.org 0x0000
                           000000    99 __flag	=	0x0000
                           000002   100 __sp	=	0x0002
                           000003   101 __clkmd	=	0x0003
                           000004   102 __inten	=	0x0004
                           000005   103 __intrq	=	0x0005
                           000006   104 __t16m	=	0x0006
                           00000A   105 __eoscr	=	0x000a
                           00000B   106 __ihrcr	=	0x000b
                           00000C   107 __integs	=	0x000c
                           00000D   108 __padier	=	0x000d
                           00000E   109 __pbdier	=	0x000e
                           00000F   110 __pcdier	=	0x000f
                           000010   111 __pa	=	0x0010
                           000011   112 __pac	=	0x0011
                           000012   113 __paph	=	0x0012
                           000013   114 __pb	=	0x0013
                           000014   115 __pbc	=	0x0014
                           000015   116 __pbph	=	0x0015
                           000016   117 __pc	=	0x0016
                           000017   118 __pcc	=	0x0017
                           000018   119 __pcph	=	0x0018
                           000019   120 __pbpl	=	0x0019
                           00001A   121 __pcpl	=	0x001a
                           000020   122 __adcc	=	0x0020
                           000021   123 __adcm	=	0x0021
                           000022   124 __adcr	=	0x0022
                           000024   125 __adcrgc	=	0x0024
                           000026   126 __misc	=	0x0026
                           000027   127 __misc2	=	0x0027
                           000028   128 __misclvr	=	0x0028
                           00002B   129 __gpcc	=	0x002b
                           00002C   130 __gpcs	=	0x002c
                           000030   131 __tm2c	=	0x0030
                           000031   132 __tm2ct	=	0x0031
                           000032   133 __tm2s	=	0x0032
                           000033   134 __tm2b	=	0x0033
                           000034   135 __tm3c	=	0x0034
                           000035   136 __tm3ct	=	0x0035
                           000036   137 __tm3s	=	0x0036
                           000037   138 __tm3b	=	0x0037
                           000040   139 __pwmg0c	=	0x0040
                           000041   140 __pwmgclk	=	0x0041
                           000042   141 __pwmg0dth	=	0x0042
                           000043   142 __pwmg0dtl	=	0x0043
                           000044   143 __pwmgcubh	=	0x0044
                           000045   144 __pwmgcubl	=	0x0045
                           000046   145 __pwmg1c	=	0x0046
                           000048   146 __pwmg1dth	=	0x0048
                           000049   147 __pwmg1dtl	=	0x0049
                           00004C   148 __pwmg2c	=	0x004c
                           00004E   149 __pwmg2dth	=	0x004e
                           00004F   150 __pwmg2dtl	=	0x004f
                           000062   151 __ilrcr	=	0x0062
                           000063   152 __bgtr	=	0x0063
                           000067   153 __rop	=	0x0067
      000000                        154 __t16c::
      000000                        155 	.ds 2
                                    156 ;--------------------------------------------------------
                                    157 ; ram data
                                    158 ;--------------------------------------------------------
                                    159 	.area DATA
      000002                        160 __delay_loop_8_PARM_1:
      000002                        161 	.ds 1
      000003                        162 __delay_loop_16_PARM_1:
      000003                        163 	.ds 2
      000005                        164 __delay_loop_32_PARM_1:
      000005                        165 	.ds 4
      000009                        166 _txdata::
      000009                        167 	.ds 2
      00000B                        168 _count_ms::
      00000B                        169 	.ds 2
      00000D                        170 _count_ms1::
      00000D                        171 	.ds 2
      00000F                        172 _start_status::
      00000F                        173 	.ds 2
      000011                        174 _count_data::
      000011                        175 	.ds 2
      000013                        176 _data::
      000013                        177 	.ds 4
      000017                        178 _data2::
      000017                        179 	.ds 4
      00001B                        180 _sta::
      00001B                        181 	.ds 2
      00001D                        182 _UART_printNum_PARM_1:
      00001D                        183 	.ds 4
      000021                        184 _UART_printNum_sloc0_1_0:
      000021                        185 	.ds 1
      000022                        186 _UART_printNum_sloc1_1_0:
      000022                        187 	.ds 4
      000026                        188 _main_dis_65536_52:
      000026                        189 	.ds 7
      00002D                        190 _interrupt_sloc2_1_0:
      00002D                        191 	.ds 2
      00002F                        192 _interrupt_sloc3_1_0:
      00002F                        193 	.ds 2
      000031                        194 _interrupt_sloc4_1_0:
      000031                        195 	.ds 2
      000033                        196 _interrupt_sloc5_1_0:
      000033                        197 	.ds 4
                                    198 ;--------------------------------------------------------
                                    199 ; overlayable items in ram
                                    200 ;--------------------------------------------------------
                                    201 ;--------------------------------------------------------
                                    202 ; Stack segment in internal ram
                                    203 ;--------------------------------------------------------
                                    204 	.area	SSEG
      00003C                        205 __start__stack:
      00003C                        206 	.ds	1
                                    207 
                                    208 ;--------------------------------------------------------
                                    209 ; absolute external ram data
                                    210 ;--------------------------------------------------------
                                    211 	.area DABS (ABS)
                                    212 ;--------------------------------------------------------
                                    213 ; interrupt vector
                                    214 ;--------------------------------------------------------
                                    215 	.area HOME
      000022                        216 __interrupt_vect:
                                    217 	.area	HEADER (ABS)
      000020                        218 	.org	 0x0020
      000020 BC 60                  219 	goto	_interrupt
                                    220 ;--------------------------------------------------------
                                    221 ; global & static initialisations
                                    222 ;--------------------------------------------------------
                                    223 	.area HOME
                                    224 	.area GSINIT
                                    225 	.area GSFINAL
                                    226 	.area GSINIT
                                    227 	.area	PREG (ABS)
      000000                        228 	.org 0x00
      000000                        229 p::
      000000                        230 	.ds 2
                                    231 	.area	HEADER (ABS)
      000000                        232 	.org 0x0000
      000000 00 00                  233 	nop
      000002 01 26                  234 	clear	p+1
      000004 3C 57                  235 	mov	a, #s_OSEG
      000006 01 50                  236 	add	a, #l_OSEG + 1
      000008 FE 54                  237 	and	a, #0xfe
      00000A 02 01                  238 	mov.io	sp, a
      00000C 36 70                  239 	call	__sdcc_external_startup
      00000E 12 60                  240 	goto	s_GSINIT
                                    241 	.area GSINIT
      000024                        242 __sdcc_init_data:
      000024 02 57                  243 	mov	a, #s_DATA
      000026 00 17                  244 	mov	p, a
      000028 19 60                  245 	goto	00002$
      00002A                        246 00001$:
      00002A 00 57                  247 	mov	a, #0x00
      00002C 00 07                  248 	idxm	p, a
      00002E 00 24                  249 	inc	p
      000030 02 57                  250 	mov	a, #s_DATA
      000032                        251 00002$:
      000032 3A 50                  252 	add	a, #l_DATA
      000034 00 2E                  253 	ceqsn	a, p
      000036 15 60                  254 	goto	00001$
                                    255 ;	pdk_Led_Ty_Gia.c: 25: int sta = 0;
      000038 1B 26                  256 	clear	_sta+0
      00003A 1C 26                  257 	clear	_sta+1
                                    258 	.area GSFINAL
      00003C 11 60                  259 	goto	__sdcc_program_startup
                                    260 ;--------------------------------------------------------
                                    261 ; Home
                                    262 ;--------------------------------------------------------
                                    263 	.area HOME
                                    264 	.area HOME
      000022                        265 __sdcc_program_startup:
      000022 83 60                  266 	goto	_main
                                    267 ;	return from main will return to caller
                                    268 ;--------------------------------------------------------
                                    269 ; code
                                    270 ;--------------------------------------------------------
                                    271 	.area CODE
                                    272 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    273 ;	-----------------------------------------
                                    274 ;	 function _delay_loop_8
                                    275 ;	-----------------------------------------
      00003E                        276 __delay_loop_8:
                                    277 ;	delay.h: 44: __endasm;
      00003E                        278 	00001$:
                                    279 ; 4 cycles per loop
      00003E 02 23                  280 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000040 1F 60                  281 	goto	00001$ ; 2 cycles
      000042                        282 00101$:
                                    283 ;	delay.h: 45: }
      000042 7A 00                  284 	ret
                                    285 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    286 ;	-----------------------------------------
                                    287 ;	 function _delay_loop_16
                                    288 ;	-----------------------------------------
      000044                        289 __delay_loop_16:
                                    290 ;	delay.h: 65: __endasm;
      000044                        291 	00001$:
                                    292 ; 8 cycles per loop
      000044 00 00                  293 	nop	; 1 cycle
      000046 03 25                  294 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 21                  295 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 03 1F                  296 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      00004C 04 1D                  297 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004E 00 34                  298 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000050 22 60                  299 	goto	00001$ ; 2 cycles
      000052                        300 00101$:
                                    301 ;	delay.h: 66: }
      000052 7A 00                  302 	ret
                                    303 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    304 ;	-----------------------------------------
                                    305 ;	 function _delay_loop_32
                                    306 ;	-----------------------------------------
      000054                        307 __delay_loop_32:
                                    308 ;	delay.h: 94: __endasm;
      000054                        309 	00001$:
                                    310 ; 12 cycles per loop
      000054 00 00                  311 	nop	; 1 cycle
      000056 05 25                  312 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000058 06 21                  313 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      00005A 07 21                  314 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      00005C 08 21                  315 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005E 05 1F                  316 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000060 06 1D                  317 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000062 07 1D                  318 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000064 08 1D                  319 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000066 00 34                  320 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000068 2A 60                  321 	goto	00001$ ; 2 cycles
      00006A                        322 00101$:
                                    323 ;	delay.h: 95: }
      00006A 7A 00                  324 	ret
                                    325 ;	pdk_Led_Ty_Gia.c: 19: uint8_t _sdcc_external_startup(void)
                                    326 ;	-----------------------------------------
                                    327 ;	 function _sdcc_external_startup
                                    328 ;	-----------------------------------------
      00006C                        329 __sdcc_external_startup:
                                    330 ;	pdk_Led_Ty_Gia.c: 21: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
      00006C 34 57                  331 	mov	a, #0x34
      00006E 03 01                  332 	mov.io	__clkmd, a
                                    333 ;	pdk_Led_Ty_Gia.c: 22: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); // tune SYSCLK to 8MHz @ 4.000V
      000070 52 54                  334 	and	a, #'R'                        
      000072 43 54                  335 	and	a, #'C'                        
      000074 01 54                  336 	and	a, #((1))          
      000076 00 54                  337 	and	a, #((8000000))     
      000078 12 54                  338 	and	a, #((8000000)>>8)  
      00007A 7A 54                  339 	and	a, #((8000000)>>16) 
      00007C 00 54                  340 	and	a, #((8000000)>>24) 
      00007E A0 54                  341 	and	a, #((4000))     
      000080 0F 54                  342 	and	a, #((4000)>>8)  
      000082 0B 54                  343 	and	a, #((0x0B))           
                                    344 ;	pdk_Led_Ty_Gia.c: 23: return 0;							  // perform normal initialization
                                    345 ;	pdk_Led_Ty_Gia.c: 24: }
      000084 00 02                  346 	ret	#0x00
                                    347 ;	pdk_Led_Ty_Gia.c: 27: void UART_printNum(uint32_t num)
                                    348 ;	-----------------------------------------
                                    349 ;	 function UART_printNum
                                    350 ;	-----------------------------------------
      000086                        351 _UART_printNum:
                                    352 ;	pdk_Led_Ty_Gia.c: 30: putchar('0');
      000086 30 57                  353 	mov	a, #0x30
      000088 37 17                  354 	mov	_putchar_PARM_1+0, a
      00008A 38 26                  355 	clear	_putchar_PARM_1+1
      00008C B9 71                  356 	call	_putchar
                                    357 ;	pdk_Led_Ty_Gia.c: 31: putchar('x');
      00008E 78 57                  358 	mov	a, #0x78
      000090 37 17                  359 	mov	_putchar_PARM_1+0, a
      000092 38 26                  360 	clear	_putchar_PARM_1+1
      000094 B9 71                  361 	call	_putchar
                                    362 ;	pdk_Led_Ty_Gia.c: 32: for (uint8_t i = 0; i < 8; i++)
      000096 21 26                  363 	clear	_UART_printNum_sloc0_1_0+0
      000098                        364 00108$:
      000098 21 1F                  365 	mov	a, _UART_printNum_sloc0_1_0+0
      00009A 08 51                  366 	sub	a, #0x08
      00009C 80 34                  367 	t1sn.io	f, c
      00009E 7E 60                  368 	goto	00106$
                                    369 ;	pdk_Led_Ty_Gia.c: 34: temp = (uint8_t)((num >> (4 * (7 - i))) & 0x0000000F);
      0000A0 07 57                  370 	mov	a, #0x07
      0000A2 21 19                  371 	sub	a, _UART_printNum_sloc0_1_0+0
      0000A4 00 17                  372 	mov	p, a
      0000A6 00 2B                  373 	sl	p
      0000A8 00 2B                  374 	sl	p
      0000AA 1D 1F                  375 	mov	a, _UART_printNum_PARM_1+0
      0000AC 22 17                  376 	mov	_UART_printNum_sloc1_1_0+0, a
      0000AE 1E 1F                  377 	mov	a, _UART_printNum_PARM_1+1
      0000B0 23 17                  378 	mov	_UART_printNum_sloc1_1_0+1, a
      0000B2 1F 1F                  379 	mov	a, _UART_printNum_PARM_1+2
      0000B4 24 17                  380 	mov	_UART_printNum_sloc1_1_0+2, a
      0000B6 20 1F                  381 	mov	a, _UART_printNum_PARM_1+3
      0000B8 25 17                  382 	mov	_UART_printNum_sloc1_1_0+3, a
      0000BA 00 1F                  383 	mov	a, p
      0000BC                        384 00129$:
      0000BC 01 51                  385 	sub	a, #1
      0000BE 80 30                  386 	t0sn.io	f, c
      0000C0 66 60                  387 	goto	00130$
      0000C2 25 2A                  388 	sr	_UART_printNum_sloc1_1_0+3
      0000C4 24 2C                  389 	src	_UART_printNum_sloc1_1_0+2
      0000C6 23 2C                  390 	src	_UART_printNum_sloc1_1_0+1
      0000C8 22 2C                  391 	src	_UART_printNum_sloc1_1_0+0
      0000CA 5E 60                  392 	goto	00129$
      0000CC                        393 00130$:
      0000CC 22 1F                  394 	mov	a, _UART_printNum_sloc1_1_0+0
      0000CE 0F 54                  395 	and	a, #0x0f
                                    396 ;	pdk_Led_Ty_Gia.c: 35: if (temp <= 9)
      0000D0 0A 52                  397 	ceqsn	a, #0x0a
      0000D2 80 34                  398 	t1sn.io	f, c
      0000D4 72 60                  399 	goto	00104$
                                    400 ;	pdk_Led_Ty_Gia.c: 36: putchar(temp + 48);
      0000D6 30 50                  401 	add	a, #0x30
      0000D8 37 17                  402 	mov	_putchar_PARM_1+0, a
      0000DA 00 57                  403 	mov	a, #0x00
      0000DC 60 00                  404 	addc	a
      0000DE 38 17                  405 	mov	_putchar_PARM_1+1, a
      0000E0 B9 71                  406 	call	_putchar
      0000E2 7C 60                  407 	goto	00109$
      0000E4                        408 00104$:
                                    409 ;	pdk_Led_Ty_Gia.c: 37: else if (temp > 9)
      0000E4 0A 52                  410 	ceqsn	a, #0x0a
      0000E6 00 00                  411 	nop
      0000E8 80 30                  412 	t0sn.io	f, c
      0000EA 7C 60                  413 	goto	00109$
                                    414 ;	pdk_Led_Ty_Gia.c: 38: putchar(temp + 55);
      0000EC 37 50                  415 	add	a, #0x37
      0000EE 37 17                  416 	mov	_putchar_PARM_1+0, a
      0000F0 00 57                  417 	mov	a, #0x00
      0000F2 60 00                  418 	addc	a
      0000F4 38 17                  419 	mov	_putchar_PARM_1+1, a
      0000F6 B9 71                  420 	call	_putchar
      0000F8                        421 00109$:
                                    422 ;	pdk_Led_Ty_Gia.c: 32: for (uint8_t i = 0; i < 8; i++)
      0000F8 21 24                  423 	inc	_UART_printNum_sloc0_1_0+0
      0000FA 4C 60                  424 	goto	00108$
      0000FC                        425 00106$:
                                    426 ;	pdk_Led_Ty_Gia.c: 40: putchar('\n');
      0000FC 0A 57                  427 	mov	a, #0x0a
      0000FE 37 17                  428 	mov	_putchar_PARM_1+0, a
      000100 38 26                  429 	clear	_putchar_PARM_1+1
      000102 B9 61                  430 	goto	_putchar
                                    431 ;	pdk_Led_Ty_Gia.c: 41: }
      000104 7A 00                  432 	ret
                                    433 ;	pdk_Led_Ty_Gia.c: 43: int main(void)
                                    434 ;	-----------------------------------------
                                    435 ;	 function main
                                    436 ;	-----------------------------------------
      000106                        437 _main:
                                    438 ;	pdk_Led_Ty_Gia.c: 45: char dis[] = "asdasd";
      000106 61 57                  439 	mov	a, #0x61
      000108 26 17                  440 	mov	_main_dis_65536_52+0, a
      00010A 73 57                  441 	mov	a, #0x73
      00010C 27 17                  442 	mov	_main_dis_65536_52+1, a
      00010E 64 57                  443 	mov	a, #0x64
      000110 28 17                  444 	mov	_main_dis_65536_52+2, a
      000112 61 57                  445 	mov	a, #0x61
      000114 29 17                  446 	mov	_main_dis_65536_52+3, a
      000116 73 57                  447 	mov	a, #0x73
      000118 2A 17                  448 	mov	_main_dis_65536_52+4, a
      00011A 64 57                  449 	mov	a, #0x64
      00011C 2B 17                  450 	mov	_main_dis_65536_52+5, a
      00011E 2C 26                  451 	clear	_main_dis_65536_52+6
                                    452 ;	pdk_Led_Ty_Gia.c: 47: UART_begin(); // Initialize UART engine
      000120 9C 71                  453 	call	_UART_begin
                                    454 ;	pdk_Led_Ty_Gia.c: 50: TM3C = TM3C_CLK_IHRC;							 // Use IHRC -> 16 Mhz
      000122 20 57                  455 	mov	a, #0x20
      000124 34 01                  456 	mov.io	__tm3c, a
                                    457 ;	pdk_Led_Ty_Gia.c: 51: TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV64; // No prescale, scale 64 ~> 0.25MHz
      000126 60 57                  458 	mov	a, #0x60
      000128 36 01                  459 	mov.io	__tm3s, a
                                    460 ;	pdk_Led_Ty_Gia.c: 52: TM3B = 125;										 // Divide by 125 ~> 2000 Hz 0.5ms
      00012A 7D 57                  461 	mov	a, #0x7d
      00012C 37 01                  462 	mov.io	__tm3b, a
                                    463 ;	pdk_Led_Ty_Gia.c: 54: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      00012E 84 3F                  464 	set1.io	__inten, #7
                                    465 ;	pdk_Led_Ty_Gia.c: 56: ROP = ROP_INT_SRC_PB5;
      000130 02 57                  466 	mov	a, #0x02
      000132 67 01                  467 	mov.io	__rop, a
                                    468 ;	pdk_Led_Ty_Gia.c: 57: setb(PBDIER, 5);
      000134 8E 3E                  469 	set1.io	__pbdier, #5
                                    470 ;	pdk_Led_Ty_Gia.c: 58: setb(PBPH, 5);
      000136 95 3E                  471 	set1.io	__pbph, #5
                                    472 ;	pdk_Led_Ty_Gia.c: 59: INTEGS = INTEGS_PB5_FALLING;
      000138 02 57                  473 	mov	a, #0x02
      00013A 0C 01                  474 	mov.io	__integs, a
                                    475 ;	pdk_Led_Ty_Gia.c: 60: INTEN |= INTEN_PB5;
      00013C 04 3C                  476 	set1.io	__inten, #0
                                    477 ;	pdk_Led_Ty_Gia.c: 64: sei(); // Enable global interrupts
      00013E 78 00                  478 	engint
                                    479 ;	pdk_Led_Ty_Gia.c: 65: while (1)
      000140                        480 00107$:
                                    481 ;	pdk_Led_Ty_Gia.c: 67: if (sta == 0)
      000140 1B 1F                  482 	mov	a, _sta+0
      000142 1C 1D                  483 	or	a, _sta+1
      000144 00 53                  484 	cneqsn	a, #0x00
      000146 B5 60                  485 	goto	00105$
                                    486 ;	pdk_Led_Ty_Gia.c: 71: else if (sta == 1)
      000148 1B 1F                  487 	mov	a, _sta+0
      00014A 01 52                  488 	ceqsn	a, #0x01
      00014C B5 60                  489 	goto	00105$
      00014E 1C 1F                  490 	mov	a, _sta+1
      000150 00 52                  491 	ceqsn	a, #0x00
      000152 B5 60                  492 	goto	00105$
                                    493 ;	pdk_Led_Ty_Gia.c: 73: UART_printNum(data2);
      000154 17 1F                  494 	mov	a, _data2+0
      000156 1D 17                  495 	mov	_UART_printNum_PARM_1+0, a
      000158 18 1F                  496 	mov	a, _data2+1
      00015A 1E 17                  497 	mov	_UART_printNum_PARM_1+1, a
      00015C 19 1F                  498 	mov	a, _data2+2
      00015E 1F 17                  499 	mov	_UART_printNum_PARM_1+2, a
      000160 1A 1F                  500 	mov	a, _data2+3
      000162 20 17                  501 	mov	_UART_printNum_PARM_1+3, a
      000164 43 70                  502 	call	_UART_printNum
                                    503 ;	pdk_Led_Ty_Gia.c: 74: sta = 0;
      000166 1B 26                  504 	clear	_sta+0
      000168 1C 26                  505 	clear	_sta+1
      00016A                        506 00105$:
                                    507 ;	pdk_Led_Ty_Gia.c: 76: _delay_ms(1);
      00016A E6 57                  508 	mov	a, #0xe6
      00016C 03 17                  509 	mov	__delay_loop_16_PARM_1+0, a
      00016E 03 57                  510 	mov	a, #0x03
      000170 04 17                  511 	mov	__delay_loop_16_PARM_1+1, a
      000172 22 70                  512 	call	__delay_loop_16
      000174 A0 60                  513 	goto	00107$
                                    514 ;	pdk_Led_Ty_Gia.c: 78: }
      000176 7A 00                  515 	ret
                                    516 ;	pdk_Led_Ty_Gia.c: 81: void interrupt(void) __interrupt(0)
                                    517 ;	-----------------------------------------
                                    518 ;	 function interrupt
                                    519 ;	-----------------------------------------
      000178                        520 _interrupt:
      000178 72 00                  521 	push	af
      00017A 00 1F                  522 	mov	a, p
      00017C 72 00                  523 	push	af
                                    524 ;	pdk_Led_Ty_Gia.c: 84: if (INTRQ & INTRQ_TM2)
      00017E 85 01                  525 	mov.io	a, __intrq
      000180 40 54                  526 	and	a, #0x40
      000182 00 53                  527 	cneqsn	a, #0x00
      000184 C5 60                  528 	goto	00102$
                                    529 ;	pdk_Led_Ty_Gia.c: 86: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      000186 05 3B                  530 	set0.io	__intrq, #6
                                    531 ;	pdk_Led_Ty_Gia.c: 87: TIM2_interrupt();
      000188 A9 71                  532 	call	_TIM2_interrupt
      00018A                        533 00102$:
                                    534 ;	pdk_Led_Ty_Gia.c: 90: if (INTRQ & INTRQ_TM3)
      00018A 85 01                  535 	mov.io	a, __intrq
      00018C 80 54                  536 	and	a, #0x80
      00018E 00 53                  537 	cneqsn	a, #0x00
      000190 D6 60                  538 	goto	00106$
                                    539 ;	pdk_Led_Ty_Gia.c: 92: INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
      000192 85 3B                  540 	set0.io	__intrq, #7
                                    541 ;	pdk_Led_Ty_Gia.c: 95: count_ms++;
      000194 0B 24                  542 	inc	_count_ms+0
      000196 0C 20                  543 	addc	_count_ms+1
                                    544 ;	pdk_Led_Ty_Gia.c: 96: if (count_ms == 50)
      000198 0C 1F                  545 	mov	a, _count_ms+1
      00019A 00 17                  546 	mov	p, a
      00019C 0B 1F                  547 	mov	a, _count_ms+0
      00019E 32 52                  548 	ceqsn	a, #0x32
      0001A0 D6 60                  549 	goto	00106$
      0001A2 00 1F                  550 	mov	a, p
      0001A4 00 52                  551 	ceqsn	a, #0x00
      0001A6 D6 60                  552 	goto	00106$
                                    553 ;	pdk_Led_Ty_Gia.c: 97: count_ms = 0;
      0001A8 0B 26                  554 	clear	_count_ms+0
      0001AA 0C 26                  555 	clear	_count_ms+1
      0001AC                        556 00106$:
                                    557 ;	pdk_Led_Ty_Gia.c: 100: if (INTRQ & INTRQ_PB5)
      0001AC 85 01                  558 	mov.io	a, __intrq
      0001AE 01 54                  559 	and	a, #0x01
      0001B0 00 53                  560 	cneqsn	a, #0x00
      0001B2 98 61                  561 	goto	00134$
                                    562 ;	pdk_Led_Ty_Gia.c: 102: INTRQ &= ~INTRQ_PB5; // Mark PB5 interrupt request processed
      0001B4 05 38                  563 	set0.io	__intrq, #0
                                    564 ;	pdk_Led_Ty_Gia.c: 107: count_ms1 = count_ms;
      0001B6 0B 1F                  565 	mov	a, _count_ms+0
      0001B8 0D 17                  566 	mov	_count_ms1+0, a
      0001BA 0C 1F                  567 	mov	a, _count_ms+1
      0001BC 0E 17                  568 	mov	_count_ms1+1, a
                                    569 ;	pdk_Led_Ty_Gia.c: 108: count_ms = 0;
      0001BE 0B 26                  570 	clear	_count_ms+0
      0001C0 0C 26                  571 	clear	_count_ms+1
                                    572 ;	pdk_Led_Ty_Gia.c: 109: count_data++;
      0001C2 11 24                  573 	inc	_count_data+0
      0001C4 12 20                  574 	addc	_count_data+1
                                    575 ;	pdk_Led_Ty_Gia.c: 111: if (((count_ms1) >= 25) && ((count_ms1) <= 28)) // 10s-14ms
      0001C6 0D 1F                  576 	mov	a, _count_ms1+0
      0001C8 2D 17                  577 	mov	_interrupt_sloc2_1_0+0, a
      0001CA 0E 1F                  578 	mov	a, _count_ms1+1
      0001CC 2E 17                  579 	mov	_interrupt_sloc2_1_0+1, a
      0001CE 2D 1F                  580 	mov	a, _interrupt_sloc2_1_0+0
      0001D0 19 51                  581 	sub	a, #0x19
      0001D2 2E 1F                  582 	mov	a, _interrupt_sloc2_1_0+1
      0001D4 61 00                  583 	subc	a
      0001D6 80 30                  584 	t0sn.io	f, c
      0001D8 FD 60                  585 	goto	00127$
      0001DA 1C 57                  586 	mov	a, #0x1c
      0001DC 2D 19                  587 	sub	a, _interrupt_sloc2_1_0+0
      0001DE 00 57                  588 	mov	a, #0x00
      0001E0 2E 1B                  589 	subc	a, _interrupt_sloc2_1_0+1
      0001E2 80 30                  590 	t0sn.io	f, c
      0001E4 FD 60                  591 	goto	00127$
                                    592 ;	pdk_Led_Ty_Gia.c: 113: count_data = -1;
      0001E6 FF 57                  593 	mov	a, #0xff
      0001E8 11 17                  594 	mov	_count_data+0, a
      0001EA FF 57                  595 	mov	a, #0xff
      0001EC 12 17                  596 	mov	_count_data+1, a
                                    597 ;	pdk_Led_Ty_Gia.c: 114: start_status = 1;
      0001EE 01 57                  598 	mov	a, #0x01
      0001F0 0F 17                  599 	mov	_start_status+0, a
      0001F2 10 26                  600 	clear	_start_status+1
                                    601 ;	pdk_Led_Ty_Gia.c: 115: count_ms1 = 0;
      0001F4 0D 26                  602 	clear	_count_ms1+0
      0001F6 0E 26                  603 	clear	_count_ms1+1
      0001F8 7B 61                  604 	goto	00128$
      0001FA                        605 00127$:
                                    606 ;	pdk_Led_Ty_Gia.c: 117: else if (((count_ms1) >= 20) && ((count_ms1) <= 24)) // 10s-14ms
      0001FA 2D 1F                  607 	mov	a, _interrupt_sloc2_1_0+0
      0001FC 14 51                  608 	sub	a, #0x14
      0001FE 2E 1F                  609 	mov	a, _interrupt_sloc2_1_0+1
      000200 61 00                  610 	subc	a
      000202 80 30                  611 	t0sn.io	f, c
      000204 0D 61                  612 	goto	00123$
      000206 18 57                  613 	mov	a, #0x18
      000208 2D 19                  614 	sub	a, _interrupt_sloc2_1_0+0
      00020A 00 57                  615 	mov	a, #0x00
      00020C 2E 1B                  616 	subc	a, _interrupt_sloc2_1_0+1
      00020E 80 30                  617 	t0sn.io	f, c
      000210 0D 61                  618 	goto	00123$
                                    619 ;	pdk_Led_Ty_Gia.c: 119: sta = 1;
      000212 01 57                  620 	mov	a, #0x01
      000214 1B 17                  621 	mov	_sta+0, a
      000216 1C 26                  622 	clear	_sta+1
      000218 7B 61                  623 	goto	00128$
      00021A                        624 00123$:
                                    625 ;	pdk_Led_Ty_Gia.c: 123: else if ((start_status == 1) && (count_data >= 0) && (count_data <= 31))
      00021A 10 1F                  626 	mov	a, _start_status+1
      00021C 00 17                  627 	mov	p, a
      00021E 0F 1F                  628 	mov	a, _start_status+0
      000220 01 52                  629 	ceqsn	a, #0x01
      000222 67 61                  630 	goto	00118$
      000224 00 1F                  631 	mov	a, p
      000226 00 52                  632 	ceqsn	a, #0x00
      000228 67 61                  633 	goto	00118$
      00022A 11 1F                  634 	mov	a, _count_data+0
      00022C 2F 17                  635 	mov	_interrupt_sloc3_1_0+0, a
      00022E 12 1F                  636 	mov	a, _count_data+1
      000230 30 17                  637 	mov	_interrupt_sloc3_1_0+1, a
      000232 80 52                  638 	ceqsn	a, #0x80
      000234 80 34                  639 	t1sn.io	f, c
      000236 67 61                  640 	goto	00118$
      000238 1F 57                  641 	mov	a, #0x1f
      00023A 2F 19                  642 	sub	a, _interrupt_sloc3_1_0+0
      00023C 00 57                  643 	mov	a, #0x00
      00023E 30 1B                  644 	subc	a, _interrupt_sloc3_1_0+1
      000240 80 31                  645 	t0sn.io	f, ov
      000242 80 56                  646 	xor	a, #0x80
      000244 6B 00                  647 	sl	a
      000246 80 30                  648 	t0sn.io	f, c
      000248 67 61                  649 	goto	00118$
                                    650 ;	pdk_Led_Ty_Gia.c: 125: if ((count_ms1 >= 4) && (count_ms1 <= 6)) // 2ms->3ms //detect logic 1.
      00024A 2D 1F                  651 	mov	a, _interrupt_sloc2_1_0+0
      00024C 04 51                  652 	sub	a, #0x04
      00024E 2E 1F                  653 	mov	a, _interrupt_sloc2_1_0+1
      000250 61 00                  654 	subc	a
      000252 80 30                  655 	t0sn.io	f, c
      000254 53 61                  656 	goto	00111$
      000256 06 57                  657 	mov	a, #0x06
      000258 2D 19                  658 	sub	a, _interrupt_sloc2_1_0+0
      00025A 00 57                  659 	mov	a, #0x00
      00025C 2E 1B                  660 	subc	a, _interrupt_sloc2_1_0+1
      00025E 80 30                  661 	t0sn.io	f, c
      000260 53 61                  662 	goto	00111$
                                    663 ;	pdk_Led_Ty_Gia.c: 127: data |= 1 << (31 - count_data);
      000262 11 1F                  664 	mov	a, _count_data+0
      000264 69 00                  665 	neg	a
      000266 1F 50                  666 	add	a, #0x1f
      000268 72 00                  667 	push	af
      00026A 01 57                  668 	mov	a, #0x01
      00026C 31 17                  669 	mov	_interrupt_sloc4_1_0+0, a
      00026E 73 00                  670 	pop	af
      000270 32 26                  671 	clear	_interrupt_sloc4_1_0+1
      000272                        672 00204$:
      000272 01 51                  673 	sub	a, #1
      000274 80 30                  674 	t0sn.io	f, c
      000276 3F 61                  675 	goto	00205$
      000278 31 2B                  676 	sl	_interrupt_sloc4_1_0+0
      00027A 32 2D                  677 	slc	_interrupt_sloc4_1_0+1
      00027C 39 61                  678 	goto	00204$
      00027E                        679 00205$:
      00027E 31 1F                  680 	mov	a, _interrupt_sloc4_1_0+0
      000280 33 17                  681 	mov	_interrupt_sloc5_1_0+0, a
      000282 32 1F                  682 	mov	a, _interrupt_sloc4_1_0+1
      000284 34 17                  683 	mov	_interrupt_sloc5_1_0+1, a
      000286 6B 00                  684 	sl	a
      000288 00 57                  685 	mov	a, #0x00
      00028A 61 00                  686 	subc	a
      00028C 35 17                  687 	mov	_interrupt_sloc5_1_0+2, a
      00028E 36 17                  688 	mov	_interrupt_sloc5_1_0+3, a
      000290 33 1F                  689 	mov	a, _interrupt_sloc5_1_0+0
      000292 13 15                  690 	or	_data+0, a
      000294 34 1F                  691 	mov	a, _interrupt_sloc5_1_0+1
      000296 14 15                  692 	or	_data+1, a
      000298 35 1F                  693 	mov	a, _interrupt_sloc5_1_0+2
      00029A 15 15                  694 	or	_data+2, a
      00029C 36 1F                  695 	mov	a, _interrupt_sloc5_1_0+3
      00029E 16 15                  696 	or	_data+3, a
                                    697 ;	pdk_Led_Ty_Gia.c: 128: count_ms1 = 0;
      0002A0 0D 26                  698 	clear	_count_ms1+0
      0002A2 0E 26                  699 	clear	_count_ms1+1
      0002A4 7B 61                  700 	goto	00128$
      0002A6                        701 00111$:
                                    702 ;	pdk_Led_Ty_Gia.c: 130: else if (count_ms1 < 4) // nho hon <2ms //detect logic 0.
      0002A6 2D 1F                  703 	mov	a, _interrupt_sloc2_1_0+0
      0002A8 04 51                  704 	sub	a, #0x04
      0002AA 2E 1F                  705 	mov	a, _interrupt_sloc2_1_0+1
      0002AC 61 00                  706 	subc	a
      0002AE 80 34                  707 	t1sn.io	f, c
      0002B0 5C 61                  708 	goto	00108$
                                    709 ;	pdk_Led_Ty_Gia.c: 132: count_ms1 = 0;
      0002B2 0D 26                  710 	clear	_count_ms1+0
      0002B4 0E 26                  711 	clear	_count_ms1+1
      0002B6 7B 61                  712 	goto	00128$
      0002B8                        713 00108$:
                                    714 ;	pdk_Led_Ty_Gia.c: 136: count_ms1 = 0;
      0002B8 0D 26                  715 	clear	_count_ms1+0
      0002BA 0E 26                  716 	clear	_count_ms1+1
                                    717 ;	pdk_Led_Ty_Gia.c: 137: start_status = 0;
      0002BC 0F 26                  718 	clear	_start_status+0
      0002BE 10 26                  719 	clear	_start_status+1
                                    720 ;	pdk_Led_Ty_Gia.c: 138: count_data = 0;
      0002C0 11 26                  721 	clear	_count_data+0
      0002C2 12 26                  722 	clear	_count_data+1
                                    723 ;	pdk_Led_Ty_Gia.c: 139: data = 0;
      0002C4 13 26                  724 	clear	_data+0
      0002C6 14 26                  725 	clear	_data+1
      0002C8 15 26                  726 	clear	_data+2
      0002CA 16 26                  727 	clear	_data+3
      0002CC 7B 61                  728 	goto	00128$
      0002CE                        729 00118$:
                                    730 ;	pdk_Led_Ty_Gia.c: 143: else if ((start_status == 0) && ((count_ms1) > 28)) /// error detect xung start
      0002CE 0F 1F                  731 	mov	a, _start_status+0
      0002D0 10 1D                  732 	or	a, _start_status+1
      0002D2 00 52                  733 	ceqsn	a, #0x00
      0002D4 7B 61                  734 	goto	00128$
      0002D6 1C 57                  735 	mov	a, #0x1c
      0002D8 2D 19                  736 	sub	a, _interrupt_sloc2_1_0+0
      0002DA 00 57                  737 	mov	a, #0x00
      0002DC 2E 1B                  738 	subc	a, _interrupt_sloc2_1_0+1
      0002DE 80 34                  739 	t1sn.io	f, c
      0002E0 7B 61                  740 	goto	00128$
                                    741 ;	pdk_Led_Ty_Gia.c: 145: count_ms1 = 0;
      0002E2 0D 26                  742 	clear	_count_ms1+0
      0002E4 0E 26                  743 	clear	_count_ms1+1
                                    744 ;	pdk_Led_Ty_Gia.c: 146: start_status = 0;
      0002E6 0F 26                  745 	clear	_start_status+0
      0002E8 10 26                  746 	clear	_start_status+1
                                    747 ;	pdk_Led_Ty_Gia.c: 147: count_data = 0;
      0002EA 11 26                  748 	clear	_count_data+0
      0002EC 12 26                  749 	clear	_count_data+1
                                    750 ;	pdk_Led_Ty_Gia.c: 148: data = 0;
      0002EE 13 26                  751 	clear	_data+0
      0002F0 14 26                  752 	clear	_data+1
      0002F2 15 26                  753 	clear	_data+2
      0002F4 16 26                  754 	clear	_data+3
      0002F6                        755 00128$:
                                    756 ;	pdk_Led_Ty_Gia.c: 151: if (count_data == 32) // reset sau khi detect 32 bit data
      0002F6 12 1F                  757 	mov	a, _count_data+1
      0002F8 00 17                  758 	mov	p, a
      0002FA 11 1F                  759 	mov	a, _count_data+0
      0002FC 20 52                  760 	ceqsn	a, #0x20
      0002FE 98 61                  761 	goto	00134$
      000300 00 1F                  762 	mov	a, p
      000302 00 52                  763 	ceqsn	a, #0x00
      000304 98 61                  764 	goto	00134$
                                    765 ;	pdk_Led_Ty_Gia.c: 153: sta = 1;
      000306 01 57                  766 	mov	a, #0x01
      000308 1B 17                  767 	mov	_sta+0, a
      00030A 1C 26                  768 	clear	_sta+1
                                    769 ;	pdk_Led_Ty_Gia.c: 154: data2 = data;
      00030C 13 1F                  770 	mov	a, _data+0
      00030E 17 17                  771 	mov	_data2+0, a
      000310 14 1F                  772 	mov	a, _data+1
      000312 18 17                  773 	mov	_data2+1, a
      000314 15 1F                  774 	mov	a, _data+2
      000316 19 17                  775 	mov	_data2+2, a
      000318 16 1F                  776 	mov	a, _data+3
      00031A 1A 17                  777 	mov	_data2+3, a
                                    778 ;	pdk_Led_Ty_Gia.c: 156: count_data = 0;
      00031C 11 26                  779 	clear	_count_data+0
      00031E 12 26                  780 	clear	_count_data+1
                                    781 ;	pdk_Led_Ty_Gia.c: 157: data = 0;
      000320 13 26                  782 	clear	_data+0
      000322 14 26                  783 	clear	_data+1
      000324 15 26                  784 	clear	_data+2
      000326 16 26                  785 	clear	_data+3
                                    786 ;	pdk_Led_Ty_Gia.c: 158: start_status = 0;
      000328 0F 26                  787 	clear	_start_status+0
      00032A 10 26                  788 	clear	_start_status+1
                                    789 ;	pdk_Led_Ty_Gia.c: 159: count_ms1 = 0;
      00032C 0D 26                  790 	clear	_count_ms1+0
      00032E 0E 26                  791 	clear	_count_ms1+1
      000330                        792 00134$:
                                    793 ;	pdk_Led_Ty_Gia.c: 163: }
      000330 73 00                  794 	pop	af
      000332 00 17                  795 	mov	p, a
      000334 73 00                  796 	pop	af
      000336 7B 00                  797 	reti
                                    798 	.area CODE
                                    799 	.area CONST
                                    800 	.area CABS (ABS)
