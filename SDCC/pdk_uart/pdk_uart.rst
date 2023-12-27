                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
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
                                     16 	.globl _UART_rx_off
                                     17 	.globl __t16c
                                     18 	.globl __rop
                                     19 	.globl __bgtr
                                     20 	.globl __ilrcr
                                     21 	.globl __pwmg2dtl
                                     22 	.globl __pwmg2dth
                                     23 	.globl __pwmg2c
                                     24 	.globl __pwmg1dtl
                                     25 	.globl __pwmg1dth
                                     26 	.globl __pwmg1c
                                     27 	.globl __pwmgcubl
                                     28 	.globl __pwmgcubh
                                     29 	.globl __pwmg0dtl
                                     30 	.globl __pwmg0dth
                                     31 	.globl __pwmgclk
                                     32 	.globl __pwmg0c
                                     33 	.globl __tm3b
                                     34 	.globl __tm3s
                                     35 	.globl __tm3ct
                                     36 	.globl __tm3c
                                     37 	.globl __tm2b
                                     38 	.globl __tm2s
                                     39 	.globl __tm2ct
                                     40 	.globl __tm2c
                                     41 	.globl __gpcs
                                     42 	.globl __gpcc
                                     43 	.globl __misclvr
                                     44 	.globl __misc2
                                     45 	.globl __misc
                                     46 	.globl __adcrgc
                                     47 	.globl __adcr
                                     48 	.globl __adcm
                                     49 	.globl __adcc
                                     50 	.globl __pcpl
                                     51 	.globl __pbpl
                                     52 	.globl __pcph
                                     53 	.globl __pcc
                                     54 	.globl __pc
                                     55 	.globl __pbph
                                     56 	.globl __pbc
                                     57 	.globl __pb
                                     58 	.globl __paph
                                     59 	.globl __pac
                                     60 	.globl __pa
                                     61 	.globl __pcdier
                                     62 	.globl __pbdier
                                     63 	.globl __padier
                                     64 	.globl __integs
                                     65 	.globl __ihrcr
                                     66 	.globl __eoscr
                                     67 	.globl __t16m
                                     68 	.globl __intrq
                                     69 	.globl __inten
                                     70 	.globl __clkmd
                                     71 	.globl __sp
                                     72 	.globl __flag
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
                                     86 	.globl _UART_getchar
                                     87 	.globl _UART_kbhit
                                     88 	.globl _UART_flush_input_buffer
                                     89 	.globl _UART_transmit_busy
                                     90 	.globl _UART_putC
                                     91 	.globl _UART_print
                                     92 	.globl _TIM2_interrupt
                                     93 	.globl _PB5_interrupt
                                     94 ;--------------------------------------------------------
                                     95 ; special function registers
                                     96 ;--------------------------------------------------------
                                     97 	.area RSEG (ABS)
      000002                         98 	.org 0x0000
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
      000002                        154 __t16c::
      000002                        155 	.ds 2
                                    156 ;--------------------------------------------------------
                                    157 ; ram data
                                    158 ;--------------------------------------------------------
                                    159 	.area DATA
      000019                        160 _inbuf:
      000019                        161 	.ds 32
      000039                        162 _qin::
      000039                        163 	.ds 1
      00003A                        164 _start_bit::
      00003A                        165 	.ds 1
      00003B                        166 _qout::
      00003B                        167 	.ds 1
      00003C                        168 _flag_rx_off::
      00003C                        169 	.ds 1
      00003D                        170 _flag_rx_ready::
      00003D                        171 	.ds 1
      00003E                        172 _flag_tx_busy::
      00003E                        173 	.ds 1
      00003F                        174 _bits_left_in_tx::
      00003F                        175 	.ds 1
      000040                        176 _internal_tx_buffer::
      000040                        177 	.ds 2
      000042                        178 _UART_putC_PARM_1:
      000042                        179 	.ds 1
      000043                        180 _UART_print_PARM_1:
      000043                        181 	.ds 2
      000045                        182 _UART_print_sloc0_1_0:
      000045                        183 	.ds 2
      000047                        184 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_52:
      000047                        185 	.ds 1
      000048                        186 _TIM2_interrupt_rx_mask_65536_52:
      000048                        187 	.ds 1
      000049                        188 _TIM2_interrupt_bits_left_in_rx_65536_52:
      000049                        189 	.ds 1
      00004A                        190 _TIM2_interrupt_internal_rx_buffer_65536_52:
      00004A                        191 	.ds 1
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
                                    206 ;	pdk_uart.c: 141: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      000040 47 26                  207 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_52+0
                                    208 ;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
      000042 01 57                  209 	mov	a, #0x01
      000044 3A 17                  210 	mov	_start_bit+0, a
                                    211 ;--------------------------------------------------------
                                    212 ; Home
                                    213 ;--------------------------------------------------------
                                    214 	.area HOME
                                    215 	.area HOME
                                    216 ;--------------------------------------------------------
                                    217 ; code
                                    218 ;--------------------------------------------------------
                                    219 	.area CODE
                                    220 ;	pdk_uart.c: 35: void UART_IO_config(void)
                                    221 ;	-----------------------------------------
                                    222 ;	 function UART_IO_config
                                    223 ;	-----------------------------------------
      0000A6                        224 _UART_IO_config:
                                    225 ;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PB5;
      0000A6 02 57                  226 	mov	a, #0x02
      0000A8 67 01                  227 	mov.io	__rop, a
                                    228 ;	pdk_uart.c: 40: setb(UART_PxC, UART_TX);
      0000AA 94 3F                  229 	set1.io	__pbc, #7
                                    230 ;	pdk_uart.c: 42: setb(UART_PxDIER, UART_RX);
      0000AC 8E 3E                  231 	set1.io	__pbdier, #5
                                    232 ;	pdk_uart.c: 43: setb(UART_PxPH, UART_RX);
      0000AE 95 3E                  233 	set1.io	__pbph, #5
                                    234 ;	pdk_uart.c: 44: }
      0000B0 7A 00                  235 	ret
                                    236 ;	pdk_uart.c: 46: static void TIM2_Config(void)
                                    237 ;	-----------------------------------------
                                    238 ;	 function TIM2_Config
                                    239 ;	-----------------------------------------
      0000B2                        240 _TIM2_Config:
                                    241 ;	pdk_uart.c: 49: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      0000B2 20 57                  242 	mov	a, #0x20
      0000B4 30 01                  243 	mov.io	__tm2c, a
                                    244 ;	pdk_uart.c: 50: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      0000B6 0F 57                  245 	mov	a, #0x0f
      0000B8 32 01                  246 	mov.io	__tm2s, a
                                    247 ;	pdk_uart.c: 51: TM2B = 103;									  // Divide by 69 ~> 115942 Hz (apx. 115200)
      0000BA 67 57                  248 	mov	a, #0x67
      0000BC 33 01                  249 	mov.io	__tm2b, a
                                    250 ;	pdk_uart.c: 56: }
      0000BE 7A 00                  251 	ret
                                    252 ;	pdk_uart.c: 58: void UART_begin(void)
                                    253 ;	-----------------------------------------
                                    254 ;	 function UART_begin
                                    255 ;	-----------------------------------------
      0000C0                        256 _UART_begin:
                                    257 ;	pdk_uart.c: 60: flag_tx_busy = SU_FALSE;
      0000C0 3E 26                  258 	clear	_flag_tx_busy+0
                                    259 ;	pdk_uart.c: 61: flag_rx_ready = SU_FALSE;
      0000C2 3D 26                  260 	clear	_flag_rx_ready+0
                                    261 ;	pdk_uart.c: 62: flag_rx_off = SU_TRUE;
      0000C4 01 57                  262 	mov	a, #0x01
      0000C6 3C 17                  263 	mov	_flag_rx_off+0, a
                                    264 ;	pdk_uart.c: 63: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      0000C8 93 3F                  265 	set1.io	__pb, #7
                                    266 ;	pdk_uart.c: 65: TIM2_Config();
      0000CA 59 70                  267 	call	_TIM2_Config
                                    268 ;	pdk_uart.c: 66: UART_rx_on();
      0000CC 69 60                  269 	goto	_UART_rx_on
                                    270 ;	pdk_uart.c: 67: }
      0000CE 7A 00                  271 	ret
                                    272 ;	pdk_uart.c: 69: static void idle(void)
                                    273 ;	-----------------------------------------
                                    274 ;	 function idle
                                    275 ;	-----------------------------------------
      0000D0                        276 _idle:
                                    277 ;	pdk_uart.c: 74: }
      0000D0 7A 00                  278 	ret
                                    279 ;	pdk_uart.c: 76: void UART_rx_on(void)
                                    280 ;	-----------------------------------------
                                    281 ;	 function UART_rx_on
                                    282 ;	-----------------------------------------
      0000D2                        283 _UART_rx_on:
                                    284 ;	pdk_uart.c: 78: flag_rx_off = SU_FALSE;
      0000D2 3C 26                  285 	clear	_flag_rx_off+0
                                    286 ;	pdk_uart.c: 79: }
      0000D4 7A 00                  287 	ret
                                    288 ;	pdk_uart.c: 81: void UART_rx_off(void)
                                    289 ;	-----------------------------------------
                                    290 ;	 function UART_rx_off
                                    291 ;	-----------------------------------------
      0000D6                        292 _UART_rx_off:
                                    293 ;	pdk_uart.c: 83: flag_rx_off = SU_TRUE;
      0000D6 01 57                  294 	mov	a, #0x01
      0000D8 3C 17                  295 	mov	_flag_rx_off+0, a
                                    296 ;	pdk_uart.c: 84: }
      0000DA 7A 00                  297 	ret
                                    298 ;	pdk_uart.c: 86: char UART_getchar(void)
                                    299 ;	-----------------------------------------
                                    300 ;	 function UART_getchar
                                    301 ;	-----------------------------------------
      0000DC                        302 _UART_getchar:
                                    303 ;	pdk_uart.c: 89: while (qout == qin)
      0000DC                        304 00101$:
      0000DC 3B 1F                  305 	mov	a, _qout+0
      0000DE 39 2F                  306 	cneqsn	a, _qin+0
      0000E0 6E 60                  307 	goto	00101$
      0000E2                        308 00120$:
                                    309 ;	pdk_uart.c: 93: ch = inbuf[qout];
      0000E2 19 57                  310 	mov	a, #(_inbuf + 0)
      0000E4 3B 18                  311 	add	a, _qout+0
      0000E6 00 17                  312 	mov	p, a
      0000E8 01 07                  313 	idxm	a, p
      0000EA 00 17                  314 	mov	p, a
                                    315 ;	pdk_uart.c: 94: if (++qout >= UART_IN_BUF_SIZE)
      0000EC 3B 24                  316 	inc	_qout+0
      0000EE 3B 1F                  317 	mov	a, _qout+0
      0000F0 20 51                  318 	sub	a, #0x20
      0000F2 80 30                  319 	t0sn.io	f, c
      0000F4 7C 60                  320 	goto	00105$
                                    321 ;	pdk_uart.c: 96: qout = 0;
      0000F6 3B 26                  322 	clear	_qout+0
      0000F8                        323 00105$:
                                    324 ;	pdk_uart.c: 99: return (ch);
      0000F8 00 1F                  325 	mov	a, p
                                    326 ;	pdk_uart.c: 100: }
      0000FA 7A 00                  327 	ret
                                    328 ;	pdk_uart.c: 102: uint8_t UART_kbhit(void)
                                    329 ;	-----------------------------------------
                                    330 ;	 function UART_kbhit
                                    331 ;	-----------------------------------------
      0000FC                        332 _UART_kbhit:
                                    333 ;	pdk_uart.c: 104: return (qin != qout); // 0 neu giong 1 neu khac
      0000FC 39 1F                  334 	mov	a, _qin+0
      0000FE 3B 2E                  335 	ceqsn	a, _qout+0
      000100 83 60                  336 	goto	00103$
      000102 01 57                  337 	mov	a, #0x01
      000104 84 60                  338 	goto	00104$
      000106                        339 00103$:
      000106 00 57                  340 	mov	a, #0x00
      000108                        341 00104$:
      000108 01 56                  342 	xor	a, #0x01
                                    343 ;	pdk_uart.c: 105: }
      00010A 7A 00                  344 	ret
                                    345 ;	pdk_uart.c: 107: void UART_flush_input_buffer(void)
                                    346 ;	-----------------------------------------
                                    347 ;	 function UART_flush_input_buffer
                                    348 ;	-----------------------------------------
      00010C                        349 _UART_flush_input_buffer:
                                    350 ;	pdk_uart.c: 109: qin = 0;
      00010C 39 26                  351 	clear	_qin+0
                                    352 ;	pdk_uart.c: 110: qout = 0;
      00010E 3B 26                  353 	clear	_qout+0
                                    354 ;	pdk_uart.c: 111: }
      000110 7A 00                  355 	ret
                                    356 ;	pdk_uart.c: 113: uint8_t UART_transmit_busy(void)
                                    357 ;	-----------------------------------------
                                    358 ;	 function UART_transmit_busy
                                    359 ;	-----------------------------------------
      000112                        360 _UART_transmit_busy:
                                    361 ;	pdk_uart.c: 115: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      000112 3E 1F                  362 	mov	a, _flag_tx_busy+0
      000114 01 52                  363 	ceqsn	a, #0x01
      000116 8F 60                  364 	goto	00103$
      000118 01 57                  365 	mov	a, #0x01
      00011A 00 26                  366 	clear	p
      00011C 90 60                  367 	goto	00104$
      00011E                        368 00103$:
      00011E 00 57                  369 	mov	a, #0x00
      000120                        370 00104$:
                                    371 ;	pdk_uart.c: 116: }
      000120 7A 00                  372 	ret
                                    373 ;	pdk_uart.c: 118: void UART_putC(const char ch)
                                    374 ;	-----------------------------------------
                                    375 ;	 function UART_putC
                                    376 ;	-----------------------------------------
      000122                        377 _UART_putC:
                                    378 ;	pdk_uart.c: 120: while (flag_tx_busy == SU_TRUE)
      000122                        379 00101$:
      000122 3E 1F                  380 	mov	a, _flag_tx_busy+0
      000124 01 53                  381 	cneqsn	a, #0x01
      000126 91 60                  382 	goto	00101$
      000128                        383 00114$:
                                    384 ;	pdk_uart.c: 126: bits_left_in_tx = TX_NUM_OF_BITS;
      000128 0A 57                  385 	mov	a, #0x0a
      00012A 3F 17                  386 	mov	_bits_left_in_tx+0, a
                                    387 ;	pdk_uart.c: 127: TIMER_ON;
      00012C 04 3F                  388 	set1.io	__inten, #6
                                    389 ;	pdk_uart.c: 128: internal_tx_buffer = (ch << 1) | 0x200;
      00012E 00 26                  390 	clear	p
      000130 42 1F                  391 	mov	a, _UART_putC_PARM_1+0
      000132 6B 00                  392 	sl	a
      000134 00 2D                  393 	slc	p
      000136 80 4C                  394 	set1	p, #1
      000138 40 17                  395 	mov	_internal_tx_buffer+0, a
      00013A 00 1F                  396 	mov	a, p
      00013C 41 17                  397 	mov	_internal_tx_buffer+1, a
                                    398 ;	pdk_uart.c: 129: flag_tx_busy = SU_TRUE;
      00013E 01 57                  399 	mov	a, #0x01
      000140 3E 17                  400 	mov	_flag_tx_busy+0, a
                                    401 ;	pdk_uart.c: 130: }
      000142 7A 00                  402 	ret
                                    403 ;	pdk_uart.c: 132: void UART_print(char *str)
                                    404 ;	-----------------------------------------
                                    405 ;	 function UART_print
                                    406 ;	-----------------------------------------
      000144                        407 _UART_print:
                                    408 ;	pdk_uart.c: 135: while (str[i] != '\0')
      000144 45 26                  409 	clear	_UART_print_sloc0_1_0+0
      000146 46 26                  410 	clear	_UART_print_sloc0_1_0+1
      000148                        411 00101$:
      000148 43 1F                  412 	mov	a, _UART_print_PARM_1+0
      00014A 45 18                  413 	add	a, _UART_print_sloc0_1_0+0
      00014C 00 17                  414 	mov	p, a
      00014E 44 1F                  415 	mov	a, _UART_print_PARM_1+1
      000150 46 1A                  416 	addc	a, _UART_print_sloc0_1_0+1
      000152 20 71                  417 	call	__gptrget
      000154 00 53                  418 	cneqsn	a, #0x00
      000156 B7 60                  419 	goto	00104$
                                    420 ;	pdk_uart.c: 136: UART_putC(str[i++]);
      000158 43 1F                  421 	mov	a, _UART_print_PARM_1+0
      00015A 45 18                  422 	add	a, _UART_print_sloc0_1_0+0
      00015C 00 17                  423 	mov	p, a
      00015E 44 1F                  424 	mov	a, _UART_print_PARM_1+1
      000160 46 1A                  425 	addc	a, _UART_print_sloc0_1_0+1
      000162 45 24                  426 	inc	_UART_print_sloc0_1_0+0
      000164 46 20                  427 	addc	_UART_print_sloc0_1_0+1
      000166 20 71                  428 	call	__gptrget
      000168 42 17                  429 	mov	_UART_putC_PARM_1+0, a
      00016A 91 70                  430 	call	_UART_putC
      00016C A4 60                  431 	goto	00101$
      00016E                        432 00104$:
                                    433 ;	pdk_uart.c: 137: }
      00016E 7A 00                  434 	ret
                                    435 ;	pdk_uart.c: 139: void TIM2_interrupt(void)
                                    436 ;	-----------------------------------------
                                    437 ;	 function TIM2_interrupt
                                    438 ;	-----------------------------------------
      000170                        439 _TIM2_interrupt:
                                    440 ;	pdk_uart.c: 148: if (flag_tx_busy == SU_TRUE)
      000170 3E 1F                  441 	mov	a, _flag_tx_busy+0
      000172 01 52                  442 	ceqsn	a, #0x01
      000174 CE 60                  443 	goto	00107$
                                    444 ;	pdk_uart.c: 150: if (internal_tx_buffer & 0x01)
      000176 41 1F                  445 	mov	a, _internal_tx_buffer+1
      000178 00 17                  446 	mov	p, a
      00017A 40 1F                  447 	mov	a, _internal_tx_buffer+0
      00017C 01 54                  448 	and	a, #0x01
      00017E 00 53                  449 	cneqsn	a, #0x00
      000180 C3 60                  450 	goto	00102$
                                    451 ;	pdk_uart.c: 152: setb(UART_Px, UART_TX);
      000182 93 3F                  452 	set1.io	__pb, #7
      000184 C4 60                  453 	goto	00103$
      000186                        454 00102$:
                                    455 ;	pdk_uart.c: 156: clrb(UART_Px, UART_TX);
      000186 93 3B                  456 	set0.io	__pb, #7
      000188                        457 00103$:
                                    458 ;	pdk_uart.c: 158: internal_tx_buffer >>= 1;
      000188 41 2A                  459 	sr	_internal_tx_buffer+1
      00018A 40 2C                  460 	src	_internal_tx_buffer+0
                                    461 ;	pdk_uart.c: 159: if (--bits_left_in_tx == 0)
      00018C 3F 1F                  462 	mov	a, _bits_left_in_tx+0
      00018E 01 51                  463 	sub	a, #0x01
      000190 3F 17                  464 	mov	_bits_left_in_tx+0, a
      000192 00 52                  465 	ceqsn	a, #0x00
      000194 CE 60                  466 	goto	00107$
                                    467 ;	pdk_uart.c: 161: flag_tx_busy = SU_FALSE;
      000196 3E 26                  468 	clear	_flag_tx_busy+0
                                    469 ;	pdk_uart.c: 162: TIMER_OFF;
      000198 04 3B                  470 	set0.io	__inten, #6
                                    471 ;	pdk_uart.c: 163: EXTERNAL_ON;
      00019A 04 3C                  472 	set1.io	__inten, #0
      00019C                        473 00107$:
                                    474 ;	pdk_uart.c: 168: if (flag_rx_off == SU_FALSE)
      00019C 3C 1F                  475 	mov	a, _flag_rx_off+0
      00019E 00 52                  476 	ceqsn	a, #0x00
      0001A0 00 61                  477 	goto	00124$
                                    478 ;	pdk_uart.c: 170: if (flag_rx_waiting_for_stop_bit)
      0001A2 47 1F                  479 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_52+0
      0001A4 00 53                  480 	cneqsn	a, #0x00
      0001A6 E7 60                  481 	goto	00120$
                                    482 ;	pdk_uart.c: 172: start_bit = 1;
      0001A8 01 57                  483 	mov	a, #0x01
      0001AA 3A 17                  484 	mov	_start_bit+0, a
                                    485 ;	pdk_uart.c: 173: EXTERNAL_ON;
      0001AC 04 3C                  486 	set1.io	__inten, #0
                                    487 ;	pdk_uart.c: 174: flag_rx_waiting_for_stop_bit = SU_FALSE;
      0001AE 47 26                  488 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_52+0
                                    489 ;	pdk_uart.c: 175: flag_rx_ready = SU_FALSE;
      0001B0 3D 26                  490 	clear	_flag_rx_ready+0
                                    491 ;	pdk_uart.c: 176: inbuf[qin] = internal_rx_buffer;
      0001B2 19 57                  492 	mov	a, #(_inbuf + 0)
      0001B4 39 18                  493 	add	a, _qin+0
      0001B6 00 17                  494 	mov	p, a
      0001B8 4A 1F                  495 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_52+0
      0001BA 00 07                  496 	idxm	p, a
                                    497 ;	pdk_uart.c: 177: if (++qin >= UART_IN_BUF_SIZE)
      0001BC 39 1F                  498 	mov	a, _qin+0
      0001BE 01 50                  499 	add	a, #0x01
      0001C0 39 17                  500 	mov	_qin+0, a
      0001C2 20 52                  501 	ceqsn	a, #0x20
      0001C4 00 00                  502 	nop
      0001C6 80 30                  503 	t0sn.io	f, c
      0001C8 00 61                  504 	goto	00124$
                                    505 ;	pdk_uart.c: 179: qin = 0; // overflow - reset inbuf-index
      0001CA 39 26                  506 	clear	_qin+0
      0001CC 00 61                  507 	goto	00124$
      0001CE                        508 00120$:
                                    509 ;	pdk_uart.c: 184: if (flag_rx_ready == SU_FALSE)
      0001CE 3D 1F                  510 	mov	a, _flag_rx_ready+0
      0001D0 00 52                  511 	ceqsn	a, #0x00
      0001D2 F5 60                  512 	goto	00117$
                                    513 ;	pdk_uart.c: 186: if (start_bit == 0)
      0001D4 3A 1F                  514 	mov	a, _start_bit+0
      0001D6 00 52                  515 	ceqsn	a, #0x00
      0001D8 00 61                  516 	goto	00124$
                                    517 ;	pdk_uart.c: 188: flag_rx_ready = SU_TRUE;
      0001DA 01 57                  518 	mov	a, #0x01
      0001DC 3D 17                  519 	mov	_flag_rx_ready+0, a
                                    520 ;	pdk_uart.c: 189: internal_rx_buffer = 0;
      0001DE 4A 26                  521 	clear	_TIM2_interrupt_internal_rx_buffer_65536_52+0
                                    522 ;	pdk_uart.c: 190: bits_left_in_rx = RX_NUM_OF_BITS;
      0001E0 08 57                  523 	mov	a, #0x08
      0001E2 49 17                  524 	mov	_TIM2_interrupt_bits_left_in_rx_65536_52+0, a
                                    525 ;	pdk_uart.c: 191: rx_mask = 1;
      0001E4 01 57                  526 	mov	a, #0x01
      0001E6 48 17                  527 	mov	_TIM2_interrupt_rx_mask_65536_52+0, a
      0001E8 00 61                  528 	goto	00124$
      0001EA                        529 00117$:
                                    530 ;	pdk_uart.c: 197: if (UART_Px & (0x20))
      0001EA 93 01                  531 	mov.io	a, __pb
      0001EC 20 54                  532 	and	a, #0x20
      0001EE 00 53                  533 	cneqsn	a, #0x00
      0001F0 FB 60                  534 	goto	00113$
                                    535 ;	pdk_uart.c: 199: internal_rx_buffer |= rx_mask;
      0001F2 48 1F                  536 	mov	a, _TIM2_interrupt_rx_mask_65536_52+0
      0001F4 4A 15                  537 	or	_TIM2_interrupt_internal_rx_buffer_65536_52+0, a
      0001F6                        538 00113$:
                                    539 ;	pdk_uart.c: 201: rx_mask <<= 1;
      0001F6 48 2B                  540 	sl	_TIM2_interrupt_rx_mask_65536_52+0
                                    541 ;	pdk_uart.c: 202: if (--bits_left_in_rx == 0)
      0001F8 49 23                  542 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_52+0
      0001FA 00 61                  543 	goto	00124$
                                    544 ;	pdk_uart.c: 204: flag_rx_waiting_for_stop_bit = SU_TRUE;
      0001FC 01 57                  545 	mov	a, #0x01
      0001FE 47 17                  546 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_52+0, a
      000200                        547 00124$:
                                    548 ;	pdk_uart.c: 209: }
      000200 7A 00                  549 	ret
                                    550 ;	pdk_uart.c: 212: void PB5_interrupt(void)
                                    551 ;	-----------------------------------------
                                    552 ;	 function PB5_interrupt
                                    553 ;	-----------------------------------------
      000202                        554 _PB5_interrupt:
                                    555 ;	pdk_uart.c: 214: TM2CT = 9;
      000202 09 57                  556 	mov	a, #0x09
      000204 31 01                  557 	mov.io	__tm2ct, a
                                    558 ;	pdk_uart.c: 215: TIMER_OFF;
      000206 04 3B                  559 	set0.io	__inten, #6
                                    560 ;	pdk_uart.c: 216: EXTERNAL_OFF;
      000208 04 38                  561 	set0.io	__inten, #0
                                    562 ;	pdk_uart.c: 217: start_bit = 0;
      00020A 3A 26                  563 	clear	_start_bit+0
                                    564 ;	pdk_uart.c: 219: INTRQ &= ~INTRQ_TM2;
      00020C 05 3B                  565 	set0.io	__intrq, #6
                                    566 ;	pdk_uart.c: 220: TIMER_ON;
      00020E 04 3F                  567 	set1.io	__inten, #6
                                    568 ;	pdk_uart.c: 221: }
      000210 7A 00                  569 	ret
                                    570 	.area CODE
                                    571 	.area CONST
                                    572 	.area CABS (ABS)
