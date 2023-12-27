                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_uart
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
                                     16 	.globl __t16c
                                     17 	.globl __rop
                                     18 	.globl __bgtr
                                     19 	.globl __ilrcr
                                     20 	.globl __pwmg2dtl
                                     21 	.globl __pwmg2dth
                                     22 	.globl __pwmg2c
                                     23 	.globl __pwmg1dtl
                                     24 	.globl __pwmg1dth
                                     25 	.globl __pwmg1c
                                     26 	.globl __pwmgcubl
                                     27 	.globl __pwmgcubh
                                     28 	.globl __pwmg0dtl
                                     29 	.globl __pwmg0dth
                                     30 	.globl __pwmgclk
                                     31 	.globl __pwmg0c
                                     32 	.globl __tm3b
                                     33 	.globl __tm3s
                                     34 	.globl __tm3ct
                                     35 	.globl __tm3c
                                     36 	.globl __tm2b
                                     37 	.globl __tm2s
                                     38 	.globl __tm2ct
                                     39 	.globl __tm2c
                                     40 	.globl __gpcs
                                     41 	.globl __gpcc
                                     42 	.globl __misclvr
                                     43 	.globl __misc2
                                     44 	.globl __misc
                                     45 	.globl __adcrgc
                                     46 	.globl __adcr
                                     47 	.globl __adcm
                                     48 	.globl __adcc
                                     49 	.globl __pcpl
                                     50 	.globl __pbpl
                                     51 	.globl __pcph
                                     52 	.globl __pcc
                                     53 	.globl __pc
                                     54 	.globl __pbph
                                     55 	.globl __pbc
                                     56 	.globl __pb
                                     57 	.globl __paph
                                     58 	.globl __pac
                                     59 	.globl __pa
                                     60 	.globl __pcdier
                                     61 	.globl __pbdier
                                     62 	.globl __padier
                                     63 	.globl __integs
                                     64 	.globl __ihrcr
                                     65 	.globl __eoscr
                                     66 	.globl __t16m
                                     67 	.globl __intrq
                                     68 	.globl __inten
                                     69 	.globl __clkmd
                                     70 	.globl __sp
                                     71 	.globl __flag
                                     72 	.globl _UART_printNum_PARM_1
                                     73 	.globl _UART_print_PARM_1
                                     74 	.globl _UART_putC_PARM_1
                                     75 	.globl _internal_tx_buffer
                                     76 	.globl _bits_left_in_tx
                                     77 	.globl _flag_tx_busy
                                     78 	.globl _flag_rx_ready
                                     79 	.globl _flag_rx_off
                                     80 	.globl _qout
                                     81 	.globl _start_bit
                                     82 	.globl _qin
                                     83 	.globl _UART_IO_config
                                     84 	.globl _UART_begin
                                     85 	.globl _UART_rx_on
                                     86 	.globl _UART_rx_off
                                     87 	.globl _UART_getchar
                                     88 	.globl _UART_kbhit
                                     89 	.globl _UART_flush_input_buffer
                                     90 	.globl _UART_transmit_busy
                                     91 	.globl _UART_putC
                                     92 	.globl _UART_print
                                     93 	.globl _UART_printNum
                                     94 	.globl _TIM2_interrupt
                                     95 	.globl _PB5_interrupt
                                     96 ;--------------------------------------------------------
                                     97 ; special function registers
                                     98 ;--------------------------------------------------------
                                     99 	.area RSEG (ABS)
      000002                        100 	.org 0x0000
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
      000002                        156 __t16c::
      000002                        157 	.ds 2
                                    158 ;--------------------------------------------------------
                                    159 ; ram data
                                    160 ;--------------------------------------------------------
                                    161 	.area DATA
      00001B                        162 _inbuf:
      00001B                        163 	.ds 32
      00003B                        164 _qin::
      00003B                        165 	.ds 1
      00003C                        166 _start_bit::
      00003C                        167 	.ds 1
      00003D                        168 _qout::
      00003D                        169 	.ds 1
      00003E                        170 _flag_rx_off::
      00003E                        171 	.ds 1
      00003F                        172 _flag_rx_ready::
      00003F                        173 	.ds 1
      000040                        174 _flag_tx_busy::
      000040                        175 	.ds 1
      000041                        176 _bits_left_in_tx::
      000041                        177 	.ds 1
      000042                        178 _internal_tx_buffer::
      000042                        179 	.ds 2
      000044                        180 _UART_putC_PARM_1:
      000044                        181 	.ds 1
      000045                        182 _UART_print_PARM_1:
      000045                        183 	.ds 2
      000047                        184 _UART_print_sloc1_1_0:
      000047                        185 	.ds 2
      000049                        186 _UART_printNum_PARM_1:
      000049                        187 	.ds 2
      00004B                        188 _UART_printNum_dis_65536_53:
      00004B                        189 	.ds 5
      000050                        190 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59:
      000050                        191 	.ds 1
      000051                        192 _TIM2_interrupt_rx_mask_65536_59:
      000051                        193 	.ds 1
      000052                        194 _TIM2_interrupt_bits_left_in_rx_65536_59:
      000052                        195 	.ds 1
      000053                        196 _TIM2_interrupt_internal_rx_buffer_65536_59:
      000053                        197 	.ds 1
                                    198 ;--------------------------------------------------------
                                    199 ; overlayable items in ram 
                                    200 ;--------------------------------------------------------
                                    201 	.area	OSEG (OVR,DATA)
      0000AC                        202 _UART_putC_sloc0_1_0:
      0000AC                        203 	.ds 2
                                    204 ;--------------------------------------------------------
                                    205 ; absolute external ram data
                                    206 ;--------------------------------------------------------
                                    207 	.area DABS (ABS)
                                    208 ;--------------------------------------------------------
                                    209 ; global & static initialisations
                                    210 ;--------------------------------------------------------
                                    211 	.area HOME
                                    212 	.area GSINIT
                                    213 	.area GSFINAL
                                    214 	.area GSINIT
                                    215 ;	pdk_uart.c: 174: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      00003C 50 26                  216 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    217 ;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
      00003E 01 57                  218 	mov	a, #0x01
      000040 3C 17                  219 	mov	_start_bit+0, a
                                    220 ;--------------------------------------------------------
                                    221 ; Home
                                    222 ;--------------------------------------------------------
                                    223 	.area HOME
                                    224 	.area HOME
                                    225 ;--------------------------------------------------------
                                    226 ; code
                                    227 ;--------------------------------------------------------
                                    228 	.area CODE
                                    229 ;	pdk_uart.c: 35: void UART_IO_config(void)
                                    230 ;	-----------------------------------------
                                    231 ;	 function UART_IO_config
                                    232 ;	-----------------------------------------
      00027E                        233 _UART_IO_config:
                                    234 ;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PB5;
      00027E 02 57                  235 	mov	a, #0x02
      000280 67 01                  236 	mov	__rop, a
                                    237 ;	pdk_uart.c: 39: setb(UART_PxC, UART_TX);
      000282 14 3E                  238 	set1	__pbc, #4
                                    239 ;	pdk_uart.c: 41: setb(UART_PxDIER, UART_RX);
      000284 8E 3E                  240 	set1	__pbdier, #5
                                    241 ;	pdk_uart.c: 42: setb(UART_PxPH, UART_RX);
      000286 95 3E                  242 	set1	__pbph, #5
                                    243 ;	pdk_uart.c: 44: INTEGS = INTEGS_PB5_FALLING;
      000288 02 57                  244 	mov	a, #0x02
      00028A 0C 01                  245 	mov	__integs, a
                                    246 ;	pdk_uart.c: 45: INTEN |= INTEN_PB5;
      00028C 84 01                  247 	mov	a, __inten
      00028E 01 55                  248 	or	a, #0x01
      000290 04 01                  249 	mov	__inten, a
                                    250 ;	pdk_uart.c: 46: }
      000292 7A 00                  251 	ret
                                    252 ;	pdk_uart.c: 48: static void TIM2_Config(void)
                                    253 ;	-----------------------------------------
                                    254 ;	 function TIM2_Config
                                    255 ;	-----------------------------------------
      000294                        256 _TIM2_Config:
                                    257 ;	pdk_uart.c: 51: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      000294 20 57                  258 	mov	a, #0x20
      000296 30 01                  259 	mov	__tm2c, a
                                    260 ;	pdk_uart.c: 52: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      000298 0F 57                  261 	mov	a, #0x0f
      00029A 32 01                  262 	mov	__tm2s, a
                                    263 ;	pdk_uart.c: 53: TM2B = 103;									  // Divide by 69 ~> 115942 Hz (apx. 115200)
      00029C 67 57                  264 	mov	a, #0x67
      00029E 33 01                  265 	mov	__tm2b, a
                                    266 ;	pdk_uart.c: 58: }
      0002A0 7A 00                  267 	ret
                                    268 ;	pdk_uart.c: 60: void UART_begin(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function UART_begin
                                    271 ;	-----------------------------------------
      0002A2                        272 _UART_begin:
                                    273 ;	pdk_uart.c: 62: flag_tx_busy = SU_FALSE;
      0002A2 40 26                  274 	clear	_flag_tx_busy+0
                                    275 ;	pdk_uart.c: 63: flag_rx_ready = SU_FALSE;
      0002A4 3F 26                  276 	clear	_flag_rx_ready+0
                                    277 ;	pdk_uart.c: 64: flag_rx_off = SU_TRUE;
      0002A6 01 57                  278 	mov	a, #0x01
      0002A8 3E 17                  279 	mov	_flag_rx_off+0, a
                                    280 ;	pdk_uart.c: 65: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      0002AA 13 3E                  281 	set1	__pb, #4
                                    282 ;	pdk_uart.c: 67: TIM2_Config();
      0002AC 4A 71                  283 	call	_TIM2_Config
                                    284 ;	pdk_uart.c: 68: UART_rx_on();
      0002AE 5A 61                  285 	goto	_UART_rx_on
                                    286 ;	pdk_uart.c: 69: }
      0002B0 7A 00                  287 	ret
                                    288 ;	pdk_uart.c: 71: static void idle(void)
                                    289 ;	-----------------------------------------
                                    290 ;	 function idle
                                    291 ;	-----------------------------------------
      0002B2                        292 _idle:
                                    293 ;	pdk_uart.c: 76: }
      0002B2 7A 00                  294 	ret
                                    295 ;	pdk_uart.c: 78: void UART_rx_on(void)
                                    296 ;	-----------------------------------------
                                    297 ;	 function UART_rx_on
                                    298 ;	-----------------------------------------
      0002B4                        299 _UART_rx_on:
                                    300 ;	pdk_uart.c: 80: flag_rx_off = SU_FALSE;
      0002B4 3E 26                  301 	clear	_flag_rx_off+0
                                    302 ;	pdk_uart.c: 81: }
      0002B6 7A 00                  303 	ret
                                    304 ;	pdk_uart.c: 83: void UART_rx_off(void)
                                    305 ;	-----------------------------------------
                                    306 ;	 function UART_rx_off
                                    307 ;	-----------------------------------------
      0002B8                        308 _UART_rx_off:
                                    309 ;	pdk_uart.c: 85: flag_rx_off = SU_TRUE;
      0002B8 01 57                  310 	mov	a, #0x01
      0002BA 3E 17                  311 	mov	_flag_rx_off+0, a
                                    312 ;	pdk_uart.c: 86: }
      0002BC 7A 00                  313 	ret
                                    314 ;	pdk_uart.c: 88: char UART_getchar(void)
                                    315 ;	-----------------------------------------
                                    316 ;	 function UART_getchar
                                    317 ;	-----------------------------------------
      0002BE                        318 _UART_getchar:
                                    319 ;	pdk_uart.c: 91: while (qout == qin)
      0002BE                        320 00101$:
      0002BE 3D 1F                  321 	mov	a, _qout+0
      0002C0 3B 2F                  322 	cneqsn	a, _qin+0
      0002C2 5F 61                  323 	goto	00101$
      0002C4                        324 00120$:
                                    325 ;	pdk_uart.c: 94: ch = inbuf[qout];
      0002C4 1B 57                  326 	mov	a, #(_inbuf + 0)
      0002C6 3D 18                  327 	add	a, _qout+0
      0002C8 00 17                  328 	mov	p, a
      0002CA 01 07                  329 	idxm	a, p
      0002CC 00 17                  330 	mov	p, a
                                    331 ;	pdk_uart.c: 95: if (++qout >= UART_IN_BUF_SIZE)
      0002CE 3D 24                  332 	inc	_qout+0
      0002D0 3D 1F                  333 	mov	a, _qout+0
      0002D2 20 51                  334 	sub	a, #0x20
      0002D4 80 30                  335 	t0sn	f, c
      0002D6 6D 61                  336 	goto	00105$
                                    337 ;	pdk_uart.c: 97: qout = 0;
      0002D8 3D 26                  338 	clear	_qout+0
      0002DA                        339 00105$:
                                    340 ;	pdk_uart.c: 100: return (ch);
      0002DA 00 1F                  341 	mov	a, p
                                    342 ;	pdk_uart.c: 101: }
      0002DC 7A 00                  343 	ret
                                    344 ;	pdk_uart.c: 103: uint8_t UART_kbhit(void)
                                    345 ;	-----------------------------------------
                                    346 ;	 function UART_kbhit
                                    347 ;	-----------------------------------------
      0002DE                        348 _UART_kbhit:
                                    349 ;	pdk_uart.c: 105: return (qin != qout); // 0 neu giong 1 neu khac
      0002DE 3B 1F                  350 	mov	a, _qin+0
      0002E0 3D 2E                  351 	ceqsn	a, _qout+0
      0002E2 74 61                  352 	goto	00103$
      0002E4 01 57                  353 	mov	a, #0x01
      0002E6 75 61                  354 	goto	00104$
      0002E8                        355 00103$:
      0002E8 00 57                  356 	mov	a, #0x00
      0002EA                        357 00104$:
      0002EA 01 56                  358 	xor	a, #0x01
                                    359 ;	pdk_uart.c: 106: }
      0002EC 7A 00                  360 	ret
                                    361 ;	pdk_uart.c: 108: void UART_flush_input_buffer(void)
                                    362 ;	-----------------------------------------
                                    363 ;	 function UART_flush_input_buffer
                                    364 ;	-----------------------------------------
      0002EE                        365 _UART_flush_input_buffer:
                                    366 ;	pdk_uart.c: 110: qin = 0;
      0002EE 3B 26                  367 	clear	_qin+0
                                    368 ;	pdk_uart.c: 111: qout = 0;
      0002F0 3D 26                  369 	clear	_qout+0
                                    370 ;	pdk_uart.c: 112: }
      0002F2 7A 00                  371 	ret
                                    372 ;	pdk_uart.c: 114: uint8_t UART_transmit_busy(void)
                                    373 ;	-----------------------------------------
                                    374 ;	 function UART_transmit_busy
                                    375 ;	-----------------------------------------
      0002F4                        376 _UART_transmit_busy:
                                    377 ;	pdk_uart.c: 116: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      0002F4 40 1F                  378 	mov	a, _flag_tx_busy+0
      0002F6 01 52                  379 	ceqsn	a, #0x01
      0002F8 80 61                  380 	goto	00103$
      0002FA 01 57                  381 	mov	a, #0x01
      0002FC 00 26                  382 	clear	p
      0002FE 81 61                  383 	goto	00104$
      000300                        384 00103$:
      000300 00 57                  385 	mov	a, #0x00
      000302                        386 00104$:
                                    387 ;	pdk_uart.c: 117: }
      000302 7A 00                  388 	ret
                                    389 ;	pdk_uart.c: 119: void UART_putC(const char ch)
                                    390 ;	-----------------------------------------
                                    391 ;	 function UART_putC
                                    392 ;	-----------------------------------------
      000304                        393 _UART_putC:
                                    394 ;	pdk_uart.c: 121: while (flag_tx_busy == SU_TRUE)
      000304                        395 00101$:
      000304 40 1F                  396 	mov	a, _flag_tx_busy+0
      000306 01 53                  397 	cneqsn	a, #0x01
      000308 82 61                  398 	goto	00101$
      00030A                        399 00114$:
                                    400 ;	pdk_uart.c: 126: bits_left_in_tx = TX_NUM_OF_BITS;
      00030A 0A 57                  401 	mov	a, #0x0a
      00030C 41 17                  402 	mov	_bits_left_in_tx+0, a
                                    403 ;	pdk_uart.c: 127: TIMER_ON;
      00030E 84 01                  404 	mov	a, __inten
      000310 40 55                  405 	or	a, #0x40
      000312 04 01                  406 	mov	__inten, a
                                    407 ;	pdk_uart.c: 128: internal_tx_buffer = (ch << 1) | 0x200;
      000314 00 26                  408 	clear	p
      000316 44 1F                  409 	mov	a, _UART_putC_PARM_1+0
      000318 6B 00                  410 	sl	a
      00031A 00 2D                  411 	slc	p
      00031C AC 17                  412 	mov	_UART_putC_sloc0_1_0+0, a
      00031E 00 1F                  413 	mov	a, p
      000320 02 55                  414 	or	a, #0x02
      000322 AD 17                  415 	mov	_UART_putC_sloc0_1_0+1, a
      000324 AC 1F                  416 	mov	a, _UART_putC_sloc0_1_0+0
      000326 42 17                  417 	mov	_internal_tx_buffer+0, a
      000328 AD 1F                  418 	mov	a, _UART_putC_sloc0_1_0+1
      00032A 43 17                  419 	mov	_internal_tx_buffer+1, a
                                    420 ;	pdk_uart.c: 129: flag_tx_busy = SU_TRUE;
      00032C 01 57                  421 	mov	a, #0x01
      00032E 40 17                  422 	mov	_flag_tx_busy+0, a
                                    423 ;	pdk_uart.c: 130: }
      000330 7A 00                  424 	ret
                                    425 ;	pdk_uart.c: 132: void UART_print(char *str)
                                    426 ;	-----------------------------------------
                                    427 ;	 function UART_print
                                    428 ;	-----------------------------------------
      000332                        429 _UART_print:
                                    430 ;	pdk_uart.c: 135: while (str[i] != '\0')
      000332 47 26                  431 	clear	_UART_print_sloc1_1_0+0
      000334 48 26                  432 	clear	_UART_print_sloc1_1_0+1
      000336                        433 00101$:
      000336 45 1F                  434 	mov	a, _UART_print_PARM_1+0
      000338 47 18                  435 	add	a, _UART_print_sloc1_1_0+0
      00033A 00 17                  436 	mov	p, a
      00033C 46 1F                  437 	mov	a, _UART_print_PARM_1+1
      00033E 48 1A                  438 	addc	a, _UART_print_sloc1_1_0+1
      000340 79 74                  439 	call	__gptrget
      000342 00 53                  440 	cneqsn	a, #0x00
      000344 AE 61                  441 	goto	00104$
                                    442 ;	pdk_uart.c: 136: UART_putC(str[i++]);
      000346 45 1F                  443 	mov	a, _UART_print_PARM_1+0
      000348 47 18                  444 	add	a, _UART_print_sloc1_1_0+0
      00034A 00 17                  445 	mov	p, a
      00034C 46 1F                  446 	mov	a, _UART_print_PARM_1+1
      00034E 48 1A                  447 	addc	a, _UART_print_sloc1_1_0+1
      000350 47 24                  448 	inc	_UART_print_sloc1_1_0+0
      000352 48 20                  449 	addc	_UART_print_sloc1_1_0+1
      000354 79 74                  450 	call	__gptrget
      000356 44 17                  451 	mov	_UART_putC_PARM_1+0, a
      000358 82 71                  452 	call	_UART_putC
      00035A 9B 61                  453 	goto	00101$
      00035C                        454 00104$:
                                    455 ;	pdk_uart.c: 137: }
      00035C 7A 00                  456 	ret
                                    457 ;	pdk_uart.c: 139: void UART_printNum(int num)
                                    458 ;	-----------------------------------------
                                    459 ;	 function UART_printNum
                                    460 ;	-----------------------------------------
      00035E                        461 _UART_printNum:
                                    462 ;	pdk_uart.c: 142: if (num > 999)
      00035E E7 57                  463 	mov	a, #0xe7
      000360 49 19                  464 	sub	a, _UART_printNum_PARM_1+0
      000362 03 57                  465 	mov	a, #0x03
      000364 4A 1B                  466 	subc	a, _UART_printNum_PARM_1+1
      000366 80 31                  467 	t0sn	f, ov
      000368 80 56                  468 	xor	a, #0x80
      00036A 6B 00                  469 	sl	a
      00036C 80 34                  470 	t1sn	f, c
      00036E F1 61                  471 	goto	00108$
                                    472 ;	pdk_uart.c: 144: dis[0] = num / 1000 + 48;
      000370 49 1F                  473 	mov	a, _UART_printNum_PARM_1+0
      000372 9E 17                  474 	mov	__divsint_PARM_1+0, a
      000374 4A 1F                  475 	mov	a, _UART_printNum_PARM_1+1
      000376 9F 17                  476 	mov	__divsint_PARM_1+1, a
      000378 E8 57                  477 	mov	a, #0xe8
      00037A A0 17                  478 	mov	__divsint_PARM_2+0, a
      00037C 03 57                  479 	mov	a, #0x03
      00037E A1 17                  480 	mov	__divsint_PARM_2+1, a
      000380 16 74                  481 	call	__divsint
      000382 30 50                  482 	add	a, #0x30
      000384 4B 17                  483 	mov	_UART_printNum_dis_65536_53+0, a
                                    484 ;	pdk_uart.c: 145: dis[1] = (num / 100) % 10 + 48;
      000386 49 1F                  485 	mov	a, _UART_printNum_PARM_1+0
      000388 9E 17                  486 	mov	__divsint_PARM_1+0, a
      00038A 4A 1F                  487 	mov	a, _UART_printNum_PARM_1+1
      00038C 9F 17                  488 	mov	__divsint_PARM_1+1, a
      00038E 64 57                  489 	mov	a, #0x64
      000390 A0 17                  490 	mov	__divsint_PARM_2+0, a
      000392 A1 26                  491 	clear	__divsint_PARM_2+1
      000394 16 74                  492 	call	__divsint
      000396 91 17                  493 	mov	__modsint_PARM_1+0, a
      000398 00 1F                  494 	mov	a, p
      00039A 92 17                  495 	mov	__modsint_PARM_1+1, a
      00039C 0A 57                  496 	mov	a, #0x0a
      00039E 93 17                  497 	mov	__modsint_PARM_2+0, a
      0003A0 94 26                  498 	clear	__modsint_PARM_2+1
      0003A2 AF 73                  499 	call	__modsint
      0003A4 30 50                  500 	add	a, #0x30
      0003A6 4C 17                  501 	mov	_UART_printNum_dis_65536_53+1, a
                                    502 ;	pdk_uart.c: 146: dis[2] = (num / 10) % 10 + 48;
      0003A8 49 1F                  503 	mov	a, _UART_printNum_PARM_1+0
      0003AA 9E 17                  504 	mov	__divsint_PARM_1+0, a
      0003AC 4A 1F                  505 	mov	a, _UART_printNum_PARM_1+1
      0003AE 9F 17                  506 	mov	__divsint_PARM_1+1, a
      0003B0 0A 57                  507 	mov	a, #0x0a
      0003B2 A0 17                  508 	mov	__divsint_PARM_2+0, a
      0003B4 A1 26                  509 	clear	__divsint_PARM_2+1
      0003B6 16 74                  510 	call	__divsint
      0003B8 91 17                  511 	mov	__modsint_PARM_1+0, a
      0003BA 00 1F                  512 	mov	a, p
      0003BC 92 17                  513 	mov	__modsint_PARM_1+1, a
      0003BE 0A 57                  514 	mov	a, #0x0a
      0003C0 93 17                  515 	mov	__modsint_PARM_2+0, a
      0003C2 94 26                  516 	clear	__modsint_PARM_2+1
      0003C4 AF 73                  517 	call	__modsint
      0003C6 30 50                  518 	add	a, #0x30
      0003C8 4D 17                  519 	mov	_UART_printNum_dis_65536_53+2, a
                                    520 ;	pdk_uart.c: 147: dis[3] = num % 10 + 48;
      0003CA 49 1F                  521 	mov	a, _UART_printNum_PARM_1+0
      0003CC 91 17                  522 	mov	__modsint_PARM_1+0, a
      0003CE 4A 1F                  523 	mov	a, _UART_printNum_PARM_1+1
      0003D0 92 17                  524 	mov	__modsint_PARM_1+1, a
      0003D2 0A 57                  525 	mov	a, #0x0a
      0003D4 93 17                  526 	mov	__modsint_PARM_2+0, a
      0003D6 94 26                  527 	clear	__modsint_PARM_2+1
      0003D8 AF 73                  528 	call	__modsint
      0003DA 30 50                  529 	add	a, #0x30
      0003DC 4E 17                  530 	mov	_UART_printNum_dis_65536_53+3, a
                                    531 ;	pdk_uart.c: 148: dis[4] = '\0';
      0003DE 4F 26                  532 	clear	_UART_printNum_dis_65536_53+4
      0003E0 44 62                  533 	goto	00109$
      0003E2                        534 00108$:
                                    535 ;	pdk_uart.c: 150: else if (num > 99)
      0003E2 63 57                  536 	mov	a, #0x63
      0003E4 49 19                  537 	sub	a, _UART_printNum_PARM_1+0
      0003E6 00 57                  538 	mov	a, #0x00
      0003E8 4A 1B                  539 	subc	a, _UART_printNum_PARM_1+1
      0003EA 80 31                  540 	t0sn	f, ov
      0003EC 80 56                  541 	xor	a, #0x80
      0003EE 6B 00                  542 	sl	a
      0003F0 80 34                  543 	t1sn	f, c
      0003F2 21 62                  544 	goto	00105$
                                    545 ;	pdk_uart.c: 152: dis[0] = num / 100 + 48;
      0003F4 49 1F                  546 	mov	a, _UART_printNum_PARM_1+0
      0003F6 9E 17                  547 	mov	__divsint_PARM_1+0, a
      0003F8 4A 1F                  548 	mov	a, _UART_printNum_PARM_1+1
      0003FA 9F 17                  549 	mov	__divsint_PARM_1+1, a
      0003FC 64 57                  550 	mov	a, #0x64
      0003FE A0 17                  551 	mov	__divsint_PARM_2+0, a
      000400 A1 26                  552 	clear	__divsint_PARM_2+1
      000402 16 74                  553 	call	__divsint
      000404 30 50                  554 	add	a, #0x30
      000406 4B 17                  555 	mov	_UART_printNum_dis_65536_53+0, a
                                    556 ;	pdk_uart.c: 153: dis[1] = (num / 10) % 10 + 48;
      000408 49 1F                  557 	mov	a, _UART_printNum_PARM_1+0
      00040A 9E 17                  558 	mov	__divsint_PARM_1+0, a
      00040C 4A 1F                  559 	mov	a, _UART_printNum_PARM_1+1
      00040E 9F 17                  560 	mov	__divsint_PARM_1+1, a
      000410 0A 57                  561 	mov	a, #0x0a
      000412 A0 17                  562 	mov	__divsint_PARM_2+0, a
      000414 A1 26                  563 	clear	__divsint_PARM_2+1
      000416 16 74                  564 	call	__divsint
      000418 91 17                  565 	mov	__modsint_PARM_1+0, a
      00041A 00 1F                  566 	mov	a, p
      00041C 92 17                  567 	mov	__modsint_PARM_1+1, a
      00041E 0A 57                  568 	mov	a, #0x0a
      000420 93 17                  569 	mov	__modsint_PARM_2+0, a
      000422 94 26                  570 	clear	__modsint_PARM_2+1
      000424 AF 73                  571 	call	__modsint
      000426 30 50                  572 	add	a, #0x30
      000428 4C 17                  573 	mov	_UART_printNum_dis_65536_53+1, a
                                    574 ;	pdk_uart.c: 154: dis[2] = num % 10 + 48;
      00042A 49 1F                  575 	mov	a, _UART_printNum_PARM_1+0
      00042C 91 17                  576 	mov	__modsint_PARM_1+0, a
      00042E 4A 1F                  577 	mov	a, _UART_printNum_PARM_1+1
      000430 92 17                  578 	mov	__modsint_PARM_1+1, a
      000432 0A 57                  579 	mov	a, #0x0a
      000434 93 17                  580 	mov	__modsint_PARM_2+0, a
      000436 94 26                  581 	clear	__modsint_PARM_2+1
      000438 AF 73                  582 	call	__modsint
      00043A 30 50                  583 	add	a, #0x30
      00043C 4D 17                  584 	mov	_UART_printNum_dis_65536_53+2, a
                                    585 ;	pdk_uart.c: 155: dis[3] = '\0';
      00043E 4E 26                  586 	clear	_UART_printNum_dis_65536_53+3
      000440 44 62                  587 	goto	00109$
      000442                        588 00105$:
                                    589 ;	pdk_uart.c: 157: else if (num > 9)
      000442 09 57                  590 	mov	a, #0x09
      000444 49 19                  591 	sub	a, _UART_printNum_PARM_1+0
      000446 00 57                  592 	mov	a, #0x00
      000448 4A 1B                  593 	subc	a, _UART_printNum_PARM_1+1
      00044A 80 31                  594 	t0sn	f, ov
      00044C 80 56                  595 	xor	a, #0x80
      00044E 6B 00                  596 	sl	a
      000450 80 34                  597 	t1sn	f, c
      000452 40 62                  598 	goto	00102$
                                    599 ;	pdk_uart.c: 159: dis[0] = num / 10 + 48;
      000454 49 1F                  600 	mov	a, _UART_printNum_PARM_1+0
      000456 9E 17                  601 	mov	__divsint_PARM_1+0, a
      000458 4A 1F                  602 	mov	a, _UART_printNum_PARM_1+1
      00045A 9F 17                  603 	mov	__divsint_PARM_1+1, a
      00045C 0A 57                  604 	mov	a, #0x0a
      00045E A0 17                  605 	mov	__divsint_PARM_2+0, a
      000460 A1 26                  606 	clear	__divsint_PARM_2+1
      000462 16 74                  607 	call	__divsint
      000464 30 50                  608 	add	a, #0x30
      000466 4B 17                  609 	mov	_UART_printNum_dis_65536_53+0, a
                                    610 ;	pdk_uart.c: 160: dis[1] = num % 10 + 48;
      000468 49 1F                  611 	mov	a, _UART_printNum_PARM_1+0
      00046A 91 17                  612 	mov	__modsint_PARM_1+0, a
      00046C 4A 1F                  613 	mov	a, _UART_printNum_PARM_1+1
      00046E 92 17                  614 	mov	__modsint_PARM_1+1, a
      000470 0A 57                  615 	mov	a, #0x0a
      000472 93 17                  616 	mov	__modsint_PARM_2+0, a
      000474 94 26                  617 	clear	__modsint_PARM_2+1
      000476 AF 73                  618 	call	__modsint
      000478 30 50                  619 	add	a, #0x30
      00047A 4C 17                  620 	mov	_UART_printNum_dis_65536_53+1, a
                                    621 ;	pdk_uart.c: 161: dis[2] = '\0';
      00047C 4D 26                  622 	clear	_UART_printNum_dis_65536_53+2
      00047E 44 62                  623 	goto	00109$
      000480                        624 00102$:
                                    625 ;	pdk_uart.c: 165: dis[0] = num + 48;
      000480 49 1F                  626 	mov	a, _UART_printNum_PARM_1+0
      000482 30 50                  627 	add	a, #0x30
      000484 4B 17                  628 	mov	_UART_printNum_dis_65536_53+0, a
                                    629 ;	pdk_uart.c: 166: dis[1] = '\0';
      000486 4C 26                  630 	clear	_UART_printNum_dis_65536_53+1
      000488                        631 00109$:
                                    632 ;	pdk_uart.c: 168: UART_print(dis);
      000488 4B 57                  633 	mov	a, #(_UART_printNum_dis_65536_53 + 0)
      00048A 45 17                  634 	mov	_UART_print_PARM_1+0, a
      00048C 46 26                  635 	clear	_UART_print_PARM_1+1
      00048E 99 61                  636 	goto	_UART_print
                                    637 ;	pdk_uart.c: 169: }
      000490 7A 00                  638 	ret
                                    639 ;	pdk_uart.c: 172: void TIM2_interrupt(void)
                                    640 ;	-----------------------------------------
                                    641 ;	 function TIM2_interrupt
                                    642 ;	-----------------------------------------
      000492                        643 _TIM2_interrupt:
                                    644 ;	pdk_uart.c: 181: if (flag_tx_busy == SU_TRUE)
      000492 40 1F                  645 	mov	a, _flag_tx_busy+0
      000494 01 52                  646 	ceqsn	a, #0x01
      000496 61 62                  647 	goto	00107$
                                    648 ;	pdk_uart.c: 183: if (internal_tx_buffer & 0x01)
      000498 43 1F                  649 	mov	a, _internal_tx_buffer+1
      00049A 00 17                  650 	mov	p, a
      00049C 42 1F                  651 	mov	a, _internal_tx_buffer+0
      00049E 01 54                  652 	and	a, #0x01
      0004A0 00 53                  653 	cneqsn	a, #0x00
      0004A2 54 62                  654 	goto	00102$
                                    655 ;	pdk_uart.c: 185: setb(UART_Px, UART_TX);
      0004A4 13 3E                  656 	set1	__pb, #4
      0004A6 55 62                  657 	goto	00103$
      0004A8                        658 00102$:
                                    659 ;	pdk_uart.c: 189: clrb(UART_Px, UART_TX);
      0004A8 13 3A                  660 	set0	__pb, #4
      0004AA                        661 00103$:
                                    662 ;	pdk_uart.c: 191: internal_tx_buffer >>= 1;
      0004AA 43 2A                  663 	sr	_internal_tx_buffer+1
      0004AC 42 2C                  664 	src	_internal_tx_buffer+0
                                    665 ;	pdk_uart.c: 192: if (--bits_left_in_tx == 0)
      0004AE 41 1F                  666 	mov	a, _bits_left_in_tx+0
      0004B0 01 51                  667 	sub	a, #0x01
      0004B2 41 17                  668 	mov	_bits_left_in_tx+0, a
      0004B4 00 52                  669 	ceqsn	a, #0x00
      0004B6 61 62                  670 	goto	00107$
                                    671 ;	pdk_uart.c: 194: flag_tx_busy = SU_FALSE;
      0004B8 40 26                  672 	clear	_flag_tx_busy+0
                                    673 ;	pdk_uart.c: 195: TIMER_OFF;
      0004BA 04 3B                  674 	set0	__inten, #6
                                    675 ;	pdk_uart.c: 196: EXTERNAL_ON;
      0004BC 84 01                  676 	mov	a, __inten
      0004BE 01 55                  677 	or	a, #0x01
      0004C0 04 01                  678 	mov	__inten, a
      0004C2                        679 00107$:
                                    680 ;	pdk_uart.c: 201: if (flag_rx_off == SU_FALSE)
      0004C2 3E 1F                  681 	mov	a, _flag_rx_off+0
      0004C4 00 52                  682 	ceqsn	a, #0x00
      0004C6 95 62                  683 	goto	00124$
                                    684 ;	pdk_uart.c: 203: if (flag_rx_waiting_for_stop_bit)
      0004C8 50 1F                  685 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
      0004CA 00 53                  686 	cneqsn	a, #0x00
      0004CC 7C 62                  687 	goto	00120$
                                    688 ;	pdk_uart.c: 205: start_bit = 1;
      0004CE 01 57                  689 	mov	a, #0x01
      0004D0 3C 17                  690 	mov	_start_bit+0, a
                                    691 ;	pdk_uart.c: 206: EXTERNAL_ON;
      0004D2 84 01                  692 	mov	a, __inten
      0004D4 01 55                  693 	or	a, #0x01
      0004D6 04 01                  694 	mov	__inten, a
                                    695 ;	pdk_uart.c: 207: flag_rx_waiting_for_stop_bit = SU_FALSE;
      0004D8 50 26                  696 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    697 ;	pdk_uart.c: 208: flag_rx_ready = SU_FALSE;
      0004DA 3F 26                  698 	clear	_flag_rx_ready+0
                                    699 ;	pdk_uart.c: 209: inbuf[qin] = internal_rx_buffer;
      0004DC 1B 57                  700 	mov	a, #(_inbuf + 0)
      0004DE 3B 18                  701 	add	a, _qin+0
      0004E0 00 17                  702 	mov	p, a
      0004E2 53 1F                  703 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_59+0
      0004E4 00 07                  704 	idxm	p, a
                                    705 ;	pdk_uart.c: 210: if (++qin >= UART_IN_BUF_SIZE)
      0004E6 3B 1F                  706 	mov	a, _qin+0
      0004E8 01 50                  707 	add	a, #0x01
      0004EA 3B 17                  708 	mov	_qin+0, a
      0004EC 20 52                  709 	ceqsn	a, #0x20
      0004EE 00 00                  710 	nop
      0004F0 80 30                  711 	t0sn	f, c
      0004F2 95 62                  712 	goto	00124$
                                    713 ;	pdk_uart.c: 212: qin = 0; // overflow - reset inbuf-index
      0004F4 3B 26                  714 	clear	_qin+0
      0004F6 95 62                  715 	goto	00124$
      0004F8                        716 00120$:
                                    717 ;	pdk_uart.c: 217: if (flag_rx_ready == SU_FALSE)
      0004F8 3F 1F                  718 	mov	a, _flag_rx_ready+0
      0004FA 00 52                  719 	ceqsn	a, #0x00
      0004FC 8A 62                  720 	goto	00117$
                                    721 ;	pdk_uart.c: 219: if (start_bit == 0)
      0004FE 3C 1F                  722 	mov	a, _start_bit+0
      000500 00 52                  723 	ceqsn	a, #0x00
      000502 95 62                  724 	goto	00124$
                                    725 ;	pdk_uart.c: 221: flag_rx_ready = SU_TRUE;
      000504 01 57                  726 	mov	a, #0x01
      000506 3F 17                  727 	mov	_flag_rx_ready+0, a
                                    728 ;	pdk_uart.c: 222: internal_rx_buffer = 0;
      000508 53 26                  729 	clear	_TIM2_interrupt_internal_rx_buffer_65536_59+0
                                    730 ;	pdk_uart.c: 223: bits_left_in_rx = RX_NUM_OF_BITS;
      00050A 08 57                  731 	mov	a, #0x08
      00050C 52 17                  732 	mov	_TIM2_interrupt_bits_left_in_rx_65536_59+0, a
                                    733 ;	pdk_uart.c: 224: rx_mask = 1;
      00050E 01 57                  734 	mov	a, #0x01
      000510 51 17                  735 	mov	_TIM2_interrupt_rx_mask_65536_59+0, a
      000512 95 62                  736 	goto	00124$
      000514                        737 00117$:
                                    738 ;	pdk_uart.c: 230: if (UART_Px & (0x20))
      000514 93 01                  739 	mov	a, __pb
      000516 20 54                  740 	and	a, #0x20
      000518 00 53                  741 	cneqsn	a, #0x00
      00051A 90 62                  742 	goto	00113$
                                    743 ;	pdk_uart.c: 232: internal_rx_buffer |= rx_mask;
      00051C 51 1F                  744 	mov	a, _TIM2_interrupt_rx_mask_65536_59+0
      00051E 53 15                  745 	or	_TIM2_interrupt_internal_rx_buffer_65536_59+0, a
      000520                        746 00113$:
                                    747 ;	pdk_uart.c: 234: rx_mask <<= 1;
      000520 51 2B                  748 	sl	_TIM2_interrupt_rx_mask_65536_59+0
                                    749 ;	pdk_uart.c: 235: if (--bits_left_in_rx == 0)
      000522 52 23                  750 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_59+0
      000524 95 62                  751 	goto	00124$
                                    752 ;	pdk_uart.c: 237: flag_rx_waiting_for_stop_bit = SU_TRUE;
      000526 01 57                  753 	mov	a, #0x01
      000528 50 17                  754 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0, a
      00052A                        755 00124$:
                                    756 ;	pdk_uart.c: 242: }
      00052A 7A 00                  757 	ret
                                    758 ;	pdk_uart.c: 245: void PB5_interrupt(void)
                                    759 ;	-----------------------------------------
                                    760 ;	 function PB5_interrupt
                                    761 ;	-----------------------------------------
      00052C                        762 _PB5_interrupt:
                                    763 ;	pdk_uart.c: 247: TM2CT = 9;
      00052C 09 57                  764 	mov	a, #0x09
      00052E 31 01                  765 	mov	__tm2ct, a
                                    766 ;	pdk_uart.c: 248: TIMER_OFF;
      000530 04 3B                  767 	set0	__inten, #6
                                    768 ;	pdk_uart.c: 249: EXTERNAL_OFF;
      000532 04 38                  769 	set0	__inten, #0
                                    770 ;	pdk_uart.c: 250: start_bit = 0;
      000534 3C 26                  771 	clear	_start_bit+0
                                    772 ;	pdk_uart.c: 252: INTRQ &= ~INTRQ_TM2;
      000536 05 3B                  773 	set0	__intrq, #6
                                    774 ;	pdk_uart.c: 253: TIMER_ON;
      000538 84 01                  775 	mov	a, __inten
      00053A 40 55                  776 	or	a, #0x40
      00053C 04 01                  777 	mov	__inten, a
                                    778 ;	pdk_uart.c: 254: }
      00053E 7A 00                  779 	ret
                                    780 	.area CODE
                                    781 	.area CONST
                                    782 	.area CABS (ABS)
