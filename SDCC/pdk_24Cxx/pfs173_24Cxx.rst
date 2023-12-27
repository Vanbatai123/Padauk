                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_24Cxx
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
                                     19 	.globl _AT24C_readBuf
                                     20 	.globl _AT24C_writeBuf
                                     21 	.globl _I2C_begin
                                     22 	.globl _UART_printNum
                                     23 	.globl _PB5_interrupt
                                     24 	.globl _TIM2_interrupt
                                     25 	.globl _UART_print
                                     26 	.globl _UART_rx_off
                                     27 	.globl _UART_IO_config
                                     28 	.globl _UART_begin
                                     29 	.globl __delay_loop_32
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
                                     86 	.globl _arr2
                                     87 	.globl _arr
                                     88 ;--------------------------------------------------------
                                     89 ; special function registers
                                     90 ;--------------------------------------------------------
                                     91 	.area RSEG (ABS)
      000000                         92 	.org 0x0000
                           000000    93 __flag	=	0x0000
                           000002    94 __sp	=	0x0002
                           000003    95 __clkmd	=	0x0003
                           000004    96 __inten	=	0x0004
                           000005    97 __intrq	=	0x0005
                           000006    98 __t16m	=	0x0006
                           00000A    99 __eoscr	=	0x000a
                           00000B   100 __ihrcr	=	0x000b
                           00000C   101 __integs	=	0x000c
                           00000D   102 __padier	=	0x000d
                           00000E   103 __pbdier	=	0x000e
                           00000F   104 __pcdier	=	0x000f
                           000010   105 __pa	=	0x0010
                           000011   106 __pac	=	0x0011
                           000012   107 __paph	=	0x0012
                           000013   108 __pb	=	0x0013
                           000014   109 __pbc	=	0x0014
                           000015   110 __pbph	=	0x0015
                           000016   111 __pc	=	0x0016
                           000017   112 __pcc	=	0x0017
                           000018   113 __pcph	=	0x0018
                           000019   114 __pbpl	=	0x0019
                           00001A   115 __pcpl	=	0x001a
                           000020   116 __adcc	=	0x0020
                           000021   117 __adcm	=	0x0021
                           000022   118 __adcr	=	0x0022
                           000024   119 __adcrgc	=	0x0024
                           000026   120 __misc	=	0x0026
                           000027   121 __misc2	=	0x0027
                           000028   122 __misclvr	=	0x0028
                           00002B   123 __gpcc	=	0x002b
                           00002C   124 __gpcs	=	0x002c
                           000030   125 __tm2c	=	0x0030
                           000031   126 __tm2ct	=	0x0031
                           000032   127 __tm2s	=	0x0032
                           000033   128 __tm2b	=	0x0033
                           000034   129 __tm3c	=	0x0034
                           000035   130 __tm3ct	=	0x0035
                           000036   131 __tm3s	=	0x0036
                           000037   132 __tm3b	=	0x0037
                           000040   133 __pwmg0c	=	0x0040
                           000041   134 __pwmgclk	=	0x0041
                           000042   135 __pwmg0dth	=	0x0042
                           000043   136 __pwmg0dtl	=	0x0043
                           000044   137 __pwmgcubh	=	0x0044
                           000045   138 __pwmgcubl	=	0x0045
                           000046   139 __pwmg1c	=	0x0046
                           000048   140 __pwmg1dth	=	0x0048
                           000049   141 __pwmg1dtl	=	0x0049
                           00004C   142 __pwmg2c	=	0x004c
                           00004E   143 __pwmg2dth	=	0x004e
                           00004F   144 __pwmg2dtl	=	0x004f
                           000062   145 __ilrcr	=	0x0062
                           000063   146 __bgtr	=	0x0063
                           000067   147 __rop	=	0x0067
      000000                        148 __t16c::
      000000                        149 	.ds 2
                                    150 ;--------------------------------------------------------
                                    151 ; ram data
                                    152 ;--------------------------------------------------------
                                    153 	.area DATA
      000002                        154 _arr::
      000002                        155 	.ds 10
      00000C                        156 _arr2::
      00000C                        157 	.ds 10
                                    158 ;--------------------------------------------------------
                                    159 ; overlayable items in ram
                                    160 ;--------------------------------------------------------
                                    161 ;--------------------------------------------------------
                                    162 ; Stack segment in internal ram
                                    163 ;--------------------------------------------------------
                                    164 	.area	SSEG
      0000C6                        165 __start__stack:
      0000C6                        166 	.ds	1
                                    167 
                                    168 ;--------------------------------------------------------
                                    169 ; absolute external ram data
                                    170 ;--------------------------------------------------------
                                    171 	.area DABS (ABS)
                                    172 ;--------------------------------------------------------
                                    173 ; interrupt vector
                                    174 ;--------------------------------------------------------
                                    175 	.area HOME
      000022                        176 __interrupt_vect:
                                    177 	.area	HEADER (ABS)
      000020                        178 	.org	 0x0020
      000020 81 60                  179 	goto	_interrupt
                                    180 ;--------------------------------------------------------
                                    181 ; global & static initialisations
                                    182 ;--------------------------------------------------------
                                    183 	.area HOME
                                    184 	.area GSINIT
                                    185 	.area GSFINAL
                                    186 	.area GSINIT
                                    187 	.area	PREG (ABS)
      000000                        188 	.org 0x00
      000000                        189 p::
      000000                        190 	.ds 2
                                    191 	.area	HEADER (ABS)
      000000                        192 	.org 0x0000
      000000 00 00                  193 	nop
      000002 01 26                  194 	clear	p+1
      000004 C3 57                  195 	mov	a, #s_OSEG
      000006 04 50                  196 	add	a, #l_OSEG + 1
      000008 FE 54                  197 	and	a, #0xfe
      00000A 02 01                  198 	mov.io	sp, a
      00000C 32 70                  199 	call	__sdcc_external_startup
      00000E 12 60                  200 	goto	s_GSINIT
                                    201 	.area GSINIT
      000024                        202 __sdcc_init_data:
      000024 02 57                  203 	mov	a, #s_DATA
      000026 00 17                  204 	mov	p, a
      000028 19 60                  205 	goto	00002$
      00002A                        206 00001$:
      00002A 00 57                  207 	mov	a, #0x00
      00002C 00 07                  208 	idxm	p, a
      00002E 00 24                  209 	inc	p
      000030 02 57                  210 	mov	a, #s_DATA
      000032                        211 00002$:
      000032 C1 50                  212 	add	a, #l_DATA
      000034 00 2E                  213 	ceqsn	a, p
      000036 15 60                  214 	goto	00001$
                                    215 ;	pfs173_24Cxx.c: 20: uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
      000038 04 57                  216 	mov	a, #0x04
      00003A 02 17                  217 	mov	_arr+0, a
      00003C 32 57                  218 	mov	a, #0x32
      00003E 03 17                  219 	mov	_arr+1, a
      000040 0B 57                  220 	mov	a, #0x0b
      000042 04 17                  221 	mov	_arr+2, a
      000044 1E 57                  222 	mov	a, #0x1e
      000046 05 17                  223 	mov	_arr+3, a
      000048 06 57                  224 	mov	a, #0x06
      00004A 06 17                  225 	mov	_arr+4, a
      00004C 08 57                  226 	mov	a, #0x08
      00004E 07 17                  227 	mov	_arr+5, a
      000050 0B 57                  228 	mov	a, #0x0b
      000052 08 17                  229 	mov	_arr+6, a
      000054 09 26                  230 	clear	_arr+7
      000056 0A 26                  231 	clear	_arr+8
      000058 05 57                  232 	mov	a, #0x05
      00005A 0B 17                  233 	mov	_arr+9, a
                                    234 	.area GSFINAL
      000062 11 60                  235 	goto	__sdcc_program_startup
                                    236 ;--------------------------------------------------------
                                    237 ; Home
                                    238 ;--------------------------------------------------------
                                    239 	.area HOME
                                    240 	.area HOME
      000022                        241 __sdcc_program_startup:
      000022 3F 60                  242 	goto	_main
                                    243 ;	return from main will return to caller
                                    244 ;--------------------------------------------------------
                                    245 ; code
                                    246 ;--------------------------------------------------------
                                    247 	.area CODE
                                    248 ;	pfs173_24Cxx.c: 14: uint8_t _sdcc_external_startup(void)
                                    249 ;	-----------------------------------------
                                    250 ;	 function _sdcc_external_startup
                                    251 ;	-----------------------------------------
      000064                        252 __sdcc_external_startup:
                                    253 ;	pfs173_24Cxx.c: 16: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000064 34 57                  254 	mov	a, #0x34
      000066 03 01                  255 	mov.io	__clkmd, a
                                    256 ;	pfs173_24Cxx.c: 17: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      000068 52 54                  257 	and	a, #'R'                        
      00006A 43 54                  258 	and	a, #'C'                        
      00006C 01 54                  259 	and	a, #((1))          
      00006E 00 54                  260 	and	a, #((8000000))     
      000070 12 54                  261 	and	a, #((8000000)>>8)  
      000072 7A 54                  262 	and	a, #((8000000)>>16) 
      000074 00 54                  263 	and	a, #((8000000)>>24) 
      000076 88 54                  264 	and	a, #((5000))     
      000078 13 54                  265 	and	a, #((5000)>>8)  
      00007A 0B 54                  266 	and	a, #((0x0B))           
                                    267 ;	pfs173_24Cxx.c: 18: return 0;							  //perform normal initialization
                                    268 ;	pfs173_24Cxx.c: 19: }
      00007C 00 02                  269 	ret	#0x00
                                    270 ;	pfs173_24Cxx.c: 23: int main(void)
                                    271 ;	-----------------------------------------
                                    272 ;	 function main
                                    273 ;	-----------------------------------------
      00007E                        274 _main:
                                    275 ;	pfs173_24Cxx.c: 25: I2C_begin();
      00007E DB 72                  276 	call	_I2C_begin
                                    277 ;	pfs173_24Cxx.c: 26: UART_IO_config();
      000080 94 70                  278 	call	_UART_IO_config
                                    279 ;	pfs173_24Cxx.c: 27: UART_begin();
      000082 A4 70                  280 	call	_UART_begin
                                    281 ;	pfs173_24Cxx.c: 28: INTRQ = 0;
      000084 00 57                  282 	mov	a, #0x00
      000086 05 01                  283 	mov.io	__intrq, a
                                    284 ;	pfs173_24Cxx.c: 29: sei();
      000088 78 00                  285 	engint
                                    286 ;	pfs173_24Cxx.c: 30: UART_rx_off();
      00008A AF 70                  287 	call	_UART_rx_off
                                    288 ;	pfs173_24Cxx.c: 31: UART_print("\rOK\r");
      00008C 8A 57                  289 	mov	a, #<(___str_0 + 0)
      00008E 40 17                  290 	mov	_UART_print_PARM_1+0, a
      000090 84 57                  291 	mov	a, #>(___str_0 + 0x8000 + 0)
      000092 41 17                  292 	mov	_UART_print_PARM_1+1, a
      000094 E6 70                  293 	call	_UART_print
                                    294 ;	pfs173_24Cxx.c: 32: AT24C_writeBuf(0x0050, arr, 10);
      000096 02 57                  295 	mov	a, #(_arr + 0)
      000098 97 17                  296 	mov	_AT24C_writeBuf_PARM_2+0, a
      00009A 98 26                  297 	clear	_AT24C_writeBuf_PARM_2+1
      00009C 50 57                  298 	mov	a, #0x50
      00009E 95 17                  299 	mov	_AT24C_writeBuf_PARM_1+0, a
      0000A0 96 26                  300 	clear	_AT24C_writeBuf_PARM_1+1
      0000A2 0A 57                  301 	mov	a, #0x0a
      0000A4 99 17                  302 	mov	_AT24C_writeBuf_PARM_3+0, a
      0000A6 52 73                  303 	call	_AT24C_writeBuf
                                    304 ;	pfs173_24Cxx.c: 34: while (1)
      0000A8                        305 00102$:
                                    306 ;	pfs173_24Cxx.c: 36: AT24C_readBuf(0x0052, arr2, 10);
      0000A8 0C 57                  307 	mov	a, #(_arr2 + 0)
      0000AA 9F 17                  308 	mov	_AT24C_readBuf_PARM_2+0, a
      0000AC A0 26                  309 	clear	_AT24C_readBuf_PARM_2+1
      0000AE 52 57                  310 	mov	a, #0x52
      0000B0 9D 17                  311 	mov	_AT24C_readBuf_PARM_1+0, a
      0000B2 9E 26                  312 	clear	_AT24C_readBuf_PARM_1+1
      0000B4 0A 57                  313 	mov	a, #0x0a
      0000B6 A1 17                  314 	mov	_AT24C_readBuf_PARM_3+0, a
      0000B8 A2 26                  315 	clear	_AT24C_readBuf_PARM_3+1
      0000BA 80 73                  316 	call	_AT24C_readBuf
                                    317 ;	pfs173_24Cxx.c: 37: UART_printNum(arr2[7]);
      0000BC 13 1F                  318 	mov	a, _arr2+7
      0000BE 44 17                  319 	mov	_UART_printNum_PARM_1+0, a
      0000C0 45 26                  320 	clear	_UART_printNum_PARM_1+1
      0000C2 FC 70                  321 	call	_UART_printNum
                                    322 ;	pfs173_24Cxx.c: 38: UART_print("\r");
      0000C4 8F 57                  323 	mov	a, #<(___str_1 + 0)
      0000C6 40 17                  324 	mov	_UART_print_PARM_1+0, a
      0000C8 84 57                  325 	mov	a, #>(___str_1 + 0x8000 + 0)
      0000CA 41 17                  326 	mov	_UART_print_PARM_1+1, a
      0000CC E6 70                  327 	call	_UART_print
                                    328 ;	pfs173_24Cxx.c: 39: _delay_ms(900);
      0000CE BE 57                  329 	mov	a, #0xbe
      0000D0 88 17                  330 	mov	__delay_loop_32_PARM_1+0, a
      0000D2 27 57                  331 	mov	a, #0x27
      0000D4 89 17                  332 	mov	__delay_loop_32_PARM_1+1, a
      0000D6 09 57                  333 	mov	a, #0x09
      0000D8 8A 17                  334 	mov	__delay_loop_32_PARM_1+2, a
      0000DA 8B 26                  335 	clear	__delay_loop_32_PARM_1+3
      0000DC E9 72                  336 	call	__delay_loop_32
                                    337 ;	pfs173_24Cxx.c: 40: _delay_ms(900);
      0000DE BE 57                  338 	mov	a, #0xbe
      0000E0 88 17                  339 	mov	__delay_loop_32_PARM_1+0, a
      0000E2 27 57                  340 	mov	a, #0x27
      0000E4 89 17                  341 	mov	__delay_loop_32_PARM_1+1, a
      0000E6 09 57                  342 	mov	a, #0x09
      0000E8 8A 17                  343 	mov	__delay_loop_32_PARM_1+2, a
      0000EA 8B 26                  344 	clear	__delay_loop_32_PARM_1+3
      0000EC E9 72                  345 	call	__delay_loop_32
                                    346 ;	pfs173_24Cxx.c: 41: _delay_ms(900);
      0000EE BE 57                  347 	mov	a, #0xbe
      0000F0 88 17                  348 	mov	__delay_loop_32_PARM_1+0, a
      0000F2 27 57                  349 	mov	a, #0x27
      0000F4 89 17                  350 	mov	__delay_loop_32_PARM_1+1, a
      0000F6 09 57                  351 	mov	a, #0x09
      0000F8 8A 17                  352 	mov	__delay_loop_32_PARM_1+2, a
      0000FA 8B 26                  353 	clear	__delay_loop_32_PARM_1+3
      0000FC E9 72                  354 	call	__delay_loop_32
      0000FE 54 60                  355 	goto	00102$
                                    356 ;	pfs173_24Cxx.c: 43: }
      000100 7A 00                  357 	ret
                                    358 ;	pfs173_24Cxx.c: 46: void interrupt(void) __interrupt(0)
                                    359 ;	-----------------------------------------
                                    360 ;	 function interrupt
                                    361 ;	-----------------------------------------
      000102                        362 _interrupt:
      000102 72 00                  363 	push	af
      000104 00 1F                  364 	mov	a, p
      000106 72 00                  365 	push	af
                                    366 ;	pfs173_24Cxx.c: 49: if (INTRQ & INTRQ_TM2)
      000108 85 01                  367 	mov.io	a, __intrq
      00010A 40 54                  368 	and	a, #0x40
      00010C 00 53                  369 	cneqsn	a, #0x00
      00010E 8A 60                  370 	goto	00102$
                                    371 ;	pfs173_24Cxx.c: 51: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      000110 05 3B                  372 	set0.io	__intrq, #6
                                    373 ;	pfs173_24Cxx.c: 52: TIM2_interrupt();
      000112 96 71                  374 	call	_TIM2_interrupt
      000114                        375 00102$:
                                    376 ;	pfs173_24Cxx.c: 55: if (INTRQ & INTRQ_PB5)
      000114 85 01                  377 	mov.io	a, __intrq
      000116 01 54                  378 	and	a, #0x01
      000118 00 53                  379 	cneqsn	a, #0x00
      00011A 90 60                  380 	goto	00105$
                                    381 ;	pfs173_24Cxx.c: 57: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
      00011C 05 38                  382 	set0.io	__intrq, #0
                                    383 ;	pfs173_24Cxx.c: 58: PB5_interrupt();
      00011E DF 71                  384 	call	_PB5_interrupt
      000120                        385 00105$:
                                    386 ;	pfs173_24Cxx.c: 60: }
      000120 73 00                  387 	pop	af
      000122 00 17                  388 	mov	p, a
      000124 73 00                  389 	pop	af
      000126 7B 00                  390 	reti
                                    391 	.area CODE
                                    392 	.area CONST
                                    393 	.area CONST
      000914                        394 ___str_0:
      000914 0D 02                  395 	ret #0x0d
      000916 4F 02                  396 	ret #0x4f	; O
      000918 4B 02                  397 	ret #0x4b	; K
      00091A 0D 02                  398 	ret #0x0d
      00091C 00 02                  399 	ret #0x00
                                    400 	.area CODE
                                    401 	.area CONST
      00091E                        402 ___str_1:
      00091E 0D 02                  403 	ret #0x0d
      000920 00 02                  404 	ret #0x00
                                    405 	.area CODE
                                    406 	.area CABS (ABS)
