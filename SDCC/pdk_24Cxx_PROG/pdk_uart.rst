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
                                     95 	.globl _PA4_interrupt
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
      000038                        162 _inbuf:
      000038                        163 	.ds 32
      000058                        164 _qin::
      000058                        165 	.ds 1
      000059                        166 _start_bit::
      000059                        167 	.ds 1
      00005A                        168 _qout::
      00005A                        169 	.ds 1
      00005B                        170 _flag_rx_off::
      00005B                        171 	.ds 1
      00005C                        172 _flag_rx_ready::
      00005C                        173 	.ds 1
      00005D                        174 _flag_tx_busy::
      00005D                        175 	.ds 1
      00005E                        176 _bits_left_in_tx::
      00005E                        177 	.ds 1
      00005F                        178 _internal_tx_buffer::
      00005F                        179 	.ds 2
      000061                        180 _UART_putC_PARM_1:
      000061                        181 	.ds 1
      000062                        182 _UART_print_PARM_1:
      000062                        183 	.ds 2
      000064                        184 _UART_print_sloc1_1_0:
      000064                        185 	.ds 2
      000066                        186 _UART_printNum_PARM_1:
      000066                        187 	.ds 2
      000068                        188 _UART_printNum_dis_65536_53:
      000068                        189 	.ds 5
      00006D                        190 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59:
      00006D                        191 	.ds 1
      00006E                        192 _TIM2_interrupt_rx_mask_65536_59:
      00006E                        193 	.ds 1
      00006F                        194 _TIM2_interrupt_bits_left_in_rx_65536_59:
      00006F                        195 	.ds 1
      000070                        196 _TIM2_interrupt_internal_rx_buffer_65536_59:
      000070                        197 	.ds 1
                                    198 ;--------------------------------------------------------
                                    199 ; overlayable items in ram 
                                    200 ;--------------------------------------------------------
                                    201 	.area	OSEG (OVR,DATA)
      0000EC                        202 _UART_putC_sloc0_1_0:
      0000EC                        203 	.ds 2
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
                                    215 ;	pdk_uart.c: 170: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      000068 6D 26                  216 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    217 ;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
      00006A 01 57                  218 	mov	a, #0x01
      00006C 59 17                  219 	mov	_start_bit+0, a
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
      0001D8                        233 _UART_IO_config:
                                    234 ;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PA4;
      0001D8 01 57                  235 	mov	a, #0x01
      0001DA 67 01                  236 	mov	__rop, a
                                    237 ;	pdk_uart.c: 39: setb(UART_PxC, UART_TX);
      0001DC 91 3D                  238 	set1	__pac, #3
                                    239 ;	pdk_uart.c: 41: setb(UART_PxDIER, UART_RX);
      0001DE 0D 3E                  240 	set1	__padier, #4
                                    241 ;	pdk_uart.c: 42: setb(UART_PxPH, UART_RX);
      0001E0 12 3E                  242 	set1	__paph, #4
                                    243 ;	pdk_uart.c: 44: INTEGS = INTEGS_PA4_FALLING;
      0001E2 08 57                  244 	mov	a, #0x08
      0001E4 0C 01                  245 	mov	__integs, a
                                    246 ;	pdk_uart.c: 45: INTEN |= INTEN_PA4;
      0001E6 84 01                  247 	mov	a, __inten
      0001E8 02 55                  248 	or	a, #0x02
      0001EA 04 01                  249 	mov	__inten, a
                                    250 ;	pdk_uart.c: 46: }
      0001EC 7A 00                  251 	ret
                                    252 ;	pdk_uart.c: 48: static void TIM2_Config(void)
                                    253 ;	-----------------------------------------
                                    254 ;	 function TIM2_Config
                                    255 ;	-----------------------------------------
      0001EE                        256 _TIM2_Config:
                                    257 ;	pdk_uart.c: 51: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      0001EE 20 57                  258 	mov	a, #0x20
      0001F0 30 01                  259 	mov	__tm2c, a
                                    260 ;	pdk_uart.c: 52: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      0001F2 0F 57                  261 	mov	a, #0x0f
      0001F4 32 01                  262 	mov	__tm2s, a
                                    263 ;	pdk_uart.c: 53: TM2B = 103;									  // Divide by 69 ~> 9600 Hz (apx. 115200)
      0001F6 67 57                  264 	mov	a, #0x67
      0001F8 33 01                  265 	mov	__tm2b, a
                                    266 ;	pdk_uart.c: 54: }
      0001FA 7A 00                  267 	ret
                                    268 ;	pdk_uart.c: 56: void UART_begin(void)
                                    269 ;	-----------------------------------------
                                    270 ;	 function UART_begin
                                    271 ;	-----------------------------------------
      0001FC                        272 _UART_begin:
                                    273 ;	pdk_uart.c: 58: flag_tx_busy = SU_FALSE;
      0001FC 5D 26                  274 	clear	_flag_tx_busy+0
                                    275 ;	pdk_uart.c: 59: flag_rx_ready = SU_FALSE;
      0001FE 5C 26                  276 	clear	_flag_rx_ready+0
                                    277 ;	pdk_uart.c: 60: flag_rx_off = SU_TRUE;
      000200 01 57                  278 	mov	a, #0x01
      000202 5B 17                  279 	mov	_flag_rx_off+0, a
                                    280 ;	pdk_uart.c: 61: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      000204 90 3D                  281 	set1	__pa, #3
                                    282 ;	pdk_uart.c: 63: TIM2_Config();
      000206 F7 70                  283 	call	_TIM2_Config
                                    284 ;	pdk_uart.c: 64: UART_rx_on();
      000208 07 61                  285 	goto	_UART_rx_on
                                    286 ;	pdk_uart.c: 65: }
      00020A 7A 00                  287 	ret
                                    288 ;	pdk_uart.c: 67: static void idle(void)
                                    289 ;	-----------------------------------------
                                    290 ;	 function idle
                                    291 ;	-----------------------------------------
      00020C                        292 _idle:
                                    293 ;	pdk_uart.c: 72: }
      00020C 7A 00                  294 	ret
                                    295 ;	pdk_uart.c: 74: void UART_rx_on(void)
                                    296 ;	-----------------------------------------
                                    297 ;	 function UART_rx_on
                                    298 ;	-----------------------------------------
      00020E                        299 _UART_rx_on:
                                    300 ;	pdk_uart.c: 76: flag_rx_off = SU_FALSE;
      00020E 5B 26                  301 	clear	_flag_rx_off+0
                                    302 ;	pdk_uart.c: 77: }
      000210 7A 00                  303 	ret
                                    304 ;	pdk_uart.c: 79: void UART_rx_off(void)
                                    305 ;	-----------------------------------------
                                    306 ;	 function UART_rx_off
                                    307 ;	-----------------------------------------
      000212                        308 _UART_rx_off:
                                    309 ;	pdk_uart.c: 81: flag_rx_off = SU_TRUE;
      000212 01 57                  310 	mov	a, #0x01
      000214 5B 17                  311 	mov	_flag_rx_off+0, a
                                    312 ;	pdk_uart.c: 82: }
      000216 7A 00                  313 	ret
                                    314 ;	pdk_uart.c: 84: char UART_getchar(void)
                                    315 ;	-----------------------------------------
                                    316 ;	 function UART_getchar
                                    317 ;	-----------------------------------------
      000218                        318 _UART_getchar:
                                    319 ;	pdk_uart.c: 87: while (qout == qin)
      000218                        320 00101$:
      000218 5A 1F                  321 	mov	a, _qout+0
      00021A 58 2F                  322 	cneqsn	a, _qin+0
      00021C 0C 61                  323 	goto	00101$
      00021E                        324 00120$:
                                    325 ;	pdk_uart.c: 90: ch = inbuf[qout];
      00021E 38 57                  326 	mov	a, #(_inbuf + 0)
      000220 5A 18                  327 	add	a, _qout+0
      000222 00 17                  328 	mov	p, a
      000224 01 07                  329 	idxm	a, p
      000226 00 17                  330 	mov	p, a
                                    331 ;	pdk_uart.c: 91: if (++qout >= UART_IN_BUF_SIZE)
      000228 5A 24                  332 	inc	_qout+0
      00022A 5A 1F                  333 	mov	a, _qout+0
      00022C 20 51                  334 	sub	a, #0x20
      00022E 80 30                  335 	t0sn	f, c
      000230 1A 61                  336 	goto	00105$
                                    337 ;	pdk_uart.c: 93: qout = 0;
      000232 5A 26                  338 	clear	_qout+0
      000234                        339 00105$:
                                    340 ;	pdk_uart.c: 96: return (ch);
      000234 00 1F                  341 	mov	a, p
                                    342 ;	pdk_uart.c: 97: }
      000236 7A 00                  343 	ret
                                    344 ;	pdk_uart.c: 99: uint8_t UART_kbhit(void)
                                    345 ;	-----------------------------------------
                                    346 ;	 function UART_kbhit
                                    347 ;	-----------------------------------------
      000238                        348 _UART_kbhit:
                                    349 ;	pdk_uart.c: 101: return (qin != qout); // 0 neu giong 1 neu khac
      000238 58 1F                  350 	mov	a, _qin+0
      00023A 5A 2E                  351 	ceqsn	a, _qout+0
      00023C 21 61                  352 	goto	00103$
      00023E 01 57                  353 	mov	a, #0x01
      000240 22 61                  354 	goto	00104$
      000242                        355 00103$:
      000242 00 57                  356 	mov	a, #0x00
      000244                        357 00104$:
      000244 01 56                  358 	xor	a, #0x01
                                    359 ;	pdk_uart.c: 102: }
      000246 7A 00                  360 	ret
                                    361 ;	pdk_uart.c: 104: void UART_flush_input_buffer(void)
                                    362 ;	-----------------------------------------
                                    363 ;	 function UART_flush_input_buffer
                                    364 ;	-----------------------------------------
      000248                        365 _UART_flush_input_buffer:
                                    366 ;	pdk_uart.c: 106: qin = 0;
      000248 58 26                  367 	clear	_qin+0
                                    368 ;	pdk_uart.c: 107: qout = 0;
      00024A 5A 26                  369 	clear	_qout+0
                                    370 ;	pdk_uart.c: 108: }
      00024C 7A 00                  371 	ret
                                    372 ;	pdk_uart.c: 110: uint8_t UART_transmit_busy(void)
                                    373 ;	-----------------------------------------
                                    374 ;	 function UART_transmit_busy
                                    375 ;	-----------------------------------------
      00024E                        376 _UART_transmit_busy:
                                    377 ;	pdk_uart.c: 112: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      00024E 5D 1F                  378 	mov	a, _flag_tx_busy+0
      000250 01 52                  379 	ceqsn	a, #0x01
      000252 2D 61                  380 	goto	00103$
      000254 01 57                  381 	mov	a, #0x01
      000256 00 26                  382 	clear	p
      000258 2E 61                  383 	goto	00104$
      00025A                        384 00103$:
      00025A 00 57                  385 	mov	a, #0x00
      00025C                        386 00104$:
                                    387 ;	pdk_uart.c: 113: }
      00025C 7A 00                  388 	ret
                                    389 ;	pdk_uart.c: 115: void UART_putC(const char ch)
                                    390 ;	-----------------------------------------
                                    391 ;	 function UART_putC
                                    392 ;	-----------------------------------------
      00025E                        393 _UART_putC:
                                    394 ;	pdk_uart.c: 117: while (flag_tx_busy == SU_TRUE)
      00025E                        395 00101$:
      00025E 5D 1F                  396 	mov	a, _flag_tx_busy+0
      000260 01 53                  397 	cneqsn	a, #0x01
      000262 2F 61                  398 	goto	00101$
      000264                        399 00114$:
                                    400 ;	pdk_uart.c: 122: bits_left_in_tx = TX_NUM_OF_BITS;
      000264 0A 57                  401 	mov	a, #0x0a
      000266 5E 17                  402 	mov	_bits_left_in_tx+0, a
                                    403 ;	pdk_uart.c: 123: TIMER2_ON;
      000268 84 01                  404 	mov	a, __inten
      00026A 40 55                  405 	or	a, #0x40
      00026C 04 01                  406 	mov	__inten, a
                                    407 ;	pdk_uart.c: 124: internal_tx_buffer = (ch << 1) | 0x200;
      00026E 00 26                  408 	clear	p
      000270 61 1F                  409 	mov	a, _UART_putC_PARM_1+0
      000272 6B 00                  410 	sl	a
      000274 00 2D                  411 	slc	p
      000276 EC 17                  412 	mov	_UART_putC_sloc0_1_0+0, a
      000278 00 1F                  413 	mov	a, p
      00027A 02 55                  414 	or	a, #0x02
      00027C ED 17                  415 	mov	_UART_putC_sloc0_1_0+1, a
      00027E EC 1F                  416 	mov	a, _UART_putC_sloc0_1_0+0
      000280 5F 17                  417 	mov	_internal_tx_buffer+0, a
      000282 ED 1F                  418 	mov	a, _UART_putC_sloc0_1_0+1
      000284 60 17                  419 	mov	_internal_tx_buffer+1, a
                                    420 ;	pdk_uart.c: 125: flag_tx_busy = SU_TRUE;
      000286 01 57                  421 	mov	a, #0x01
      000288 5D 17                  422 	mov	_flag_tx_busy+0, a
                                    423 ;	pdk_uart.c: 126: }
      00028A 7A 00                  424 	ret
                                    425 ;	pdk_uart.c: 128: void UART_print(char *str)
                                    426 ;	-----------------------------------------
                                    427 ;	 function UART_print
                                    428 ;	-----------------------------------------
      00028C                        429 _UART_print:
                                    430 ;	pdk_uart.c: 131: while (str[i] != '\0')
      00028C 64 26                  431 	clear	_UART_print_sloc1_1_0+0
      00028E 65 26                  432 	clear	_UART_print_sloc1_1_0+1
      000290                        433 00101$:
      000290 62 1F                  434 	mov	a, _UART_print_PARM_1+0
      000292 64 18                  435 	add	a, _UART_print_sloc1_1_0+0
      000294 00 17                  436 	mov	p, a
      000296 63 1F                  437 	mov	a, _UART_print_PARM_1+1
      000298 65 1A                  438 	addc	a, _UART_print_sloc1_1_0+1
      00029A 19 75                  439 	call	__gptrget
      00029C 00 53                  440 	cneqsn	a, #0x00
      00029E 5B 61                  441 	goto	00104$
                                    442 ;	pdk_uart.c: 132: UART_putC(str[i++]);
      0002A0 62 1F                  443 	mov	a, _UART_print_PARM_1+0
      0002A2 64 18                  444 	add	a, _UART_print_sloc1_1_0+0
      0002A4 00 17                  445 	mov	p, a
      0002A6 63 1F                  446 	mov	a, _UART_print_PARM_1+1
      0002A8 65 1A                  447 	addc	a, _UART_print_sloc1_1_0+1
      0002AA 64 24                  448 	inc	_UART_print_sloc1_1_0+0
      0002AC 65 20                  449 	addc	_UART_print_sloc1_1_0+1
      0002AE 19 75                  450 	call	__gptrget
      0002B0 61 17                  451 	mov	_UART_putC_PARM_1+0, a
      0002B2 2F 71                  452 	call	_UART_putC
      0002B4 48 61                  453 	goto	00101$
      0002B6                        454 00104$:
                                    455 ;	pdk_uart.c: 133: }
      0002B6 7A 00                  456 	ret
                                    457 ;	pdk_uart.c: 135: void UART_printNum(int num)
                                    458 ;	-----------------------------------------
                                    459 ;	 function UART_printNum
                                    460 ;	-----------------------------------------
      0002B8                        461 _UART_printNum:
                                    462 ;	pdk_uart.c: 138: if (num > 999)
      0002B8 E7 57                  463 	mov	a, #0xe7
      0002BA 66 19                  464 	sub	a, _UART_printNum_PARM_1+0
      0002BC 03 57                  465 	mov	a, #0x03
      0002BE 67 1B                  466 	subc	a, _UART_printNum_PARM_1+1
      0002C0 80 31                  467 	t0sn	f, ov
      0002C2 80 56                  468 	xor	a, #0x80
      0002C4 6B 00                  469 	sl	a
      0002C6 80 34                  470 	t1sn	f, c
      0002C8 9E 61                  471 	goto	00108$
                                    472 ;	pdk_uart.c: 140: dis[0] = num / 1000 + 48;
      0002CA 66 1F                  473 	mov	a, _UART_printNum_PARM_1+0
      0002CC DE 17                  474 	mov	__divsint_PARM_1+0, a
      0002CE 67 1F                  475 	mov	a, _UART_printNum_PARM_1+1
      0002D0 DF 17                  476 	mov	__divsint_PARM_1+1, a
      0002D2 E8 57                  477 	mov	a, #0xe8
      0002D4 E0 17                  478 	mov	__divsint_PARM_2+0, a
      0002D6 03 57                  479 	mov	a, #0x03
      0002D8 E1 17                  480 	mov	__divsint_PARM_2+1, a
      0002DA B6 74                  481 	call	__divsint
      0002DC 30 50                  482 	add	a, #0x30
      0002DE 68 17                  483 	mov	_UART_printNum_dis_65536_53+0, a
                                    484 ;	pdk_uart.c: 141: dis[1] = (num / 100) % 10 + 48;
      0002E0 66 1F                  485 	mov	a, _UART_printNum_PARM_1+0
      0002E2 DE 17                  486 	mov	__divsint_PARM_1+0, a
      0002E4 67 1F                  487 	mov	a, _UART_printNum_PARM_1+1
      0002E6 DF 17                  488 	mov	__divsint_PARM_1+1, a
      0002E8 64 57                  489 	mov	a, #0x64
      0002EA E0 17                  490 	mov	__divsint_PARM_2+0, a
      0002EC E1 26                  491 	clear	__divsint_PARM_2+1
      0002EE B6 74                  492 	call	__divsint
      0002F0 D1 17                  493 	mov	__modsint_PARM_1+0, a
      0002F2 00 1F                  494 	mov	a, p
      0002F4 D2 17                  495 	mov	__modsint_PARM_1+1, a
      0002F6 0A 57                  496 	mov	a, #0x0a
      0002F8 D3 17                  497 	mov	__modsint_PARM_2+0, a
      0002FA D4 26                  498 	clear	__modsint_PARM_2+1
      0002FC 4F 74                  499 	call	__modsint
      0002FE 30 50                  500 	add	a, #0x30
      000300 69 17                  501 	mov	_UART_printNum_dis_65536_53+1, a
                                    502 ;	pdk_uart.c: 142: dis[2] = (num / 10) % 10 + 48;
      000302 66 1F                  503 	mov	a, _UART_printNum_PARM_1+0
      000304 DE 17                  504 	mov	__divsint_PARM_1+0, a
      000306 67 1F                  505 	mov	a, _UART_printNum_PARM_1+1
      000308 DF 17                  506 	mov	__divsint_PARM_1+1, a
      00030A 0A 57                  507 	mov	a, #0x0a
      00030C E0 17                  508 	mov	__divsint_PARM_2+0, a
      00030E E1 26                  509 	clear	__divsint_PARM_2+1
      000310 B6 74                  510 	call	__divsint
      000312 D1 17                  511 	mov	__modsint_PARM_1+0, a
      000314 00 1F                  512 	mov	a, p
      000316 D2 17                  513 	mov	__modsint_PARM_1+1, a
      000318 0A 57                  514 	mov	a, #0x0a
      00031A D3 17                  515 	mov	__modsint_PARM_2+0, a
      00031C D4 26                  516 	clear	__modsint_PARM_2+1
      00031E 4F 74                  517 	call	__modsint
      000320 30 50                  518 	add	a, #0x30
      000322 6A 17                  519 	mov	_UART_printNum_dis_65536_53+2, a
                                    520 ;	pdk_uart.c: 143: dis[3] = num % 10 + 48;
      000324 66 1F                  521 	mov	a, _UART_printNum_PARM_1+0
      000326 D1 17                  522 	mov	__modsint_PARM_1+0, a
      000328 67 1F                  523 	mov	a, _UART_printNum_PARM_1+1
      00032A D2 17                  524 	mov	__modsint_PARM_1+1, a
      00032C 0A 57                  525 	mov	a, #0x0a
      00032E D3 17                  526 	mov	__modsint_PARM_2+0, a
      000330 D4 26                  527 	clear	__modsint_PARM_2+1
      000332 4F 74                  528 	call	__modsint
      000334 30 50                  529 	add	a, #0x30
      000336 6B 17                  530 	mov	_UART_printNum_dis_65536_53+3, a
                                    531 ;	pdk_uart.c: 144: dis[4] = '\0';
      000338 6C 26                  532 	clear	_UART_printNum_dis_65536_53+4
      00033A F1 61                  533 	goto	00109$
      00033C                        534 00108$:
                                    535 ;	pdk_uart.c: 146: else if (num > 99)
      00033C 63 57                  536 	mov	a, #0x63
      00033E 66 19                  537 	sub	a, _UART_printNum_PARM_1+0
      000340 00 57                  538 	mov	a, #0x00
      000342 67 1B                  539 	subc	a, _UART_printNum_PARM_1+1
      000344 80 31                  540 	t0sn	f, ov
      000346 80 56                  541 	xor	a, #0x80
      000348 6B 00                  542 	sl	a
      00034A 80 34                  543 	t1sn	f, c
      00034C CE 61                  544 	goto	00105$
                                    545 ;	pdk_uart.c: 148: dis[0] = num / 100 + 48;
      00034E 66 1F                  546 	mov	a, _UART_printNum_PARM_1+0
      000350 DE 17                  547 	mov	__divsint_PARM_1+0, a
      000352 67 1F                  548 	mov	a, _UART_printNum_PARM_1+1
      000354 DF 17                  549 	mov	__divsint_PARM_1+1, a
      000356 64 57                  550 	mov	a, #0x64
      000358 E0 17                  551 	mov	__divsint_PARM_2+0, a
      00035A E1 26                  552 	clear	__divsint_PARM_2+1
      00035C B6 74                  553 	call	__divsint
      00035E 30 50                  554 	add	a, #0x30
      000360 68 17                  555 	mov	_UART_printNum_dis_65536_53+0, a
                                    556 ;	pdk_uart.c: 149: dis[1] = (num / 10) % 10 + 48;
      000362 66 1F                  557 	mov	a, _UART_printNum_PARM_1+0
      000364 DE 17                  558 	mov	__divsint_PARM_1+0, a
      000366 67 1F                  559 	mov	a, _UART_printNum_PARM_1+1
      000368 DF 17                  560 	mov	__divsint_PARM_1+1, a
      00036A 0A 57                  561 	mov	a, #0x0a
      00036C E0 17                  562 	mov	__divsint_PARM_2+0, a
      00036E E1 26                  563 	clear	__divsint_PARM_2+1
      000370 B6 74                  564 	call	__divsint
      000372 D1 17                  565 	mov	__modsint_PARM_1+0, a
      000374 00 1F                  566 	mov	a, p
      000376 D2 17                  567 	mov	__modsint_PARM_1+1, a
      000378 0A 57                  568 	mov	a, #0x0a
      00037A D3 17                  569 	mov	__modsint_PARM_2+0, a
      00037C D4 26                  570 	clear	__modsint_PARM_2+1
      00037E 4F 74                  571 	call	__modsint
      000380 30 50                  572 	add	a, #0x30
      000382 69 17                  573 	mov	_UART_printNum_dis_65536_53+1, a
                                    574 ;	pdk_uart.c: 150: dis[2] = num % 10 + 48;
      000384 66 1F                  575 	mov	a, _UART_printNum_PARM_1+0
      000386 D1 17                  576 	mov	__modsint_PARM_1+0, a
      000388 67 1F                  577 	mov	a, _UART_printNum_PARM_1+1
      00038A D2 17                  578 	mov	__modsint_PARM_1+1, a
      00038C 0A 57                  579 	mov	a, #0x0a
      00038E D3 17                  580 	mov	__modsint_PARM_2+0, a
      000390 D4 26                  581 	clear	__modsint_PARM_2+1
      000392 4F 74                  582 	call	__modsint
      000394 30 50                  583 	add	a, #0x30
      000396 6A 17                  584 	mov	_UART_printNum_dis_65536_53+2, a
                                    585 ;	pdk_uart.c: 151: dis[3] = '\0';
      000398 6B 26                  586 	clear	_UART_printNum_dis_65536_53+3
      00039A F1 61                  587 	goto	00109$
      00039C                        588 00105$:
                                    589 ;	pdk_uart.c: 153: else if (num > 9)
      00039C 09 57                  590 	mov	a, #0x09
      00039E 66 19                  591 	sub	a, _UART_printNum_PARM_1+0
      0003A0 00 57                  592 	mov	a, #0x00
      0003A2 67 1B                  593 	subc	a, _UART_printNum_PARM_1+1
      0003A4 80 31                  594 	t0sn	f, ov
      0003A6 80 56                  595 	xor	a, #0x80
      0003A8 6B 00                  596 	sl	a
      0003AA 80 34                  597 	t1sn	f, c
      0003AC ED 61                  598 	goto	00102$
                                    599 ;	pdk_uart.c: 155: dis[0] = num / 10 + 48;
      0003AE 66 1F                  600 	mov	a, _UART_printNum_PARM_1+0
      0003B0 DE 17                  601 	mov	__divsint_PARM_1+0, a
      0003B2 67 1F                  602 	mov	a, _UART_printNum_PARM_1+1
      0003B4 DF 17                  603 	mov	__divsint_PARM_1+1, a
      0003B6 0A 57                  604 	mov	a, #0x0a
      0003B8 E0 17                  605 	mov	__divsint_PARM_2+0, a
      0003BA E1 26                  606 	clear	__divsint_PARM_2+1
      0003BC B6 74                  607 	call	__divsint
      0003BE 30 50                  608 	add	a, #0x30
      0003C0 68 17                  609 	mov	_UART_printNum_dis_65536_53+0, a
                                    610 ;	pdk_uart.c: 156: dis[1] = num % 10 + 48;
      0003C2 66 1F                  611 	mov	a, _UART_printNum_PARM_1+0
      0003C4 D1 17                  612 	mov	__modsint_PARM_1+0, a
      0003C6 67 1F                  613 	mov	a, _UART_printNum_PARM_1+1
      0003C8 D2 17                  614 	mov	__modsint_PARM_1+1, a
      0003CA 0A 57                  615 	mov	a, #0x0a
      0003CC D3 17                  616 	mov	__modsint_PARM_2+0, a
      0003CE D4 26                  617 	clear	__modsint_PARM_2+1
      0003D0 4F 74                  618 	call	__modsint
      0003D2 30 50                  619 	add	a, #0x30
      0003D4 69 17                  620 	mov	_UART_printNum_dis_65536_53+1, a
                                    621 ;	pdk_uart.c: 157: dis[2] = '\0';
      0003D6 6A 26                  622 	clear	_UART_printNum_dis_65536_53+2
      0003D8 F1 61                  623 	goto	00109$
      0003DA                        624 00102$:
                                    625 ;	pdk_uart.c: 161: dis[0] = num + 48;
      0003DA 66 1F                  626 	mov	a, _UART_printNum_PARM_1+0
      0003DC 30 50                  627 	add	a, #0x30
      0003DE 68 17                  628 	mov	_UART_printNum_dis_65536_53+0, a
                                    629 ;	pdk_uart.c: 162: dis[1] = '\0';
      0003E0 69 26                  630 	clear	_UART_printNum_dis_65536_53+1
      0003E2                        631 00109$:
                                    632 ;	pdk_uart.c: 164: UART_print(dis);
      0003E2 68 57                  633 	mov	a, #(_UART_printNum_dis_65536_53 + 0)
      0003E4 62 17                  634 	mov	_UART_print_PARM_1+0, a
      0003E6 63 26                  635 	clear	_UART_print_PARM_1+1
      0003E8 46 61                  636 	goto	_UART_print
                                    637 ;	pdk_uart.c: 165: }
      0003EA 7A 00                  638 	ret
                                    639 ;	pdk_uart.c: 168: void TIM2_interrupt(void)
                                    640 ;	-----------------------------------------
                                    641 ;	 function TIM2_interrupt
                                    642 ;	-----------------------------------------
      0003EC                        643 _TIM2_interrupt:
                                    644 ;	pdk_uart.c: 177: if (flag_tx_busy == SU_TRUE)
      0003EC 5D 1F                  645 	mov	a, _flag_tx_busy+0
      0003EE 01 52                  646 	ceqsn	a, #0x01
      0003F0 0E 62                  647 	goto	00107$
                                    648 ;	pdk_uart.c: 179: if (internal_tx_buffer & 0x01)
      0003F2 60 1F                  649 	mov	a, _internal_tx_buffer+1
      0003F4 00 17                  650 	mov	p, a
      0003F6 5F 1F                  651 	mov	a, _internal_tx_buffer+0
      0003F8 01 54                  652 	and	a, #0x01
      0003FA 00 53                  653 	cneqsn	a, #0x00
      0003FC 01 62                  654 	goto	00102$
                                    655 ;	pdk_uart.c: 181: setb(UART_Px, UART_TX);
      0003FE 90 3D                  656 	set1	__pa, #3
      000400 02 62                  657 	goto	00103$
      000402                        658 00102$:
                                    659 ;	pdk_uart.c: 185: clrb(UART_Px, UART_TX);
      000402 90 39                  660 	set0	__pa, #3
      000404                        661 00103$:
                                    662 ;	pdk_uart.c: 187: internal_tx_buffer >>= 1;
      000404 60 2A                  663 	sr	_internal_tx_buffer+1
      000406 5F 2C                  664 	src	_internal_tx_buffer+0
                                    665 ;	pdk_uart.c: 188: if (--bits_left_in_tx == 0)
      000408 5E 1F                  666 	mov	a, _bits_left_in_tx+0
      00040A 01 51                  667 	sub	a, #0x01
      00040C 5E 17                  668 	mov	_bits_left_in_tx+0, a
      00040E 00 52                  669 	ceqsn	a, #0x00
      000410 0E 62                  670 	goto	00107$
                                    671 ;	pdk_uart.c: 190: flag_tx_busy = SU_FALSE;
      000412 5D 26                  672 	clear	_flag_tx_busy+0
                                    673 ;	pdk_uart.c: 191: TIMER2_OFF;
      000414 04 3B                  674 	set0	__inten, #6
                                    675 ;	pdk_uart.c: 192: EXTERNAL_ON;
      000416 84 01                  676 	mov	a, __inten
      000418 02 55                  677 	or	a, #0x02
      00041A 04 01                  678 	mov	__inten, a
      00041C                        679 00107$:
                                    680 ;	pdk_uart.c: 197: if (flag_rx_off == SU_FALSE)
      00041C 5B 1F                  681 	mov	a, _flag_rx_off+0
      00041E 00 52                  682 	ceqsn	a, #0x00
      000420 44 62                  683 	goto	00124$
                                    684 ;	pdk_uart.c: 199: if (flag_rx_waiting_for_stop_bit)
      000422 6D 1F                  685 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
      000424 00 53                  686 	cneqsn	a, #0x00
      000426 29 62                  687 	goto	00120$
                                    688 ;	pdk_uart.c: 201: start_bit = 1;
      000428 01 57                  689 	mov	a, #0x01
      00042A 59 17                  690 	mov	_start_bit+0, a
                                    691 ;	pdk_uart.c: 202: EXTERNAL_ON;
      00042C 84 01                  692 	mov	a, __inten
      00042E 02 55                  693 	or	a, #0x02
      000430 04 01                  694 	mov	__inten, a
                                    695 ;	pdk_uart.c: 203: flag_rx_waiting_for_stop_bit = SU_FALSE;
      000432 6D 26                  696 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    697 ;	pdk_uart.c: 204: flag_rx_ready = SU_FALSE;
      000434 5C 26                  698 	clear	_flag_rx_ready+0
                                    699 ;	pdk_uart.c: 205: inbuf[qin] = internal_rx_buffer;
      000436 38 57                  700 	mov	a, #(_inbuf + 0)
      000438 58 18                  701 	add	a, _qin+0
      00043A 00 17                  702 	mov	p, a
      00043C 70 1F                  703 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_59+0
      00043E 00 07                  704 	idxm	p, a
                                    705 ;	pdk_uart.c: 206: if (++qin >= UART_IN_BUF_SIZE)
      000440 58 1F                  706 	mov	a, _qin+0
      000442 01 50                  707 	add	a, #0x01
      000444 58 17                  708 	mov	_qin+0, a
      000446 20 52                  709 	ceqsn	a, #0x20
      000448 00 00                  710 	nop
      00044A 80 30                  711 	t0sn	f, c
      00044C 44 62                  712 	goto	00124$
                                    713 ;	pdk_uart.c: 208: qin = 0; // overflow - reset inbuf-index
      00044E 58 26                  714 	clear	_qin+0
      000450 44 62                  715 	goto	00124$
      000452                        716 00120$:
                                    717 ;	pdk_uart.c: 213: if (flag_rx_ready == SU_FALSE)
      000452 5C 1F                  718 	mov	a, _flag_rx_ready+0
      000454 00 52                  719 	ceqsn	a, #0x00
      000456 37 62                  720 	goto	00117$
                                    721 ;	pdk_uart.c: 215: if (start_bit == 0)
      000458 59 1F                  722 	mov	a, _start_bit+0
      00045A 00 52                  723 	ceqsn	a, #0x00
      00045C 44 62                  724 	goto	00124$
                                    725 ;	pdk_uart.c: 217: flag_rx_ready = SU_TRUE;
      00045E 01 57                  726 	mov	a, #0x01
      000460 5C 17                  727 	mov	_flag_rx_ready+0, a
                                    728 ;	pdk_uart.c: 218: internal_rx_buffer = 0;
      000462 70 26                  729 	clear	_TIM2_interrupt_internal_rx_buffer_65536_59+0
                                    730 ;	pdk_uart.c: 219: bits_left_in_rx = RX_NUM_OF_BITS;
      000464 08 57                  731 	mov	a, #0x08
      000466 6F 17                  732 	mov	_TIM2_interrupt_bits_left_in_rx_65536_59+0, a
                                    733 ;	pdk_uart.c: 220: rx_mask = 1;
      000468 01 57                  734 	mov	a, #0x01
      00046A 6E 17                  735 	mov	_TIM2_interrupt_rx_mask_65536_59+0, a
      00046C 44 62                  736 	goto	00124$
      00046E                        737 00117$:
                                    738 ;	pdk_uart.c: 225: if (inbit(UART_Px, UART_RX))
      00046E 90 01                  739 	mov	a, __pa
      000470 10 54                  740 	and	a, #0x10
      000472 6E 00                  741 	swap	a
      000474 0F 54                  742 	and	a, #0x0f
      000476 00 53                  743 	cneqsn	a, #0x00
      000478 3F 62                  744 	goto	00113$
                                    745 ;	pdk_uart.c: 227: internal_rx_buffer |= rx_mask;
      00047A 6E 1F                  746 	mov	a, _TIM2_interrupt_rx_mask_65536_59+0
      00047C 70 15                  747 	or	_TIM2_interrupt_internal_rx_buffer_65536_59+0, a
      00047E                        748 00113$:
                                    749 ;	pdk_uart.c: 229: rx_mask <<= 1;
      00047E 6E 2B                  750 	sl	_TIM2_interrupt_rx_mask_65536_59+0
                                    751 ;	pdk_uart.c: 230: if (--bits_left_in_rx == 0)
      000480 6F 23                  752 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_59+0
      000482 44 62                  753 	goto	00124$
                                    754 ;	pdk_uart.c: 232: flag_rx_waiting_for_stop_bit = SU_TRUE;
      000484 01 57                  755 	mov	a, #0x01
      000486 6D 17                  756 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0, a
      000488                        757 00124$:
                                    758 ;	pdk_uart.c: 237: }
      000488 7A 00                  759 	ret
                                    760 ;	pdk_uart.c: 240: void PA4_interrupt(void)
                                    761 ;	-----------------------------------------
                                    762 ;	 function PA4_interrupt
                                    763 ;	-----------------------------------------
      00048A                        764 _PA4_interrupt:
                                    765 ;	pdk_uart.c: 242: TM2CT = 25;
      00048A 19 57                  766 	mov	a, #0x19
      00048C 31 01                  767 	mov	__tm2ct, a
                                    768 ;	pdk_uart.c: 243: TIMER2_OFF;
      00048E 04 3B                  769 	set0	__inten, #6
                                    770 ;	pdk_uart.c: 244: EXTERNAL_OFF;
      000490 84 38                  771 	set0	__inten, #1
                                    772 ;	pdk_uart.c: 245: start_bit = 0;
      000492 59 26                  773 	clear	_start_bit+0
                                    774 ;	pdk_uart.c: 247: INTRQ &= ~INTRQ_TM2;
      000494 05 3B                  775 	set0	__intrq, #6
                                    776 ;	pdk_uart.c: 248: TIMER2_ON;
      000496 84 01                  777 	mov	a, __inten
      000498 40 55                  778 	or	a, #0x40
      00049A 04 01                  779 	mov	__inten, a
                                    780 ;	pdk_uart.c: 249: }
      00049C 7A 00                  781 	ret
                                    782 	.area CODE
                                    783 	.area CONST
                                    784 	.area CABS (ABS)
