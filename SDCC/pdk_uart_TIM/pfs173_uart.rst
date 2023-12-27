                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_uart
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
                                     18 	.globl __sdcc_external_startup
                                     19 	.globl _PB5_interrupt
                                     20 	.globl _TIM2_interrupt
                                     21 	.globl _UART_print
                                     22 	.globl _UART_IO_config
                                     23 	.globl _softuart_getchar
                                     24 	.globl _softuart_kbhit
                                     25 	.globl _UART_begin
                                     26 	.globl __delay_loop_32
                                     27 	.globl __delay_loop_16
                                     28 	.globl __delay_loop_8
                                     29 	.globl __t16c
                                     30 	.globl __rop
                                     31 	.globl __bgtr
                                     32 	.globl __ilrcr
                                     33 	.globl __pwmg2dtl
                                     34 	.globl __pwmg2dth
                                     35 	.globl __pwmg2c
                                     36 	.globl __pwmg1dtl
                                     37 	.globl __pwmg1dth
                                     38 	.globl __pwmg1c
                                     39 	.globl __pwmgcubl
                                     40 	.globl __pwmgcubh
                                     41 	.globl __pwmg0dtl
                                     42 	.globl __pwmg0dth
                                     43 	.globl __pwmgclk
                                     44 	.globl __pwmg0c
                                     45 	.globl __tm3b
                                     46 	.globl __tm3s
                                     47 	.globl __tm3ct
                                     48 	.globl __tm3c
                                     49 	.globl __tm2b
                                     50 	.globl __tm2s
                                     51 	.globl __tm2ct
                                     52 	.globl __tm2c
                                     53 	.globl __gpcs
                                     54 	.globl __gpcc
                                     55 	.globl __misclvr
                                     56 	.globl __misc2
                                     57 	.globl __misc
                                     58 	.globl __adcrgc
                                     59 	.globl __adcr
                                     60 	.globl __adcm
                                     61 	.globl __adcc
                                     62 	.globl __pcpl
                                     63 	.globl __pbpl
                                     64 	.globl __pcph
                                     65 	.globl __pcc
                                     66 	.globl __pc
                                     67 	.globl __pbph
                                     68 	.globl __pbc
                                     69 	.globl __pb
                                     70 	.globl __paph
                                     71 	.globl __pac
                                     72 	.globl __pa
                                     73 	.globl __pcdier
                                     74 	.globl __pbdier
                                     75 	.globl __padier
                                     76 	.globl __integs
                                     77 	.globl __ihrcr
                                     78 	.globl __eoscr
                                     79 	.globl __t16m
                                     80 	.globl __intrq
                                     81 	.globl __inten
                                     82 	.globl __clkmd
                                     83 	.globl __sp
                                     84 	.globl __flag
                                     85 	.globl _i
                                     86 	.globl _u
                                     87 	.globl _x
                                     88 	.globl __delay_loop_32_PARM_1
                                     89 	.globl __delay_loop_16_PARM_1
                                     90 	.globl __delay_loop_8_PARM_1
                                     91 ;--------------------------------------------------------
                                     92 ; special function registers
                                     93 ;--------------------------------------------------------
                                     94 	.area RSEG (ABS)
      000000                         95 	.org 0x0000
                           000000    96 __flag	=	0x0000
                           000002    97 __sp	=	0x0002
                           000003    98 __clkmd	=	0x0003
                           000004    99 __inten	=	0x0004
                           000005   100 __intrq	=	0x0005
                           000006   101 __t16m	=	0x0006
                           00000A   102 __eoscr	=	0x000a
                           00000B   103 __ihrcr	=	0x000b
                           00000C   104 __integs	=	0x000c
                           00000D   105 __padier	=	0x000d
                           00000E   106 __pbdier	=	0x000e
                           00000F   107 __pcdier	=	0x000f
                           000010   108 __pa	=	0x0010
                           000011   109 __pac	=	0x0011
                           000012   110 __paph	=	0x0012
                           000013   111 __pb	=	0x0013
                           000014   112 __pbc	=	0x0014
                           000015   113 __pbph	=	0x0015
                           000016   114 __pc	=	0x0016
                           000017   115 __pcc	=	0x0017
                           000018   116 __pcph	=	0x0018
                           000019   117 __pbpl	=	0x0019
                           00001A   118 __pcpl	=	0x001a
                           000020   119 __adcc	=	0x0020
                           000021   120 __adcm	=	0x0021
                           000022   121 __adcr	=	0x0022
                           000024   122 __adcrgc	=	0x0024
                           000026   123 __misc	=	0x0026
                           000027   124 __misc2	=	0x0027
                           000028   125 __misclvr	=	0x0028
                           00002B   126 __gpcc	=	0x002b
                           00002C   127 __gpcs	=	0x002c
                           000030   128 __tm2c	=	0x0030
                           000031   129 __tm2ct	=	0x0031
                           000032   130 __tm2s	=	0x0032
                           000033   131 __tm2b	=	0x0033
                           000034   132 __tm3c	=	0x0034
                           000035   133 __tm3ct	=	0x0035
                           000036   134 __tm3s	=	0x0036
                           000037   135 __tm3b	=	0x0037
                           000040   136 __pwmg0c	=	0x0040
                           000041   137 __pwmgclk	=	0x0041
                           000042   138 __pwmg0dth	=	0x0042
                           000043   139 __pwmg0dtl	=	0x0043
                           000044   140 __pwmgcubh	=	0x0044
                           000045   141 __pwmgcubl	=	0x0045
                           000046   142 __pwmg1c	=	0x0046
                           000048   143 __pwmg1dth	=	0x0048
                           000049   144 __pwmg1dtl	=	0x0049
                           00004C   145 __pwmg2c	=	0x004c
                           00004E   146 __pwmg2dth	=	0x004e
                           00004F   147 __pwmg2dtl	=	0x004f
                           000062   148 __ilrcr	=	0x0062
                           000063   149 __bgtr	=	0x0063
                           000067   150 __rop	=	0x0067
      000000                        151 __t16c::
      000000                        152 	.ds 2
                                    153 ;--------------------------------------------------------
                                    154 ; ram data
                                    155 ;--------------------------------------------------------
                                    156 	.area DATA
      000002                        157 __delay_loop_8_PARM_1:
      000002                        158 	.ds 1
      000003                        159 __delay_loop_16_PARM_1:
      000003                        160 	.ds 2
      000005                        161 __delay_loop_32_PARM_1:
      000005                        162 	.ds 4
      000009                        163 _x::
      000009                        164 	.ds 1
      00000A                        165 _u::
      00000A                        166 	.ds 20
      00001E                        167 _i::
      00001E                        168 	.ds 2
                                    169 ;--------------------------------------------------------
                                    170 ; overlayable items in ram 
                                    171 ;--------------------------------------------------------
                                    172 ;--------------------------------------------------------
                                    173 ; Stack segment in internal ram 
                                    174 ;--------------------------------------------------------
                                    175 	.area	SSEG
      FFFFFF                        176 __start__stack:
      FFFFFF                        177 	.ds	1
                                    178 
                                    179 ;--------------------------------------------------------
                                    180 ; absolute external ram data
                                    181 ;--------------------------------------------------------
                                    182 	.area DABS (ABS)
                                    183 ;--------------------------------------------------------
                                    184 ; interrupt vector 
                                    185 ;--------------------------------------------------------
                                    186 	.area HOME
      000022                        187 __interrupt_vect:
                                    188 	.area	HEADER (ABS)
      000020                        189 	.org	 0x0020
      000020 7D 60                  190 	goto	_interrupt
                                    191 ;--------------------------------------------------------
                                    192 ; global & static initialisations
                                    193 ;--------------------------------------------------------
                                    194 	.area HOME
                                    195 	.area GSINIT
                                    196 	.area GSFINAL
                                    197 	.area GSINIT
                                    198 	.area	PREG (ABS)
      000000                        199 	.org 0x00
      000000                        200 p::
      000000                        201 	.ds 2
                                    202 	.area	HEADER (ABS)
      000000                        203 	.org 0x0000
      000000 00 00                  204 	nop
      000002 01 26                  205 	clear	p+1
      000004 55 57                  206 	mov	a, #s_OSEG
      000006 03 50                  207 	add	a, #l_OSEG + 1
      000008 FE 54                  208 	and	a, #0xfe
      00000A 02 01                  209 	mov	sp, a
      00000C 39 70                  210 	call	__sdcc_external_startup
      00000E 12 60                  211 	goto	__sdcc_gs_init_startup
                                    212 	.area GSINIT
      000024                        213 __sdcc_gs_init_startup:
      000024                        214 __sdcc_init_data:
      000024 02 57                  215 	mov	a, #s_DATA
      000026 00 17                  216 	mov	p, a
      000028 19 60                  217 	goto	00002$
      00002A                        218 00001$:
      00002A 00 57                  219 	mov	a, #0x00
      00002C 00 07                  220 	idxm	p, a
      00002E 00 24                  221 	inc	p
      000030 02 57                  222 	mov	a, #s_DATA
      000032                        223 00002$:
      000032 53 50                  224 	add	a, #l_DATA
      000034 00 2E                  225 	ceqsn	a, p
      000036 15 60                  226 	goto	00001$
                                    227 ;	pfs173_uart.c: 19: char x = 'G';
      000038 47 57                  228 	mov	a, #0x47
      00003A 09 17                  229 	mov	_x+0, a
                                    230 ;	pfs173_uart.c: 21: int i = 0;
      00003C 1E 26                  231 	clear	_i+0
      00003E 1F 26                  232 	clear	_i+1
                                    233 	.area GSFINAL
      000042 11 60                  234 	goto	__sdcc_program_startup
                                    235 ;--------------------------------------------------------
                                    236 ; Home
                                    237 ;--------------------------------------------------------
                                    238 	.area HOME
                                    239 	.area HOME
      000022                        240 __sdcc_program_startup:
      000022 48 60                  241 	goto	_main
                                    242 ;	return from main will return to caller
                                    243 ;--------------------------------------------------------
                                    244 ; code
                                    245 ;--------------------------------------------------------
                                    246 	.area CODE
                                    247 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    248 ;	-----------------------------------------
                                    249 ;	 function _delay_loop_8
                                    250 ;	-----------------------------------------
      000044                        251 __delay_loop_8:
                                    252 ;	delay.h: 44: __endasm;
      000044                        253 	00001$:
                                    254 ; 4 cycles per loop
      000044 02 23                  255 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000046 22 60                  256 	goto	00001$ ; 2 cycles
      000048                        257 00101$:
                                    258 ;	delay.h: 45: }
      000048 7A 00                  259 	ret
                                    260 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    261 ;	-----------------------------------------
                                    262 ;	 function _delay_loop_16
                                    263 ;	-----------------------------------------
      00004A                        264 __delay_loop_16:
                                    265 ;	delay.h: 65: __endasm;
      00004A                        266 	00001$:
                                    267 ; 8 cycles per loop
      00004A 00 00                  268 	nop	; 1 cycle
      00004C 03 25                  269 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00004E 04 21                  270 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000050 03 1F                  271 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000052 04 1D                  272 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000054 00 34                  273 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000056 25 60                  274 	goto	00001$ ; 2 cycles
      000058                        275 00101$:
                                    276 ;	delay.h: 66: }
      000058 7A 00                  277 	ret
                                    278 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    279 ;	-----------------------------------------
                                    280 ;	 function _delay_loop_32
                                    281 ;	-----------------------------------------
      00005A                        282 __delay_loop_32:
                                    283 ;	delay.h: 94: __endasm;
      00005A                        284 	00001$:
                                    285 ; 12 cycles per loop
      00005A 00 00                  286 	nop	; 1 cycle
      00005C 05 25                  287 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      00005E 06 21                  288 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000060 07 21                  289 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000062 08 21                  290 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000064 05 1F                  291 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000066 06 1D                  292 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000068 07 1D                  293 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      00006A 08 1D                  294 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      00006C 00 34                  295 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00006E 2D 60                  296 	goto	00001$ ; 2 cycles
      000070                        297 00101$:
                                    298 ;	delay.h: 95: }
      000070 7A 00                  299 	ret
                                    300 ;	pfs173_uart.c: 12: uint8_t _sdcc_external_startup(void)
                                    301 ;	-----------------------------------------
                                    302 ;	 function _sdcc_external_startup
                                    303 ;	-----------------------------------------
      000072                        304 __sdcc_external_startup:
                                    305 ;	pfs173_uart.c: 14: ROP = ROP_INT_SRC_PB5;
      000072 02 57                  306 	mov	a, #0x02
      000074 67 01                  307 	mov	__rop, a
                                    308 ;	pfs173_uart.c: 15: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000076 34 57                  309 	mov	a, #0x34
      000078 03 01                  310 	mov	__clkmd, a
                                    311 ;	pfs173_uart.c: 16: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      00007A 52 54                  312 	and	a, #'R'                        
      00007C 43 54                  313 	and	a, #'C'                        
      00007E 01 54                  314 	and	a, #((1))          
      000080 00 54                  315 	and	a, #((8000000))     
      000082 12 54                  316 	and	a, #((8000000)>>8)  
      000084 7A 54                  317 	and	a, #((8000000)>>16) 
      000086 00 54                  318 	and	a, #((8000000)>>24) 
      000088 88 54                  319 	and	a, #((5000))     
      00008A 13 54                  320 	and	a, #((5000)>>8)  
      00008C 0B 54                  321 	and	a, #((0x0B))           
                                    322 ;	pfs173_uart.c: 17: return 0;							  //perform normal initialization
                                    323 ;	pfs173_uart.c: 18: }
      00008E 00 02                  324 	ret	#0x00
                                    325 ;	pfs173_uart.c: 22: int main(void)
                                    326 ;	-----------------------------------------
                                    327 ;	 function main
                                    328 ;	-----------------------------------------
      000090                        329 _main:
                                    330 ;	pfs173_uart.c: 25: UART_IO_config();
      000090 DB 70                  331 	call	_UART_IO_config
                                    332 ;	pfs173_uart.c: 26: setb(PBC, 4);
      000092 14 3E                  333 	set1	__pbc, #4
                                    334 ;	pfs173_uart.c: 29: INTEGS = INTEGS_PB5_FALLING;
      000094 02 57                  335 	mov	a, #0x02
      000096 0C 01                  336 	mov	__integs, a
                                    337 ;	pfs173_uart.c: 30: INTEN |= INTEN_PB5;
      000098 84 01                  338 	mov	a, __inten
      00009A 01 55                  339 	or	a, #0x01
      00009C 04 01                  340 	mov	__inten, a
                                    341 ;	pfs173_uart.c: 31: UART_begin();
      00009E E9 70                  342 	call	_UART_begin
                                    343 ;	pfs173_uart.c: 32: INTRQ = 0;
      0000A0 00 57                  344 	mov	a, #0x00
      0000A2 05 01                  345 	mov	__intrq, a
                                    346 ;	pfs173_uart.c: 33: sei();
      0000A4 78 00                  347 	engint
                                    348 ;	pfs173_uart.c: 35: UART_print("\rOK\r");
      0000A6 63 57                  349 	mov	a, #<(___str_0 + 0)
      0000A8 51 17                  350 	mov	_UART_print_PARM_1+0, a
      0000AA 81 57                  351 	mov	a, #>(___str_0 + 0x8000 + 0)
      0000AC 52 17                  352 	mov	_UART_print_PARM_1+1, a
      0000AE 40 71                  353 	call	_UART_print
                                    354 ;	pfs173_uart.c: 37: while (1)
      0000B0                        355 00105$:
                                    356 ;	pfs173_uart.c: 61: i = 0;
      0000B0 1E 26                  357 	clear	_i+0
      0000B2 1F 26                  358 	clear	_i+1
                                    359 ;	pfs173_uart.c: 62: while (softuart_kbhit())
      0000B4                        360 00101$:
      0000B4 09 71                  361 	call	_softuart_kbhit
      0000B6 00 53                  362 	cneqsn	a, #0x00
      0000B8 6A 60                  363 	goto	00103$
                                    364 ;	pfs173_uart.c: 64: u[i++] = softuart_getchar();
      0000BA 1F 1F                  365 	mov	a, _i+1
      0000BC 00 17                  366 	mov	p, a
      0000BE 1E 1F                  367 	mov	a, _i+0
      0000C0 1E 24                  368 	inc	_i+0
      0000C2 1F 20                  369 	addc	_i+1
      0000C4 0A 50                  370 	add	a, #(_u + 0)
      0000C6 72 00                  371 	push	af
      0000C8 F7 70                  372 	call	_softuart_getchar
      0000CA 00 17                  373 	mov	p, a
      0000CC 73 00                  374 	pop	af
      0000CE 00 27                  375 	xch	a, p
      0000D0 00 07                  376 	idxm	p, a
      0000D2 5A 60                  377 	goto	00101$
      0000D4                        378 00103$:
                                    379 ;	pfs173_uart.c: 66: u[i] = '\0';
      0000D4 0A 57                  380 	mov	a, #(_u + 0)
      0000D6 1E 18                  381 	add	a, _i+0
      0000D8 00 17                  382 	mov	p, a
      0000DA 00 57                  383 	mov	a, #0x00
      0000DC 00 07                  384 	idxm	p, a
                                    385 ;	pfs173_uart.c: 67: UART_print(u);
      0000DE 0A 57                  386 	mov	a, #(_u + 0)
      0000E0 51 17                  387 	mov	_UART_print_PARM_1+0, a
      0000E2 52 26                  388 	clear	_UART_print_PARM_1+1
      0000E4 40 71                  389 	call	_UART_print
                                    390 ;	pfs173_uart.c: 68: _delay_ms(500);
      0000E6 14 57                  391 	mov	a, #0x14
      0000E8 05 17                  392 	mov	__delay_loop_32_PARM_1+0, a
      0000EA 16 57                  393 	mov	a, #0x16
      0000EC 06 17                  394 	mov	__delay_loop_32_PARM_1+1, a
      0000EE 05 57                  395 	mov	a, #0x05
      0000F0 07 17                  396 	mov	__delay_loop_32_PARM_1+2, a
      0000F2 08 26                  397 	clear	__delay_loop_32_PARM_1+3
      0000F4 2D 70                  398 	call	__delay_loop_32
      0000F6 58 60                  399 	goto	00105$
                                    400 ;	pfs173_uart.c: 70: }
      0000F8 7A 00                  401 	ret
                                    402 ;	pfs173_uart.c: 73: void interrupt(void) __interrupt(0)
                                    403 ;	-----------------------------------------
                                    404 ;	 function interrupt
                                    405 ;	-----------------------------------------
      0000FA                        406 _interrupt:
      0000FA 72 00                  407 	push	af
      0000FC 00 1F                  408 	mov	a, p
      0000FE 72 00                  409 	push	af
                                    410 ;	pfs173_uart.c: 76: if (INTRQ & INTRQ_TM2)
      000100 85 01                  411 	mov	a, __intrq
      000102 40 54                  412 	and	a, #0x40
      000104 00 53                  413 	cneqsn	a, #0x00
      000106 86 60                  414 	goto	00102$
                                    415 ;	pfs173_uart.c: 78: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      000108 05 3B                  416 	set0	__intrq, #6
                                    417 ;	pfs173_uart.c: 80: TIM2_interrupt();
      00010A 90 70                  418 	call	_TIM2_interrupt
      00010C                        419 00102$:
                                    420 ;	pfs173_uart.c: 83: if (INTRQ & INTRQ_PB5)
      00010C 85 01                  421 	mov	a, __intrq
      00010E 01 54                  422 	and	a, #0x01
      000110 00 53                  423 	cneqsn	a, #0x00
      000112 8C 60                  424 	goto	00105$
                                    425 ;	pfs173_uart.c: 85: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
      000114 05 38                  426 	set0	__intrq, #0
                                    427 ;	pfs173_uart.c: 87: PB5_interrupt();
      000116 56 71                  428 	call	_PB5_interrupt
      000118                        429 00105$:
                                    430 ;	pfs173_uart.c: 89: }
      000118 73 00                  431 	pop	af
      00011A 00 17                  432 	mov	p, a
      00011C 73 00                  433 	pop	af
      00011E 7B 00                  434 	reti
                                    435 	.area CODE
                                    436 	.area CONST
                                    437 	.area CONST
      0002C6                        438 ___str_0:
      0002C6 0D 02                  439 	ret #0x0d
      0002C8 4F 02                  440 	ret #0x4f	; O
      0002CA 4B 02                  441 	ret #0x4b	; K
      0002CC 0D 02                  442 	ret #0x0d
      0002CE 00 02                  443 	ret #0x00
                                    444 	.area CODE
                                    445 	.area CABS (ABS)
