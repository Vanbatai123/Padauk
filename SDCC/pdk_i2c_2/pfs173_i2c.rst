                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_i2c
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
                                     19 	.globl _display2
                                     20 	.globl _DS1307_Set
                                     21 	.globl _DS1307_Read
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
                                     86 	.globl _aaa
                                     87 	.globl _i
                                     88 	.globl _u
                                     89 ;--------------------------------------------------------
                                     90 ; special function registers
                                     91 ;--------------------------------------------------------
                                     92 	.area RSEG (ABS)
      000000                         93 	.org 0x0000
                           000000    94 __flag	=	0x0000
                           000002    95 __sp	=	0x0002
                           000003    96 __clkmd	=	0x0003
                           000004    97 __inten	=	0x0004
                           000005    98 __intrq	=	0x0005
                           000006    99 __t16m	=	0x0006
                           00000A   100 __eoscr	=	0x000a
                           00000B   101 __ihrcr	=	0x000b
                           00000C   102 __integs	=	0x000c
                           00000D   103 __padier	=	0x000d
                           00000E   104 __pbdier	=	0x000e
                           00000F   105 __pcdier	=	0x000f
                           000010   106 __pa	=	0x0010
                           000011   107 __pac	=	0x0011
                           000012   108 __paph	=	0x0012
                           000013   109 __pb	=	0x0013
                           000014   110 __pbc	=	0x0014
                           000015   111 __pbph	=	0x0015
                           000016   112 __pc	=	0x0016
                           000017   113 __pcc	=	0x0017
                           000018   114 __pcph	=	0x0018
                           000019   115 __pbpl	=	0x0019
                           00001A   116 __pcpl	=	0x001a
                           000020   117 __adcc	=	0x0020
                           000021   118 __adcm	=	0x0021
                           000022   119 __adcr	=	0x0022
                           000024   120 __adcrgc	=	0x0024
                           000026   121 __misc	=	0x0026
                           000027   122 __misc2	=	0x0027
                           000028   123 __misclvr	=	0x0028
                           00002B   124 __gpcc	=	0x002b
                           00002C   125 __gpcs	=	0x002c
                           000030   126 __tm2c	=	0x0030
                           000031   127 __tm2ct	=	0x0031
                           000032   128 __tm2s	=	0x0032
                           000033   129 __tm2b	=	0x0033
                           000034   130 __tm3c	=	0x0034
                           000035   131 __tm3ct	=	0x0035
                           000036   132 __tm3s	=	0x0036
                           000037   133 __tm3b	=	0x0037
                           000040   134 __pwmg0c	=	0x0040
                           000041   135 __pwmgclk	=	0x0041
                           000042   136 __pwmg0dth	=	0x0042
                           000043   137 __pwmg0dtl	=	0x0043
                           000044   138 __pwmgcubh	=	0x0044
                           000045   139 __pwmgcubl	=	0x0045
                           000046   140 __pwmg1c	=	0x0046
                           000048   141 __pwmg1dth	=	0x0048
                           000049   142 __pwmg1dtl	=	0x0049
                           00004C   143 __pwmg2c	=	0x004c
                           00004E   144 __pwmg2dth	=	0x004e
                           00004F   145 __pwmg2dtl	=	0x004f
                           000062   146 __ilrcr	=	0x0062
                           000063   147 __bgtr	=	0x0063
                           000067   148 __rop	=	0x0067
      000000                        149 __t16c::
      000000                        150 	.ds 2
                                    151 ;--------------------------------------------------------
                                    152 ; ram data
                                    153 ;--------------------------------------------------------
                                    154 	.area DATA
      000002                        155 _u::
      000002                        156 	.ds 20
      000016                        157 _i::
      000016                        158 	.ds 2
      000018                        159 _aaa::
      000018                        160 	.ds 2
                                    161 ;--------------------------------------------------------
                                    162 ; overlayable items in ram
                                    163 ;--------------------------------------------------------
                                    164 ;--------------------------------------------------------
                                    165 ; Stack segment in internal ram
                                    166 ;--------------------------------------------------------
                                    167 	.area	SSEG
      000087                        168 __start__stack:
      000087                        169 	.ds	1
                                    170 
                                    171 ;--------------------------------------------------------
                                    172 ; absolute external ram data
                                    173 ;--------------------------------------------------------
                                    174 	.area DABS (ABS)
                                    175 ;--------------------------------------------------------
                                    176 ; interrupt vector
                                    177 ;--------------------------------------------------------
                                    178 	.area HOME
      000022                        179 __interrupt_vect:
                                    180 	.area	HEADER (ABS)
      000020                        181 	.org	 0x0020
      000020 98 60                  182 	goto	_interrupt
                                    183 ;--------------------------------------------------------
                                    184 ; global & static initialisations
                                    185 ;--------------------------------------------------------
                                    186 	.area HOME
                                    187 	.area GSINIT
                                    188 	.area GSFINAL
                                    189 	.area GSINIT
                                    190 	.area	PREG (ABS)
      000000                        191 	.org 0x00
      000000                        192 p::
      000000                        193 	.ds 2
                                    194 	.area	HEADER (ABS)
      000000                        195 	.org 0x0000
      000000 00 00                  196 	nop
      000002 01 26                  197 	clear	p+1
      000004 84 57                  198 	mov	a, #s_OSEG
      000006 04 50                  199 	add	a, #l_OSEG + 1
      000008 FE 54                  200 	and	a, #0xfe
      00000A 02 01                  201 	mov.io	sp, a
      00000C 66 70                  202 	call	__sdcc_external_startup
      00000E 12 60                  203 	goto	s_GSINIT
                                    204 	.area GSINIT
      000024                        205 __sdcc_init_data:
      000024 02 57                  206 	mov	a, #s_DATA
      000026 00 17                  207 	mov	p, a
      000028 19 60                  208 	goto	00002$
      00002A                        209 00001$:
      00002A 00 57                  210 	mov	a, #0x00
      00002C 00 07                  211 	idxm	p, a
      00002E 00 24                  212 	inc	p
      000030 02 57                  213 	mov	a, #s_DATA
      000032                        214 00002$:
      000032 82 50                  215 	add	a, #l_DATA
      000034 00 2E                  216 	ceqsn	a, p
      000036 15 60                  217 	goto	00001$
                                    218 ;	pfs173_i2c.c: 14: int i = 0;
      000038 16 26                  219 	clear	_i+0
      00003A 17 26                  220 	clear	_i+1
                                    221 ;	pfs173_i2c.c: 15: int aaa = 0;
      00003C 18 26                  222 	clear	_aaa+0
      00003E 19 26                  223 	clear	_aaa+1
                                    224 	.area GSFINAL
      000046 11 60                  225 	goto	__sdcc_program_startup
                                    226 ;--------------------------------------------------------
                                    227 ; Home
                                    228 ;--------------------------------------------------------
                                    229 	.area HOME
                                    230 	.area HOME
      000022                        231 __sdcc_program_startup:
      000022 73 60                  232 	goto	_main
                                    233 ;	return from main will return to caller
                                    234 ;--------------------------------------------------------
                                    235 ; code
                                    236 ;--------------------------------------------------------
                                    237 	.area CODE
                                    238 ;	pfs173_i2c.c: 17: void display2()
                                    239 ;	-----------------------------------------
                                    240 ;	 function display2
                                    241 ;	-----------------------------------------
      000048                        242 _display2:
                                    243 ;	pfs173_i2c.c: 19: UART_printNum(DS1307_Read(DS1307_DATE));
      000048 04 57                  244 	mov	a, #0x04
      00004A 5A 17                  245 	mov	_DS1307_Read_PARM_1+0, a
      00004C 61 72                  246 	call	_DS1307_Read
      00004E 48 17                  247 	mov	_UART_printNum_PARM_1+0, a
      000050 49 26                  248 	clear	_UART_printNum_PARM_1+1
      000052 13 71                  249 	call	_UART_printNum
                                    250 ;	pfs173_i2c.c: 20: UART_print("-");
      000054 88 57                  251 	mov	a, #<(___str_0 + 0)
      000056 44 17                  252 	mov	_UART_print_PARM_1+0, a
      000058 83 57                  253 	mov	a, #>(___str_0 + 0x8000 + 0)
      00005A 45 17                  254 	mov	_UART_print_PARM_1+1, a
      00005C FD 70                  255 	call	_UART_print
                                    256 ;	pfs173_i2c.c: 21: UART_printNum(DS1307_Read(DS1307_MONTH));
      00005E 05 57                  257 	mov	a, #0x05
      000060 5A 17                  258 	mov	_DS1307_Read_PARM_1+0, a
      000062 61 72                  259 	call	_DS1307_Read
      000064 48 17                  260 	mov	_UART_printNum_PARM_1+0, a
      000066 49 26                  261 	clear	_UART_printNum_PARM_1+1
      000068 13 71                  262 	call	_UART_printNum
                                    263 ;	pfs173_i2c.c: 22: UART_print("-");
      00006A 88 57                  264 	mov	a, #<(___str_0 + 0)
      00006C 44 17                  265 	mov	_UART_print_PARM_1+0, a
      00006E 83 57                  266 	mov	a, #>(___str_0 + 0x8000 + 0)
      000070 45 17                  267 	mov	_UART_print_PARM_1+1, a
      000072 FD 70                  268 	call	_UART_print
                                    269 ;	pfs173_i2c.c: 23: UART_printNum(DS1307_Read(DS1307_YEAR));
      000074 06 57                  270 	mov	a, #0x06
      000076 5A 17                  271 	mov	_DS1307_Read_PARM_1+0, a
      000078 61 72                  272 	call	_DS1307_Read
      00007A 48 17                  273 	mov	_UART_printNum_PARM_1+0, a
      00007C 49 26                  274 	clear	_UART_printNum_PARM_1+1
      00007E 13 71                  275 	call	_UART_printNum
                                    276 ;	pfs173_i2c.c: 24: UART_print("-");
      000080 88 57                  277 	mov	a, #<(___str_0 + 0)
      000082 44 17                  278 	mov	_UART_print_PARM_1+0, a
      000084 83 57                  279 	mov	a, #>(___str_0 + 0x8000 + 0)
      000086 45 17                  280 	mov	_UART_print_PARM_1+1, a
      000088 FD 70                  281 	call	_UART_print
                                    282 ;	pfs173_i2c.c: 25: UART_printNum(DS1307_Read(DS1307_HOUR));
      00008A 02 57                  283 	mov	a, #0x02
      00008C 5A 17                  284 	mov	_DS1307_Read_PARM_1+0, a
      00008E 61 72                  285 	call	_DS1307_Read
      000090 48 17                  286 	mov	_UART_printNum_PARM_1+0, a
      000092 49 26                  287 	clear	_UART_printNum_PARM_1+1
      000094 13 71                  288 	call	_UART_printNum
                                    289 ;	pfs173_i2c.c: 26: UART_print("-");
      000096 88 57                  290 	mov	a, #<(___str_0 + 0)
      000098 44 17                  291 	mov	_UART_print_PARM_1+0, a
      00009A 83 57                  292 	mov	a, #>(___str_0 + 0x8000 + 0)
      00009C 45 17                  293 	mov	_UART_print_PARM_1+1, a
      00009E FD 70                  294 	call	_UART_print
                                    295 ;	pfs173_i2c.c: 27: UART_printNum(DS1307_Read(DS1307_MIN));
      0000A0 01 57                  296 	mov	a, #0x01
      0000A2 5A 17                  297 	mov	_DS1307_Read_PARM_1+0, a
      0000A4 61 72                  298 	call	_DS1307_Read
      0000A6 48 17                  299 	mov	_UART_printNum_PARM_1+0, a
      0000A8 49 26                  300 	clear	_UART_printNum_PARM_1+1
      0000AA 13 71                  301 	call	_UART_printNum
                                    302 ;	pfs173_i2c.c: 28: UART_print("-");
      0000AC 88 57                  303 	mov	a, #<(___str_0 + 0)
      0000AE 44 17                  304 	mov	_UART_print_PARM_1+0, a
      0000B0 83 57                  305 	mov	a, #>(___str_0 + 0x8000 + 0)
      0000B2 45 17                  306 	mov	_UART_print_PARM_1+1, a
      0000B4 FD 70                  307 	call	_UART_print
                                    308 ;	pfs173_i2c.c: 29: UART_printNum(DS1307_Read(DS1307_SEC));
      0000B6 5A 26                  309 	clear	_DS1307_Read_PARM_1+0
      0000B8 61 72                  310 	call	_DS1307_Read
      0000BA 48 17                  311 	mov	_UART_printNum_PARM_1+0, a
      0000BC 49 26                  312 	clear	_UART_printNum_PARM_1+1
      0000BE 13 71                  313 	call	_UART_printNum
                                    314 ;	pfs173_i2c.c: 30: UART_print("\r");
      0000C0 8A 57                  315 	mov	a, #<(___str_1 + 0)
      0000C2 44 17                  316 	mov	_UART_print_PARM_1+0, a
      0000C4 83 57                  317 	mov	a, #>(___str_1 + 0x8000 + 0)
      0000C6 45 17                  318 	mov	_UART_print_PARM_1+1, a
      0000C8 FD 60                  319 	goto	_UART_print
                                    320 ;	pfs173_i2c.c: 31: }
      0000CA 7A 00                  321 	ret
                                    322 ;	pfs173_i2c.c: 32: uint8_t _sdcc_external_startup(void)
                                    323 ;	-----------------------------------------
                                    324 ;	 function _sdcc_external_startup
                                    325 ;	-----------------------------------------
      0000CC                        326 __sdcc_external_startup:
                                    327 ;	pfs173_i2c.c: 34: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      0000CC 34 57                  328 	mov	a, #0x34
      0000CE 03 01                  329 	mov.io	__clkmd, a
                                    330 ;	pfs173_i2c.c: 35: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      0000D0 52 54                  331 	and	a, #'R'                        
      0000D2 43 54                  332 	and	a, #'C'                        
      0000D4 01 54                  333 	and	a, #((1))          
      0000D6 00 54                  334 	and	a, #((8000000))     
      0000D8 12 54                  335 	and	a, #((8000000)>>8)  
      0000DA 7A 54                  336 	and	a, #((8000000)>>16) 
      0000DC 00 54                  337 	and	a, #((8000000)>>24) 
      0000DE 88 54                  338 	and	a, #((5000))     
      0000E0 13 54                  339 	and	a, #((5000)>>8)  
      0000E2 0B 54                  340 	and	a, #((0x0B))           
                                    341 ;	pfs173_i2c.c: 36: return 0;							  //perform normal initialization
                                    342 ;	pfs173_i2c.c: 37: }
      0000E4 00 02                  343 	ret	#0x00
                                    344 ;	pfs173_i2c.c: 39: int main(void)
                                    345 ;	-----------------------------------------
                                    346 ;	 function main
                                    347 ;	-----------------------------------------
      0000E6                        348 _main:
                                    349 ;	pfs173_i2c.c: 41: UART_IO_config();
      0000E6 AB 70                  350 	call	_UART_IO_config
                                    351 ;	pfs173_i2c.c: 42: UART_begin();
      0000E8 BB 70                  352 	call	_UART_begin
                                    353 ;	pfs173_i2c.c: 43: INTRQ = 0;
      0000EA 00 57                  354 	mov	a, #0x00
      0000EC 05 01                  355 	mov.io	__intrq, a
                                    356 ;	pfs173_i2c.c: 44: sei();
      0000EE 78 00                  357 	engint
                                    358 ;	pfs173_i2c.c: 45: UART_rx_off();
      0000F0 C6 70                  359 	call	_UART_rx_off
                                    360 ;	pfs173_i2c.c: 46: UART_print("\rOK\r");
      0000F2 8C 57                  361 	mov	a, #<(___str_2 + 0)
      0000F4 44 17                  362 	mov	_UART_print_PARM_1+0, a
      0000F6 83 57                  363 	mov	a, #>(___str_2 + 0x8000 + 0)
      0000F8 45 17                  364 	mov	_UART_print_PARM_1+1, a
      0000FA FD 70                  365 	call	_UART_print
                                    366 ;	pfs173_i2c.c: 48: PBC |= (1 << SDA);
      0000FC 14 3F                  367 	set1.io	__pbc, #6
                                    368 ;	pfs173_i2c.c: 49: PBC |= (1 << SCL);
      0000FE 94 3F                  369 	set1.io	__pbc, #7
                                    370 ;	pfs173_i2c.c: 50: DS1307_Set(1, 2, 3, 4, 5, 6);
      000100 01 57                  371 	mov	a, #0x01
      000102 5C 17                  372 	mov	_DS1307_Set_PARM_1+0, a
      000104 02 57                  373 	mov	a, #0x02
      000106 5D 17                  374 	mov	_DS1307_Set_PARM_2+0, a
      000108 03 57                  375 	mov	a, #0x03
      00010A 5E 17                  376 	mov	_DS1307_Set_PARM_3+0, a
      00010C 04 57                  377 	mov	a, #0x04
      00010E 5F 17                  378 	mov	_DS1307_Set_PARM_4+0, a
      000110 05 57                  379 	mov	a, #0x05
      000112 60 17                  380 	mov	_DS1307_Set_PARM_5+0, a
      000114 06 57                  381 	mov	a, #0x06
      000116 61 17                  382 	mov	_DS1307_Set_PARM_6+0, a
      000118 80 72                  383 	call	_DS1307_Set
                                    384 ;	pfs173_i2c.c: 52: while (1)
      00011A                        385 00102$:
                                    386 ;	pfs173_i2c.c: 54: display2();
      00011A 24 70                  387 	call	_display2
                                    388 ;	pfs173_i2c.c: 55: _delay_ms(1100);
      00011C 94 57                  389 	mov	a, #0x94
      00011E 65 17                  390 	mov	__delay_loop_32_PARM_1+0, a
      000120 30 57                  391 	mov	a, #0x30
      000122 66 17                  392 	mov	__delay_loop_32_PARM_1+1, a
      000124 0B 57                  393 	mov	a, #0x0b
      000126 67 17                  394 	mov	__delay_loop_32_PARM_1+2, a
      000128 68 26                  395 	clear	__delay_loop_32_PARM_1+3
      00012A A9 72                  396 	call	__delay_loop_32
      00012C 8D 60                  397 	goto	00102$
                                    398 ;	pfs173_i2c.c: 57: }
      00012E 7A 00                  399 	ret
                                    400 ;	pfs173_i2c.c: 60: void interrupt(void) __interrupt(0)
                                    401 ;	-----------------------------------------
                                    402 ;	 function interrupt
                                    403 ;	-----------------------------------------
      000130                        404 _interrupt:
      000130 72 00                  405 	push	af
      000132 00 1F                  406 	mov	a, p
      000134 72 00                  407 	push	af
                                    408 ;	pfs173_i2c.c: 63: if (INTRQ & INTRQ_TM2)
      000136 85 01                  409 	mov.io	a, __intrq
      000138 40 54                  410 	and	a, #0x40
      00013A 00 53                  411 	cneqsn	a, #0x00
      00013C A1 60                  412 	goto	00102$
                                    413 ;	pfs173_i2c.c: 65: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      00013E 05 3B                  414 	set0.io	__intrq, #6
                                    415 ;	pfs173_i2c.c: 66: TIM2_interrupt();
      000140 AD 71                  416 	call	_TIM2_interrupt
      000142                        417 00102$:
                                    418 ;	pfs173_i2c.c: 69: if (INTRQ & INTRQ_PB5)
      000142 85 01                  419 	mov.io	a, __intrq
      000144 01 54                  420 	and	a, #0x01
      000146 00 53                  421 	cneqsn	a, #0x00
      000148 A7 60                  422 	goto	00105$
                                    423 ;	pfs173_i2c.c: 71: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
      00014A 05 38                  424 	set0.io	__intrq, #0
                                    425 ;	pfs173_i2c.c: 72: PB5_interrupt();
      00014C F6 71                  426 	call	_PB5_interrupt
      00014E                        427 00105$:
                                    428 ;	pfs173_i2c.c: 74: }
      00014E 73 00                  429 	pop	af
      000150 00 17                  430 	mov	p, a
      000152 73 00                  431 	pop	af
      000154 7B 00                  432 	reti
                                    433 	.area CODE
                                    434 	.area CONST
                                    435 	.area CONST
      000710                        436 ___str_0:
      000710 2D 02                  437 	ret #0x2d	; -
      000712 00 02                  438 	ret #0x00
                                    439 	.area CODE
                                    440 	.area CONST
      000714                        441 ___str_1:
      000714 0D 02                  442 	ret #0x0d
      000716 00 02                  443 	ret #0x00
                                    444 	.area CODE
                                    445 	.area CONST
      000718                        446 ___str_2:
      000718 0D 02                  447 	ret #0x0d
      00071A 4F 02                  448 	ret #0x4f	; O
      00071C 4B 02                  449 	ret #0x4b	; K
      00071E 0D 02                  450 	ret #0x0d
      000720 00 02                  451 	ret #0x00
                                    452 	.area CODE
                                    453 	.area CABS (ABS)
