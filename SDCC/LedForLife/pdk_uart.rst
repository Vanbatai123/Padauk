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
      00002C                        162 _inbuf:
      00002C                        163 	.ds 32
      00004C                        164 _qin::
      00004C                        165 	.ds 1
      00004D                        166 _start_bit::
      00004D                        167 	.ds 1
      00004E                        168 _qout::
      00004E                        169 	.ds 1
      00004F                        170 _flag_rx_off::
      00004F                        171 	.ds 1
      000050                        172 _flag_rx_ready::
      000050                        173 	.ds 1
      000051                        174 _flag_tx_busy::
      000051                        175 	.ds 1
      000052                        176 _bits_left_in_tx::
      000052                        177 	.ds 1
      000053                        178 _internal_tx_buffer::
      000053                        179 	.ds 2
      000055                        180 _UART_putC_PARM_1:
      000055                        181 	.ds 1
      000056                        182 _UART_print_PARM_1:
      000056                        183 	.ds 2
      000058                        184 _UART_print_sloc0_1_0:
      000058                        185 	.ds 2
      00005A                        186 _UART_printNum_PARM_1:
      00005A                        187 	.ds 2
      00005C                        188 _UART_printNum_dis_65536_53:
      00005C                        189 	.ds 5
      000061                        190 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59:
      000061                        191 	.ds 1
      000062                        192 _TIM2_interrupt_rx_mask_65536_59:
      000062                        193 	.ds 1
      000063                        194 _TIM2_interrupt_bits_left_in_rx_65536_59:
      000063                        195 	.ds 1
      000064                        196 _TIM2_interrupt_internal_rx_buffer_65536_59:
      000064                        197 	.ds 1
                                    198 ;--------------------------------------------------------
                                    199 ; overlayable items in ram
                                    200 ;--------------------------------------------------------
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
                                    212 ;	pdk_uart.c: 170: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      000060 61 26                  213 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    214 ;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
      000062 01 57                  215 	mov	a, #0x01
      000064 4D 17                  216 	mov	_start_bit+0, a
                                    217 ;--------------------------------------------------------
                                    218 ; Home
                                    219 ;--------------------------------------------------------
                                    220 	.area HOME
                                    221 	.area HOME
                                    222 ;--------------------------------------------------------
                                    223 ; code
                                    224 ;--------------------------------------------------------
                                    225 	.area CODE
                                    226 ;	pdk_uart.c: 35: void UART_IO_config(void)
                                    227 ;	-----------------------------------------
                                    228 ;	 function UART_IO_config
                                    229 ;	-----------------------------------------
      000102                        230 _UART_IO_config:
                                    231 ;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PA4;
      000102 01 57                  232 	mov	a, #0x01
      000104 67 01                  233 	mov.io	__rop, a
                                    234 ;	pdk_uart.c: 39: setb(UART_PxC, UART_TX);
      000106 91 3D                  235 	set1.io	__pac, #3
                                    236 ;	pdk_uart.c: 41: setb(UART_PxDIER, UART_RX);
      000108 0D 3E                  237 	set1.io	__padier, #4
                                    238 ;	pdk_uart.c: 42: setb(UART_PxPH, UART_RX);
      00010A 12 3E                  239 	set1.io	__paph, #4
                                    240 ;	pdk_uart.c: 44: INTEGS = INTEGS_PA4_FALLING;
      00010C 08 57                  241 	mov	a, #0x08
      00010E 0C 01                  242 	mov.io	__integs, a
                                    243 ;	pdk_uart.c: 45: INTEN |= INTEN_PA4;
      000110 84 3C                  244 	set1.io	__inten, #1
                                    245 ;	pdk_uart.c: 46: }
      000112 7A 00                  246 	ret
                                    247 ;	pdk_uart.c: 48: static void TIM2_Config(void)
                                    248 ;	-----------------------------------------
                                    249 ;	 function TIM2_Config
                                    250 ;	-----------------------------------------
      000114                        251 _TIM2_Config:
                                    252 ;	pdk_uart.c: 51: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      000114 20 57                  253 	mov	a, #0x20
      000116 30 01                  254 	mov.io	__tm2c, a
                                    255 ;	pdk_uart.c: 52: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      000118 0F 57                  256 	mov	a, #0x0f
      00011A 32 01                  257 	mov.io	__tm2s, a
                                    258 ;	pdk_uart.c: 53: TM2B = 103;									  // Divide by 69 ~> 9600 Hz (apx. 115200)
      00011C 67 57                  259 	mov	a, #0x67
      00011E 33 01                  260 	mov.io	__tm2b, a
                                    261 ;	pdk_uart.c: 54: }
      000120 7A 00                  262 	ret
                                    263 ;	pdk_uart.c: 56: void UART_begin(void)
                                    264 ;	-----------------------------------------
                                    265 ;	 function UART_begin
                                    266 ;	-----------------------------------------
      000122                        267 _UART_begin:
                                    268 ;	pdk_uart.c: 58: flag_tx_busy = SU_FALSE;
      000122 51 26                  269 	clear	_flag_tx_busy+0
                                    270 ;	pdk_uart.c: 59: flag_rx_ready = SU_FALSE;
      000124 50 26                  271 	clear	_flag_rx_ready+0
                                    272 ;	pdk_uart.c: 60: flag_rx_off = SU_TRUE;
      000126 01 57                  273 	mov	a, #0x01
      000128 4F 17                  274 	mov	_flag_rx_off+0, a
                                    275 ;	pdk_uart.c: 61: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      00012A 90 3D                  276 	set1.io	__pa, #3
                                    277 ;	pdk_uart.c: 63: TIM2_Config();
      00012C 8A 70                  278 	call	_TIM2_Config
                                    279 ;	pdk_uart.c: 64: UART_rx_on();
      00012E 9A 60                  280 	goto	_UART_rx_on
                                    281 ;	pdk_uart.c: 65: }
      000130 7A 00                  282 	ret
                                    283 ;	pdk_uart.c: 67: static void idle(void)
                                    284 ;	-----------------------------------------
                                    285 ;	 function idle
                                    286 ;	-----------------------------------------
      000132                        287 _idle:
                                    288 ;	pdk_uart.c: 72: }
      000132 7A 00                  289 	ret
                                    290 ;	pdk_uart.c: 74: void UART_rx_on(void)
                                    291 ;	-----------------------------------------
                                    292 ;	 function UART_rx_on
                                    293 ;	-----------------------------------------
      000134                        294 _UART_rx_on:
                                    295 ;	pdk_uart.c: 76: flag_rx_off = SU_FALSE;
      000134 4F 26                  296 	clear	_flag_rx_off+0
                                    297 ;	pdk_uart.c: 77: }
      000136 7A 00                  298 	ret
                                    299 ;	pdk_uart.c: 79: void UART_rx_off(void)
                                    300 ;	-----------------------------------------
                                    301 ;	 function UART_rx_off
                                    302 ;	-----------------------------------------
      000138                        303 _UART_rx_off:
                                    304 ;	pdk_uart.c: 81: flag_rx_off = SU_TRUE;
      000138 01 57                  305 	mov	a, #0x01
      00013A 4F 17                  306 	mov	_flag_rx_off+0, a
                                    307 ;	pdk_uart.c: 82: }
      00013C 7A 00                  308 	ret
                                    309 ;	pdk_uart.c: 84: char UART_getchar(void)
                                    310 ;	-----------------------------------------
                                    311 ;	 function UART_getchar
                                    312 ;	-----------------------------------------
      00013E                        313 _UART_getchar:
                                    314 ;	pdk_uart.c: 87: while (qout == qin)
      00013E                        315 00101$:
      00013E 4E 1F                  316 	mov	a, _qout+0
      000140 4C 2F                  317 	cneqsn	a, _qin+0
      000142 9F 60                  318 	goto	00101$
      000144                        319 00120$:
                                    320 ;	pdk_uart.c: 90: ch = inbuf[qout];
      000144 2C 57                  321 	mov	a, #(_inbuf + 0)
      000146 4E 18                  322 	add	a, _qout+0
      000148 00 17                  323 	mov	p, a
      00014A 01 07                  324 	idxm	a, p
      00014C 00 17                  325 	mov	p, a
                                    326 ;	pdk_uart.c: 91: if (++qout >= UART_IN_BUF_SIZE)
      00014E 4E 24                  327 	inc	_qout+0
      000150 4E 1F                  328 	mov	a, _qout+0
      000152 20 51                  329 	sub	a, #0x20
      000154 80 30                  330 	t0sn.io	f, c
      000156 AD 60                  331 	goto	00105$
                                    332 ;	pdk_uart.c: 93: qout = 0;
      000158 4E 26                  333 	clear	_qout+0
      00015A                        334 00105$:
                                    335 ;	pdk_uart.c: 96: return (ch);
      00015A 00 1F                  336 	mov	a, p
                                    337 ;	pdk_uart.c: 97: }
      00015C 7A 00                  338 	ret
                                    339 ;	pdk_uart.c: 99: uint8_t UART_kbhit(void)
                                    340 ;	-----------------------------------------
                                    341 ;	 function UART_kbhit
                                    342 ;	-----------------------------------------
      00015E                        343 _UART_kbhit:
                                    344 ;	pdk_uart.c: 101: return (qin != qout); // 0 neu giong 1 neu khac
      00015E 4C 1F                  345 	mov	a, _qin+0
      000160 4E 2E                  346 	ceqsn	a, _qout+0
      000162 B4 60                  347 	goto	00103$
      000164 01 57                  348 	mov	a, #0x01
      000166 B5 60                  349 	goto	00104$
      000168                        350 00103$:
      000168 00 57                  351 	mov	a, #0x00
      00016A                        352 00104$:
      00016A 01 56                  353 	xor	a, #0x01
                                    354 ;	pdk_uart.c: 102: }
      00016C 7A 00                  355 	ret
                                    356 ;	pdk_uart.c: 104: void UART_flush_input_buffer(void)
                                    357 ;	-----------------------------------------
                                    358 ;	 function UART_flush_input_buffer
                                    359 ;	-----------------------------------------
      00016E                        360 _UART_flush_input_buffer:
                                    361 ;	pdk_uart.c: 106: qin = 0;
      00016E 4C 26                  362 	clear	_qin+0
                                    363 ;	pdk_uart.c: 107: qout = 0;
      000170 4E 26                  364 	clear	_qout+0
                                    365 ;	pdk_uart.c: 108: }
      000172 7A 00                  366 	ret
                                    367 ;	pdk_uart.c: 110: uint8_t UART_transmit_busy(void)
                                    368 ;	-----------------------------------------
                                    369 ;	 function UART_transmit_busy
                                    370 ;	-----------------------------------------
      000174                        371 _UART_transmit_busy:
                                    372 ;	pdk_uart.c: 112: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      000174 51 1F                  373 	mov	a, _flag_tx_busy+0
      000176 01 52                  374 	ceqsn	a, #0x01
      000178 C0 60                  375 	goto	00103$
      00017A 01 57                  376 	mov	a, #0x01
      00017C 00 26                  377 	clear	p
      00017E C1 60                  378 	goto	00104$
      000180                        379 00103$:
      000180 00 57                  380 	mov	a, #0x00
      000182                        381 00104$:
                                    382 ;	pdk_uart.c: 113: }
      000182 7A 00                  383 	ret
                                    384 ;	pdk_uart.c: 115: void UART_putC(const char ch)
                                    385 ;	-----------------------------------------
                                    386 ;	 function UART_putC
                                    387 ;	-----------------------------------------
      000184                        388 _UART_putC:
                                    389 ;	pdk_uart.c: 117: while (flag_tx_busy == SU_TRUE)
      000184                        390 00101$:
      000184 51 1F                  391 	mov	a, _flag_tx_busy+0
      000186 01 53                  392 	cneqsn	a, #0x01
      000188 C2 60                  393 	goto	00101$
      00018A                        394 00114$:
                                    395 ;	pdk_uart.c: 122: bits_left_in_tx = TX_NUM_OF_BITS;
      00018A 0A 57                  396 	mov	a, #0x0a
      00018C 52 17                  397 	mov	_bits_left_in_tx+0, a
                                    398 ;	pdk_uart.c: 123: TIMER_ON;
      00018E 04 3F                  399 	set1.io	__inten, #6
                                    400 ;	pdk_uart.c: 124: internal_tx_buffer = (ch << 1) | 0x200;
      000190 00 26                  401 	clear	p
      000192 55 1F                  402 	mov	a, _UART_putC_PARM_1+0
      000194 6B 00                  403 	sl	a
      000196 00 2D                  404 	slc	p
      000198 80 4C                  405 	set1	p, #1
      00019A 53 17                  406 	mov	_internal_tx_buffer+0, a
      00019C 00 1F                  407 	mov	a, p
      00019E 54 17                  408 	mov	_internal_tx_buffer+1, a
                                    409 ;	pdk_uart.c: 125: flag_tx_busy = SU_TRUE;
      0001A0 01 57                  410 	mov	a, #0x01
      0001A2 51 17                  411 	mov	_flag_tx_busy+0, a
                                    412 ;	pdk_uart.c: 126: }
      0001A4 7A 00                  413 	ret
                                    414 ;	pdk_uart.c: 128: void UART_print(char *str)
                                    415 ;	-----------------------------------------
                                    416 ;	 function UART_print
                                    417 ;	-----------------------------------------
      0001A6                        418 _UART_print:
                                    419 ;	pdk_uart.c: 131: while (str[i] != '\0')
      0001A6 58 26                  420 	clear	_UART_print_sloc0_1_0+0
      0001A8 59 26                  421 	clear	_UART_print_sloc0_1_0+1
      0001AA                        422 00101$:
      0001AA 56 1F                  423 	mov	a, _UART_print_PARM_1+0
      0001AC 58 18                  424 	add	a, _UART_print_sloc0_1_0+0
      0001AE 00 17                  425 	mov	p, a
      0001B0 57 1F                  426 	mov	a, _UART_print_PARM_1+1
      0001B2 59 1A                  427 	addc	a, _UART_print_sloc0_1_0+1
      0001B4 99 74                  428 	call	__gptrget
      0001B6 00 53                  429 	cneqsn	a, #0x00
      0001B8 E8 60                  430 	goto	00104$
                                    431 ;	pdk_uart.c: 132: UART_putC(str[i++]);
      0001BA 56 1F                  432 	mov	a, _UART_print_PARM_1+0
      0001BC 58 18                  433 	add	a, _UART_print_sloc0_1_0+0
      0001BE 00 17                  434 	mov	p, a
      0001C0 57 1F                  435 	mov	a, _UART_print_PARM_1+1
      0001C2 59 1A                  436 	addc	a, _UART_print_sloc0_1_0+1
      0001C4 58 24                  437 	inc	_UART_print_sloc0_1_0+0
      0001C6 59 20                  438 	addc	_UART_print_sloc0_1_0+1
      0001C8 99 74                  439 	call	__gptrget
      0001CA 55 17                  440 	mov	_UART_putC_PARM_1+0, a
      0001CC C2 70                  441 	call	_UART_putC
      0001CE D5 60                  442 	goto	00101$
      0001D0                        443 00104$:
                                    444 ;	pdk_uart.c: 133: }
      0001D0 7A 00                  445 	ret
                                    446 ;	pdk_uart.c: 135: void UART_printNum(int num)
                                    447 ;	-----------------------------------------
                                    448 ;	 function UART_printNum
                                    449 ;	-----------------------------------------
      0001D2                        450 _UART_printNum:
                                    451 ;	pdk_uart.c: 138: if (num > 999)
      0001D2 E7 57                  452 	mov	a, #0xe7
      0001D4 5A 19                  453 	sub	a, _UART_printNum_PARM_1+0
      0001D6 03 57                  454 	mov	a, #0x03
      0001D8 5B 1B                  455 	subc	a, _UART_printNum_PARM_1+1
      0001DA 80 31                  456 	t0sn.io	f, ov
      0001DC 80 56                  457 	xor	a, #0x80
      0001DE 6B 00                  458 	sl	a
      0001E0 80 34                  459 	t1sn.io	f, c
      0001E2 2B 61                  460 	goto	00108$
                                    461 ;	pdk_uart.c: 140: dis[0] = num / 1000 + 48;
      0001E4 5A 1F                  462 	mov	a, _UART_printNum_PARM_1+0
      0001E6 D2 17                  463 	mov	__divsint_PARM_1+0, a
      0001E8 5B 1F                  464 	mov	a, _UART_printNum_PARM_1+1
      0001EA D3 17                  465 	mov	__divsint_PARM_1+1, a
      0001EC E8 57                  466 	mov	a, #0xe8
      0001EE D4 17                  467 	mov	__divsint_PARM_2+0, a
      0001F0 03 57                  468 	mov	a, #0x03
      0001F2 D5 17                  469 	mov	__divsint_PARM_2+1, a
      0001F4 39 74                  470 	call	__divsint
      0001F6 30 50                  471 	add	a, #0x30
      0001F8 5C 17                  472 	mov	_UART_printNum_dis_65536_53+0, a
                                    473 ;	pdk_uart.c: 141: dis[1] = (num / 100) % 10 + 48;
      0001FA 5A 1F                  474 	mov	a, _UART_printNum_PARM_1+0
      0001FC D2 17                  475 	mov	__divsint_PARM_1+0, a
      0001FE 5B 1F                  476 	mov	a, _UART_printNum_PARM_1+1
      000200 D3 17                  477 	mov	__divsint_PARM_1+1, a
      000202 64 57                  478 	mov	a, #0x64
      000204 D4 17                  479 	mov	__divsint_PARM_2+0, a
      000206 D5 26                  480 	clear	__divsint_PARM_2+1
      000208 39 74                  481 	call	__divsint
      00020A C5 17                  482 	mov	__modsint_PARM_1+0, a
      00020C 00 1F                  483 	mov	a, p
      00020E C6 17                  484 	mov	__modsint_PARM_1+1, a
      000210 0A 57                  485 	mov	a, #0x0a
      000212 C7 17                  486 	mov	__modsint_PARM_2+0, a
      000214 C8 26                  487 	clear	__modsint_PARM_2+1
      000216 D2 73                  488 	call	__modsint
      000218 30 50                  489 	add	a, #0x30
      00021A 5D 17                  490 	mov	_UART_printNum_dis_65536_53+1, a
                                    491 ;	pdk_uart.c: 142: dis[2] = (num / 10) % 10 + 48;
      00021C 5A 1F                  492 	mov	a, _UART_printNum_PARM_1+0
      00021E D2 17                  493 	mov	__divsint_PARM_1+0, a
      000220 5B 1F                  494 	mov	a, _UART_printNum_PARM_1+1
      000222 D3 17                  495 	mov	__divsint_PARM_1+1, a
      000224 0A 57                  496 	mov	a, #0x0a
      000226 D4 17                  497 	mov	__divsint_PARM_2+0, a
      000228 D5 26                  498 	clear	__divsint_PARM_2+1
      00022A 39 74                  499 	call	__divsint
      00022C C5 17                  500 	mov	__modsint_PARM_1+0, a
      00022E 00 1F                  501 	mov	a, p
      000230 C6 17                  502 	mov	__modsint_PARM_1+1, a
      000232 0A 57                  503 	mov	a, #0x0a
      000234 C7 17                  504 	mov	__modsint_PARM_2+0, a
      000236 C8 26                  505 	clear	__modsint_PARM_2+1
      000238 D2 73                  506 	call	__modsint
      00023A 30 50                  507 	add	a, #0x30
      00023C 5E 17                  508 	mov	_UART_printNum_dis_65536_53+2, a
                                    509 ;	pdk_uart.c: 143: dis[3] = num % 10 + 48;
      00023E 5A 1F                  510 	mov	a, _UART_printNum_PARM_1+0
      000240 C5 17                  511 	mov	__modsint_PARM_1+0, a
      000242 5B 1F                  512 	mov	a, _UART_printNum_PARM_1+1
      000244 C6 17                  513 	mov	__modsint_PARM_1+1, a
      000246 0A 57                  514 	mov	a, #0x0a
      000248 C7 17                  515 	mov	__modsint_PARM_2+0, a
      00024A C8 26                  516 	clear	__modsint_PARM_2+1
      00024C D2 73                  517 	call	__modsint
      00024E 30 50                  518 	add	a, #0x30
      000250 5F 17                  519 	mov	_UART_printNum_dis_65536_53+3, a
                                    520 ;	pdk_uart.c: 144: dis[4] = '\0';
      000252 60 26                  521 	clear	_UART_printNum_dis_65536_53+4
      000254 7E 61                  522 	goto	00109$
      000256                        523 00108$:
                                    524 ;	pdk_uart.c: 146: else if (num > 99)
      000256 63 57                  525 	mov	a, #0x63
      000258 5A 19                  526 	sub	a, _UART_printNum_PARM_1+0
      00025A 00 57                  527 	mov	a, #0x00
      00025C 5B 1B                  528 	subc	a, _UART_printNum_PARM_1+1
      00025E 80 31                  529 	t0sn.io	f, ov
      000260 80 56                  530 	xor	a, #0x80
      000262 6B 00                  531 	sl	a
      000264 80 34                  532 	t1sn.io	f, c
      000266 5B 61                  533 	goto	00105$
                                    534 ;	pdk_uart.c: 148: dis[0] = num / 100 + 48;
      000268 5A 1F                  535 	mov	a, _UART_printNum_PARM_1+0
      00026A D2 17                  536 	mov	__divsint_PARM_1+0, a
      00026C 5B 1F                  537 	mov	a, _UART_printNum_PARM_1+1
      00026E D3 17                  538 	mov	__divsint_PARM_1+1, a
      000270 64 57                  539 	mov	a, #0x64
      000272 D4 17                  540 	mov	__divsint_PARM_2+0, a
      000274 D5 26                  541 	clear	__divsint_PARM_2+1
      000276 39 74                  542 	call	__divsint
      000278 30 50                  543 	add	a, #0x30
      00027A 5C 17                  544 	mov	_UART_printNum_dis_65536_53+0, a
                                    545 ;	pdk_uart.c: 149: dis[1] = (num / 10) % 10 + 48;
      00027C 5A 1F                  546 	mov	a, _UART_printNum_PARM_1+0
      00027E D2 17                  547 	mov	__divsint_PARM_1+0, a
      000280 5B 1F                  548 	mov	a, _UART_printNum_PARM_1+1
      000282 D3 17                  549 	mov	__divsint_PARM_1+1, a
      000284 0A 57                  550 	mov	a, #0x0a
      000286 D4 17                  551 	mov	__divsint_PARM_2+0, a
      000288 D5 26                  552 	clear	__divsint_PARM_2+1
      00028A 39 74                  553 	call	__divsint
      00028C C5 17                  554 	mov	__modsint_PARM_1+0, a
      00028E 00 1F                  555 	mov	a, p
      000290 C6 17                  556 	mov	__modsint_PARM_1+1, a
      000292 0A 57                  557 	mov	a, #0x0a
      000294 C7 17                  558 	mov	__modsint_PARM_2+0, a
      000296 C8 26                  559 	clear	__modsint_PARM_2+1
      000298 D2 73                  560 	call	__modsint
      00029A 30 50                  561 	add	a, #0x30
      00029C 5D 17                  562 	mov	_UART_printNum_dis_65536_53+1, a
                                    563 ;	pdk_uart.c: 150: dis[2] = num % 10 + 48;
      00029E 5A 1F                  564 	mov	a, _UART_printNum_PARM_1+0
      0002A0 C5 17                  565 	mov	__modsint_PARM_1+0, a
      0002A2 5B 1F                  566 	mov	a, _UART_printNum_PARM_1+1
      0002A4 C6 17                  567 	mov	__modsint_PARM_1+1, a
      0002A6 0A 57                  568 	mov	a, #0x0a
      0002A8 C7 17                  569 	mov	__modsint_PARM_2+0, a
      0002AA C8 26                  570 	clear	__modsint_PARM_2+1
      0002AC D2 73                  571 	call	__modsint
      0002AE 30 50                  572 	add	a, #0x30
      0002B0 5E 17                  573 	mov	_UART_printNum_dis_65536_53+2, a
                                    574 ;	pdk_uart.c: 151: dis[3] = '\0';
      0002B2 5F 26                  575 	clear	_UART_printNum_dis_65536_53+3
      0002B4 7E 61                  576 	goto	00109$
      0002B6                        577 00105$:
                                    578 ;	pdk_uart.c: 153: else if (num > 9)
      0002B6 09 57                  579 	mov	a, #0x09
      0002B8 5A 19                  580 	sub	a, _UART_printNum_PARM_1+0
      0002BA 00 57                  581 	mov	a, #0x00
      0002BC 5B 1B                  582 	subc	a, _UART_printNum_PARM_1+1
      0002BE 80 31                  583 	t0sn.io	f, ov
      0002C0 80 56                  584 	xor	a, #0x80
      0002C2 6B 00                  585 	sl	a
      0002C4 80 34                  586 	t1sn.io	f, c
      0002C6 7A 61                  587 	goto	00102$
                                    588 ;	pdk_uart.c: 155: dis[0] = num / 10 + 48;
      0002C8 5A 1F                  589 	mov	a, _UART_printNum_PARM_1+0
      0002CA D2 17                  590 	mov	__divsint_PARM_1+0, a
      0002CC 5B 1F                  591 	mov	a, _UART_printNum_PARM_1+1
      0002CE D3 17                  592 	mov	__divsint_PARM_1+1, a
      0002D0 0A 57                  593 	mov	a, #0x0a
      0002D2 D4 17                  594 	mov	__divsint_PARM_2+0, a
      0002D4 D5 26                  595 	clear	__divsint_PARM_2+1
      0002D6 39 74                  596 	call	__divsint
      0002D8 30 50                  597 	add	a, #0x30
      0002DA 5C 17                  598 	mov	_UART_printNum_dis_65536_53+0, a
                                    599 ;	pdk_uart.c: 156: dis[1] = num % 10 + 48;
      0002DC 5A 1F                  600 	mov	a, _UART_printNum_PARM_1+0
      0002DE C5 17                  601 	mov	__modsint_PARM_1+0, a
      0002E0 5B 1F                  602 	mov	a, _UART_printNum_PARM_1+1
      0002E2 C6 17                  603 	mov	__modsint_PARM_1+1, a
      0002E4 0A 57                  604 	mov	a, #0x0a
      0002E6 C7 17                  605 	mov	__modsint_PARM_2+0, a
      0002E8 C8 26                  606 	clear	__modsint_PARM_2+1
      0002EA D2 73                  607 	call	__modsint
      0002EC 30 50                  608 	add	a, #0x30
      0002EE 5D 17                  609 	mov	_UART_printNum_dis_65536_53+1, a
                                    610 ;	pdk_uart.c: 157: dis[2] = '\0';
      0002F0 5E 26                  611 	clear	_UART_printNum_dis_65536_53+2
      0002F2 7E 61                  612 	goto	00109$
      0002F4                        613 00102$:
                                    614 ;	pdk_uart.c: 161: dis[0] = num + 48;
      0002F4 5A 1F                  615 	mov	a, _UART_printNum_PARM_1+0
      0002F6 30 50                  616 	add	a, #0x30
      0002F8 5C 17                  617 	mov	_UART_printNum_dis_65536_53+0, a
                                    618 ;	pdk_uart.c: 162: dis[1] = '\0';
      0002FA 5D 26                  619 	clear	_UART_printNum_dis_65536_53+1
      0002FC                        620 00109$:
                                    621 ;	pdk_uart.c: 164: UART_print(dis);
      0002FC 5C 57                  622 	mov	a, #(_UART_printNum_dis_65536_53 + 0)
      0002FE 56 17                  623 	mov	_UART_print_PARM_1+0, a
      000300 57 26                  624 	clear	_UART_print_PARM_1+1
      000302 D3 60                  625 	goto	_UART_print
                                    626 ;	pdk_uart.c: 165: }
      000304 7A 00                  627 	ret
                                    628 ;	pdk_uart.c: 168: void TIM2_interrupt(void)
                                    629 ;	-----------------------------------------
                                    630 ;	 function TIM2_interrupt
                                    631 ;	-----------------------------------------
      000306                        632 _TIM2_interrupt:
                                    633 ;	pdk_uart.c: 177: if (flag_tx_busy == SU_TRUE)
      000306 51 1F                  634 	mov	a, _flag_tx_busy+0
      000308 01 52                  635 	ceqsn	a, #0x01
      00030A 99 61                  636 	goto	00107$
                                    637 ;	pdk_uart.c: 179: if (internal_tx_buffer & 0x01)
      00030C 54 1F                  638 	mov	a, _internal_tx_buffer+1
      00030E 00 17                  639 	mov	p, a
      000310 53 1F                  640 	mov	a, _internal_tx_buffer+0
      000312 01 54                  641 	and	a, #0x01
      000314 00 53                  642 	cneqsn	a, #0x00
      000316 8E 61                  643 	goto	00102$
                                    644 ;	pdk_uart.c: 181: setb(UART_Px, UART_TX);
      000318 90 3D                  645 	set1.io	__pa, #3
      00031A 8F 61                  646 	goto	00103$
      00031C                        647 00102$:
                                    648 ;	pdk_uart.c: 185: clrb(UART_Px, UART_TX);
      00031C 90 39                  649 	set0.io	__pa, #3
      00031E                        650 00103$:
                                    651 ;	pdk_uart.c: 187: internal_tx_buffer >>= 1;
      00031E 54 2A                  652 	sr	_internal_tx_buffer+1
      000320 53 2C                  653 	src	_internal_tx_buffer+0
                                    654 ;	pdk_uart.c: 188: if (--bits_left_in_tx == 0)
      000322 52 1F                  655 	mov	a, _bits_left_in_tx+0
      000324 01 51                  656 	sub	a, #0x01
      000326 52 17                  657 	mov	_bits_left_in_tx+0, a
      000328 00 52                  658 	ceqsn	a, #0x00
      00032A 99 61                  659 	goto	00107$
                                    660 ;	pdk_uart.c: 190: flag_tx_busy = SU_FALSE;
      00032C 51 26                  661 	clear	_flag_tx_busy+0
                                    662 ;	pdk_uart.c: 191: TIMER_OFF;
      00032E 04 3B                  663 	set0.io	__inten, #6
                                    664 ;	pdk_uart.c: 192: EXTERNAL_ON;
      000330 84 3C                  665 	set1.io	__inten, #1
      000332                        666 00107$:
                                    667 ;	pdk_uart.c: 197: if (flag_rx_off == SU_FALSE)
      000332 4F 1F                  668 	mov	a, _flag_rx_off+0
      000334 00 52                  669 	ceqsn	a, #0x00
      000336 CD 61                  670 	goto	00124$
                                    671 ;	pdk_uart.c: 199: if (flag_rx_waiting_for_stop_bit)
      000338 61 1F                  672 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
      00033A 00 53                  673 	cneqsn	a, #0x00
      00033C B2 61                  674 	goto	00120$
                                    675 ;	pdk_uart.c: 201: start_bit = 1;
      00033E 01 57                  676 	mov	a, #0x01
      000340 4D 17                  677 	mov	_start_bit+0, a
                                    678 ;	pdk_uart.c: 202: EXTERNAL_ON;
      000342 84 3C                  679 	set1.io	__inten, #1
                                    680 ;	pdk_uart.c: 203: flag_rx_waiting_for_stop_bit = SU_FALSE;
      000344 61 26                  681 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    682 ;	pdk_uart.c: 204: flag_rx_ready = SU_FALSE;
      000346 50 26                  683 	clear	_flag_rx_ready+0
                                    684 ;	pdk_uart.c: 205: inbuf[qin] = internal_rx_buffer;
      000348 2C 57                  685 	mov	a, #(_inbuf + 0)
      00034A 4C 18                  686 	add	a, _qin+0
      00034C 00 17                  687 	mov	p, a
      00034E 64 1F                  688 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_59+0
      000350 00 07                  689 	idxm	p, a
                                    690 ;	pdk_uart.c: 206: if (++qin >= UART_IN_BUF_SIZE)
      000352 4C 1F                  691 	mov	a, _qin+0
      000354 01 50                  692 	add	a, #0x01
      000356 4C 17                  693 	mov	_qin+0, a
      000358 20 52                  694 	ceqsn	a, #0x20
      00035A 00 00                  695 	nop
      00035C 80 30                  696 	t0sn.io	f, c
      00035E CD 61                  697 	goto	00124$
                                    698 ;	pdk_uart.c: 208: qin = 0; // overflow - reset inbuf-index
      000360 4C 26                  699 	clear	_qin+0
      000362 CD 61                  700 	goto	00124$
      000364                        701 00120$:
                                    702 ;	pdk_uart.c: 213: if (flag_rx_ready == SU_FALSE)
      000364 50 1F                  703 	mov	a, _flag_rx_ready+0
      000366 00 52                  704 	ceqsn	a, #0x00
      000368 C0 61                  705 	goto	00117$
                                    706 ;	pdk_uart.c: 215: if (start_bit == 0)
      00036A 4D 1F                  707 	mov	a, _start_bit+0
      00036C 00 52                  708 	ceqsn	a, #0x00
      00036E CD 61                  709 	goto	00124$
                                    710 ;	pdk_uart.c: 217: flag_rx_ready = SU_TRUE;
      000370 01 57                  711 	mov	a, #0x01
      000372 50 17                  712 	mov	_flag_rx_ready+0, a
                                    713 ;	pdk_uart.c: 218: internal_rx_buffer = 0;
      000374 64 26                  714 	clear	_TIM2_interrupt_internal_rx_buffer_65536_59+0
                                    715 ;	pdk_uart.c: 219: bits_left_in_rx = RX_NUM_OF_BITS;
      000376 08 57                  716 	mov	a, #0x08
      000378 63 17                  717 	mov	_TIM2_interrupt_bits_left_in_rx_65536_59+0, a
                                    718 ;	pdk_uart.c: 220: rx_mask = 1;
      00037A 01 57                  719 	mov	a, #0x01
      00037C 62 17                  720 	mov	_TIM2_interrupt_rx_mask_65536_59+0, a
      00037E CD 61                  721 	goto	00124$
      000380                        722 00117$:
                                    723 ;	pdk_uart.c: 225: if (inbit(UART_Px, UART_RX))
      000380 90 01                  724 	mov.io	a, __pa
      000382 10 54                  725 	and	a, #0x10
      000384 6E 00                  726 	swap	a
      000386 0F 54                  727 	and	a, #0x0f
      000388 00 53                  728 	cneqsn	a, #0x00
      00038A C8 61                  729 	goto	00113$
                                    730 ;	pdk_uart.c: 227: internal_rx_buffer |= rx_mask;
      00038C 62 1F                  731 	mov	a, _TIM2_interrupt_rx_mask_65536_59+0
      00038E 64 15                  732 	or	_TIM2_interrupt_internal_rx_buffer_65536_59+0, a
      000390                        733 00113$:
                                    734 ;	pdk_uart.c: 229: rx_mask <<= 1;
      000390 62 2B                  735 	sl	_TIM2_interrupt_rx_mask_65536_59+0
                                    736 ;	pdk_uart.c: 230: if (--bits_left_in_rx == 0)
      000392 63 23                  737 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_59+0
      000394 CD 61                  738 	goto	00124$
                                    739 ;	pdk_uart.c: 232: flag_rx_waiting_for_stop_bit = SU_TRUE;
      000396 01 57                  740 	mov	a, #0x01
      000398 61 17                  741 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0, a
      00039A                        742 00124$:
                                    743 ;	pdk_uart.c: 237: }
      00039A 7A 00                  744 	ret
                                    745 ;	pdk_uart.c: 240: void PA4_interrupt(void)
                                    746 ;	-----------------------------------------
                                    747 ;	 function PA4_interrupt
                                    748 ;	-----------------------------------------
      00039C                        749 _PA4_interrupt:
                                    750 ;	pdk_uart.c: 242: TM2CT = 9;
      00039C 09 57                  751 	mov	a, #0x09
      00039E 31 01                  752 	mov.io	__tm2ct, a
                                    753 ;	pdk_uart.c: 243: TIMER_OFF;
      0003A0 04 3B                  754 	set0.io	__inten, #6
                                    755 ;	pdk_uart.c: 244: EXTERNAL_OFF;
      0003A2 84 38                  756 	set0.io	__inten, #1
                                    757 ;	pdk_uart.c: 245: start_bit = 0;
      0003A4 4D 26                  758 	clear	_start_bit+0
                                    759 ;	pdk_uart.c: 247: INTRQ &= ~INTRQ_TM2;
      0003A6 05 3B                  760 	set0.io	__intrq, #6
                                    761 ;	pdk_uart.c: 248: TIMER_ON;
      0003A8 04 3F                  762 	set1.io	__inten, #6
                                    763 ;	pdk_uart.c: 249: }
      0003AA 7A 00                  764 	ret
                                    765 	.area CODE
                                    766 	.area CONST
                                    767 	.area CABS (ABS)
