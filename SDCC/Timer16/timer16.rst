                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timer16
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
                                     16 	.globl _main
                                     17 	.globl _UART_printNum
                                     18 	.globl _UART_print
                                     19 	.globl _interrupt
                                     20 	.globl __sdcc_external_startup
                                     21 	.globl _TIM2_interrupt
                                     22 	.globl _putChar
                                     23 	.globl _UART_begin
                                     24 	.globl _millis_irq_handler
                                     25 	.globl _millis
                                     26 	.globl _millis_setup
                                     27 	.globl __delay_loop_32
                                     28 	.globl __delay_loop_16
                                     29 	.globl __delay_loop_8
                                     30 	.globl __t16c
                                     31 	.globl __rop
                                     32 	.globl __bgtr
                                     33 	.globl __ilrcr
                                     34 	.globl __pwmg2dtl
                                     35 	.globl __pwmg2dth
                                     36 	.globl __pwmg2c
                                     37 	.globl __pwmg1dtl
                                     38 	.globl __pwmg1dth
                                     39 	.globl __pwmg1c
                                     40 	.globl __pwmgcubl
                                     41 	.globl __pwmgcubh
                                     42 	.globl __pwmg0dtl
                                     43 	.globl __pwmg0dth
                                     44 	.globl __pwmgclk
                                     45 	.globl __pwmg0c
                                     46 	.globl __tm3b
                                     47 	.globl __tm3s
                                     48 	.globl __tm3ct
                                     49 	.globl __tm3c
                                     50 	.globl __tm2b
                                     51 	.globl __tm2s
                                     52 	.globl __tm2ct
                                     53 	.globl __tm2c
                                     54 	.globl __gpcs
                                     55 	.globl __gpcc
                                     56 	.globl __misclvr
                                     57 	.globl __misc2
                                     58 	.globl __misc
                                     59 	.globl __adcrgc
                                     60 	.globl __adcr
                                     61 	.globl __adcm
                                     62 	.globl __adcc
                                     63 	.globl __pcpl
                                     64 	.globl __pbpl
                                     65 	.globl __pcph
                                     66 	.globl __pcc
                                     67 	.globl __pc
                                     68 	.globl __pbph
                                     69 	.globl __pbc
                                     70 	.globl __pb
                                     71 	.globl __paph
                                     72 	.globl __pac
                                     73 	.globl __pa
                                     74 	.globl __pcdier
                                     75 	.globl __pbdier
                                     76 	.globl __padier
                                     77 	.globl __integs
                                     78 	.globl __ihrcr
                                     79 	.globl __eoscr
                                     80 	.globl __t16m
                                     81 	.globl __intrq
                                     82 	.globl __inten
                                     83 	.globl __clkmd
                                     84 	.globl __sp
                                     85 	.globl __flag
                                     86 	.globl _t
                                     87 	.globl _UART_printNum_PARM_2
                                     88 	.globl _UART_printNum_PARM_1
                                     89 	.globl _UART_print_PARM_1
                                     90 	.globl _txdata
                                     91 	.globl _flag
                                     92 	.globl __millis
                                     93 	.globl __ticks
                                     94 	.globl __delay_loop_32_PARM_1
                                     95 	.globl __delay_loop_16_PARM_1
                                     96 	.globl __delay_loop_8_PARM_1
                                     97 ;--------------------------------------------------------
                                     98 ; special function registers
                                     99 ;--------------------------------------------------------
                                    100 	.area RSEG (ABS)
      000000                        101 	.org 0x0000
                           000000   102 __flag	=	0x0000
                           000002   103 __sp	=	0x0002
                           000003   104 __clkmd	=	0x0003
                           000004   105 __inten	=	0x0004
                           000005   106 __intrq	=	0x0005
                           000006   107 __t16m	=	0x0006
                           00000A   108 __eoscr	=	0x000a
                           00000B   109 __ihrcr	=	0x000b
                           00000C   110 __integs	=	0x000c
                           00000D   111 __padier	=	0x000d
                           00000E   112 __pbdier	=	0x000e
                           00000F   113 __pcdier	=	0x000f
                           000010   114 __pa	=	0x0010
                           000011   115 __pac	=	0x0011
                           000012   116 __paph	=	0x0012
                           000013   117 __pb	=	0x0013
                           000014   118 __pbc	=	0x0014
                           000015   119 __pbph	=	0x0015
                           000016   120 __pc	=	0x0016
                           000017   121 __pcc	=	0x0017
                           000018   122 __pcph	=	0x0018
                           000019   123 __pbpl	=	0x0019
                           00001A   124 __pcpl	=	0x001a
                           000020   125 __adcc	=	0x0020
                           000021   126 __adcm	=	0x0021
                           000022   127 __adcr	=	0x0022
                           000024   128 __adcrgc	=	0x0024
                           000026   129 __misc	=	0x0026
                           000027   130 __misc2	=	0x0027
                           000028   131 __misclvr	=	0x0028
                           00002B   132 __gpcc	=	0x002b
                           00002C   133 __gpcs	=	0x002c
                           000030   134 __tm2c	=	0x0030
                           000031   135 __tm2ct	=	0x0031
                           000032   136 __tm2s	=	0x0032
                           000033   137 __tm2b	=	0x0033
                           000034   138 __tm3c	=	0x0034
                           000035   139 __tm3ct	=	0x0035
                           000036   140 __tm3s	=	0x0036
                           000037   141 __tm3b	=	0x0037
                           000040   142 __pwmg0c	=	0x0040
                           000041   143 __pwmgclk	=	0x0041
                           000042   144 __pwmg0dth	=	0x0042
                           000043   145 __pwmg0dtl	=	0x0043
                           000044   146 __pwmgcubh	=	0x0044
                           000045   147 __pwmgcubl	=	0x0045
                           000046   148 __pwmg1c	=	0x0046
                           000048   149 __pwmg1dth	=	0x0048
                           000049   150 __pwmg1dtl	=	0x0049
                           00004C   151 __pwmg2c	=	0x004c
                           00004E   152 __pwmg2dth	=	0x004e
                           00004F   153 __pwmg2dtl	=	0x004f
                           000062   154 __ilrcr	=	0x0062
                           000063   155 __bgtr	=	0x0063
                           000067   156 __rop	=	0x0067
      000000                        157 __t16c::
      000000                        158 	.ds 2
                                    159 ;--------------------------------------------------------
                                    160 ; ram data
                                    161 ;--------------------------------------------------------
                                    162 	.area DATA
      000002                        163 __delay_loop_8_PARM_1:
      000002                        164 	.ds 1
      000003                        165 __delay_loop_16_PARM_1:
      000003                        166 	.ds 2
      000005                        167 __delay_loop_32_PARM_1:
      000005                        168 	.ds 4
      000009                        169 __ticks::
      000009                        170 	.ds 1
      00000A                        171 __millis::
      00000A                        172 	.ds 4
      00000E                        173 _flag::
      00000E                        174 	.ds 1
      00000F                        175 _txdata::
      00000F                        176 	.ds 2
      000011                        177 _UART_print_PARM_1:
      000011                        178 	.ds 2
      000013                        179 _UART_print_sloc2_1_0:
      000013                        180 	.ds 1
      000014                        181 _UART_printNum_PARM_1:
      000014                        182 	.ds 4
      000018                        183 _UART_printNum_PARM_2:
      000018                        184 	.ds 1
      000019                        185 _UART_printNum_dis_65536_23:
      000019                        186 	.ds 10
      000023                        187 _UART_printNum_sloc3_1_0:
      000023                        188 	.ds 4
      000027                        189 _UART_printNum_sloc4_1_0:
      000027                        190 	.ds 4
      00002B                        191 _UART_printNum_sloc5_1_0:
      00002B                        192 	.ds 1
      00002C                        193 _UART_printNum_sloc6_1_0:
      00002C                        194 	.ds 1
      00002D                        195 _UART_printNum_sloc7_1_0:
      00002D                        196 	.ds 4
      000031                        197 _UART_printNum_sloc8_1_0:
      000031                        198 	.ds 1
      000032                        199 _UART_printNum_sloc9_1_0:
      000032                        200 	.ds 1
      000033                        201 _UART_printNum_sloc10_1_0:
      000033                        202 	.ds 1
      000034                        203 _UART_printNum_sloc11_1_0:
      000034                        204 	.ds 1
      000035                        205 _UART_printNum_sloc12_1_0:
      000035                        206 	.ds 1
      000036                        207 _UART_printNum_sloc13_1_0:
      000036                        208 	.ds 1
      000037                        209 _UART_printNum_sloc14_1_0:
      000037                        210 	.ds 2
      000039                        211 _UART_printNum_sloc15_1_0:
      000039                        212 	.ds 1
      00003A                        213 _UART_printNum_sloc16_1_0:
      00003A                        214 	.ds 1
      00003B                        215 _UART_printNum_sloc17_1_0:
      00003B                        216 	.ds 1
      00003C                        217 _UART_printNum_sloc18_1_0:
      00003C                        218 	.ds 1
      00003D                        219 _t::
      00003D                        220 	.ds 4
      000041                        221 _main_sloc19_1_0:
      000041                        222 	.ds 4
      000045                        223 _main_sloc20_1_0:
      000045                        224 	.ds 4
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable items in ram
                                    227 ;--------------------------------------------------------
                                    228 	.area	OSEG (OVR,DATA)
      0000B9                        229 _millis_sloc0_1_0:
      0000B9                        230 	.ds 4
                                    231 	.area	OSEG (OVR,DATA)
      0000B9                        232 _millis_irq_handler_sloc1_1_0:
      0000B9                        233 	.ds 4
                                    234 ;--------------------------------------------------------
                                    235 ; Stack segment in internal ram
                                    236 ;--------------------------------------------------------
                                    237 	.area	SSEG
      0000C1                        238 __start__stack:
      0000C1                        239 	.ds	1
                                    240 
                                    241 ;--------------------------------------------------------
                                    242 ; absolute external ram data
                                    243 ;--------------------------------------------------------
                                    244 	.area DABS (ABS)
                                    245 ;--------------------------------------------------------
                                    246 ; interrupt vector
                                    247 ;--------------------------------------------------------
                                    248 	.area HOME
      000022                        249 __interrupt_vect:
                                    250 	.area	HEADER (ABS)
      000020                        251 	.org	 0x0020
      000020 81 60                  252 	goto	_interrupt
                                    253 ;--------------------------------------------------------
                                    254 ; global & static initialisations
                                    255 ;--------------------------------------------------------
                                    256 	.area HOME
                                    257 	.area GSINIT
                                    258 	.area GSFINAL
                                    259 	.area GSINIT
                                    260 	.area	PREG (ABS)
      000000                        261 	.org 0x00
      000000                        262 p::
      000000                        263 	.ds 2
                                    264 	.area	HEADER (ABS)
      000000                        265 	.org 0x0000
      000000 00 00                  266 	nop
      000002 01 26                  267 	clear	p+1
      000004 B9 57                  268 	mov	a, #s_OSEG
      000006 09 50                  269 	add	a, #l_OSEG + 1
      000008 FE 54                  270 	and	a, #0xfe
      00000A 02 01                  271 	mov.io	sp, a
      00000C 74 70                  272 	call	__sdcc_external_startup
      00000E 12 60                  273 	goto	s_GSINIT
                                    274 	.area GSINIT
      000024                        275 __sdcc_init_data:
      000024 02 57                  276 	mov	a, #s_DATA
      000026 00 17                  277 	mov	p, a
      000028 19 60                  278 	goto	00002$
      00002A                        279 00001$:
      00002A 00 57                  280 	mov	a, #0x00
      00002C 00 07                  281 	idxm	p, a
      00002E 00 24                  282 	inc	p
      000030 02 57                  283 	mov	a, #s_DATA
      000032                        284 00002$:
      000032 B7 50                  285 	add	a, #l_DATA
      000034 00 2E                  286 	ceqsn	a, p
      000036 15 60                  287 	goto	00001$
                                    288 ;	timer16.c: 13: uint8_t flag = 0;
      000038 0E 26                  289 	clear	_flag+0
                                    290 ;	timer16.c: 97: uint32_t t = 0;
      00003A 3D 26                  291 	clear	_t+0
      00003C 3E 26                  292 	clear	_t+1
      00003E 3F 26                  293 	clear	_t+2
      000040 40 26                  294 	clear	_t+3
                                    295 	.area GSFINAL
      000042 11 60                  296 	goto	__sdcc_program_startup
                                    297 ;--------------------------------------------------------
                                    298 ; Home
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME
                                    301 	.area HOME
      000022                        302 __sdcc_program_startup:
      000022 BD 61                  303 	goto	_main
                                    304 ;	return from main will return to caller
                                    305 ;--------------------------------------------------------
                                    306 ; code
                                    307 ;--------------------------------------------------------
                                    308 	.area CODE
                                    309 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    310 ;	-----------------------------------------
                                    311 ;	 function _delay_loop_8
                                    312 ;	-----------------------------------------
      000044                        313 __delay_loop_8:
                                    314 ;	delay.h: 44: __endasm;
      000044                        315 	00001$:
                                    316 ; 4 cycles per loop
      000044 02 23                  317 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000046 22 60                  318 	goto	00001$ ; 2 cycles
      000048                        319 00101$:
                                    320 ;	delay.h: 45: }
      000048 7A 00                  321 	ret
                                    322 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    323 ;	-----------------------------------------
                                    324 ;	 function _delay_loop_16
                                    325 ;	-----------------------------------------
      00004A                        326 __delay_loop_16:
                                    327 ;	delay.h: 65: __endasm;
      00004A                        328 	00001$:
                                    329 ; 8 cycles per loop
      00004A 00 00                  330 	nop	; 1 cycle
      00004C 03 25                  331 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00004E 04 21                  332 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000050 03 1F                  333 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000052 04 1D                  334 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000054 00 34                  335 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000056 25 60                  336 	goto	00001$ ; 2 cycles
      000058                        337 00101$:
                                    338 ;	delay.h: 66: }
      000058 7A 00                  339 	ret
                                    340 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    341 ;	-----------------------------------------
                                    342 ;	 function _delay_loop_32
                                    343 ;	-----------------------------------------
      00005A                        344 __delay_loop_32:
                                    345 ;	delay.h: 94: __endasm;
      00005A                        346 	00001$:
                                    347 ; 12 cycles per loop
      00005A 00 00                  348 	nop	; 1 cycle
      00005C 05 25                  349 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      00005E 06 21                  350 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000060 07 21                  351 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000062 08 21                  352 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000064 05 1F                  353 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000066 06 1D                  354 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000068 07 1D                  355 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      00006A 08 1D                  356 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      00006C 00 34                  357 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00006E 2D 60                  358 	goto	00001$ ; 2 cycles
      000070                        359 00101$:
                                    360 ;	delay.h: 95: }
      000070 7A 00                  361 	ret
                                    362 ;	millis.h: 12: void millis_setup()
                                    363 ;	-----------------------------------------
                                    364 ;	 function millis_setup
                                    365 ;	-----------------------------------------
      000072                        366 _millis_setup:
                                    367 ;	millis.h: 18: T16C = 0;
      000072 00 26                  368 	clear	p
      000074 00 06                  369 	stt16	p
                                    370 ;	millis.h: 20: }
      000076 7A 00                  371 	ret
                                    372 ;	millis.h: 22: uint32_t millis()
                                    373 ;	-----------------------------------------
                                    374 ;	 function millis
                                    375 ;	-----------------------------------------
      000078                        376 _millis:
                                    377 ;	millis.h: 24: INTEN &= ~INTEN_T16;			  // Disable T16 (read of 32 bit value _millis is non-atomic)
      000078 04 39                  378 	set0.io	__inten, #2
                                    379 ;	millis.h: 25: uint32_t currentMillis = _millis; // Read _millis while T16 interrupt is off (otherwise it might be modified on us!)
      00007A 0A 1F                  380 	mov	a, __millis+0
      00007C B9 17                  381 	mov	_millis_sloc0_1_0+0, a
      00007E 0B 1F                  382 	mov	a, __millis+1
      000080 BA 17                  383 	mov	_millis_sloc0_1_0+1, a
      000082 0C 1F                  384 	mov	a, __millis+2
      000084 BB 17                  385 	mov	_millis_sloc0_1_0+2, a
      000086 0D 1F                  386 	mov	a, __millis+3
      000088 BC 17                  387 	mov	_millis_sloc0_1_0+3, a
                                    388 ;	millis.h: 26: INTEN |= INTEN_T16;				  // Re-enable T16
      00008A 04 3D                  389 	set1.io	__inten, #2
                                    390 ;	millis.h: 27: return currentMillis;
      00008C 82 01                  391 	mov.io	a, sp
      00008E FC 50                  392 	add	a, #0xfc
      000090 00 17                  393 	mov	p, a
      000092 01 07                  394 	idxm	a, p
      000094 00 17                  395 	mov	p, a
      000096 B9 1F                  396 	mov	a, _millis_sloc0_1_0+0
      000098 00 07                  397 	idxm	p, a
      00009A 00 24                  398 	inc	p
      00009C BA 1F                  399 	mov	a, _millis_sloc0_1_0+1
      00009E 00 07                  400 	idxm	p, a
      0000A0 00 24                  401 	inc	p
      0000A2 BB 1F                  402 	mov	a, _millis_sloc0_1_0+2
      0000A4 00 07                  403 	idxm	p, a
      0000A6 00 24                  404 	inc	p
      0000A8 BC 1F                  405 	mov	a, _millis_sloc0_1_0+3
      0000AA 00 07                  406 	idxm	p, a
                                    407 ;	millis.h: 28: }
      0000AC 7A 00                  408 	ret
                                    409 ;	millis.h: 30: void millis_irq_handler()
                                    410 ;	-----------------------------------------
                                    411 ;	 function millis_irq_handler
                                    412 ;	-----------------------------------------
      0000AE                        413 _millis_irq_handler:
                                    414 ;	millis.h: 32: if (_ticks++ == (uint8_t)(1000 / US_PER_TICK))
      0000AE 09 1F                  415 	mov	a, __ticks+0
      0000B0 72 00                  416 	push	af
      0000B2 01 50                  417 	add	a, #0x01
      0000B4 09 17                  418 	mov	__ticks+0, a
      0000B6 73 00                  419 	pop	af
      0000B8 1F 52                  420 	ceqsn	a, #0x1f
      0000BA 73 60                  421 	goto	00103$
                                    422 ;	millis.h: 34: _ticks = 0;
      0000BC 09 26                  423 	clear	__ticks+0
                                    424 ;	millis.h: 35: _millis++;
      0000BE 0A 1F                  425 	mov	a, __millis+0
      0000C0 B9 17                  426 	mov	_millis_irq_handler_sloc1_1_0+0, a
      0000C2 0B 1F                  427 	mov	a, __millis+1
      0000C4 BA 17                  428 	mov	_millis_irq_handler_sloc1_1_0+1, a
      0000C6 0C 1F                  429 	mov	a, __millis+2
      0000C8 BB 17                  430 	mov	_millis_irq_handler_sloc1_1_0+2, a
      0000CA 0D 1F                  431 	mov	a, __millis+3
      0000CC BC 17                  432 	mov	_millis_irq_handler_sloc1_1_0+3, a
      0000CE B9 1F                  433 	mov	a, _millis_irq_handler_sloc1_1_0+0
      0000D0 01 50                  434 	add	a, #0x01
      0000D2 0A 17                  435 	mov	__millis+0, a
      0000D4 BA 1F                  436 	mov	a, _millis_irq_handler_sloc1_1_0+1
      0000D6 60 00                  437 	addc	a
      0000D8 0B 17                  438 	mov	__millis+1, a
      0000DA BB 1F                  439 	mov	a, _millis_irq_handler_sloc1_1_0+2
      0000DC 60 00                  440 	addc	a
      0000DE 0C 17                  441 	mov	__millis+2, a
      0000E0 BC 1F                  442 	mov	a, _millis_irq_handler_sloc1_1_0+3
      0000E2 60 00                  443 	addc	a
      0000E4 0D 17                  444 	mov	__millis+3, a
      0000E6                        445 00103$:
                                    446 ;	millis.h: 37: }
      0000E6 7A 00                  447 	ret
                                    448 ;	timer16.c: 16: unsigned char _sdcc_external_startup(void)
                                    449 ;	-----------------------------------------
                                    450 ;	 function _sdcc_external_startup
                                    451 ;	-----------------------------------------
      0000E8                        452 __sdcc_external_startup:
                                    453 ;	timer16.c: 18: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 1MHz sysclock
      0000E8 34 57                  454 	mov	a, #0x34
      0000EA 03 01                  455 	mov.io	__clkmd, a
                                    456 ;	timer16.c: 19: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
      0000EC 52 54                  457 	and	a, #'R'                        
      0000EE 43 54                  458 	and	a, #'C'                        
      0000F0 01 54                  459 	and	a, #((1))          
      0000F2 00 54                  460 	and	a, #((8000000))     
      0000F4 12 54                  461 	and	a, #((8000000)>>8)  
      0000F6 7A 54                  462 	and	a, #((8000000)>>16) 
      0000F8 00 54                  463 	and	a, #((8000000)>>24) 
      0000FA 88 54                  464 	and	a, #((5000))     
      0000FC 13 54                  465 	and	a, #((5000)>>8)  
      0000FE 0B 54                  466 	and	a, #((0x0B))           
                                    467 ;	timer16.c: 20: return 0;							  // perform normal initialization
                                    468 ;	timer16.c: 21: }
      000100 00 02                  469 	ret	#0x00
                                    470 ;	timer16.c: 23: void interrupt(void) __interrupt(0)
                                    471 ;	-----------------------------------------
                                    472 ;	 function interrupt
                                    473 ;	-----------------------------------------
      000102                        474 _interrupt:
      000102 72 00                  475 	push	af
      000104 00 1F                  476 	mov	a, p
      000106 72 00                  477 	push	af
                                    478 ;	timer16.c: 25: if (INTRQ & INTRQ_T16) // TM2 interrupt request?
      000108 85 01                  479 	mov.io	a, __intrq
      00010A 04 54                  480 	and	a, #0x04
      00010C 00 53                  481 	cneqsn	a, #0x00
      00010E 8A 60                  482 	goto	00102$
                                    483 ;	timer16.c: 27: millis_irq_handler();
      000110 57 70                  484 	call	_millis_irq_handler
                                    485 ;	timer16.c: 28: INTRQ &= ~INTRQ_T16;
      000112 05 39                  486 	set0.io	__intrq, #2
      000114                        487 00102$:
                                    488 ;	timer16.c: 31: if (INTRQ & INTRQ_TM2)
      000114 85 01                  489 	mov.io	a, __intrq
      000116 40 54                  490 	and	a, #0x40
      000118 00 53                  491 	cneqsn	a, #0x00
      00011A 90 60                  492 	goto	00105$
                                    493 ;	timer16.c: 33: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      00011C 05 3B                  494 	set0.io	__intrq, #6
                                    495 ;	timer16.c: 35: TIM2_interrupt();
      00011E 07 72                  496 	call	_TIM2_interrupt
      000120                        497 00105$:
                                    498 ;	timer16.c: 37: }
      000120 73 00                  499 	pop	af
      000122 00 17                  500 	mov	p, a
      000124 73 00                  501 	pop	af
      000126 7B 00                  502 	reti
                                    503 ;	timer16.c: 39: void UART_print(char *str)
                                    504 ;	-----------------------------------------
                                    505 ;	 function UART_print
                                    506 ;	-----------------------------------------
      000128                        507 _UART_print:
                                    508 ;	timer16.c: 42: while (str[i] != '\0')
      000128 13 26                  509 	clear	_UART_print_sloc2_1_0+0
      00012A                        510 00101$:
      00012A 11 1F                  511 	mov	a, _UART_print_PARM_1+0
      00012C 13 18                  512 	add	a, _UART_print_sloc2_1_0+0
      00012E 00 17                  513 	mov	p, a
      000130 12 1F                  514 	mov	a, _UART_print_PARM_1+1
      000132 60 00                  515 	addc	a
      000134 A2 74                  516 	call	__gptrget
      000136 00 53                  517 	cneqsn	a, #0x00
      000138 A8 60                  518 	goto	00104$
                                    519 ;	timer16.c: 43: putChar(str[i++]);
      00013A 11 1F                  520 	mov	a, _UART_print_PARM_1+0
      00013C 13 18                  521 	add	a, _UART_print_sloc2_1_0+0
      00013E 00 17                  522 	mov	p, a
      000140 12 1F                  523 	mov	a, _UART_print_PARM_1+1
      000142 60 00                  524 	addc	a
      000144 13 24                  525 	inc	_UART_print_sloc2_1_0+0
      000146 A2 74                  526 	call	__gptrget
      000148 49 17                  527 	mov	_putChar_PARM_1+0, a
      00014A 4A 26                  528 	clear	_putChar_PARM_1+1
      00014C 17 72                  529 	call	_putChar
      00014E 95 60                  530 	goto	00101$
      000150                        531 00104$:
                                    532 ;	timer16.c: 44: }
      000150 7A 00                  533 	ret
                                    534 ;	timer16.c: 46: void UART_printNum(int32_t num, uint8_t base)
                                    535 ;	-----------------------------------------
                                    536 ;	 function UART_printNum
                                    537 ;	-----------------------------------------
      000152                        538 _UART_printNum:
                                    539 ;	timer16.c: 49: int8_t max = 0, flag = 0; // max: index of dis array, flag: = 1 if negative
      000152 00 26                  540 	clear	p
      000154 2B 26                  541 	clear	_UART_printNum_sloc5_1_0+0
                                    542 ;	timer16.c: 51: if (num == 0) // input 0
      000156 14 1F                  543 	mov	a, _UART_printNum_PARM_1+0
      000158 15 1D                  544 	or	a, _UART_printNum_PARM_1+1
      00015A 16 1D                  545 	or	a, _UART_printNum_PARM_1+2
      00015C 17 1D                  546 	or	a, _UART_printNum_PARM_1+3
      00015E 00 52                  547 	ceqsn	a, #0x00
      000160 B6 60                  548 	goto	00104$
                                    549 ;	timer16.c: 53: dis[max++] = '0';
      000162 01 57                  550 	mov	a, #0x01
      000164 00 17                  551 	mov	p, a
      000166 30 57                  552 	mov	a, #0x30
      000168 19 17                  553 	mov	_UART_printNum_dis_65536_23+0, a
      00016A C8 60                  554 	goto	00131$
      00016C                        555 00104$:
                                    556 ;	timer16.c: 55: else if (num < 0) // negative number
      00016C 17 1F                  557 	mov	a, _UART_printNum_PARM_1+3
      00016E 80 51                  558 	sub	a, #0x80
      000170 80 30                  559 	t0sn.io	f, c
      000172 C8 60                  560 	goto	00131$
                                    561 ;	timer16.c: 57: num = 0 - num;
      000174 00 57                  562 	mov	a, #0x00
      000176 14 19                  563 	sub	a, _UART_printNum_PARM_1+0
      000178 14 17                  564 	mov	_UART_printNum_PARM_1+0, a
      00017A 00 57                  565 	mov	a, #0x00
      00017C 15 1B                  566 	subc	a, _UART_printNum_PARM_1+1
      00017E 15 17                  567 	mov	_UART_printNum_PARM_1+1, a
      000180 00 57                  568 	mov	a, #0x00
      000182 16 1B                  569 	subc	a, _UART_printNum_PARM_1+2
      000184 16 17                  570 	mov	_UART_printNum_PARM_1+2, a
      000186 00 57                  571 	mov	a, #0x00
      000188 17 1B                  572 	subc	a, _UART_printNum_PARM_1+3
      00018A 17 17                  573 	mov	_UART_printNum_PARM_1+3, a
                                    574 ;	timer16.c: 58: flag = 1;
      00018C 01 57                  575 	mov	a, #0x01
      00018E 2B 17                  576 	mov	_UART_printNum_sloc5_1_0+0, a
                                    577 ;	timer16.c: 60: while (num > 0) // convert to base number and add to dis array
      000190                        578 00131$:
      000190 00 1F                  579 	mov	a, p
      000192 2C 17                  580 	mov	_UART_printNum_sloc6_1_0+0, a
      000194                        581 00109$:
      000194 00 57                  582 	mov	a, #0x00
      000196 14 19                  583 	sub	a, _UART_printNum_PARM_1+0
      000198 00 57                  584 	mov	a, #0x00
      00019A 15 1B                  585 	subc	a, _UART_printNum_PARM_1+1
      00019C 00 57                  586 	mov	a, #0x00
      00019E 16 1B                  587 	subc	a, _UART_printNum_PARM_1+2
      0001A0 00 57                  588 	mov	a, #0x00
      0001A2 17 1B                  589 	subc	a, _UART_printNum_PARM_1+3
      0001A4 80 31                  590 	t0sn.io	f, ov
      0001A6 80 56                  591 	xor	a, #0x80
      0001A8 6B 00                  592 	sl	a
      0001AA 80 34                  593 	t1sn.io	f, c
      0001AC 2C 61                  594 	goto	00138$
                                    595 ;	timer16.c: 62: if (num % base >= 10)
      0001AE 18 1F                  596 	mov	a, _UART_printNum_PARM_2+0
      0001B0 2D 17                  597 	mov	_UART_printNum_sloc7_1_0+0, a
      0001B2 2E 26                  598 	clear	_UART_printNum_sloc7_1_0+1
      0001B4 2F 26                  599 	clear	_UART_printNum_sloc7_1_0+2
      0001B6 30 26                  600 	clear	_UART_printNum_sloc7_1_0+3
      0001B8 14 1F                  601 	mov	a, _UART_printNum_PARM_1+0
      0001BA 4B 17                  602 	mov	__modslong_PARM_1+0, a
      0001BC 15 1F                  603 	mov	a, _UART_printNum_PARM_1+1
      0001BE 4C 17                  604 	mov	__modslong_PARM_1+1, a
      0001C0 16 1F                  605 	mov	a, _UART_printNum_PARM_1+2
      0001C2 4D 17                  606 	mov	__modslong_PARM_1+2, a
      0001C4 17 1F                  607 	mov	a, _UART_printNum_PARM_1+3
      0001C6 4E 17                  608 	mov	__modslong_PARM_1+3, a
      0001C8 2D 1F                  609 	mov	a, _UART_printNum_sloc7_1_0+0
      0001CA 4F 17                  610 	mov	__modslong_PARM_2+0, a
      0001CC 2E 1F                  611 	mov	a, _UART_printNum_sloc7_1_0+1
      0001CE 50 17                  612 	mov	__modslong_PARM_2+1, a
      0001D0 2F 1F                  613 	mov	a, _UART_printNum_sloc7_1_0+2
      0001D2 51 17                  614 	mov	__modslong_PARM_2+2, a
      0001D4 30 1F                  615 	mov	a, _UART_printNum_sloc7_1_0+3
      0001D6 52 17                  616 	mov	__modslong_PARM_2+3, a
      0001D8 23 57                  617 	mov	a, #_UART_printNum_sloc3_1_0
      0001DA 72 00                  618 	push	af
      0001DC 2A 72                  619 	call	__modslong
      0001DE 82 01                  620 	mov.io	a, sp
      0001E0 FE 50                  621 	add	a, #-2
      0001E2 02 01                  622 	mov.io	sp, a
      0001E4 23 1F                  623 	mov	a, _UART_printNum_sloc3_1_0+0
      0001E6 0A 51                  624 	sub	a, #0x0a
      0001E8 24 1F                  625 	mov	a, _UART_printNum_sloc3_1_0+1
      0001EA 61 00                  626 	subc	a
      0001EC 25 1F                  627 	mov	a, _UART_printNum_sloc3_1_0+2
      0001EE 61 00                  628 	subc	a
      0001F0 26 1F                  629 	mov	a, _UART_printNum_sloc3_1_0+3
      0001F2 61 00                  630 	subc	a
      0001F4 80 31                  631 	t0sn.io	f, ov
      0001F6 80 56                  632 	xor	a, #0x80
      0001F8 6B 00                  633 	sl	a
      0001FA 80 30                  634 	t0sn.io	f, c
      0001FC 06 61                  635 	goto	00107$
                                    636 ;	timer16.c: 63: dis[max] = num % base + 55;
      0001FE 19 57                  637 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      000200 2C 18                  638 	add	a, _UART_printNum_sloc6_1_0+0
      000202 00 17                  639 	mov	p, a
      000204 23 1F                  640 	mov	a, _UART_printNum_sloc3_1_0+0
      000206 37 50                  641 	add	a, #0x37
      000208 00 07                  642 	idxm	p, a
      00020A 0C 61                  643 	goto	00108$
      00020C                        644 00107$:
                                    645 ;	timer16.c: 65: dis[max] = num % base + 48;
      00020C 19 57                  646 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      00020E 2C 18                  647 	add	a, _UART_printNum_sloc6_1_0+0
      000210 00 17                  648 	mov	p, a
      000212 23 1F                  649 	mov	a, _UART_printNum_sloc3_1_0+0
      000214 30 50                  650 	add	a, #0x30
      000216 00 07                  651 	idxm	p, a
      000218                        652 00108$:
                                    653 ;	timer16.c: 67: num = num / base;
      000218 14 1F                  654 	mov	a, _UART_printNum_PARM_1+0
      00021A 74 17                  655 	mov	__divslong_PARM_1+0, a
      00021C 15 1F                  656 	mov	a, _UART_printNum_PARM_1+1
      00021E 75 17                  657 	mov	__divslong_PARM_1+1, a
      000220 16 1F                  658 	mov	a, _UART_printNum_PARM_1+2
      000222 76 17                  659 	mov	__divslong_PARM_1+2, a
      000224 17 1F                  660 	mov	a, _UART_printNum_PARM_1+3
      000226 77 17                  661 	mov	__divslong_PARM_1+3, a
      000228 2D 1F                  662 	mov	a, _UART_printNum_sloc7_1_0+0
      00022A 78 17                  663 	mov	__divslong_PARM_2+0, a
      00022C 2E 1F                  664 	mov	a, _UART_printNum_sloc7_1_0+1
      00022E 79 17                  665 	mov	__divslong_PARM_2+1, a
      000230 2F 1F                  666 	mov	a, _UART_printNum_sloc7_1_0+2
      000232 7A 17                  667 	mov	__divslong_PARM_2+2, a
      000234 30 1F                  668 	mov	a, _UART_printNum_sloc7_1_0+3
      000236 7B 17                  669 	mov	__divslong_PARM_2+3, a
      000238 27 57                  670 	mov	a, #_UART_printNum_sloc4_1_0
      00023A 72 00                  671 	push	af
      00023C 07 73                  672 	call	__divslong
      00023E 82 01                  673 	mov.io	a, sp
      000240 FE 50                  674 	add	a, #-2
      000242 02 01                  675 	mov.io	sp, a
      000244 27 1F                  676 	mov	a, _UART_printNum_sloc4_1_0+0
      000246 14 17                  677 	mov	_UART_printNum_PARM_1+0, a
      000248 28 1F                  678 	mov	a, _UART_printNum_sloc4_1_0+1
      00024A 15 17                  679 	mov	_UART_printNum_PARM_1+1, a
      00024C 29 1F                  680 	mov	a, _UART_printNum_sloc4_1_0+2
      00024E 16 17                  681 	mov	_UART_printNum_PARM_1+2, a
      000250 2A 1F                  682 	mov	a, _UART_printNum_sloc4_1_0+3
      000252 17 17                  683 	mov	_UART_printNum_PARM_1+3, a
                                    684 ;	timer16.c: 68: max++;
      000254 2C 24                  685 	inc	_UART_printNum_sloc6_1_0+0
      000256 CA 60                  686 	goto	00109$
      000258                        687 00138$:
      000258 2C 1F                  688 	mov	a, _UART_printNum_sloc6_1_0+0
      00025A 31 17                  689 	mov	_UART_printNum_sloc8_1_0+0, a
                                    690 ;	timer16.c: 71: if (base == HEX) // add 0x for HEX and 0B for BIN
      00025C 18 1F                  691 	mov	a, _UART_printNum_PARM_2+0
      00025E 10 52                  692 	ceqsn	a, #0x10
      000260 5D 61                  693 	goto	00117$
                                    694 ;	timer16.c: 73: if (max % 2 == 1)
      000262 2C 1F                  695 	mov	a, _UART_printNum_sloc6_1_0+0
      000264 9E 17                  696 	mov	__modsint_PARM_1+0, a
      000266 6B 00                  697 	sl	a
      000268 00 57                  698 	mov	a, #0x00
      00026A 61 00                  699 	subc	a
      00026C 9F 17                  700 	mov	__modsint_PARM_1+1, a
      00026E 02 57                  701 	mov	a, #0x02
      000270 A0 17                  702 	mov	__modsint_PARM_2+0, a
      000272 A1 26                  703 	clear	__modsint_PARM_2+1
      000274 DB 73                  704 	call	__modsint
      000276 01 52                  705 	ceqsn	a, #0x01
      000278 48 61                  706 	goto	00113$
      00027A 00 1F                  707 	mov	a, p
      00027C 00 52                  708 	ceqsn	a, #0x00
      00027E 48 61                  709 	goto	00113$
                                    710 ;	timer16.c: 74: dis[max++] = '0';
      000280 2C 1F                  711 	mov	a, _UART_printNum_sloc6_1_0+0
      000282 01 50                  712 	add	a, #0x01
      000284 31 17                  713 	mov	_UART_printNum_sloc8_1_0+0, a
      000286 19 57                  714 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      000288 2C 18                  715 	add	a, _UART_printNum_sloc6_1_0+0
      00028A 00 17                  716 	mov	p, a
      00028C 30 57                  717 	mov	a, #0x30
      00028E 00 07                  718 	idxm	p, a
      000290                        719 00113$:
                                    720 ;	timer16.c: 76: dis[max++] = 'x';
      000290 31 1F                  721 	mov	a, _UART_printNum_sloc8_1_0+0
      000292 32 17                  722 	mov	_UART_printNum_sloc9_1_0+0, a
      000294 31 1F                  723 	mov	a, _UART_printNum_sloc8_1_0+0
      000296 01 50                  724 	add	a, #0x01
      000298 33 17                  725 	mov	_UART_printNum_sloc10_1_0+0, a
      00029A 19 57                  726 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      00029C 32 18                  727 	add	a, _UART_printNum_sloc9_1_0+0
      00029E 00 17                  728 	mov	p, a
      0002A0 78 57                  729 	mov	a, #0x78
      0002A2 00 07                  730 	idxm	p, a
                                    731 ;	timer16.c: 77: dis[max++] = '0';
      0002A4 33 1F                  732 	mov	a, _UART_printNum_sloc10_1_0+0
      0002A6 00 17                  733 	mov	p, a
      0002A8 33 1F                  734 	mov	a, _UART_printNum_sloc10_1_0+0
      0002AA 01 50                  735 	add	a, #0x01
      0002AC 31 17                  736 	mov	_UART_printNum_sloc8_1_0+0, a
      0002AE 19 57                  737 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      0002B0 00 18                  738 	add	a, p
      0002B2 00 17                  739 	mov	p, a
      0002B4 30 57                  740 	mov	a, #0x30
      0002B6 00 07                  741 	idxm	p, a
      0002B8 72 61                  742 	goto	00118$
      0002BA                        743 00117$:
                                    744 ;	timer16.c: 79: else if (base == BIN)
      0002BA 18 1F                  745 	mov	a, _UART_printNum_PARM_2+0
      0002BC 02 52                  746 	ceqsn	a, #0x02
      0002BE 72 61                  747 	goto	00118$
                                    748 ;	timer16.c: 81: dis[max++] = 'B';
      0002C0 2C 1F                  749 	mov	a, _UART_printNum_sloc6_1_0+0
      0002C2 01 50                  750 	add	a, #0x01
      0002C4 34 17                  751 	mov	_UART_printNum_sloc11_1_0+0, a
      0002C6 19 57                  752 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      0002C8 2C 18                  753 	add	a, _UART_printNum_sloc6_1_0+0
      0002CA 00 17                  754 	mov	p, a
      0002CC 42 57                  755 	mov	a, #0x42
      0002CE 00 07                  756 	idxm	p, a
                                    757 ;	timer16.c: 82: dis[max++] = '0';
      0002D0 34 1F                  758 	mov	a, _UART_printNum_sloc11_1_0+0
      0002D2 00 17                  759 	mov	p, a
      0002D4 34 1F                  760 	mov	a, _UART_printNum_sloc11_1_0+0
      0002D6 01 50                  761 	add	a, #0x01
      0002D8 31 17                  762 	mov	_UART_printNum_sloc8_1_0+0, a
      0002DA 19 57                  763 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      0002DC 00 18                  764 	add	a, p
      0002DE 00 17                  765 	mov	p, a
      0002E0 30 57                  766 	mov	a, #0x30
      0002E2 00 07                  767 	idxm	p, a
      0002E4                        768 00118$:
                                    769 ;	timer16.c: 85: if (flag == 1) // add minus to negative number
      0002E4 2B 1F                  770 	mov	a, _UART_printNum_sloc5_1_0+0
      0002E6 01 52                  771 	ceqsn	a, #0x01
      0002E8 7B 61                  772 	goto	00137$
                                    773 ;	timer16.c: 86: dis[max++] = '-';
      0002EA 31 1F                  774 	mov	a, _UART_printNum_sloc8_1_0+0
      0002EC 31 24                  775 	inc	_UART_printNum_sloc8_1_0+0
      0002EE 19 50                  776 	add	a, #(_UART_printNum_dis_65536_23 + 0)
      0002F0 00 17                  777 	mov	p, a
      0002F2 2D 57                  778 	mov	a, #0x2d
      0002F4 00 07                  779 	idxm	p, a
                                    780 ;	timer16.c: 88: for (uint8_t i = 0; i < max / 2; i++) // revert dis array
      0002F6                        781 00137$:
      0002F6 31 1F                  782 	mov	a, _UART_printNum_sloc8_1_0+0
      0002F8 01 51                  783 	sub	a, #0x01
      0002FA 35 17                  784 	mov	_UART_printNum_sloc12_1_0+0, a
      0002FC 36 26                  785 	clear	_UART_printNum_sloc13_1_0+0
      0002FE                        786 00123$:
      0002FE 31 1F                  787 	mov	a, _UART_printNum_sloc8_1_0+0
      000300 AB 17                  788 	mov	__divsint_PARM_1+0, a
      000302 6B 00                  789 	sl	a
      000304 00 57                  790 	mov	a, #0x00
      000306 61 00                  791 	subc	a
      000308 AC 17                  792 	mov	__divsint_PARM_1+1, a
      00030A 02 57                  793 	mov	a, #0x02
      00030C AD 17                  794 	mov	__divsint_PARM_2+0, a
      00030E AE 26                  795 	clear	__divsint_PARM_2+1
      000310 42 74                  796 	call	__divsint
      000312 37 17                  797 	mov	_UART_printNum_sloc14_1_0+0, a
      000314 00 1F                  798 	mov	a, p
      000316 38 17                  799 	mov	_UART_printNum_sloc14_1_0+1, a
      000318 00 26                  800 	clear	p
      00031A 36 1F                  801 	mov	a, _UART_printNum_sloc13_1_0+0
      00031C 37 19                  802 	sub	a, _UART_printNum_sloc14_1_0+0
      00031E 00 1F                  803 	mov	a, p
      000320 38 1B                  804 	subc	a, _UART_printNum_sloc14_1_0+1
      000322 80 31                  805 	t0sn.io	f, ov
      000324 80 56                  806 	xor	a, #0x80
      000326 6B 00                  807 	sl	a
      000328 80 34                  808 	t1sn.io	f, c
      00032A B3 61                  809 	goto	00121$
                                    810 ;	timer16.c: 90: dis[max] = dis[i];
      00032C 19 57                  811 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      00032E 31 18                  812 	add	a, _UART_printNum_sloc8_1_0+0
      000330 39 17                  813 	mov	_UART_printNum_sloc15_1_0+0, a
      000332 19 57                  814 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      000334 36 18                  815 	add	a, _UART_printNum_sloc13_1_0+0
      000336 3A 17                  816 	mov	_UART_printNum_sloc16_1_0+0, a
      000338 00 17                  817 	mov	p, a
      00033A 01 07                  818 	idxm	a, p
      00033C 3B 17                  819 	mov	_UART_printNum_sloc17_1_0+0, a
      00033E 39 1F                  820 	mov	a, _UART_printNum_sloc15_1_0+0
      000340 00 17                  821 	mov	p, a
      000342 3B 1F                  822 	mov	a, _UART_printNum_sloc17_1_0+0
      000344 00 07                  823 	idxm	p, a
                                    824 ;	timer16.c: 91: dis[i] = dis[max - 1 - i];
      000346 35 1F                  825 	mov	a, _UART_printNum_sloc12_1_0+0
      000348 36 19                  826 	sub	a, _UART_printNum_sloc13_1_0+0
      00034A 19 50                  827 	add	a, #(_UART_printNum_dis_65536_23 + 0)
      00034C 3C 17                  828 	mov	_UART_printNum_sloc18_1_0+0, a
      00034E 00 17                  829 	mov	p, a
      000350 01 07                  830 	idxm	a, p
      000352 00 17                  831 	mov	p, a
      000354 3A 1F                  832 	mov	a, _UART_printNum_sloc16_1_0+0
      000356 00 27                  833 	xch	a, p
      000358 00 07                  834 	idxm	p, a
                                    835 ;	timer16.c: 92: dis[max - 1 - i] = dis[max];
      00035A 3C 1F                  836 	mov	a, _UART_printNum_sloc18_1_0+0
      00035C 00 17                  837 	mov	p, a
      00035E 3B 1F                  838 	mov	a, _UART_printNum_sloc17_1_0+0
      000360 00 07                  839 	idxm	p, a
                                    840 ;	timer16.c: 88: for (uint8_t i = 0; i < max / 2; i++) // revert dis array
      000362 36 24                  841 	inc	_UART_printNum_sloc13_1_0+0
      000364 7F 61                  842 	goto	00123$
      000366                        843 00121$:
                                    844 ;	timer16.c: 94: dis[max] = '\0';  // end string character
      000366 19 57                  845 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      000368 31 18                  846 	add	a, _UART_printNum_sloc8_1_0+0
      00036A 00 17                  847 	mov	p, a
      00036C 00 57                  848 	mov	a, #0x00
      00036E 00 07                  849 	idxm	p, a
                                    850 ;	timer16.c: 95: UART_print(dis); // print dis
      000370 19 57                  851 	mov	a, #(_UART_printNum_dis_65536_23 + 0)
      000372 11 17                  852 	mov	_UART_print_PARM_1+0, a
      000374 12 26                  853 	clear	_UART_print_PARM_1+1
      000376 94 60                  854 	goto	_UART_print
                                    855 ;	timer16.c: 96: }
      000378 7A 00                  856 	ret
                                    857 ;	timer16.c: 98: void main(void)
                                    858 ;	-----------------------------------------
                                    859 ;	 function main
                                    860 ;	-----------------------------------------
      00037A                        861 _main:
                                    862 ;	timer16.c: 100: UART_begin();
      00037A FA 71                  863 	call	_UART_begin
                                    864 ;	timer16.c: 101: setb(PBC, 4);
      00037C 14 3E                  865 	set1.io	__pbc, #4
                                    866 ;	timer16.c: 102: millis_setup();
      00037E 39 70                  867 	call	_millis_setup
                                    868 ;	timer16.c: 103: INTRQ = 0;
      000380 00 57                  869 	mov	a, #0x00
      000382 05 01                  870 	mov.io	__intrq, a
                                    871 ;	timer16.c: 104: sei();
      000384 78 00                  872 	engint
                                    873 ;	timer16.c: 106: UART_print("123\n");
      000386 AE 57                  874 	mov	a, #<(___str_0 + 0)
      000388 11 17                  875 	mov	_UART_print_PARM_1+0, a
      00038A 84 57                  876 	mov	a, #>(___str_0 + 0x8000 + 0)
      00038C 12 17                  877 	mov	_UART_print_PARM_1+1, a
      00038E 94 70                  878 	call	_UART_print
                                    879 ;	timer16.c: 108: while (1)
      000390                        880 00102$:
                                    881 ;	timer16.c: 113: t = millis();
      000390 41 57                  882 	mov	a, #_main_sloc19_1_0
      000392 72 00                  883 	push	af
      000394 3C 70                  884 	call	_millis
      000396 82 01                  885 	mov.io	a, sp
      000398 FE 50                  886 	add	a, #-2
      00039A 02 01                  887 	mov.io	sp, a
      00039C 41 1F                  888 	mov	a, _main_sloc19_1_0+0
      00039E 3D 17                  889 	mov	_t+0, a
      0003A0 42 1F                  890 	mov	a, _main_sloc19_1_0+1
      0003A2 3E 17                  891 	mov	_t+1, a
      0003A4 43 1F                  892 	mov	a, _main_sloc19_1_0+2
      0003A6 3F 17                  893 	mov	_t+2, a
      0003A8 44 1F                  894 	mov	a, _main_sloc19_1_0+3
      0003AA 40 17                  895 	mov	_t+3, a
                                    896 ;	timer16.c: 116: _delay_ms(1000);
      0003AC 29 57                  897 	mov	a, #0x29
      0003AE 05 17                  898 	mov	__delay_loop_32_PARM_1+0, a
      0003B0 2C 57                  899 	mov	a, #0x2c
      0003B2 06 17                  900 	mov	__delay_loop_32_PARM_1+1, a
      0003B4 0A 57                  901 	mov	a, #0x0a
      0003B6 07 17                  902 	mov	__delay_loop_32_PARM_1+2, a
      0003B8 08 26                  903 	clear	__delay_loop_32_PARM_1+3
      0003BA 2D 70                  904 	call	__delay_loop_32
                                    905 ;	timer16.c: 117: UART_printNum(t-millis(), DEC);
      0003BC 45 57                  906 	mov	a, #_main_sloc20_1_0
      0003BE 72 00                  907 	push	af
      0003C0 3C 70                  908 	call	_millis
      0003C2 82 01                  909 	mov.io	a, sp
      0003C4 FE 50                  910 	add	a, #-2
      0003C6 02 01                  911 	mov.io	sp, a
      0003C8 3D 1F                  912 	mov	a, _t+0
      0003CA 45 19                  913 	sub	a, _main_sloc20_1_0+0
      0003CC 14 17                  914 	mov	_UART_printNum_PARM_1+0, a
      0003CE 3E 1F                  915 	mov	a, _t+1
      0003D0 46 1B                  916 	subc	a, _main_sloc20_1_0+1
      0003D2 15 17                  917 	mov	_UART_printNum_PARM_1+1, a
      0003D4 3F 1F                  918 	mov	a, _t+2
      0003D6 47 1B                  919 	subc	a, _main_sloc20_1_0+2
      0003D8 16 17                  920 	mov	_UART_printNum_PARM_1+2, a
      0003DA 40 1F                  921 	mov	a, _t+3
      0003DC 48 1B                  922 	subc	a, _main_sloc20_1_0+3
      0003DE 17 17                  923 	mov	_UART_printNum_PARM_1+3, a
      0003E0 0A 57                  924 	mov	a, #0x0a
      0003E2 18 17                  925 	mov	_UART_printNum_PARM_2+0, a
      0003E4 A9 70                  926 	call	_UART_printNum
                                    927 ;	timer16.c: 118: UART_print("\n");
      0003E6 B3 57                  928 	mov	a, #<(___str_1 + 0)
      0003E8 11 17                  929 	mov	_UART_print_PARM_1+0, a
      0003EA 84 57                  930 	mov	a, #>(___str_1 + 0x8000 + 0)
      0003EC 12 17                  931 	mov	_UART_print_PARM_1+1, a
      0003EE 94 70                  932 	call	_UART_print
      0003F0 C8 61                  933 	goto	00102$
                                    934 ;	timer16.c: 121: }
      0003F2 7A 00                  935 	ret
                                    936 	.area CODE
                                    937 	.area CONST
                                    938 	.area CONST
      00095C                        939 ___str_0:
      00095C 31 02                  940 	ret #0x31	; 1
      00095E 32 02                  941 	ret #0x32	; 2
      000960 33 02                  942 	ret #0x33	; 3
      000962 0A 02                  943 	ret #0x0a
      000964 00 02                  944 	ret #0x00
                                    945 	.area CODE
                                    946 	.area CONST
      000966                        947 ___str_1:
      000966 0A 02                  948 	ret #0x0a
      000968 00 02                  949 	ret #0x00
                                    950 	.area CODE
                                    951 	.area CABS (ABS)
