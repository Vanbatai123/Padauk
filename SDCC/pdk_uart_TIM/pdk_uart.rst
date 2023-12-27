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
                                     72 	.globl _UART_print_PARM_1
                                     73 	.globl _softuart_puts_PARM_1
                                     74 	.globl _UART_putC_PARM_1
                                     75 	.globl _internal_tx_buffer
                                     76 	.globl _bits_left_in_tx
                                     77 	.globl _flag_tx_busy
                                     78 	.globl _flag_rx_ready
                                     79 	.globl _flag_rx_off
                                     80 	.globl _qout
                                     81 	.globl _qin
                                     82 	.globl _TIM2_interrupt
                                     83 	.globl _UART_IO_config
                                     84 	.globl _UART_begin
                                     85 	.globl _UART_rx_on
                                     86 	.globl _softuart_turn_rx_off
                                     87 	.globl _softuart_getchar
                                     88 	.globl _softuart_kbhit
                                     89 	.globl _softuart_flush_input_buffer
                                     90 	.globl _softuart_transmit_busy
                                     91 	.globl _UART_putC
                                     92 	.globl _softuart_puts
                                     93 	.globl _UART_print
                                     94 	.globl _PB5_interrupt
                                     95 ;--------------------------------------------------------
                                     96 ; special function registers
                                     97 ;--------------------------------------------------------
                                     98 	.area RSEG (ABS)
      000002                         99 	.org 0x0000
                           000000   100 __flag	=	0x0000
                           000002   101 __sp	=	0x0002
                           000003   102 __clkmd	=	0x0003
                           000004   103 __inten	=	0x0004
                           000005   104 __intrq	=	0x0005
                           000006   105 __t16m	=	0x0006
                           00000A   106 __eoscr	=	0x000a
                           00000B   107 __ihrcr	=	0x000b
                           00000C   108 __integs	=	0x000c
                           00000D   109 __padier	=	0x000d
                           00000E   110 __pbdier	=	0x000e
                           00000F   111 __pcdier	=	0x000f
                           000010   112 __pa	=	0x0010
                           000011   113 __pac	=	0x0011
                           000012   114 __paph	=	0x0012
                           000013   115 __pb	=	0x0013
                           000014   116 __pbc	=	0x0014
                           000015   117 __pbph	=	0x0015
                           000016   118 __pc	=	0x0016
                           000017   119 __pcc	=	0x0017
                           000018   120 __pcph	=	0x0018
                           000019   121 __pbpl	=	0x0019
                           00001A   122 __pcpl	=	0x001a
                           000020   123 __adcc	=	0x0020
                           000021   124 __adcm	=	0x0021
                           000022   125 __adcr	=	0x0022
                           000024   126 __adcrgc	=	0x0024
                           000026   127 __misc	=	0x0026
                           000027   128 __misc2	=	0x0027
                           000028   129 __misclvr	=	0x0028
                           00002B   130 __gpcc	=	0x002b
                           00002C   131 __gpcs	=	0x002c
                           000030   132 __tm2c	=	0x0030
                           000031   133 __tm2ct	=	0x0031
                           000032   134 __tm2s	=	0x0032
                           000033   135 __tm2b	=	0x0033
                           000034   136 __tm3c	=	0x0034
                           000035   137 __tm3ct	=	0x0035
                           000036   138 __tm3s	=	0x0036
                           000037   139 __tm3b	=	0x0037
                           000040   140 __pwmg0c	=	0x0040
                           000041   141 __pwmgclk	=	0x0041
                           000042   142 __pwmg0dth	=	0x0042
                           000043   143 __pwmg0dtl	=	0x0043
                           000044   144 __pwmgcubh	=	0x0044
                           000045   145 __pwmgcubl	=	0x0045
                           000046   146 __pwmg1c	=	0x0046
                           000048   147 __pwmg1dth	=	0x0048
                           000049   148 __pwmg1dtl	=	0x0049
                           00004C   149 __pwmg2c	=	0x004c
                           00004E   150 __pwmg2dth	=	0x004e
                           00004F   151 __pwmg2dtl	=	0x004f
                           000062   152 __ilrcr	=	0x0062
                           000063   153 __bgtr	=	0x0063
                           000067   154 __rop	=	0x0067
      000002                        155 __t16c::
      000002                        156 	.ds 2
                                    157 ;--------------------------------------------------------
                                    158 ; ram data
                                    159 ;--------------------------------------------------------
                                    160 	.area DATA
      000020                        161 _inbuf:
      000020                        162 	.ds 32
      000040                        163 _qin::
      000040                        164 	.ds 1
      000041                        165 _qout::
      000041                        166 	.ds 1
      000042                        167 _flag_rx_off::
      000042                        168 	.ds 1
      000043                        169 _flag_rx_ready::
      000043                        170 	.ds 1
      000044                        171 _flag_tx_busy::
      000044                        172 	.ds 1
      000045                        173 _bits_left_in_tx::
      000045                        174 	.ds 1
      000046                        175 _internal_tx_buffer::
      000046                        176 	.ds 2
      000048                        177 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_25:
      000048                        178 	.ds 1
      000049                        179 _TIM2_interrupt_rx_mask_65536_25:
      000049                        180 	.ds 1
      00004A                        181 _TIM2_interrupt_bits_left_in_rx_65536_25:
      00004A                        182 	.ds 1
      00004B                        183 _TIM2_interrupt_internal_rx_buffer_65536_25:
      00004B                        184 	.ds 1
      00004C                        185 _UART_putC_PARM_1:
      00004C                        186 	.ds 1
      00004D                        187 _softuart_puts_PARM_1:
      00004D                        188 	.ds 2
      00004F                        189 _softuart_puts_sloc1_1_0:
      00004F                        190 	.ds 2
      000051                        191 _UART_print_PARM_1:
      000051                        192 	.ds 2
      000053                        193 _UART_print_sloc2_1_0:
      000053                        194 	.ds 2
                                    195 ;--------------------------------------------------------
                                    196 ; overlayable items in ram 
                                    197 ;--------------------------------------------------------
                                    198 	.area	OSEG (OVR,DATA)
      000055                        199 _UART_putC_sloc0_1_0:
      000055                        200 	.ds 2
                                    201 ;--------------------------------------------------------
                                    202 ; absolute external ram data
                                    203 ;--------------------------------------------------------
                                    204 	.area DABS (ABS)
                                    205 ;--------------------------------------------------------
                                    206 ; global & static initialisations
                                    207 ;--------------------------------------------------------
                                    208 	.area HOME
                                    209 	.area GSINIT
                                    210 	.area GSFINAL
                                    211 	.area GSINIT
                                    212 ;	pdk_uart.c: 31: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      000040 48 26                  213 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_25+0
                                    214 ;--------------------------------------------------------
                                    215 ; Home
                                    216 ;--------------------------------------------------------
                                    217 	.area HOME
                                    218 	.area HOME
                                    219 ;--------------------------------------------------------
                                    220 ; code
                                    221 ;--------------------------------------------------------
                                    222 	.area CODE
                                    223 ;	pdk_uart.c: 29: void TIM2_interrupt(void)
                                    224 ;	-----------------------------------------
                                    225 ;	 function TIM2_interrupt
                                    226 ;	-----------------------------------------
      000120                        227 _TIM2_interrupt:
                                    228 ;	pdk_uart.c: 40: if (flag_tx_busy == SU_TRUE)
      000120 44 1F                  229 	mov	a, _flag_tx_busy+0
      000122 01 52                  230 	ceqsn	a, #0x01
      000124 A4 60                  231 	goto	00107$
                                    232 ;	pdk_uart.c: 42: if (internal_tx_buffer & 0x01)
      000126 47 1F                  233 	mov	a, _internal_tx_buffer+1
      000128 00 17                  234 	mov	p, a
      00012A 46 1F                  235 	mov	a, _internal_tx_buffer+0
      00012C 01 54                  236 	and	a, #0x01
      00012E 00 53                  237 	cneqsn	a, #0x00
      000130 9B 60                  238 	goto	00102$
                                    239 ;	pdk_uart.c: 44: setb(UART_Px, UART_TX);
      000132 93 3F                  240 	set1	__pb, #7
      000134 9C 60                  241 	goto	00103$
      000136                        242 00102$:
                                    243 ;	pdk_uart.c: 48: clrb(UART_Px, UART_TX);
      000136 93 3B                  244 	set0	__pb, #7
      000138                        245 00103$:
                                    246 ;	pdk_uart.c: 50: internal_tx_buffer >>= 1;
      000138 47 2A                  247 	sr	_internal_tx_buffer+1
      00013A 46 2C                  248 	src	_internal_tx_buffer+0
                                    249 ;	pdk_uart.c: 51: if (--bits_left_in_tx == 0)
      00013C 45 1F                  250 	mov	a, _bits_left_in_tx+0
      00013E 01 51                  251 	sub	a, #0x01
      000140 45 17                  252 	mov	_bits_left_in_tx+0, a
      000142 00 52                  253 	ceqsn	a, #0x00
      000144 A4 60                  254 	goto	00107$
                                    255 ;	pdk_uart.c: 53: flag_tx_busy = SU_FALSE;
      000146 44 26                  256 	clear	_flag_tx_busy+0
      000148                        257 00107$:
                                    258 ;	pdk_uart.c: 58: if (flag_rx_off == SU_FALSE)
      000148 42 1F                  259 	mov	a, _flag_rx_off+0
      00014A 00 52                  260 	ceqsn	a, #0x00
      00014C DA 60                  261 	goto	00124$
                                    262 ;	pdk_uart.c: 60: if (flag_rx_waiting_for_stop_bit)
      00014E 48 1F                  263 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_25+0
      000150 00 53                  264 	cneqsn	a, #0x00
      000152 BA 60                  265 	goto	00120$
                                    266 ;	pdk_uart.c: 62: flag_rx_waiting_for_stop_bit = SU_FALSE;
      000154 48 26                  267 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_25+0
                                    268 ;	pdk_uart.c: 63: flag_rx_ready = SU_FALSE;
      000156 43 26                  269 	clear	_flag_rx_ready+0
                                    270 ;	pdk_uart.c: 64: inbuf[qin] = internal_rx_buffer;
      000158 20 57                  271 	mov	a, #(_inbuf + 0)
      00015A 40 18                  272 	add	a, _qin+0
      00015C 00 17                  273 	mov	p, a
      00015E 4B 1F                  274 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_25+0
      000160 00 07                  275 	idxm	p, a
                                    276 ;	pdk_uart.c: 65: if (++qin >= SOFTUART_IN_BUF_SIZE)
      000162 40 1F                  277 	mov	a, _qin+0
      000164 01 50                  278 	add	a, #0x01
      000166 40 17                  279 	mov	_qin+0, a
      000168 20 52                  280 	ceqsn	a, #0x20
      00016A 00 00                  281 	nop
      00016C 80 30                  282 	t0sn	f, c
      00016E DA 60                  283 	goto	00124$
                                    284 ;	pdk_uart.c: 67: qin = 0; // overflow - reset inbuf-index
      000170 40 26                  285 	clear	_qin+0
      000172 DA 60                  286 	goto	00124$
      000174                        287 00120$:
                                    288 ;	pdk_uart.c: 72: if (flag_rx_ready == SU_FALSE)
      000174 43 1F                  289 	mov	a, _flag_rx_ready+0
      000176 00 52                  290 	ceqsn	a, #0x00
      000178 CC 60                  291 	goto	00117$
                                    292 ;	pdk_uart.c: 74: start_bit = inbit(UART_Px, UART_RX);
      00017A 93 01                  293 	mov	a, __pb
      00017C 20 54                  294 	and	a, #0x20
      00017E 6E 00                  295 	swap	a
      000180 0F 54                  296 	and	a, #0x0f
      000182 6A 00                  297 	sr	a
                                    298 ;	pdk_uart.c: 76: if (start_bit == 0)
      000184 00 52                  299 	ceqsn	a, #0x00
      000186 DA 60                  300 	goto	00124$
                                    301 ;	pdk_uart.c: 78: flag_rx_ready = SU_TRUE;
      000188 01 57                  302 	mov	a, #0x01
      00018A 43 17                  303 	mov	_flag_rx_ready+0, a
                                    304 ;	pdk_uart.c: 79: internal_rx_buffer = 0;
      00018C 4B 26                  305 	clear	_TIM2_interrupt_internal_rx_buffer_65536_25+0
                                    306 ;	pdk_uart.c: 80: bits_left_in_rx = RX_NUM_OF_BITS;
      00018E 08 57                  307 	mov	a, #0x08
      000190 4A 17                  308 	mov	_TIM2_interrupt_bits_left_in_rx_65536_25+0, a
                                    309 ;	pdk_uart.c: 81: rx_mask = 1;
      000192 01 57                  310 	mov	a, #0x01
      000194 49 17                  311 	mov	_TIM2_interrupt_rx_mask_65536_25+0, a
      000196 DA 60                  312 	goto	00124$
      000198                        313 00117$:
                                    314 ;	pdk_uart.c: 86: flag_in = inbit(UART_Px, UART_RX);
      000198 93 01                  315 	mov	a, __pb
      00019A 20 54                  316 	and	a, #0x20
      00019C 6E 00                  317 	swap	a
      00019E 0F 54                  318 	and	a, #0x0f
      0001A0 6A 00                  319 	sr	a
                                    320 ;	pdk_uart.c: 87: if (flag_in)
      0001A2 00 53                  321 	cneqsn	a, #0x00
      0001A4 D5 60                  322 	goto	00113$
                                    323 ;	pdk_uart.c: 89: internal_rx_buffer |= rx_mask;
      0001A6 49 1F                  324 	mov	a, _TIM2_interrupt_rx_mask_65536_25+0
      0001A8 4B 15                  325 	or	_TIM2_interrupt_internal_rx_buffer_65536_25+0, a
      0001AA                        326 00113$:
                                    327 ;	pdk_uart.c: 91: rx_mask <<= 1;
      0001AA 49 2B                  328 	sl	_TIM2_interrupt_rx_mask_65536_25+0
                                    329 ;	pdk_uart.c: 92: if (--bits_left_in_rx == 0)
      0001AC 4A 23                  330 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_25+0
      0001AE DA 60                  331 	goto	00124$
                                    332 ;	pdk_uart.c: 94: flag_rx_waiting_for_stop_bit = SU_TRUE;
      0001B0 01 57                  333 	mov	a, #0x01
      0001B2 48 17                  334 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_25+0, a
      0001B4                        335 00124$:
                                    336 ;	pdk_uart.c: 99: }
      0001B4 7A 00                  337 	ret
                                    338 ;	pdk_uart.c: 101: void UART_IO_config(void)
                                    339 ;	-----------------------------------------
                                    340 ;	 function UART_IO_config
                                    341 ;	-----------------------------------------
      0001B6                        342 _UART_IO_config:
                                    343 ;	pdk_uart.c: 104: setb(UART_PxC, UART_TX);
      0001B6 94 3F                  344 	set1	__pbc, #7
                                    345 ;	pdk_uart.c: 106: setb(UART_PxDIER, UART_RX);
      0001B8 8E 3E                  346 	set1	__pbdier, #5
                                    347 ;	pdk_uart.c: 107: setb(UART_PxPH, UART_RX);
      0001BA 95 3E                  348 	set1	__pbph, #5
                                    349 ;	pdk_uart.c: 108: }
      0001BC 7A 00                  350 	ret
                                    351 ;	pdk_uart.c: 110: static void TIM2_Config(void)
                                    352 ;	-----------------------------------------
                                    353 ;	 function TIM2_Config
                                    354 ;	-----------------------------------------
      0001BE                        355 _TIM2_Config:
                                    356 ;	pdk_uart.c: 113: TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
      0001BE 20 57                  357 	mov	a, #0x20
      0001C0 30 01                  358 	mov	__tm2c, a
                                    359 ;	pdk_uart.c: 114: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      0001C2 0F 57                  360 	mov	a, #0x0f
      0001C4 32 01                  361 	mov	__tm2s, a
                                    362 ;	pdk_uart.c: 115: TM2B = 103;									 // Divide by 69 ~> 115942 Hz (apx. 115200)
      0001C6 67 57                  363 	mov	a, #0x67
      0001C8 33 01                  364 	mov	__tm2b, a
                                    365 ;	pdk_uart.c: 119: INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      0001CA 84 01                  366 	mov	a, __inten
      0001CC 40 55                  367 	or	a, #0x40
      0001CE 04 01                  368 	mov	__inten, a
                                    369 ;	pdk_uart.c: 120: }
      0001D0 7A 00                  370 	ret
                                    371 ;	pdk_uart.c: 122: void UART_begin(void)
                                    372 ;	-----------------------------------------
                                    373 ;	 function UART_begin
                                    374 ;	-----------------------------------------
      0001D2                        375 _UART_begin:
                                    376 ;	pdk_uart.c: 124: flag_tx_busy = SU_FALSE;
      0001D2 44 26                  377 	clear	_flag_tx_busy+0
                                    378 ;	pdk_uart.c: 125: flag_rx_ready = SU_FALSE;
      0001D4 43 26                  379 	clear	_flag_rx_ready+0
                                    380 ;	pdk_uart.c: 126: flag_rx_off = SU_TRUE;
      0001D6 01 57                  381 	mov	a, #0x01
      0001D8 42 17                  382 	mov	_flag_rx_off+0, a
                                    383 ;	pdk_uart.c: 127: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      0001DA 93 3F                  384 	set1	__pb, #7
                                    385 ;	pdk_uart.c: 129: TIM2_Config();
      0001DC DF 70                  386 	call	_TIM2_Config
                                    387 ;	pdk_uart.c: 130: UART_rx_on();
      0001DE F2 60                  388 	goto	_UART_rx_on
                                    389 ;	pdk_uart.c: 131: }
      0001E0 7A 00                  390 	ret
                                    391 ;	pdk_uart.c: 133: static void idle(void)
                                    392 ;	-----------------------------------------
                                    393 ;	 function idle
                                    394 ;	-----------------------------------------
      0001E2                        395 _idle:
                                    396 ;	pdk_uart.c: 138: }
      0001E2 7A 00                  397 	ret
                                    398 ;	pdk_uart.c: 140: void UART_rx_on(void)
                                    399 ;	-----------------------------------------
                                    400 ;	 function UART_rx_on
                                    401 ;	-----------------------------------------
      0001E4                        402 _UART_rx_on:
                                    403 ;	pdk_uart.c: 142: flag_rx_off = SU_FALSE;
      0001E4 42 26                  404 	clear	_flag_rx_off+0
                                    405 ;	pdk_uart.c: 143: }
      0001E6 7A 00                  406 	ret
                                    407 ;	pdk_uart.c: 145: void softuart_turn_rx_off(void)
                                    408 ;	-----------------------------------------
                                    409 ;	 function softuart_turn_rx_off
                                    410 ;	-----------------------------------------
      0001E8                        411 _softuart_turn_rx_off:
                                    412 ;	pdk_uart.c: 147: flag_rx_off = SU_TRUE;
      0001E8 01 57                  413 	mov	a, #0x01
      0001EA 42 17                  414 	mov	_flag_rx_off+0, a
                                    415 ;	pdk_uart.c: 148: }
      0001EC 7A 00                  416 	ret
                                    417 ;	pdk_uart.c: 150: char softuart_getchar(void)
                                    418 ;	-----------------------------------------
                                    419 ;	 function softuart_getchar
                                    420 ;	-----------------------------------------
      0001EE                        421 _softuart_getchar:
                                    422 ;	pdk_uart.c: 154: while (qout == qin)
      0001EE                        423 00101$:
      0001EE 41 1F                  424 	mov	a, _qout+0
      0001F0 40 2E                  425 	ceqsn	a, _qin+0
      0001F2 FC 60                  426 	goto	00103$
                                    427 ;	pdk_uart.c: 156: idle();
      0001F4 F1 70                  428 	call	_idle
      0001F6 F7 60                  429 	goto	00101$
      0001F8                        430 00103$:
                                    431 ;	pdk_uart.c: 158: ch = inbuf[qout];
      0001F8 20 57                  432 	mov	a, #(_inbuf + 0)
      0001FA 41 18                  433 	add	a, _qout+0
      0001FC 00 17                  434 	mov	p, a
      0001FE 01 07                  435 	idxm	a, p
      000200 00 17                  436 	mov	p, a
                                    437 ;	pdk_uart.c: 159: if (++qout >= SOFTUART_IN_BUF_SIZE)
      000202 41 24                  438 	inc	_qout+0
      000204 41 1F                  439 	mov	a, _qout+0
      000206 20 51                  440 	sub	a, #0x20
      000208 80 30                  441 	t0sn	f, c
      00020A 07 61                  442 	goto	00105$
                                    443 ;	pdk_uart.c: 161: qout = 0;
      00020C 41 26                  444 	clear	_qout+0
      00020E                        445 00105$:
                                    446 ;	pdk_uart.c: 164: return (ch);
      00020E 00 1F                  447 	mov	a, p
                                    448 ;	pdk_uart.c: 165: }
      000210 7A 00                  449 	ret
                                    450 ;	pdk_uart.c: 167: uint8_t softuart_kbhit(void)
                                    451 ;	-----------------------------------------
                                    452 ;	 function softuart_kbhit
                                    453 ;	-----------------------------------------
      000212                        454 _softuart_kbhit:
                                    455 ;	pdk_uart.c: 169: return (qin != qout);// 0 neu giong 1 neu khac
      000212 40 1F                  456 	mov	a, _qin+0
      000214 41 2E                  457 	ceqsn	a, _qout+0
      000216 0E 61                  458 	goto	00103$
      000218 01 57                  459 	mov	a, #0x01
      00021A 0F 61                  460 	goto	00104$
      00021C                        461 00103$:
      00021C 00 57                  462 	mov	a, #0x00
      00021E                        463 00104$:
      00021E 01 56                  464 	xor	a, #0x01
                                    465 ;	pdk_uart.c: 170: }
      000220 7A 00                  466 	ret
                                    467 ;	pdk_uart.c: 172: void softuart_flush_input_buffer(void)
                                    468 ;	-----------------------------------------
                                    469 ;	 function softuart_flush_input_buffer
                                    470 ;	-----------------------------------------
      000222                        471 _softuart_flush_input_buffer:
                                    472 ;	pdk_uart.c: 174: qin = 0;
      000222 40 26                  473 	clear	_qin+0
                                    474 ;	pdk_uart.c: 175: qout = 0;
      000224 41 26                  475 	clear	_qout+0
                                    476 ;	pdk_uart.c: 176: }
      000226 7A 00                  477 	ret
                                    478 ;	pdk_uart.c: 178: uint8_t softuart_transmit_busy(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function softuart_transmit_busy
                                    481 ;	-----------------------------------------
      000228                        482 _softuart_transmit_busy:
                                    483 ;	pdk_uart.c: 180: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      000228 44 1F                  484 	mov	a, _flag_tx_busy+0
      00022A 01 52                  485 	ceqsn	a, #0x01
      00022C 1A 61                  486 	goto	00103$
      00022E 01 57                  487 	mov	a, #0x01
      000230 00 26                  488 	clear	p
      000232 1B 61                  489 	goto	00104$
      000234                        490 00103$:
      000234 00 57                  491 	mov	a, #0x00
      000236                        492 00104$:
                                    493 ;	pdk_uart.c: 181: }
      000236 7A 00                  494 	ret
                                    495 ;	pdk_uart.c: 183: void UART_putC(const char ch)
                                    496 ;	-----------------------------------------
                                    497 ;	 function UART_putC
                                    498 ;	-----------------------------------------
      000238                        499 _UART_putC:
                                    500 ;	pdk_uart.c: 185: while (flag_tx_busy == SU_TRUE)
      000238                        501 00101$:
      000238 44 1F                  502 	mov	a, _flag_tx_busy+0
      00023A 01 53                  503 	cneqsn	a, #0x01
      00023C 1C 61                  504 	goto	00101$
      00023E                        505 00114$:
                                    506 ;	pdk_uart.c: 192: bits_left_in_tx = TX_NUM_OF_BITS;
      00023E 0A 57                  507 	mov	a, #0x0a
      000240 45 17                  508 	mov	_bits_left_in_tx+0, a
                                    509 ;	pdk_uart.c: 193: internal_tx_buffer = (ch << 1) | 0x200;
      000242 00 26                  510 	clear	p
      000244 4C 1F                  511 	mov	a, _UART_putC_PARM_1+0
      000246 6B 00                  512 	sl	a
      000248 00 2D                  513 	slc	p
      00024A 55 17                  514 	mov	_UART_putC_sloc0_1_0+0, a
      00024C 00 1F                  515 	mov	a, p
      00024E 02 55                  516 	or	a, #0x02
      000250 56 17                  517 	mov	_UART_putC_sloc0_1_0+1, a
      000252 55 1F                  518 	mov	a, _UART_putC_sloc0_1_0+0
      000254 46 17                  519 	mov	_internal_tx_buffer+0, a
      000256 56 1F                  520 	mov	a, _UART_putC_sloc0_1_0+1
      000258 47 17                  521 	mov	_internal_tx_buffer+1, a
                                    522 ;	pdk_uart.c: 194: flag_tx_busy = SU_TRUE;
      00025A 01 57                  523 	mov	a, #0x01
      00025C 44 17                  524 	mov	_flag_tx_busy+0, a
                                    525 ;	pdk_uart.c: 195: }
      00025E 7A 00                  526 	ret
                                    527 ;	pdk_uart.c: 197: void softuart_puts(const char *s)
                                    528 ;	-----------------------------------------
                                    529 ;	 function softuart_puts
                                    530 ;	-----------------------------------------
      000260                        531 _softuart_puts:
                                    532 ;	pdk_uart.c: 199: while (*s)
      000260 4D 1F                  533 	mov	a, _softuart_puts_PARM_1+0
      000262 4F 17                  534 	mov	_softuart_puts_sloc1_1_0+0, a
      000264 4E 1F                  535 	mov	a, _softuart_puts_PARM_1+1
      000266 50 17                  536 	mov	_softuart_puts_sloc1_1_0+1, a
      000268                        537 00101$:
      000268 4F 1F                  538 	mov	a, _softuart_puts_sloc1_1_0+0
      00026A 00 17                  539 	mov	p, a
      00026C 50 1F                  540 	mov	a, _softuart_puts_sloc1_1_0+1
      00026E 57 71                  541 	call	__gptrget
      000270 00 53                  542 	cneqsn	a, #0x00
      000272 3F 61                  543 	goto	00104$
                                    544 ;	pdk_uart.c: 201: UART_putC(*s++);
      000274 4C 17                  545 	mov	_UART_putC_PARM_1+0, a
      000276 4F 24                  546 	inc	_softuart_puts_sloc1_1_0+0
      000278 50 20                  547 	addc	_softuart_puts_sloc1_1_0+1
      00027A 1C 71                  548 	call	_UART_putC
      00027C 34 61                  549 	goto	00101$
      00027E                        550 00104$:
                                    551 ;	pdk_uart.c: 203: }
      00027E 7A 00                  552 	ret
                                    553 ;	pdk_uart.c: 205: void UART_print(char* str)
                                    554 ;	-----------------------------------------
                                    555 ;	 function UART_print
                                    556 ;	-----------------------------------------
      000280                        557 _UART_print:
                                    558 ;	pdk_uart.c: 208: while(str[i]!='\0')
      000280 53 26                  559 	clear	_UART_print_sloc2_1_0+0
      000282 54 26                  560 	clear	_UART_print_sloc2_1_0+1
      000284                        561 00101$:
      000284 51 1F                  562 	mov	a, _UART_print_PARM_1+0
      000286 53 18                  563 	add	a, _UART_print_sloc2_1_0+0
      000288 00 17                  564 	mov	p, a
      00028A 52 1F                  565 	mov	a, _UART_print_PARM_1+1
      00028C 54 1A                  566 	addc	a, _UART_print_sloc2_1_0+1
      00028E 57 71                  567 	call	__gptrget
      000290 00 53                  568 	cneqsn	a, #0x00
      000292 55 61                  569 	goto	00104$
                                    570 ;	pdk_uart.c: 209: UART_putC(str[i++]);
      000294 51 1F                  571 	mov	a, _UART_print_PARM_1+0
      000296 53 18                  572 	add	a, _UART_print_sloc2_1_0+0
      000298 00 17                  573 	mov	p, a
      00029A 52 1F                  574 	mov	a, _UART_print_PARM_1+1
      00029C 54 1A                  575 	addc	a, _UART_print_sloc2_1_0+1
      00029E 53 24                  576 	inc	_UART_print_sloc2_1_0+0
      0002A0 54 20                  577 	addc	_UART_print_sloc2_1_0+1
      0002A2 57 71                  578 	call	__gptrget
      0002A4 4C 17                  579 	mov	_UART_putC_PARM_1+0, a
      0002A6 1C 71                  580 	call	_UART_putC
      0002A8 42 61                  581 	goto	00101$
      0002AA                        582 00104$:
                                    583 ;	pdk_uart.c: 210: }
      0002AA 7A 00                  584 	ret
                                    585 ;	pdk_uart.c: 213: void PB5_interrupt(void)
                                    586 ;	-----------------------------------------
                                    587 ;	 function PB5_interrupt
                                    588 ;	-----------------------------------------
      0002AC                        589 _PB5_interrupt:
                                    590 ;	pdk_uart.c: 216: }
      0002AC 7A 00                  591 	ret
                                    592 	.area CODE
                                    593 	.area CONST
                                    594 	.area CABS (ABS)
