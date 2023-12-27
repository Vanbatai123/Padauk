                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_uart_TIM
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
                                     16 	.globl __sdcc_external_startup
                                     17 	.globl _interrupt
                                     18 	.globl _main
                                     19 	.globl _print_string
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
                                     79 	.globl _print_string_PARM_1
                                     80 	.globl _SW_UART_Transmit_PARM_1
                                     81 	.globl _SW_UART_status
                                     82 	.globl _SW_UART_FRAME_ERROR
                                     83 	.globl _SW_UART_RX_BUFFER_OVERFLOW
                                     84 	.globl _SW_UART_RX_BUFFER_FULL
                                     85 	.globl _SW_UART_TX_BUFFER_FULL
                                     86 	.globl _RX_data
                                     87 	.globl _TX_data
                                     88 	.globl _last_bit_sent
                                     89 	.globl _state
                                     90 	.globl _bit_out
                                     91 	.globl _counter2
                                     92 	.globl _counter
                                     93 	.globl __delay_loop_32_PARM_1
                                     94 	.globl __delay_loop_16_PARM_1
                                     95 	.globl __delay_loop_8_PARM_1
                                     96 	.globl _SW_UART_Enable
                                     97 	.globl _SW_UART_Transmit
                                     98 ;--------------------------------------------------------
                                     99 ; special function registers
                                    100 ;--------------------------------------------------------
                                    101 	.area RSEG (ABS)
      000000                        102 	.org 0x0000
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
      000000                        158 __t16c::
      000000                        159 	.ds 2
                                    160 ;--------------------------------------------------------
                                    161 ; ram data
                                    162 ;--------------------------------------------------------
                                    163 	.area DATA
      000002                        164 __delay_loop_8_PARM_1:
      000002                        165 	.ds 1
      000003                        166 __delay_loop_16_PARM_1:
      000003                        167 	.ds 2
      000005                        168 __delay_loop_32_PARM_1:
      000005                        169 	.ds 4
      000009                        170 _counter::
      000009                        171 	.ds 1
      00000A                        172 _counter2::
      00000A                        173 	.ds 1
      00000B                        174 _bit_out::
      00000B                        175 	.ds 1
      00000C                        176 _state::
      00000C                        177 	.ds 1
      00000D                        178 _last_bit_sent::
      00000D                        179 	.ds 1
      00000E                        180 _TX_data::
      00000E                        181 	.ds 1
      00000F                        182 _RX_data::
      00000F                        183 	.ds 1
      000010                        184 _SW_UART_TX_BUFFER_FULL::
      000010                        185 	.ds 1
      000011                        186 _SW_UART_RX_BUFFER_FULL::
      000011                        187 	.ds 1
      000012                        188 _SW_UART_RX_BUFFER_OVERFLOW::
      000012                        189 	.ds 1
      000013                        190 _SW_UART_FRAME_ERROR::
      000013                        191 	.ds 1
      000014                        192 _SW_UART_status::
      000014                        193 	.ds 1
      000015                        194 _SW_UART_Transmit_PARM_1:
      000015                        195 	.ds 1
      000016                        196 _print_string_PARM_1:
      000016                        197 	.ds 2
      000018                        198 _print_string_sloc0_1_0:
      000018                        199 	.ds 2
                                    200 ;--------------------------------------------------------
                                    201 ; overlayable items in ram
                                    202 ;--------------------------------------------------------
                                    203 ;--------------------------------------------------------
                                    204 ; Stack segment in internal ram
                                    205 ;--------------------------------------------------------
                                    206 	.area	SSEG
      00001A                        207 __start__stack:
      00001A                        208 	.ds	1
                                    209 
                                    210 ;--------------------------------------------------------
                                    211 ; absolute external ram data
                                    212 ;--------------------------------------------------------
                                    213 	.area DABS (ABS)
                                    214 ;--------------------------------------------------------
                                    215 ; interrupt vector
                                    216 ;--------------------------------------------------------
                                    217 	.area HOME
      000022                        218 __interrupt_vect:
                                    219 	.area	HEADER (ABS)
      000020                        220 	.org	 0x0020
      000020 9F 60                  221 	goto	_interrupt
                                    222 ;--------------------------------------------------------
                                    223 ; global & static initialisations
                                    224 ;--------------------------------------------------------
                                    225 	.area HOME
                                    226 	.area GSINIT
                                    227 	.area GSFINAL
                                    228 	.area GSINIT
                                    229 	.area	PREG (ABS)
      000000                        230 	.org 0x00
      000000                        231 p::
      000000                        232 	.ds 2
                                    233 	.area	HEADER (ABS)
      000000                        234 	.org 0x0000
      000000 00 00                  235 	nop
      000002 01 26                  236 	clear	p+1
      000004 1A 57                  237 	mov	a, #s_OSEG
      000006 01 50                  238 	add	a, #l_OSEG + 1
      000008 FE 54                  239 	and	a, #0xfe
      00000A 02 01                  240 	mov.io	sp, a
      00000C F3 70                  241 	call	__sdcc_external_startup
      00000E 12 60                  242 	goto	s_GSINIT
                                    243 	.area GSINIT
      000024                        244 __sdcc_init_data:
      000024 02 57                  245 	mov	a, #s_DATA
      000026 00 17                  246 	mov	p, a
      000028 19 60                  247 	goto	00002$
      00002A                        248 00001$:
      00002A 00 57                  249 	mov	a, #0x00
      00002C 00 07                  250 	idxm	p, a
      00002E 00 24                  251 	inc	p
      000030 02 57                  252 	mov	a, #s_DATA
      000032                        253 00002$:
      000032 18 50                  254 	add	a, #l_DATA
      000034 00 2E                  255 	ceqsn	a, p
      000036 15 60                  256 	goto	00001$
                                    257 ;	pfs173_uart_TIM.c: 22: unsigned char counter = 0;	   //even 2,4,6 when TRANSMIT
      000038 09 26                  258 	clear	_counter+0
                                    259 ;	pfs173_uart_TIM.c: 23: unsigned char counter2 = 0;	   //even 2,4,6 when TRANSMIT
      00003A 0A 26                  260 	clear	_counter2+0
                                    261 ;	pfs173_uart_TIM.c: 24: unsigned char bit_out = 0;	   //
      00003C 0B 26                  262 	clear	_bit_out+0
                                    263 ;	pfs173_uart_TIM.c: 25: unsigned char state = 0;		   //
      00003E 0C 26                  264 	clear	_state+0
                                    265 ;	pfs173_uart_TIM.c: 26: unsigned char last_bit_sent = 0; //
      000040 0D 26                  266 	clear	_last_bit_sent+0
                                    267 ;	pfs173_uart_TIM.c: 27: unsigned char TX_data = 0;	   //
      000042 0E 26                  268 	clear	_TX_data+0
                                    269 ;	pfs173_uart_TIM.c: 28: unsigned char RX_data = 0;	   //
      000044 0F 26                  270 	clear	_RX_data+0
                                    271 	.area GSFINAL
      000046 11 60                  272 	goto	__sdcc_program_startup
                                    273 ;--------------------------------------------------------
                                    274 ; Home
                                    275 ;--------------------------------------------------------
                                    276 	.area HOME
                                    277 	.area HOME
      000022                        278 __sdcc_program_startup:
      000022 71 60                  279 	goto	_main
                                    280 ;	return from main will return to caller
                                    281 ;--------------------------------------------------------
                                    282 ; code
                                    283 ;--------------------------------------------------------
                                    284 	.area CODE
                                    285 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    286 ;	-----------------------------------------
                                    287 ;	 function _delay_loop_8
                                    288 ;	-----------------------------------------
      000048                        289 __delay_loop_8:
                                    290 ;	delay.h: 44: __endasm;
      000048                        291 	00001$:
                                    292 ; 4 cycles per loop
      000048 02 23                  293 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00004A 24 60                  294 	goto	00001$ ; 2 cycles
      00004C                        295 00101$:
                                    296 ;	delay.h: 45: }
      00004C 7A 00                  297 	ret
                                    298 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    299 ;	-----------------------------------------
                                    300 ;	 function _delay_loop_16
                                    301 ;	-----------------------------------------
      00004E                        302 __delay_loop_16:
                                    303 ;	delay.h: 65: __endasm;
      00004E                        304 	00001$:
                                    305 ; 8 cycles per loop
      00004E 00 00                  306 	nop	; 1 cycle
      000050 03 25                  307 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000052 04 21                  308 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000054 03 1F                  309 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000056 04 1D                  310 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000058 00 34                  311 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00005A 27 60                  312 	goto	00001$ ; 2 cycles
      00005C                        313 00101$:
                                    314 ;	delay.h: 66: }
      00005C 7A 00                  315 	ret
                                    316 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    317 ;	-----------------------------------------
                                    318 ;	 function _delay_loop_32
                                    319 ;	-----------------------------------------
      00005E                        320 __delay_loop_32:
                                    321 ;	delay.h: 94: __endasm;
      00005E                        322 	00001$:
                                    323 ; 12 cycles per loop
      00005E 00 00                  324 	nop	; 1 cycle
      000060 05 25                  325 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000062 06 21                  326 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000064 07 21                  327 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000066 08 21                  328 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000068 05 1F                  329 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00006A 06 1D                  330 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00006C 07 1D                  331 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      00006E 08 1D                  332 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000070 00 34                  333 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000072 2F 60                  334 	goto	00001$ ; 2 cycles
      000074                        335 00101$:
                                    336 ;	delay.h: 95: }
      000074 7A 00                  337 	ret
                                    338 ;	pfs173_uart_TIM.c: 39: void SW_UART_Enable(void)
                                    339 ;	-----------------------------------------
                                    340 ;	 function SW_UART_Enable
                                    341 ;	-----------------------------------------
      000076                        342 _SW_UART_Enable:
                                    343 ;	pfs173_uart_TIM.c: 42: setb(PBC, 7);
      000076 94 3F                  344 	set1.io	__pbc, #7
                                    345 ;	pfs173_uart_TIM.c: 43: setb(PB, 7);
      000078 93 3F                  346 	set1.io	__pb, #7
                                    347 ;	pfs173_uart_TIM.c: 46: setb(PBDIER, 5);
      00007A 8E 3E                  348 	set1.io	__pbdier, #5
                                    349 ;	pfs173_uart_TIM.c: 47: setb(PBPH, 5);
      00007C 95 3E                  350 	set1.io	__pbph, #5
                                    351 ;	pfs173_uart_TIM.c: 49: INTEGS = INTEGS_PB5_FALLING;
      00007E 02 57                  352 	mov	a, #0x02
      000080 0C 01                  353 	mov.io	__integs, a
                                    354 ;	pfs173_uart_TIM.c: 52: INTEN &= ~INTEN_TM2;
      000082 04 3B                  355 	set0.io	__inten, #6
                                    356 ;	pfs173_uart_TIM.c: 55: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      000084 20 57                  357 	mov	a, #0x20
      000086 30 01                  358 	mov.io	__tm2c, a
                                    359 ;	pfs173_uart_TIM.c: 56: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      000088 0F 57                  360 	mov	a, #0x0f
      00008A 32 01                  361 	mov.io	__tm2s, a
                                    362 ;	pfs173_uart_TIM.c: 57: TM2B = 103;
      00008C 67 57                  363 	mov	a, #0x67
      00008E 33 01                  364 	mov.io	__tm2b, a
                                    365 ;	pfs173_uart_TIM.c: 59: INTEN |= INTEN_PB5;
      000090 04 3C                  366 	set1.io	__inten, #0
                                    367 ;	pfs173_uart_TIM.c: 61: state = IDLE;
      000092 0C 26                  368 	clear	_state+0
                                    369 ;	pfs173_uart_TIM.c: 62: INTRQ = 0;
      000094 00 57                  370 	mov	a, #0x00
      000096 05 01                  371 	mov.io	__intrq, a
                                    372 ;	pfs173_uart_TIM.c: 63: }
      000098 7A 00                  373 	ret
                                    374 ;	pfs173_uart_TIM.c: 65: void SW_UART_Transmit(unsigned char byte)
                                    375 ;	-----------------------------------------
                                    376 ;	 function SW_UART_Transmit
                                    377 ;	-----------------------------------------
      00009A                        378 _SW_UART_Transmit:
                                    379 ;	pfs173_uart_TIM.c: 68: while (state != IDLE)
      00009A                        380 00101$:
      00009A 0C 1F                  381 	mov	a, _state+0
      00009C 00 52                  382 	ceqsn	a, #0x00
      00009E 4D 60                  383 	goto	00101$
                                    384 ;	pfs173_uart_TIM.c: 73: state = TRANSMIT;
      0000A0 01 57                  385 	mov	a, #0x01
      0000A2 0C 17                  386 	mov	_state+0, a
                                    387 ;	pfs173_uart_TIM.c: 75: TX_data = byte; //copy data to tx buffer
      0000A4 15 1F                  388 	mov	a, _SW_UART_Transmit_PARM_1+0
      0000A6 0E 17                  389 	mov	_TX_data+0, a
                                    390 ;	pfs173_uart_TIM.c: 76: counter = 0;
      0000A8 09 26                  391 	clear	_counter+0
                                    392 ;	pfs173_uart_TIM.c: 78: clrb(PB, 7); //send start bit
      0000AA 93 3B                  393 	set0.io	__pb, #7
                                    394 ;	pfs173_uart_TIM.c: 79: clrb(PB, 7); //send start bit
      0000AC 93 3B                  395 	set0.io	__pb, #7
                                    396 ;	pfs173_uart_TIM.c: 81: INTRQ = 0;
      0000AE 00 57                  397 	mov	a, #0x00
      0000B0 05 01                  398 	mov.io	__intrq, a
                                    399 ;	pfs173_uart_TIM.c: 82: INTEN |= INTEN_TM2;
      0000B2 04 3F                  400 	set1.io	__inten, #6
                                    401 ;	pfs173_uart_TIM.c: 83: }
      0000B4 7A 00                  402 	ret
                                    403 ;	pfs173_uart_TIM.c: 85: void print_string(char *str)
                                    404 ;	-----------------------------------------
                                    405 ;	 function print_string
                                    406 ;	-----------------------------------------
      0000B6                        407 _print_string:
                                    408 ;	pfs173_uart_TIM.c: 88: while (str[i] != '\0')
      0000B6 18 26                  409 	clear	_print_string_sloc0_1_0+0
      0000B8 19 26                  410 	clear	_print_string_sloc0_1_0+1
      0000BA                        411 00101$:
      0000BA 16 1F                  412 	mov	a, _print_string_PARM_1+0
      0000BC 18 18                  413 	add	a, _print_string_sloc0_1_0+0
      0000BE 00 17                  414 	mov	p, a
      0000C0 17 1F                  415 	mov	a, _print_string_PARM_1+1
      0000C2 19 1A                  416 	addc	a, _print_string_sloc0_1_0+1
      0000C4 02 71                  417 	call	__gptrget
      0000C6 00 53                  418 	cneqsn	a, #0x00
      0000C8 70 60                  419 	goto	00104$
                                    420 ;	pfs173_uart_TIM.c: 89: SW_UART_Transmit(str[i++]);
      0000CA 16 1F                  421 	mov	a, _print_string_PARM_1+0
      0000CC 18 18                  422 	add	a, _print_string_sloc0_1_0+0
      0000CE 00 17                  423 	mov	p, a
      0000D0 17 1F                  424 	mov	a, _print_string_PARM_1+1
      0000D2 19 1A                  425 	addc	a, _print_string_sloc0_1_0+1
      0000D4 18 24                  426 	inc	_print_string_sloc0_1_0+0
      0000D6 19 20                  427 	addc	_print_string_sloc0_1_0+1
      0000D8 02 71                  428 	call	__gptrget
      0000DA 15 17                  429 	mov	_SW_UART_Transmit_PARM_1+0, a
      0000DC 4D 70                  430 	call	_SW_UART_Transmit
      0000DE 5D 60                  431 	goto	00101$
      0000E0                        432 00104$:
                                    433 ;	pfs173_uart_TIM.c: 90: }
      0000E0 7A 00                  434 	ret
                                    435 ;	pfs173_uart_TIM.c: 92: void main(void)
                                    436 ;	-----------------------------------------
                                    437 ;	 function main
                                    438 ;	-----------------------------------------
      0000E2                        439 _main:
                                    440 ;	pfs173_uart_TIM.c: 94: SW_UART_Enable();
      0000E2 3B 70                  441 	call	_SW_UART_Enable
                                    442 ;	pfs173_uart_TIM.c: 95: sei();
      0000E4 78 00                  443 	engint
                                    444 ;	pfs173_uart_TIM.c: 96: SW_UART_Transmit('A');
      0000E6 41 57                  445 	mov	a, #0x41
      0000E8 15 17                  446 	mov	_SW_UART_Transmit_PARM_1+0, a
      0000EA 4D 70                  447 	call	_SW_UART_Transmit
                                    448 ;	pfs173_uart_TIM.c: 97: SW_UART_Transmit('V');
      0000EC 56 57                  449 	mov	a, #0x56
      0000EE 15 17                  450 	mov	_SW_UART_Transmit_PARM_1+0, a
      0000F0 4D 70                  451 	call	_SW_UART_Transmit
                                    452 ;	pfs173_uart_TIM.c: 98: SW_UART_Transmit('R');
      0000F2 52 57                  453 	mov	a, #0x52
      0000F4 15 17                  454 	mov	_SW_UART_Transmit_PARM_1+0, a
      0000F6 4D 70                  455 	call	_SW_UART_Transmit
                                    456 ;	pfs173_uart_TIM.c: 99: SW_UART_Transmit('\r');
      0000F8 0D 57                  457 	mov	a, #0x0d
      0000FA 15 17                  458 	mov	_SW_UART_Transmit_PARM_1+0, a
      0000FC 4D 70                  459 	call	_SW_UART_Transmit
                                    460 ;	pfs173_uart_TIM.c: 100: while (1)
      0000FE                        461 00108$:
                                    462 ;	pfs173_uart_TIM.c: 102: if (state == DATA_PENDING)
      0000FE 0C 1F                  463 	mov	a, _state+0
      000100 05 52                  464 	ceqsn	a, #0x05
      000102 7F 60                  465 	goto	00108$
                                    466 ;	pfs173_uart_TIM.c: 104: state = IDLE;
      000104 0C 26                  467 	clear	_state+0
                                    468 ;	pfs173_uart_TIM.c: 106: SW_UART_Transmit(RX_data);
      000106 0F 1F                  469 	mov	a, _RX_data+0
      000108 15 17                  470 	mov	_SW_UART_Transmit_PARM_1+0, a
      00010A 4D 70                  471 	call	_SW_UART_Transmit
                                    472 ;	pfs173_uart_TIM.c: 107: switch (RX_data)
      00010C 0F 1F                  473 	mov	a, _RX_data+0
      00010E 41 53                  474 	cneqsn	a, #0x41
      000110 92 60                  475 	goto	00102$
      000112                        476 00128$:
      000112 0F 1F                  477 	mov	a, _RX_data+0
      000114 61 52                  478 	ceqsn	a, #0x61
      000116 98 60                  479 	goto	00103$
                                    480 ;	pfs173_uart_TIM.c: 111: print_string("atmel avr\r");
      000118 0E 57                  481 	mov	a, #<(___str_0 + 0)
      00011A 16 17                  482 	mov	_print_string_PARM_1+0, a
      00011C 81 57                  483 	mov	a, #>(___str_0 + 0x8000 + 0)
      00011E 17 17                  484 	mov	_print_string_PARM_1+1, a
      000120 5B 70                  485 	call	_print_string
                                    486 ;	pfs173_uart_TIM.c: 112: break;
      000122 7F 60                  487 	goto	00108$
                                    488 ;	pfs173_uart_TIM.c: 114: case 'A':
      000124                        489 00102$:
                                    490 ;	pfs173_uart_TIM.c: 115: print_string("Atmel AVR\r");
      000124 19 57                  491 	mov	a, #<(___str_1 + 0)
      000126 16 17                  492 	mov	_print_string_PARM_1+0, a
      000128 81 57                  493 	mov	a, #>(___str_1 + 0x8000 + 0)
      00012A 17 17                  494 	mov	_print_string_PARM_1+1, a
      00012C 5B 70                  495 	call	_print_string
                                    496 ;	pfs173_uart_TIM.c: 116: break;
      00012E 7F 60                  497 	goto	00108$
                                    498 ;	pfs173_uart_TIM.c: 118: default:
      000130                        499 00103$:
                                    500 ;	pfs173_uart_TIM.c: 119: print_string("Unknown command\r");
      000130 24 57                  501 	mov	a, #<(___str_2 + 0)
      000132 16 17                  502 	mov	_print_string_PARM_1+0, a
      000134 81 57                  503 	mov	a, #>(___str_2 + 0x8000 + 0)
      000136 17 17                  504 	mov	_print_string_PARM_1+1, a
      000138 5B 70                  505 	call	_print_string
                                    506 ;	pfs173_uart_TIM.c: 121: }
      00013A 7F 60                  507 	goto	00108$
                                    508 ;	pfs173_uart_TIM.c: 124: }
      00013C 7A 00                  509 	ret
                                    510 ;	pfs173_uart_TIM.c: 127: void interrupt(void) __interrupt(0)
                                    511 ;	-----------------------------------------
                                    512 ;	 function interrupt
                                    513 ;	-----------------------------------------
      00013E                        514 _interrupt:
      00013E 72 00                  515 	push	af
      000140 00 1F                  516 	mov	a, p
      000142 72 00                  517 	push	af
                                    518 ;	pfs173_uart_TIM.c: 130: if (INTRQ & INTRQ_TM2)
      000144 85 01                  519 	mov.io	a, __intrq
      000146 40 54                  520 	and	a, #0x40
      000148 00 53                  521 	cneqsn	a, #0x00
      00014A DD 60                  522 	goto	00118$
                                    523 ;	pfs173_uart_TIM.c: 132: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      00014C 05 3B                  524 	set0.io	__intrq, #6
                                    525 ;	pfs173_uart_TIM.c: 133: switch (state)
      00014E 0C 1F                  526 	mov	a, _state+0
      000150 01 53                  527 	cneqsn	a, #0x01
      000152 B1 60                  528 	goto	00101$
      000154                        529 00159$:
      000154 0C 1F                  530 	mov	a, _state+0
      000156 02 53                  531 	cneqsn	a, #0x02
      000158 C7 60                  532 	goto	00109$
      00015A                        533 00160$:
      00015A 0C 1F                  534 	mov	a, _state+0
      00015C 04 53                  535 	cneqsn	a, #0x04
      00015E C3 60                  536 	goto	00108$
      000160                        537 00161$:
      000160 DC 60                  538 	goto	00115$
                                    539 ;	pfs173_uart_TIM.c: 136: case TRANSMIT:
      000162                        540 00101$:
                                    541 ;	pfs173_uart_TIM.c: 138: if (counter < 8)
      000162 09 1F                  542 	mov	a, _counter+0
      000164 08 51                  543 	sub	a, #0x08
      000166 80 34                  544 	t1sn.io	f, c
      000168 BF 60                  545 	goto	00106$
                                    546 ;	pfs173_uart_TIM.c: 140: if (TX_data & 0x01)
      00016A 0E 1F                  547 	mov	a, _TX_data+0
      00016C 01 54                  548 	and	a, #0x01
      00016E 00 53                  549 	cneqsn	a, #0x00
      000170 BB 60                  550 	goto	00103$
                                    551 ;	pfs173_uart_TIM.c: 142: setb(PB, 7); // Send a logic 1 on the TX_PIN.
      000172 93 3F                  552 	set1.io	__pb, #7
      000174 BC 60                  553 	goto	00104$
      000176                        554 00103$:
                                    555 ;	pfs173_uart_TIM.c: 146: clrb(PB, 7); // Send a logic 0 on the TX_PIN.
      000176 93 3B                  556 	set0.io	__pb, #7
      000178                        557 00104$:
                                    558 ;	pfs173_uart_TIM.c: 148: TX_data = TX_data >> 1; // Bitshift the TX buffer and
      000178 0E 2A                  559 	sr	_TX_data+0
                                    560 ;	pfs173_uart_TIM.c: 149: counter++;				// increment TX bit counter.
      00017A 09 24                  561 	inc	_counter+0
      00017C DD 60                  562 	goto	00118$
      00017E                        563 00106$:
                                    564 ;	pfs173_uart_TIM.c: 155: setb(PB, 7); // Output a logic 1.
      00017E 93 3F                  565 	set1.io	__pb, #7
                                    566 ;	pfs173_uart_TIM.c: 156: state = TRANSMIT_STOP_BIT;
      000180 04 57                  567 	mov	a, #0x04
      000182 0C 17                  568 	mov	_state+0, a
                                    569 ;	pfs173_uart_TIM.c: 158: break;
      000184 DD 60                  570 	goto	00118$
                                    571 ;	pfs173_uart_TIM.c: 161: case TRANSMIT_STOP_BIT:
      000186                        572 00108$:
                                    573 ;	pfs173_uart_TIM.c: 162: INTEN &= ~INTEN_TM2; // Stop the timer interrupts.
      000186 04 3B                  574 	set0.io	__inten, #6
                                    575 ;	pfs173_uart_TIM.c: 163: state = IDLE;		 // Go back to idle.
      000188 0C 26                  576 	clear	_state+0
                                    577 ;	pfs173_uart_TIM.c: 164: INTEN |= INTEN_PB5;	 // Enable reception again.
      00018A 04 3C                  578 	set1.io	__inten, #0
                                    579 ;	pfs173_uart_TIM.c: 165: break;
      00018C DD 60                  580 	goto	00118$
                                    581 ;	pfs173_uart_TIM.c: 168: case RECEIVE:
      00018E                        582 00109$:
                                    583 ;	pfs173_uart_TIM.c: 169: TM2B = 103; // Count one period after the falling edge is trigged.
      00018E 67 57                  584 	mov	a, #0x67
      000190 33 01                  585 	mov.io	__tm2b, a
                                    586 ;	pfs173_uart_TIM.c: 171: if (counter2 < 8)
      000192 0A 1F                  587 	mov	a, _counter2+0
      000194 08 51                  588 	sub	a, #0x08
      000196 80 34                  589 	t1sn.io	f, c
      000198 D6 60                  590 	goto	00113$
                                    591 ;	pfs173_uart_TIM.c: 173: counter2++;
      00019A 0A 24                  592 	inc	_counter2+0
                                    593 ;	pfs173_uart_TIM.c: 174: RX_data = (RX_data >> 1); // Shift due to receiving LSB first.
      00019C 0F 2A                  594 	sr	_RX_data+0
                                    595 ;	pfs173_uart_TIM.c: 175: if ((PB & (1 << 5)) != 0)
      00019E 93 01                  596 	mov.io	a, __pb
      0001A0 20 54                  597 	and	a, #0x20
      0001A2 00 53                  598 	cneqsn	a, #0x00
      0001A4 DD 60                  599 	goto	00118$
                                    600 ;	pfs173_uart_TIM.c: 177: RX_data |= 0x80; // If a logical 1 is read, let the data mirror this.
      0001A6 80 57                  601 	mov	a, #0x80
      0001A8 0F 15                  602 	or	_RX_data+0, a
      0001AA DD 60                  603 	goto	00118$
      0001AC                        604 00113$:
                                    605 ;	pfs173_uart_TIM.c: 184: state = DATA_PENDING; // Enter DATA_PENDING when one byte is received.
      0001AC 05 57                  606 	mov	a, #0x05
      0001AE 0C 17                  607 	mov	_state+0, a
                                    608 ;	pfs173_uart_TIM.c: 185: INTEN &= ~INTEN_TM2;  // Disable this interrupt.
      0001B0 04 3B                  609 	set0.io	__inten, #6
                                    610 ;	pfs173_uart_TIM.c: 186: INTRQ &= ~INTRQ_PB5;  // Reset flag not to enter the ISR one extra time.
      0001B2 05 38                  611 	set0.io	__intrq, #0
                                    612 ;	pfs173_uart_TIM.c: 187: INTEN |= INTEN_PB5;	  // Enable interrupt to receive more bytes.
      0001B4 04 3C                  613 	set1.io	__inten, #0
                                    614 ;	pfs173_uart_TIM.c: 189: break;
      0001B6 DD 60                  615 	goto	00118$
                                    616 ;	pfs173_uart_TIM.c: 192: default:
      0001B8                        617 00115$:
                                    618 ;	pfs173_uart_TIM.c: 193: state = IDLE; // Error, should not occur. Going to a safe state.
      0001B8 0C 26                  619 	clear	_state+0
                                    620 ;	pfs173_uart_TIM.c: 194: }
      0001BA                        621 00118$:
                                    622 ;	pfs173_uart_TIM.c: 197: if (INTRQ & INTRQ_PB5)
      0001BA 85 01                  623 	mov.io	a, __intrq
      0001BC 01 54                  624 	and	a, #0x01
      0001BE 00 53                  625 	cneqsn	a, #0x00
      0001C0 EF 60                  626 	goto	00121$
                                    627 ;	pfs173_uart_TIM.c: 200: INTRQ &= ~INTRQ_PB5; // Ma
      0001C2 05 38                  628 	set0.io	__intrq, #0
                                    629 ;	pfs173_uart_TIM.c: 202: state = RECEIVE;
      0001C4 02 57                  630 	mov	a, #0x02
      0001C6 0C 17                  631 	mov	_state+0, a
                                    632 ;	pfs173_uart_TIM.c: 203: INTEN &= ~INTEN_PB5;
      0001C8 04 38                  633 	set0.io	__inten, #0
                                    634 ;	pfs173_uart_TIM.c: 204: INTEN &= ~INTEN_TM2;
      0001CA 04 3B                  635 	set0.io	__inten, #6
                                    636 ;	pfs173_uart_TIM.c: 205: TM2CT = 9;
      0001CC 09 57                  637 	mov	a, #0x09
      0001CE 31 01                  638 	mov.io	__tm2ct, a
                                    639 ;	pfs173_uart_TIM.c: 206: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      0001D0 0F 57                  640 	mov	a, #0x0f
      0001D2 32 01                  641 	mov.io	__tm2s, a
                                    642 ;	pfs173_uart_TIM.c: 207: TM2B = 155;
      0001D4 9B 57                  643 	mov	a, #0x9b
      0001D6 33 01                  644 	mov.io	__tm2b, a
                                    645 ;	pfs173_uart_TIM.c: 208: counter2 = 0;
      0001D8 0A 26                  646 	clear	_counter2+0
                                    647 ;	pfs173_uart_TIM.c: 209: INTRQ &= ~INTRQ_TM2; // Ma
      0001DA 05 3B                  648 	set0.io	__intrq, #6
                                    649 ;	pfs173_uart_TIM.c: 210: INTEN |= INTEN_TM2;
      0001DC 04 3F                  650 	set1.io	__inten, #6
      0001DE                        651 00121$:
                                    652 ;	pfs173_uart_TIM.c: 212: }
      0001DE 73 00                  653 	pop	af
      0001E0 00 17                  654 	mov	p, a
      0001E2 73 00                  655 	pop	af
      0001E4 7B 00                  656 	reti
                                    657 ;	pfs173_uart_TIM.c: 214: unsigned char _sdcc_external_startup(void)
                                    658 ;	-----------------------------------------
                                    659 ;	 function _sdcc_external_startup
                                    660 ;	-----------------------------------------
      0001E6                        661 __sdcc_external_startup:
                                    662 ;	pfs173_uart_TIM.c: 216: ROP = ROP_INT_SRC_PB5;
      0001E6 02 57                  663 	mov	a, #0x02
      0001E8 67 01                  664 	mov.io	__rop, a
                                    665 ;	pfs173_uart_TIM.c: 217: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      0001EA 34 57                  666 	mov	a, #0x34
      0001EC 03 01                  667 	mov.io	__clkmd, a
                                    668 ;	pfs173_uart_TIM.c: 218: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); //tune SYSCLK to 8MHz @ 4.000V
      0001EE 52 54                  669 	and	a, #'R'                        
      0001F0 43 54                  670 	and	a, #'C'                        
      0001F2 01 54                  671 	and	a, #((1))          
      0001F4 00 54                  672 	and	a, #((8000000))     
      0001F6 12 54                  673 	and	a, #((8000000)>>8)  
      0001F8 7A 54                  674 	and	a, #((8000000)>>16) 
      0001FA 00 54                  675 	and	a, #((8000000)>>24) 
      0001FC A0 54                  676 	and	a, #((4000))     
      0001FE 0F 54                  677 	and	a, #((4000)>>8)  
      000200 0B 54                  678 	and	a, #((0x0B))           
                                    679 ;	pfs173_uart_TIM.c: 219: return 0;							  //perform normal initialization
                                    680 ;	pfs173_uart_TIM.c: 220: }
      000202 00 02                  681 	ret	#0x00
                                    682 	.area CODE
                                    683 	.area CONST
                                    684 	.area CONST
      00021C                        685 ___str_0:
      00021C 61 02                  686 	ret #0x61	; a
      00021E 74 02                  687 	ret #0x74	; t
      000220 6D 02                  688 	ret #0x6d	; m
      000222 65 02                  689 	ret #0x65	; e
      000224 6C 02                  690 	ret #0x6c	; l
      000226 20 02                  691 	ret #0x20	;  
      000228 61 02                  692 	ret #0x61	; a
      00022A 76 02                  693 	ret #0x76	; v
      00022C 72 02                  694 	ret #0x72	; r
      00022E 0D 02                  695 	ret #0x0d
      000230 00 02                  696 	ret #0x00
                                    697 	.area CODE
                                    698 	.area CONST
      000232                        699 ___str_1:
      000232 41 02                  700 	ret #0x41	; A
      000234 74 02                  701 	ret #0x74	; t
      000236 6D 02                  702 	ret #0x6d	; m
      000238 65 02                  703 	ret #0x65	; e
      00023A 6C 02                  704 	ret #0x6c	; l
      00023C 20 02                  705 	ret #0x20	;  
      00023E 41 02                  706 	ret #0x41	; A
      000240 56 02                  707 	ret #0x56	; V
      000242 52 02                  708 	ret #0x52	; R
      000244 0D 02                  709 	ret #0x0d
      000246 00 02                  710 	ret #0x00
                                    711 	.area CODE
                                    712 	.area CONST
      000248                        713 ___str_2:
      000248 55 02                  714 	ret #0x55	; U
      00024A 6E 02                  715 	ret #0x6e	; n
      00024C 6B 02                  716 	ret #0x6b	; k
      00024E 6E 02                  717 	ret #0x6e	; n
      000250 6F 02                  718 	ret #0x6f	; o
      000252 77 02                  719 	ret #0x77	; w
      000254 6E 02                  720 	ret #0x6e	; n
      000256 20 02                  721 	ret #0x20	;  
      000258 63 02                  722 	ret #0x63	; c
      00025A 6F 02                  723 	ret #0x6f	; o
      00025C 6D 02                  724 	ret #0x6d	; m
      00025E 6D 02                  725 	ret #0x6d	; m
      000260 61 02                  726 	ret #0x61	; a
      000262 6E 02                  727 	ret #0x6e	; n
      000264 64 02                  728 	ret #0x64	; d
      000266 0D 02                  729 	ret #0x0d
      000268 00 02                  730 	ret #0x00
                                    731 	.area CODE
                                    732 	.area CABS (ABS)
