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
      000016                        162 _inbuf:
      000016                        163 	.ds 32
      000036                        164 _qin::
      000036                        165 	.ds 1
      000037                        166 _start_bit::
      000037                        167 	.ds 1
      000038                        168 _qout::
      000038                        169 	.ds 1
      000039                        170 _flag_rx_off::
      000039                        171 	.ds 1
      00003A                        172 _flag_rx_ready::
      00003A                        173 	.ds 1
      00003B                        174 _flag_tx_busy::
      00003B                        175 	.ds 1
      00003C                        176 _bits_left_in_tx::
      00003C                        177 	.ds 1
      00003D                        178 _internal_tx_buffer::
      00003D                        179 	.ds 2
      00003F                        180 _UART_putC_PARM_1:
      00003F                        181 	.ds 1
      000040                        182 _UART_print_PARM_1:
      000040                        183 	.ds 2
      000042                        184 _UART_print_sloc0_1_0:
      000042                        185 	.ds 2
      000044                        186 _UART_printNum_PARM_1:
      000044                        187 	.ds 2
      000046                        188 _UART_printNum_dis_65536_53:
      000046                        189 	.ds 5
      00004B                        190 _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59:
      00004B                        191 	.ds 1
      00004C                        192 _TIM2_interrupt_rx_mask_65536_59:
      00004C                        193 	.ds 1
      00004D                        194 _TIM2_interrupt_bits_left_in_rx_65536_59:
      00004D                        195 	.ds 1
      00004E                        196 _TIM2_interrupt_internal_rx_buffer_65536_59:
      00004E                        197 	.ds 1
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
                                    212 ;	pdk_uart.c: 174: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
      00005C 4B 26                  213 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    214 ;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
      00005E 01 57                  215 	mov	a, #0x01
      000060 37 17                  216 	mov	_start_bit+0, a
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
      000128                        230 _UART_IO_config:
                                    231 ;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PB5;
      000128 02 57                  232 	mov	a, #0x02
      00012A 67 01                  233 	mov.io	__rop, a
                                    234 ;	pdk_uart.c: 39: setb(UART_PxC, UART_TX);
      00012C 94 3F                  235 	set1.io	__pbc, #7
                                    236 ;	pdk_uart.c: 41: setb(UART_PxDIER, UART_RX);
      00012E 8E 3E                  237 	set1.io	__pbdier, #5
                                    238 ;	pdk_uart.c: 42: setb(UART_PxPH, UART_RX);
      000130 95 3E                  239 	set1.io	__pbph, #5
                                    240 ;	pdk_uart.c: 44: INTEGS = INTEGS_PB5_FALLING;
      000132 02 57                  241 	mov	a, #0x02
      000134 0C 01                  242 	mov.io	__integs, a
                                    243 ;	pdk_uart.c: 45: INTEN |= INTEN_PB5;
      000136 04 3C                  244 	set1.io	__inten, #0
                                    245 ;	pdk_uart.c: 46: }
      000138 7A 00                  246 	ret
                                    247 ;	pdk_uart.c: 48: static void TIM2_Config(void)
                                    248 ;	-----------------------------------------
                                    249 ;	 function TIM2_Config
                                    250 ;	-----------------------------------------
      00013A                        251 _TIM2_Config:
                                    252 ;	pdk_uart.c: 51: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
      00013A 20 57                  253 	mov	a, #0x20
      00013C 30 01                  254 	mov.io	__tm2c, a
                                    255 ;	pdk_uart.c: 52: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
      00013E 0F 57                  256 	mov	a, #0x0f
      000140 32 01                  257 	mov.io	__tm2s, a
                                    258 ;	pdk_uart.c: 53: TM2B = 103;									  // Divide by 69 ~> 115942 Hz (apx. 115200)
      000142 67 57                  259 	mov	a, #0x67
      000144 33 01                  260 	mov.io	__tm2b, a
                                    261 ;	pdk_uart.c: 58: }
      000146 7A 00                  262 	ret
                                    263 ;	pdk_uart.c: 60: void UART_begin(void)
                                    264 ;	-----------------------------------------
                                    265 ;	 function UART_begin
                                    266 ;	-----------------------------------------
      000148                        267 _UART_begin:
                                    268 ;	pdk_uart.c: 62: flag_tx_busy = SU_FALSE;
      000148 3B 26                  269 	clear	_flag_tx_busy+0
                                    270 ;	pdk_uart.c: 63: flag_rx_ready = SU_FALSE;
      00014A 3A 26                  271 	clear	_flag_rx_ready+0
                                    272 ;	pdk_uart.c: 64: flag_rx_off = SU_TRUE;
      00014C 01 57                  273 	mov	a, #0x01
      00014E 39 17                  274 	mov	_flag_rx_off+0, a
                                    275 ;	pdk_uart.c: 65: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
      000150 93 3F                  276 	set1.io	__pb, #7
                                    277 ;	pdk_uart.c: 67: TIM2_Config();
      000152 9D 70                  278 	call	_TIM2_Config
                                    279 ;	pdk_uart.c: 68: UART_rx_on();
      000154 AD 60                  280 	goto	_UART_rx_on
                                    281 ;	pdk_uart.c: 69: }
      000156 7A 00                  282 	ret
                                    283 ;	pdk_uart.c: 71: static void idle(void)
                                    284 ;	-----------------------------------------
                                    285 ;	 function idle
                                    286 ;	-----------------------------------------
      000158                        287 _idle:
                                    288 ;	pdk_uart.c: 76: }
      000158 7A 00                  289 	ret
                                    290 ;	pdk_uart.c: 78: void UART_rx_on(void)
                                    291 ;	-----------------------------------------
                                    292 ;	 function UART_rx_on
                                    293 ;	-----------------------------------------
      00015A                        294 _UART_rx_on:
                                    295 ;	pdk_uart.c: 80: flag_rx_off = SU_FALSE;
      00015A 39 26                  296 	clear	_flag_rx_off+0
                                    297 ;	pdk_uart.c: 81: }
      00015C 7A 00                  298 	ret
                                    299 ;	pdk_uart.c: 83: void UART_rx_off(void)
                                    300 ;	-----------------------------------------
                                    301 ;	 function UART_rx_off
                                    302 ;	-----------------------------------------
      00015E                        303 _UART_rx_off:
                                    304 ;	pdk_uart.c: 85: flag_rx_off = SU_TRUE;
      00015E 01 57                  305 	mov	a, #0x01
      000160 39 17                  306 	mov	_flag_rx_off+0, a
                                    307 ;	pdk_uart.c: 86: }
      000162 7A 00                  308 	ret
                                    309 ;	pdk_uart.c: 88: char UART_getchar(void)
                                    310 ;	-----------------------------------------
                                    311 ;	 function UART_getchar
                                    312 ;	-----------------------------------------
      000164                        313 _UART_getchar:
                                    314 ;	pdk_uart.c: 91: while (qout == qin)
      000164                        315 00101$:
      000164 38 1F                  316 	mov	a, _qout+0
      000166 36 2F                  317 	cneqsn	a, _qin+0
      000168 B2 60                  318 	goto	00101$
      00016A                        319 00120$:
                                    320 ;	pdk_uart.c: 94: ch = inbuf[qout];
      00016A 16 57                  321 	mov	a, #(_inbuf + 0)
      00016C 38 18                  322 	add	a, _qout+0
      00016E 00 17                  323 	mov	p, a
      000170 01 07                  324 	idxm	a, p
      000172 00 17                  325 	mov	p, a
                                    326 ;	pdk_uart.c: 95: if (++qout >= UART_IN_BUF_SIZE)
      000174 38 24                  327 	inc	_qout+0
      000176 38 1F                  328 	mov	a, _qout+0
      000178 20 51                  329 	sub	a, #0x20
      00017A 80 30                  330 	t0sn.io	f, c
      00017C C0 60                  331 	goto	00105$
                                    332 ;	pdk_uart.c: 97: qout = 0;
      00017E 38 26                  333 	clear	_qout+0
      000180                        334 00105$:
                                    335 ;	pdk_uart.c: 100: return (ch);
      000180 00 1F                  336 	mov	a, p
                                    337 ;	pdk_uart.c: 101: }
      000182 7A 00                  338 	ret
                                    339 ;	pdk_uart.c: 103: uint8_t UART_kbhit(void)
                                    340 ;	-----------------------------------------
                                    341 ;	 function UART_kbhit
                                    342 ;	-----------------------------------------
      000184                        343 _UART_kbhit:
                                    344 ;	pdk_uart.c: 105: return (qin != qout); // 0 neu giong 1 neu khac
      000184 36 1F                  345 	mov	a, _qin+0
      000186 38 2E                  346 	ceqsn	a, _qout+0
      000188 C7 60                  347 	goto	00103$
      00018A 01 57                  348 	mov	a, #0x01
      00018C C8 60                  349 	goto	00104$
      00018E                        350 00103$:
      00018E 00 57                  351 	mov	a, #0x00
      000190                        352 00104$:
      000190 01 56                  353 	xor	a, #0x01
                                    354 ;	pdk_uart.c: 106: }
      000192 7A 00                  355 	ret
                                    356 ;	pdk_uart.c: 108: void UART_flush_input_buffer(void)
                                    357 ;	-----------------------------------------
                                    358 ;	 function UART_flush_input_buffer
                                    359 ;	-----------------------------------------
      000194                        360 _UART_flush_input_buffer:
                                    361 ;	pdk_uart.c: 110: qin = 0;
      000194 36 26                  362 	clear	_qin+0
                                    363 ;	pdk_uart.c: 111: qout = 0;
      000196 38 26                  364 	clear	_qout+0
                                    365 ;	pdk_uart.c: 112: }
      000198 7A 00                  366 	ret
                                    367 ;	pdk_uart.c: 114: uint8_t UART_transmit_busy(void)
                                    368 ;	-----------------------------------------
                                    369 ;	 function UART_transmit_busy
                                    370 ;	-----------------------------------------
      00019A                        371 _UART_transmit_busy:
                                    372 ;	pdk_uart.c: 116: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
      00019A 3B 1F                  373 	mov	a, _flag_tx_busy+0
      00019C 01 52                  374 	ceqsn	a, #0x01
      00019E D3 60                  375 	goto	00103$
      0001A0 01 57                  376 	mov	a, #0x01
      0001A2 00 26                  377 	clear	p
      0001A4 D4 60                  378 	goto	00104$
      0001A6                        379 00103$:
      0001A6 00 57                  380 	mov	a, #0x00
      0001A8                        381 00104$:
                                    382 ;	pdk_uart.c: 117: }
      0001A8 7A 00                  383 	ret
                                    384 ;	pdk_uart.c: 119: void UART_putC(const char ch)
                                    385 ;	-----------------------------------------
                                    386 ;	 function UART_putC
                                    387 ;	-----------------------------------------
      0001AA                        388 _UART_putC:
                                    389 ;	pdk_uart.c: 121: while (flag_tx_busy == SU_TRUE)
      0001AA                        390 00101$:
      0001AA 3B 1F                  391 	mov	a, _flag_tx_busy+0
      0001AC 01 53                  392 	cneqsn	a, #0x01
      0001AE D5 60                  393 	goto	00101$
      0001B0                        394 00114$:
                                    395 ;	pdk_uart.c: 126: bits_left_in_tx = TX_NUM_OF_BITS;
      0001B0 0A 57                  396 	mov	a, #0x0a
      0001B2 3C 17                  397 	mov	_bits_left_in_tx+0, a
                                    398 ;	pdk_uart.c: 127: TIMER_ON;
      0001B4 04 3F                  399 	set1.io	__inten, #6
                                    400 ;	pdk_uart.c: 128: internal_tx_buffer = (ch << 1) | 0x200;
      0001B6 00 26                  401 	clear	p
      0001B8 3F 1F                  402 	mov	a, _UART_putC_PARM_1+0
      0001BA 6B 00                  403 	sl	a
      0001BC 00 2D                  404 	slc	p
      0001BE 80 4C                  405 	set1	p, #1
      0001C0 3D 17                  406 	mov	_internal_tx_buffer+0, a
      0001C2 00 1F                  407 	mov	a, p
      0001C4 3E 17                  408 	mov	_internal_tx_buffer+1, a
                                    409 ;	pdk_uart.c: 129: flag_tx_busy = SU_TRUE;
      0001C6 01 57                  410 	mov	a, #0x01
      0001C8 3B 17                  411 	mov	_flag_tx_busy+0, a
                                    412 ;	pdk_uart.c: 130: }
      0001CA 7A 00                  413 	ret
                                    414 ;	pdk_uart.c: 132: void UART_print(char *str)
                                    415 ;	-----------------------------------------
                                    416 ;	 function UART_print
                                    417 ;	-----------------------------------------
      0001CC                        418 _UART_print:
                                    419 ;	pdk_uart.c: 135: while (str[i] != '\0')
      0001CC 42 26                  420 	clear	_UART_print_sloc0_1_0+0
      0001CE 43 26                  421 	clear	_UART_print_sloc0_1_0+1
      0001D0                        422 00101$:
      0001D0 40 1F                  423 	mov	a, _UART_print_PARM_1+0
      0001D2 42 18                  424 	add	a, _UART_print_sloc0_1_0+0
      0001D4 00 17                  425 	mov	p, a
      0001D6 41 1F                  426 	mov	a, _UART_print_PARM_1+1
      0001D8 43 1A                  427 	addc	a, _UART_print_sloc0_1_0+1
      0001DA 7E 74                  428 	call	__gptrget
      0001DC 00 53                  429 	cneqsn	a, #0x00
      0001DE FB 60                  430 	goto	00104$
                                    431 ;	pdk_uart.c: 136: UART_putC(str[i++]);
      0001E0 40 1F                  432 	mov	a, _UART_print_PARM_1+0
      0001E2 42 18                  433 	add	a, _UART_print_sloc0_1_0+0
      0001E4 00 17                  434 	mov	p, a
      0001E6 41 1F                  435 	mov	a, _UART_print_PARM_1+1
      0001E8 43 1A                  436 	addc	a, _UART_print_sloc0_1_0+1
      0001EA 42 24                  437 	inc	_UART_print_sloc0_1_0+0
      0001EC 43 20                  438 	addc	_UART_print_sloc0_1_0+1
      0001EE 7E 74                  439 	call	__gptrget
      0001F0 3F 17                  440 	mov	_UART_putC_PARM_1+0, a
      0001F2 D5 70                  441 	call	_UART_putC
      0001F4 E8 60                  442 	goto	00101$
      0001F6                        443 00104$:
                                    444 ;	pdk_uart.c: 137: }
      0001F6 7A 00                  445 	ret
                                    446 ;	pdk_uart.c: 139: void UART_printNum(int num)
                                    447 ;	-----------------------------------------
                                    448 ;	 function UART_printNum
                                    449 ;	-----------------------------------------
      0001F8                        450 _UART_printNum:
                                    451 ;	pdk_uart.c: 142: if (num > 999)
      0001F8 E7 57                  452 	mov	a, #0xe7
      0001FA 44 19                  453 	sub	a, _UART_printNum_PARM_1+0
      0001FC 03 57                  454 	mov	a, #0x03
      0001FE 45 1B                  455 	subc	a, _UART_printNum_PARM_1+1
      000200 80 31                  456 	t0sn.io	f, ov
      000202 80 56                  457 	xor	a, #0x80
      000204 6B 00                  458 	sl	a
      000206 80 34                  459 	t1sn.io	f, c
      000208 3E 61                  460 	goto	00108$
                                    461 ;	pdk_uart.c: 144: dis[0] = num / 1000 + 48;
      00020A 44 1F                  462 	mov	a, _UART_printNum_PARM_1+0
      00020C B5 17                  463 	mov	__divsint_PARM_1+0, a
      00020E 45 1F                  464 	mov	a, _UART_printNum_PARM_1+1
      000210 B6 17                  465 	mov	__divsint_PARM_1+1, a
      000212 E8 57                  466 	mov	a, #0xe8
      000214 B7 17                  467 	mov	__divsint_PARM_2+0, a
      000216 03 57                  468 	mov	a, #0x03
      000218 B8 17                  469 	mov	__divsint_PARM_2+1, a
      00021A 1E 74                  470 	call	__divsint
      00021C 30 50                  471 	add	a, #0x30
      00021E 46 17                  472 	mov	_UART_printNum_dis_65536_53+0, a
                                    473 ;	pdk_uart.c: 145: dis[1] = (num / 100) % 10 + 48;
      000220 44 1F                  474 	mov	a, _UART_printNum_PARM_1+0
      000222 B5 17                  475 	mov	__divsint_PARM_1+0, a
      000224 45 1F                  476 	mov	a, _UART_printNum_PARM_1+1
      000226 B6 17                  477 	mov	__divsint_PARM_1+1, a
      000228 64 57                  478 	mov	a, #0x64
      00022A B7 17                  479 	mov	__divsint_PARM_2+0, a
      00022C B8 26                  480 	clear	__divsint_PARM_2+1
      00022E 1E 74                  481 	call	__divsint
      000230 A8 17                  482 	mov	__modsint_PARM_1+0, a
      000232 00 1F                  483 	mov	a, p
      000234 A9 17                  484 	mov	__modsint_PARM_1+1, a
      000236 0A 57                  485 	mov	a, #0x0a
      000238 AA 17                  486 	mov	__modsint_PARM_2+0, a
      00023A AB 26                  487 	clear	__modsint_PARM_2+1
      00023C B7 73                  488 	call	__modsint
      00023E 30 50                  489 	add	a, #0x30
      000240 47 17                  490 	mov	_UART_printNum_dis_65536_53+1, a
                                    491 ;	pdk_uart.c: 146: dis[2] = (num / 10) % 10 + 48;
      000242 44 1F                  492 	mov	a, _UART_printNum_PARM_1+0
      000244 B5 17                  493 	mov	__divsint_PARM_1+0, a
      000246 45 1F                  494 	mov	a, _UART_printNum_PARM_1+1
      000248 B6 17                  495 	mov	__divsint_PARM_1+1, a
      00024A 0A 57                  496 	mov	a, #0x0a
      00024C B7 17                  497 	mov	__divsint_PARM_2+0, a
      00024E B8 26                  498 	clear	__divsint_PARM_2+1
      000250 1E 74                  499 	call	__divsint
      000252 A8 17                  500 	mov	__modsint_PARM_1+0, a
      000254 00 1F                  501 	mov	a, p
      000256 A9 17                  502 	mov	__modsint_PARM_1+1, a
      000258 0A 57                  503 	mov	a, #0x0a
      00025A AA 17                  504 	mov	__modsint_PARM_2+0, a
      00025C AB 26                  505 	clear	__modsint_PARM_2+1
      00025E B7 73                  506 	call	__modsint
      000260 30 50                  507 	add	a, #0x30
      000262 48 17                  508 	mov	_UART_printNum_dis_65536_53+2, a
                                    509 ;	pdk_uart.c: 147: dis[3] = num % 10 + 48;
      000264 44 1F                  510 	mov	a, _UART_printNum_PARM_1+0
      000266 A8 17                  511 	mov	__modsint_PARM_1+0, a
      000268 45 1F                  512 	mov	a, _UART_printNum_PARM_1+1
      00026A A9 17                  513 	mov	__modsint_PARM_1+1, a
      00026C 0A 57                  514 	mov	a, #0x0a
      00026E AA 17                  515 	mov	__modsint_PARM_2+0, a
      000270 AB 26                  516 	clear	__modsint_PARM_2+1
      000272 B7 73                  517 	call	__modsint
      000274 30 50                  518 	add	a, #0x30
      000276 49 17                  519 	mov	_UART_printNum_dis_65536_53+3, a
                                    520 ;	pdk_uart.c: 148: dis[4] = '\0';
      000278 4A 26                  521 	clear	_UART_printNum_dis_65536_53+4
      00027A 91 61                  522 	goto	00109$
      00027C                        523 00108$:
                                    524 ;	pdk_uart.c: 150: else if (num > 99)
      00027C 63 57                  525 	mov	a, #0x63
      00027E 44 19                  526 	sub	a, _UART_printNum_PARM_1+0
      000280 00 57                  527 	mov	a, #0x00
      000282 45 1B                  528 	subc	a, _UART_printNum_PARM_1+1
      000284 80 31                  529 	t0sn.io	f, ov
      000286 80 56                  530 	xor	a, #0x80
      000288 6B 00                  531 	sl	a
      00028A 80 34                  532 	t1sn.io	f, c
      00028C 6E 61                  533 	goto	00105$
                                    534 ;	pdk_uart.c: 152: dis[0] = num / 100 + 48;
      00028E 44 1F                  535 	mov	a, _UART_printNum_PARM_1+0
      000290 B5 17                  536 	mov	__divsint_PARM_1+0, a
      000292 45 1F                  537 	mov	a, _UART_printNum_PARM_1+1
      000294 B6 17                  538 	mov	__divsint_PARM_1+1, a
      000296 64 57                  539 	mov	a, #0x64
      000298 B7 17                  540 	mov	__divsint_PARM_2+0, a
      00029A B8 26                  541 	clear	__divsint_PARM_2+1
      00029C 1E 74                  542 	call	__divsint
      00029E 30 50                  543 	add	a, #0x30
      0002A0 46 17                  544 	mov	_UART_printNum_dis_65536_53+0, a
                                    545 ;	pdk_uart.c: 153: dis[1] = (num / 10) % 10 + 48;
      0002A2 44 1F                  546 	mov	a, _UART_printNum_PARM_1+0
      0002A4 B5 17                  547 	mov	__divsint_PARM_1+0, a
      0002A6 45 1F                  548 	mov	a, _UART_printNum_PARM_1+1
      0002A8 B6 17                  549 	mov	__divsint_PARM_1+1, a
      0002AA 0A 57                  550 	mov	a, #0x0a
      0002AC B7 17                  551 	mov	__divsint_PARM_2+0, a
      0002AE B8 26                  552 	clear	__divsint_PARM_2+1
      0002B0 1E 74                  553 	call	__divsint
      0002B2 A8 17                  554 	mov	__modsint_PARM_1+0, a
      0002B4 00 1F                  555 	mov	a, p
      0002B6 A9 17                  556 	mov	__modsint_PARM_1+1, a
      0002B8 0A 57                  557 	mov	a, #0x0a
      0002BA AA 17                  558 	mov	__modsint_PARM_2+0, a
      0002BC AB 26                  559 	clear	__modsint_PARM_2+1
      0002BE B7 73                  560 	call	__modsint
      0002C0 30 50                  561 	add	a, #0x30
      0002C2 47 17                  562 	mov	_UART_printNum_dis_65536_53+1, a
                                    563 ;	pdk_uart.c: 154: dis[2] = num % 10 + 48;
      0002C4 44 1F                  564 	mov	a, _UART_printNum_PARM_1+0
      0002C6 A8 17                  565 	mov	__modsint_PARM_1+0, a
      0002C8 45 1F                  566 	mov	a, _UART_printNum_PARM_1+1
      0002CA A9 17                  567 	mov	__modsint_PARM_1+1, a
      0002CC 0A 57                  568 	mov	a, #0x0a
      0002CE AA 17                  569 	mov	__modsint_PARM_2+0, a
      0002D0 AB 26                  570 	clear	__modsint_PARM_2+1
      0002D2 B7 73                  571 	call	__modsint
      0002D4 30 50                  572 	add	a, #0x30
      0002D6 48 17                  573 	mov	_UART_printNum_dis_65536_53+2, a
                                    574 ;	pdk_uart.c: 155: dis[3] = '\0';
      0002D8 49 26                  575 	clear	_UART_printNum_dis_65536_53+3
      0002DA 91 61                  576 	goto	00109$
      0002DC                        577 00105$:
                                    578 ;	pdk_uart.c: 157: else if (num > 9)
      0002DC 09 57                  579 	mov	a, #0x09
      0002DE 44 19                  580 	sub	a, _UART_printNum_PARM_1+0
      0002E0 00 57                  581 	mov	a, #0x00
      0002E2 45 1B                  582 	subc	a, _UART_printNum_PARM_1+1
      0002E4 80 31                  583 	t0sn.io	f, ov
      0002E6 80 56                  584 	xor	a, #0x80
      0002E8 6B 00                  585 	sl	a
      0002EA 80 34                  586 	t1sn.io	f, c
      0002EC 8D 61                  587 	goto	00102$
                                    588 ;	pdk_uart.c: 159: dis[0] = num / 10 + 48;
      0002EE 44 1F                  589 	mov	a, _UART_printNum_PARM_1+0
      0002F0 B5 17                  590 	mov	__divsint_PARM_1+0, a
      0002F2 45 1F                  591 	mov	a, _UART_printNum_PARM_1+1
      0002F4 B6 17                  592 	mov	__divsint_PARM_1+1, a
      0002F6 0A 57                  593 	mov	a, #0x0a
      0002F8 B7 17                  594 	mov	__divsint_PARM_2+0, a
      0002FA B8 26                  595 	clear	__divsint_PARM_2+1
      0002FC 1E 74                  596 	call	__divsint
      0002FE 30 50                  597 	add	a, #0x30
      000300 46 17                  598 	mov	_UART_printNum_dis_65536_53+0, a
                                    599 ;	pdk_uart.c: 160: dis[1] = num % 10 + 48;
      000302 44 1F                  600 	mov	a, _UART_printNum_PARM_1+0
      000304 A8 17                  601 	mov	__modsint_PARM_1+0, a
      000306 45 1F                  602 	mov	a, _UART_printNum_PARM_1+1
      000308 A9 17                  603 	mov	__modsint_PARM_1+1, a
      00030A 0A 57                  604 	mov	a, #0x0a
      00030C AA 17                  605 	mov	__modsint_PARM_2+0, a
      00030E AB 26                  606 	clear	__modsint_PARM_2+1
      000310 B7 73                  607 	call	__modsint
      000312 30 50                  608 	add	a, #0x30
      000314 47 17                  609 	mov	_UART_printNum_dis_65536_53+1, a
                                    610 ;	pdk_uart.c: 161: dis[2] = '\0';
      000316 48 26                  611 	clear	_UART_printNum_dis_65536_53+2
      000318 91 61                  612 	goto	00109$
      00031A                        613 00102$:
                                    614 ;	pdk_uart.c: 165: dis[0] = num + 48;
      00031A 44 1F                  615 	mov	a, _UART_printNum_PARM_1+0
      00031C 30 50                  616 	add	a, #0x30
      00031E 46 17                  617 	mov	_UART_printNum_dis_65536_53+0, a
                                    618 ;	pdk_uart.c: 166: dis[1] = '\0';
      000320 47 26                  619 	clear	_UART_printNum_dis_65536_53+1
      000322                        620 00109$:
                                    621 ;	pdk_uart.c: 168: UART_print(dis);
      000322 46 57                  622 	mov	a, #(_UART_printNum_dis_65536_53 + 0)
      000324 40 17                  623 	mov	_UART_print_PARM_1+0, a
      000326 41 26                  624 	clear	_UART_print_PARM_1+1
      000328 E6 60                  625 	goto	_UART_print
                                    626 ;	pdk_uart.c: 169: }
      00032A 7A 00                  627 	ret
                                    628 ;	pdk_uart.c: 172: void TIM2_interrupt(void)
                                    629 ;	-----------------------------------------
                                    630 ;	 function TIM2_interrupt
                                    631 ;	-----------------------------------------
      00032C                        632 _TIM2_interrupt:
                                    633 ;	pdk_uart.c: 181: if (flag_tx_busy == SU_TRUE)
      00032C 3B 1F                  634 	mov	a, _flag_tx_busy+0
      00032E 01 52                  635 	ceqsn	a, #0x01
      000330 AC 61                  636 	goto	00107$
                                    637 ;	pdk_uart.c: 183: if (internal_tx_buffer & 0x01)
      000332 3E 1F                  638 	mov	a, _internal_tx_buffer+1
      000334 00 17                  639 	mov	p, a
      000336 3D 1F                  640 	mov	a, _internal_tx_buffer+0
      000338 01 54                  641 	and	a, #0x01
      00033A 00 53                  642 	cneqsn	a, #0x00
      00033C A1 61                  643 	goto	00102$
                                    644 ;	pdk_uart.c: 185: setb(UART_Px, UART_TX);
      00033E 93 3F                  645 	set1.io	__pb, #7
      000340 A2 61                  646 	goto	00103$
      000342                        647 00102$:
                                    648 ;	pdk_uart.c: 189: clrb(UART_Px, UART_TX);
      000342 93 3B                  649 	set0.io	__pb, #7
      000344                        650 00103$:
                                    651 ;	pdk_uart.c: 191: internal_tx_buffer >>= 1;
      000344 3E 2A                  652 	sr	_internal_tx_buffer+1
      000346 3D 2C                  653 	src	_internal_tx_buffer+0
                                    654 ;	pdk_uart.c: 192: if (--bits_left_in_tx == 0)
      000348 3C 1F                  655 	mov	a, _bits_left_in_tx+0
      00034A 01 51                  656 	sub	a, #0x01
      00034C 3C 17                  657 	mov	_bits_left_in_tx+0, a
      00034E 00 52                  658 	ceqsn	a, #0x00
      000350 AC 61                  659 	goto	00107$
                                    660 ;	pdk_uart.c: 194: flag_tx_busy = SU_FALSE;
      000352 3B 26                  661 	clear	_flag_tx_busy+0
                                    662 ;	pdk_uart.c: 195: TIMER_OFF;
      000354 04 3B                  663 	set0.io	__inten, #6
                                    664 ;	pdk_uart.c: 196: EXTERNAL_ON;
      000356 04 3C                  665 	set1.io	__inten, #0
      000358                        666 00107$:
                                    667 ;	pdk_uart.c: 201: if (flag_rx_off == SU_FALSE)
      000358 39 1F                  668 	mov	a, _flag_rx_off+0
      00035A 00 52                  669 	ceqsn	a, #0x00
      00035C DE 61                  670 	goto	00124$
                                    671 ;	pdk_uart.c: 203: if (flag_rx_waiting_for_stop_bit)
      00035E 4B 1F                  672 	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
      000360 00 53                  673 	cneqsn	a, #0x00
      000362 C5 61                  674 	goto	00120$
                                    675 ;	pdk_uart.c: 205: start_bit = 1;
      000364 01 57                  676 	mov	a, #0x01
      000366 37 17                  677 	mov	_start_bit+0, a
                                    678 ;	pdk_uart.c: 206: EXTERNAL_ON;
      000368 04 3C                  679 	set1.io	__inten, #0
                                    680 ;	pdk_uart.c: 207: flag_rx_waiting_for_stop_bit = SU_FALSE;
      00036A 4B 26                  681 	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
                                    682 ;	pdk_uart.c: 208: flag_rx_ready = SU_FALSE;
      00036C 3A 26                  683 	clear	_flag_rx_ready+0
                                    684 ;	pdk_uart.c: 209: inbuf[qin] = internal_rx_buffer;
      00036E 16 57                  685 	mov	a, #(_inbuf + 0)
      000370 36 18                  686 	add	a, _qin+0
      000372 00 17                  687 	mov	p, a
      000374 4E 1F                  688 	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_59+0
      000376 00 07                  689 	idxm	p, a
                                    690 ;	pdk_uart.c: 210: if (++qin >= UART_IN_BUF_SIZE)
      000378 36 1F                  691 	mov	a, _qin+0
      00037A 01 50                  692 	add	a, #0x01
      00037C 36 17                  693 	mov	_qin+0, a
      00037E 20 52                  694 	ceqsn	a, #0x20
      000380 00 00                  695 	nop
      000382 80 30                  696 	t0sn.io	f, c
      000384 DE 61                  697 	goto	00124$
                                    698 ;	pdk_uart.c: 212: qin = 0; // overflow - reset inbuf-index
      000386 36 26                  699 	clear	_qin+0
      000388 DE 61                  700 	goto	00124$
      00038A                        701 00120$:
                                    702 ;	pdk_uart.c: 217: if (flag_rx_ready == SU_FALSE)
      00038A 3A 1F                  703 	mov	a, _flag_rx_ready+0
      00038C 00 52                  704 	ceqsn	a, #0x00
      00038E D3 61                  705 	goto	00117$
                                    706 ;	pdk_uart.c: 219: if (start_bit == 0)
      000390 37 1F                  707 	mov	a, _start_bit+0
      000392 00 52                  708 	ceqsn	a, #0x00
      000394 DE 61                  709 	goto	00124$
                                    710 ;	pdk_uart.c: 221: flag_rx_ready = SU_TRUE;
      000396 01 57                  711 	mov	a, #0x01
      000398 3A 17                  712 	mov	_flag_rx_ready+0, a
                                    713 ;	pdk_uart.c: 222: internal_rx_buffer = 0;
      00039A 4E 26                  714 	clear	_TIM2_interrupt_internal_rx_buffer_65536_59+0
                                    715 ;	pdk_uart.c: 223: bits_left_in_rx = RX_NUM_OF_BITS;
      00039C 08 57                  716 	mov	a, #0x08
      00039E 4D 17                  717 	mov	_TIM2_interrupt_bits_left_in_rx_65536_59+0, a
                                    718 ;	pdk_uart.c: 224: rx_mask = 1;
      0003A0 01 57                  719 	mov	a, #0x01
      0003A2 4C 17                  720 	mov	_TIM2_interrupt_rx_mask_65536_59+0, a
      0003A4 DE 61                  721 	goto	00124$
      0003A6                        722 00117$:
                                    723 ;	pdk_uart.c: 230: if (UART_Px & (0x20))
      0003A6 93 01                  724 	mov.io	a, __pb
      0003A8 20 54                  725 	and	a, #0x20
      0003AA 00 53                  726 	cneqsn	a, #0x00
      0003AC D9 61                  727 	goto	00113$
                                    728 ;	pdk_uart.c: 232: internal_rx_buffer |= rx_mask;
      0003AE 4C 1F                  729 	mov	a, _TIM2_interrupt_rx_mask_65536_59+0
      0003B0 4E 15                  730 	or	_TIM2_interrupt_internal_rx_buffer_65536_59+0, a
      0003B2                        731 00113$:
                                    732 ;	pdk_uart.c: 234: rx_mask <<= 1;
      0003B2 4C 2B                  733 	sl	_TIM2_interrupt_rx_mask_65536_59+0
                                    734 ;	pdk_uart.c: 235: if (--bits_left_in_rx == 0)
      0003B4 4D 23                  735 	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_59+0
      0003B6 DE 61                  736 	goto	00124$
                                    737 ;	pdk_uart.c: 237: flag_rx_waiting_for_stop_bit = SU_TRUE;
      0003B8 01 57                  738 	mov	a, #0x01
      0003BA 4B 17                  739 	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0, a
      0003BC                        740 00124$:
                                    741 ;	pdk_uart.c: 242: }
      0003BC 7A 00                  742 	ret
                                    743 ;	pdk_uart.c: 245: void PB5_interrupt(void)
                                    744 ;	-----------------------------------------
                                    745 ;	 function PB5_interrupt
                                    746 ;	-----------------------------------------
      0003BE                        747 _PB5_interrupt:
                                    748 ;	pdk_uart.c: 247: TM2CT = 9;
      0003BE 09 57                  749 	mov	a, #0x09
      0003C0 31 01                  750 	mov.io	__tm2ct, a
                                    751 ;	pdk_uart.c: 248: TIMER_OFF;
      0003C2 04 3B                  752 	set0.io	__inten, #6
                                    753 ;	pdk_uart.c: 249: EXTERNAL_OFF;
      0003C4 04 38                  754 	set0.io	__inten, #0
                                    755 ;	pdk_uart.c: 250: start_bit = 0;
      0003C6 37 26                  756 	clear	_start_bit+0
                                    757 ;	pdk_uart.c: 252: INTRQ &= ~INTRQ_TM2;
      0003C8 05 3B                  758 	set0.io	__intrq, #6
                                    759 ;	pdk_uart.c: 253: TIMER_ON;
      0003CA 04 3F                  760 	set1.io	__inten, #6
                                    761 ;	pdk_uart.c: 254: }
      0003CC 7A 00                  762 	ret
                                    763 	.area CODE
                                    764 	.area CONST
                                    765 	.area CABS (ABS)
