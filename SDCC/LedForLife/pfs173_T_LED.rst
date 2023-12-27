                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_T_LED
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
                                     19 	.globl _UART_printNum
                                     20 	.globl _PA4_interrupt
                                     21 	.globl _TIM2_interrupt
                                     22 	.globl _UART_print
                                     23 	.globl _UART_IO_config
                                     24 	.globl _UART_begin
                                     25 	.globl __delay_loop_32
                                     26 	.globl __t16c
                                     27 	.globl __rop
                                     28 	.globl __bgtr
                                     29 	.globl __ilrcr
                                     30 	.globl __pwmg2dtl
                                     31 	.globl __pwmg2dth
                                     32 	.globl __pwmg2c
                                     33 	.globl __pwmg1dtl
                                     34 	.globl __pwmg1dth
                                     35 	.globl __pwmg1c
                                     36 	.globl __pwmgcubl
                                     37 	.globl __pwmgcubh
                                     38 	.globl __pwmg0dtl
                                     39 	.globl __pwmg0dth
                                     40 	.globl __pwmgclk
                                     41 	.globl __pwmg0c
                                     42 	.globl __tm3b
                                     43 	.globl __tm3s
                                     44 	.globl __tm3ct
                                     45 	.globl __tm3c
                                     46 	.globl __tm2b
                                     47 	.globl __tm2s
                                     48 	.globl __tm2ct
                                     49 	.globl __tm2c
                                     50 	.globl __gpcs
                                     51 	.globl __gpcc
                                     52 	.globl __misclvr
                                     53 	.globl __misc2
                                     54 	.globl __misc
                                     55 	.globl __adcrgc
                                     56 	.globl __adcr
                                     57 	.globl __adcm
                                     58 	.globl __adcc
                                     59 	.globl __pcpl
                                     60 	.globl __pbpl
                                     61 	.globl __pcph
                                     62 	.globl __pcc
                                     63 	.globl __pc
                                     64 	.globl __pbph
                                     65 	.globl __pbc
                                     66 	.globl __pb
                                     67 	.globl __paph
                                     68 	.globl __pac
                                     69 	.globl __pa
                                     70 	.globl __pcdier
                                     71 	.globl __pbdier
                                     72 	.globl __padier
                                     73 	.globl __integs
                                     74 	.globl __ihrcr
                                     75 	.globl __eoscr
                                     76 	.globl __t16m
                                     77 	.globl __intrq
                                     78 	.globl __inten
                                     79 	.globl __clkmd
                                     80 	.globl __sp
                                     81 	.globl __flag
                                     82 	.globl _i
                                     83 	.globl _u
                                     84 	.globl _arr2
                                     85 	.globl _arr
                                     86 ;--------------------------------------------------------
                                     87 ; special function registers
                                     88 ;--------------------------------------------------------
                                     89 	.area RSEG (ABS)
      000000                         90 	.org 0x0000
                           000000    91 __flag	=	0x0000
                           000002    92 __sp	=	0x0002
                           000003    93 __clkmd	=	0x0003
                           000004    94 __inten	=	0x0004
                           000005    95 __intrq	=	0x0005
                           000006    96 __t16m	=	0x0006
                           00000A    97 __eoscr	=	0x000a
                           00000B    98 __ihrcr	=	0x000b
                           00000C    99 __integs	=	0x000c
                           00000D   100 __padier	=	0x000d
                           00000E   101 __pbdier	=	0x000e
                           00000F   102 __pcdier	=	0x000f
                           000010   103 __pa	=	0x0010
                           000011   104 __pac	=	0x0011
                           000012   105 __paph	=	0x0012
                           000013   106 __pb	=	0x0013
                           000014   107 __pbc	=	0x0014
                           000015   108 __pbph	=	0x0015
                           000016   109 __pc	=	0x0016
                           000017   110 __pcc	=	0x0017
                           000018   111 __pcph	=	0x0018
                           000019   112 __pbpl	=	0x0019
                           00001A   113 __pcpl	=	0x001a
                           000020   114 __adcc	=	0x0020
                           000021   115 __adcm	=	0x0021
                           000022   116 __adcr	=	0x0022
                           000024   117 __adcrgc	=	0x0024
                           000026   118 __misc	=	0x0026
                           000027   119 __misc2	=	0x0027
                           000028   120 __misclvr	=	0x0028
                           00002B   121 __gpcc	=	0x002b
                           00002C   122 __gpcs	=	0x002c
                           000030   123 __tm2c	=	0x0030
                           000031   124 __tm2ct	=	0x0031
                           000032   125 __tm2s	=	0x0032
                           000033   126 __tm2b	=	0x0033
                           000034   127 __tm3c	=	0x0034
                           000035   128 __tm3ct	=	0x0035
                           000036   129 __tm3s	=	0x0036
                           000037   130 __tm3b	=	0x0037
                           000040   131 __pwmg0c	=	0x0040
                           000041   132 __pwmgclk	=	0x0041
                           000042   133 __pwmg0dth	=	0x0042
                           000043   134 __pwmg0dtl	=	0x0043
                           000044   135 __pwmgcubh	=	0x0044
                           000045   136 __pwmgcubl	=	0x0045
                           000046   137 __pwmg1c	=	0x0046
                           000048   138 __pwmg1dth	=	0x0048
                           000049   139 __pwmg1dtl	=	0x0049
                           00004C   140 __pwmg2c	=	0x004c
                           00004E   141 __pwmg2dth	=	0x004e
                           00004F   142 __pwmg2dtl	=	0x004f
                           000062   143 __ilrcr	=	0x0062
                           000063   144 __bgtr	=	0x0063
                           000067   145 __rop	=	0x0067
      000000                        146 __t16c::
      000000                        147 	.ds 2
                                    148 ;--------------------------------------------------------
                                    149 ; ram data
                                    150 ;--------------------------------------------------------
                                    151 	.area DATA
      000002                        152 _arr::
      000002                        153 	.ds 10
      00000C                        154 _arr2::
      00000C                        155 	.ds 10
      000016                        156 _u::
      000016                        157 	.ds 20
      00002A                        158 _i::
      00002A                        159 	.ds 2
                                    160 ;--------------------------------------------------------
                                    161 ; overlayable items in ram
                                    162 ;--------------------------------------------------------
                                    163 ;--------------------------------------------------------
                                    164 ; Stack segment in internal ram
                                    165 ;--------------------------------------------------------
                                    166 	.area	SSEG
      0000E3                        167 __start__stack:
      0000E3                        168 	.ds	1
                                    169 
                                    170 ;--------------------------------------------------------
                                    171 ; absolute external ram data
                                    172 ;--------------------------------------------------------
                                    173 	.area DABS (ABS)
                                    174 ;--------------------------------------------------------
                                    175 ; interrupt vector
                                    176 ;--------------------------------------------------------
                                    177 	.area HOME
      000022                        178 __interrupt_vect:
                                    179 	.area	HEADER (ABS)
      000020                        180 	.org	 0x0020
      000020 6E 60                  181 	goto	_interrupt
                                    182 ;--------------------------------------------------------
                                    183 ; global & static initialisations
                                    184 ;--------------------------------------------------------
                                    185 	.area HOME
                                    186 	.area GSINIT
                                    187 	.area GSFINAL
                                    188 	.area GSINIT
                                    189 	.area	PREG (ABS)
      000000                        190 	.org 0x00
      000000                        191 p::
      000000                        192 	.ds 2
                                    193 	.area	HEADER (ABS)
      000000                        194 	.org 0x0000
      000000 00 00                  195 	nop
      000002 01 26                  196 	clear	p+1
      000004 E0 57                  197 	mov	a, #s_OSEG
      000006 04 50                  198 	add	a, #l_OSEG + 1
      000008 FE 54                  199 	and	a, #0xfe
      00000A 02 01                  200 	mov.io	sp, a
      00000C 34 70                  201 	call	__sdcc_external_startup
      00000E 12 60                  202 	goto	s_GSINIT
                                    203 	.area GSINIT
      000024                        204 __sdcc_init_data:
      000024 02 57                  205 	mov	a, #s_DATA
      000026 00 17                  206 	mov	p, a
      000028 19 60                  207 	goto	00002$
      00002A                        208 00001$:
      00002A 00 57                  209 	mov	a, #0x00
      00002C 00 07                  210 	idxm	p, a
      00002E 00 24                  211 	inc	p
      000030 02 57                  212 	mov	a, #s_DATA
      000032                        213 00002$:
      000032 DE 50                  214 	add	a, #l_DATA
      000034 00 2E                  215 	ceqsn	a, p
      000036 15 60                  216 	goto	00001$
                                    217 ;	pfs173_T_LED.c: 20: uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
      000038 04 57                  218 	mov	a, #0x04
      00003A 02 17                  219 	mov	_arr+0, a
      00003C 32 57                  220 	mov	a, #0x32
      00003E 03 17                  221 	mov	_arr+1, a
      000040 0B 57                  222 	mov	a, #0x0b
      000042 04 17                  223 	mov	_arr+2, a
      000044 1E 57                  224 	mov	a, #0x1e
      000046 05 17                  225 	mov	_arr+3, a
      000048 06 57                  226 	mov	a, #0x06
      00004A 06 17                  227 	mov	_arr+4, a
      00004C 08 57                  228 	mov	a, #0x08
      00004E 07 17                  229 	mov	_arr+5, a
      000050 0B 57                  230 	mov	a, #0x0b
      000052 08 17                  231 	mov	_arr+6, a
      000054 09 26                  232 	clear	_arr+7
      000056 0A 26                  233 	clear	_arr+8
      000058 05 57                  234 	mov	a, #0x05
      00005A 0B 17                  235 	mov	_arr+9, a
                                    236 ;	pfs173_T_LED.c: 24: int i = 0;
      00005C 2A 26                  237 	clear	_i+0
      00005E 2B 26                  238 	clear	_i+1
                                    239 	.area GSFINAL
      000066 11 60                  240 	goto	__sdcc_program_startup
                                    241 ;--------------------------------------------------------
                                    242 ; Home
                                    243 ;--------------------------------------------------------
                                    244 	.area HOME
                                    245 	.area HOME
      000022                        246 __sdcc_program_startup:
      000022 41 60                  247 	goto	_main
                                    248 ;	return from main will return to caller
                                    249 ;--------------------------------------------------------
                                    250 ; code
                                    251 ;--------------------------------------------------------
                                    252 	.area CODE
                                    253 ;	pfs173_T_LED.c: 14: uint8_t _sdcc_external_startup(void)
                                    254 ;	-----------------------------------------
                                    255 ;	 function _sdcc_external_startup
                                    256 ;	-----------------------------------------
      000068                        257 __sdcc_external_startup:
                                    258 ;	pfs173_T_LED.c: 16: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000068 34 57                  259 	mov	a, #0x34
      00006A 03 01                  260 	mov.io	__clkmd, a
                                    261 ;	pfs173_T_LED.c: 17: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      00006C 52 54                  262 	and	a, #'R'                        
      00006E 43 54                  263 	and	a, #'C'                        
      000070 01 54                  264 	and	a, #((1))          
      000072 00 54                  265 	and	a, #((8000000))     
      000074 12 54                  266 	and	a, #((8000000)>>8)  
      000076 7A 54                  267 	and	a, #((8000000)>>16) 
      000078 00 54                  268 	and	a, #((8000000)>>24) 
      00007A 88 54                  269 	and	a, #((5000))     
      00007C 13 54                  270 	and	a, #((5000)>>8)  
      00007E 0B 54                  271 	and	a, #((0x0B))           
                                    272 ;	pfs173_T_LED.c: 18: return 0;							  //perform normal initialization
                                    273 ;	pfs173_T_LED.c: 19: }
      000080 00 02                  274 	ret	#0x00
                                    275 ;	pfs173_T_LED.c: 25: int main(void)
                                    276 ;	-----------------------------------------
                                    277 ;	 function main
                                    278 ;	-----------------------------------------
      000082                        279 _main:
                                    280 ;	pfs173_T_LED.c: 28: UART_IO_config();
      000082 81 70                  281 	call	_UART_IO_config
                                    282 ;	pfs173_T_LED.c: 29: UART_begin();
      000084 91 70                  283 	call	_UART_begin
                                    284 ;	pfs173_T_LED.c: 30: INTRQ = 0;
      000086 00 57                  285 	mov	a, #0x00
      000088 05 01                  286 	mov.io	__intrq, a
                                    287 ;	pfs173_T_LED.c: 31: sei();
      00008A 78 00                  288 	engint
                                    289 ;	pfs173_T_LED.c: 33: UART_print("\rOK\r");
      00008C A5 57                  290 	mov	a, #<(___str_0 + 0)
      00008E 56 17                  291 	mov	_UART_print_PARM_1+0, a
      000090 84 57                  292 	mov	a, #>(___str_0 + 0x8000 + 0)
      000092 57 17                  293 	mov	_UART_print_PARM_1+1, a
      000094 D3 70                  294 	call	_UART_print
                                    295 ;	pfs173_T_LED.c: 36: while (1)
      000096                        296 00102$:
                                    297 ;	pfs173_T_LED.c: 39: UART_printNum(arr2[5]);
      000096 11 1F                  298 	mov	a, _arr2+5
      000098 5A 17                  299 	mov	_UART_printNum_PARM_1+0, a
      00009A 5B 26                  300 	clear	_UART_printNum_PARM_1+1
      00009C E9 70                  301 	call	_UART_printNum
                                    302 ;	pfs173_T_LED.c: 40: UART_print("\r");
      00009E AA 57                  303 	mov	a, #<(___str_1 + 0)
      0000A0 56 17                  304 	mov	_UART_print_PARM_1+0, a
      0000A2 84 57                  305 	mov	a, #>(___str_1 + 0x8000 + 0)
      0000A4 57 17                  306 	mov	_UART_print_PARM_1+1, a
      0000A6 D3 70                  307 	call	_UART_print
                                    308 ;	pfs173_T_LED.c: 41: _delay_ms(900);
      0000A8 BE 57                  309 	mov	a, #0xbe
      0000AA 9E 17                  310 	mov	__delay_loop_32_PARM_1+0, a
      0000AC 27 57                  311 	mov	a, #0x27
      0000AE 9F 17                  312 	mov	__delay_loop_32_PARM_1+1, a
      0000B0 09 57                  313 	mov	a, #0x09
      0000B2 A0 17                  314 	mov	__delay_loop_32_PARM_1+2, a
      0000B4 A1 26                  315 	clear	__delay_loop_32_PARM_1+3
      0000B6 D8 72                  316 	call	__delay_loop_32
                                    317 ;	pfs173_T_LED.c: 42: _delay_ms(900);
      0000B8 BE 57                  318 	mov	a, #0xbe
      0000BA 9E 17                  319 	mov	__delay_loop_32_PARM_1+0, a
      0000BC 27 57                  320 	mov	a, #0x27
      0000BE 9F 17                  321 	mov	__delay_loop_32_PARM_1+1, a
      0000C0 09 57                  322 	mov	a, #0x09
      0000C2 A0 17                  323 	mov	__delay_loop_32_PARM_1+2, a
      0000C4 A1 26                  324 	clear	__delay_loop_32_PARM_1+3
      0000C6 D8 72                  325 	call	__delay_loop_32
                                    326 ;	pfs173_T_LED.c: 43: _delay_ms(900);
      0000C8 BE 57                  327 	mov	a, #0xbe
      0000CA 9E 17                  328 	mov	__delay_loop_32_PARM_1+0, a
      0000CC 27 57                  329 	mov	a, #0x27
      0000CE 9F 17                  330 	mov	__delay_loop_32_PARM_1+1, a
      0000D0 09 57                  331 	mov	a, #0x09
      0000D2 A0 17                  332 	mov	__delay_loop_32_PARM_1+2, a
      0000D4 A1 26                  333 	clear	__delay_loop_32_PARM_1+3
      0000D6 D8 72                  334 	call	__delay_loop_32
      0000D8 4B 60                  335 	goto	00102$
                                    336 ;	pfs173_T_LED.c: 55: }
      0000DA 7A 00                  337 	ret
                                    338 ;	pfs173_T_LED.c: 58: void interrupt(void) __interrupt(0)
                                    339 ;	-----------------------------------------
                                    340 ;	 function interrupt
                                    341 ;	-----------------------------------------
      0000DC                        342 _interrupt:
      0000DC 72 00                  343 	push	af
      0000DE 00 1F                  344 	mov	a, p
      0000E0 72 00                  345 	push	af
                                    346 ;	pfs173_T_LED.c: 61: if (INTRQ & INTRQ_TM2)
      0000E2 85 01                  347 	mov.io	a, __intrq
      0000E4 40 54                  348 	and	a, #0x40
      0000E6 00 53                  349 	cneqsn	a, #0x00
      0000E8 77 60                  350 	goto	00102$
                                    351 ;	pfs173_T_LED.c: 63: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      0000EA 05 3B                  352 	set0.io	__intrq, #6
                                    353 ;	pfs173_T_LED.c: 64: TIM2_interrupt();
      0000EC 83 71                  354 	call	_TIM2_interrupt
      0000EE                        355 00102$:
                                    356 ;	pfs173_T_LED.c: 67: if (INTRQ & INTRQ_PA4)
      0000EE 85 01                  357 	mov.io	a, __intrq
      0000F0 02 54                  358 	and	a, #0x02
      0000F2 00 53                  359 	cneqsn	a, #0x00
      0000F4 7D 60                  360 	goto	00105$
                                    361 ;	pfs173_T_LED.c: 69: INTRQ &= ~INTRQ_PA4; // Mark TM2 interrupt request processed
      0000F6 85 38                  362 	set0.io	__intrq, #1
                                    363 ;	pfs173_T_LED.c: 70: PA4_interrupt();
      0000F8 CE 71                  364 	call	_PA4_interrupt
      0000FA                        365 00105$:
                                    366 ;	pfs173_T_LED.c: 72: }
      0000FA 73 00                  367 	pop	af
      0000FC 00 17                  368 	mov	p, a
      0000FE 73 00                  369 	pop	af
      000100 7B 00                  370 	reti
                                    371 	.area CODE
                                    372 	.area CONST
                                    373 	.area CONST
      00094A                        374 ___str_0:
      00094A 0D 02                  375 	ret #0x0d
      00094C 4F 02                  376 	ret #0x4f	; O
      00094E 4B 02                  377 	ret #0x4b	; K
      000950 0D 02                  378 	ret #0x0d
      000952 00 02                  379 	ret #0x00
                                    380 	.area CODE
                                    381 	.area CONST
      000954                        382 ___str_1:
      000954 0D 02                  383 	ret #0x0d
      000956 00 02                  384 	ret #0x00
                                    385 	.area CODE
                                    386 	.area CABS (ABS)
