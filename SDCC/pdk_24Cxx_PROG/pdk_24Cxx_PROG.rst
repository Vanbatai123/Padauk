                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_24Cxx_PROG
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
                                     17 	.globl _TIM3_interrupt
                                     18 	.globl _main
                                     19 	.globl _readline
                                     20 	.globl __sdcc_external_startup
                                     21 	.globl _I2C_begin
                                     22 	.globl _PA4_interrupt
                                     23 	.globl _TIM2_interrupt
                                     24 	.globl _UART_print
                                     25 	.globl _UART_IO_config
                                     26 	.globl _UART_getchar
                                     27 	.globl _UART_kbhit
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
                                     86 	.globl _hex_address
                                     87 	.globl _hex_byteCount
                                     88 	.globl _newline
                                     89 	.globl _ret
                                     90 	.globl _temp
                                     91 	.globl _aaa
                                     92 	.globl _i
                                     93 	.globl _u
                                     94 	.globl _arr2
                                     95 	.globl _arr
                                     96 ;--------------------------------------------------------
                                     97 ; special function registers
                                     98 ;--------------------------------------------------------
                                     99 	.area RSEG (ABS)
      000000                        100 	.org 0x0000
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
      000000                        156 __t16c::
      000000                        157 	.ds 2
                                    158 ;--------------------------------------------------------
                                    159 ; ram data
                                    160 ;--------------------------------------------------------
                                    161 	.area DATA
      000002                        162 _arr::
      000002                        163 	.ds 10
      00000C                        164 _arr2::
      00000C                        165 	.ds 10
      000016                        166 _u::
      000016                        167 	.ds 22
      00002C                        168 _i::
      00002C                        169 	.ds 2
      00002E                        170 _aaa::
      00002E                        171 	.ds 1
      00002F                        172 _temp::
      00002F                        173 	.ds 1
      000030                        174 _ret::
      000030                        175 	.ds 1
      000031                        176 _newline::
      000031                        177 	.ds 1
      000032                        178 _hex_byteCount::
      000032                        179 	.ds 1
      000033                        180 _hex_address::
      000033                        181 	.ds 2
      000035                        182 _readline_sloc0_1_0:
      000035                        183 	.ds 1
      000036                        184 _readline_sloc1_1_0:
      000036                        185 	.ds 1
      000037                        186 _readline_sloc2_1_0:
      000037                        187 	.ds 1
                                    188 ;--------------------------------------------------------
                                    189 ; overlayable items in ram 
                                    190 ;--------------------------------------------------------
                                    191 ;--------------------------------------------------------
                                    192 ; Stack segment in internal ram 
                                    193 ;--------------------------------------------------------
                                    194 	.area	SSEG
      FFFFFF                        195 __start__stack:
      FFFFFF                        196 	.ds	1
                                    197 
                                    198 ;--------------------------------------------------------
                                    199 ; absolute external ram data
                                    200 ;--------------------------------------------------------
                                    201 	.area DABS (ABS)
                                    202 ;--------------------------------------------------------
                                    203 ; interrupt vector 
                                    204 ;--------------------------------------------------------
                                    205 	.area HOME
      000022                        206 __interrupt_vect:
                                    207 	.area	HEADER (ABS)
      000020                        208 	.org	 0x0020
      000020 D1 60                  209 	goto	_interrupt
                                    210 ;--------------------------------------------------------
                                    211 ; global & static initialisations
                                    212 ;--------------------------------------------------------
                                    213 	.area HOME
                                    214 	.area GSINIT
                                    215 	.area GSFINAL
                                    216 	.area GSINIT
                                    217 	.area	PREG (ABS)
      000000                        218 	.org 0x00
      000000                        219 p::
      000000                        220 	.ds 2
                                    221 	.area	HEADER (ABS)
      000000                        222 	.org 0x0000
      000000 00 00                  223 	nop
      000002 01 26                  224 	clear	p+1
      000004 EC 57                  225 	mov	a, #s_OSEG
      000006 04 50                  226 	add	a, #l_OSEG + 1
      000008 FE 54                  227 	and	a, #0xfe
      00000A 02 01                  228 	mov	sp, a
      00000C 42 70                  229 	call	__sdcc_external_startup
      00000E 12 60                  230 	goto	__sdcc_gs_init_startup
                                    231 	.area GSINIT
      000024                        232 __sdcc_gs_init_startup:
      000024                        233 __sdcc_init_data:
      000024 02 57                  234 	mov	a, #s_DATA
      000026 00 17                  235 	mov	p, a
      000028 19 60                  236 	goto	00002$
      00002A                        237 00001$:
      00002A 00 57                  238 	mov	a, #0x00
      00002C 00 07                  239 	idxm	p, a
      00002E 00 24                  240 	inc	p
      000030 02 57                  241 	mov	a, #s_DATA
      000032                        242 00002$:
      000032 EA 50                  243 	add	a, #l_DATA
      000034 00 2E                  244 	ceqsn	a, p
      000036 15 60                  245 	goto	00001$
                                    246 ;	pdk_24Cxx_PROG.c: 32: uint8_t arr[] = {4, 50, 11, 30, 6, 8, 11, 0, 0, 5};
      000038 04 57                  247 	mov	a, #0x04
      00003A 02 17                  248 	mov	_arr+0, a
      00003C 32 57                  249 	mov	a, #0x32
      00003E 03 17                  250 	mov	_arr+1, a
      000040 0B 57                  251 	mov	a, #0x0b
      000042 04 17                  252 	mov	_arr+2, a
      000044 1E 57                  253 	mov	a, #0x1e
      000046 05 17                  254 	mov	_arr+3, a
      000048 06 57                  255 	mov	a, #0x06
      00004A 06 17                  256 	mov	_arr+4, a
      00004C 08 57                  257 	mov	a, #0x08
      00004E 07 17                  258 	mov	_arr+5, a
      000050 0B 57                  259 	mov	a, #0x0b
      000052 08 17                  260 	mov	_arr+6, a
      000054 09 26                  261 	clear	_arr+7
      000056 0A 26                  262 	clear	_arr+8
      000058 05 57                  263 	mov	a, #0x05
      00005A 0B 17                  264 	mov	_arr+9, a
                                    265 ;	pdk_24Cxx_PROG.c: 36: int i = 0;
      00005C 2C 26                  266 	clear	_i+0
      00005E 2D 26                  267 	clear	_i+1
                                    268 ;	pdk_24Cxx_PROG.c: 37: uint8_t aaa = 0, temp = 0, ret = 0, newline = 0;
      000060 2E 26                  269 	clear	_aaa+0
                                    270 ;	pdk_24Cxx_PROG.c: 37: uint8_t hex_byteCount;
      000062 2F 26                  271 	clear	_temp+0
                                    272 ;	pdk_24Cxx_PROG.c: 37: uint8_t aaa = 0, temp = 0, ret = 0, newline = 0;
      000064 30 26                  273 	clear	_ret+0
                                    274 ;	pdk_24Cxx_PROG.c: 37: uint8_t hex_byteCount;
      000066 31 26                  275 	clear	_newline+0
                                    276 	.area GSFINAL
      00006E 11 60                  277 	goto	__sdcc_program_startup
                                    278 ;--------------------------------------------------------
                                    279 ; Home
                                    280 ;--------------------------------------------------------
                                    281 	.area HOME
                                    282 	.area HOME
      000022                        283 __sdcc_program_startup:
      000022 6D 60                  284 	goto	_main
                                    285 ;	return from main will return to caller
                                    286 ;--------------------------------------------------------
                                    287 ; code
                                    288 ;--------------------------------------------------------
                                    289 	.area CODE
                                    290 ;	pdk_24Cxx_PROG.c: 17: static void TIM3_Config(void)
                                    291 ;	-----------------------------------------
                                    292 ;	 function TIM3_Config
                                    293 ;	-----------------------------------------
      000070                        294 _TIM3_Config:
                                    295 ;	pdk_24Cxx_PROG.c: 20: TM3C = TM3C_CLK_IHRC;						   // Use IHRC -> 16 Mhz
      000070 20 57                  296 	mov	a, #0x20
      000072 34 01                  297 	mov	__tm3c, a
                                    298 ;	pdk_24Cxx_PROG.c: 21: TM3S = TM3S_PRESCALE_DIV64 | TM3S_SCALE_DIV32; // No prescale, scale 2 ~> 8MHz
      000074 7F 57                  299 	mov	a, #0x7f
      000076 36 01                  300 	mov	__tm3s, a
                                    301 ;	pdk_24Cxx_PROG.c: 22: TM3B = 254;									   // Divide by 69 ~> 9600 Hz (apx. 115200)
      000078 FE 57                  302 	mov	a, #0xfe
      00007A 37 01                  303 	mov	__tm3b, a
                                    304 ;	pdk_24Cxx_PROG.c: 23: INTEN |= INTEN_TM3;
      00007C 84 01                  305 	mov	a, __inten
      00007E 80 55                  306 	or	a, #0x80
      000080 04 01                  307 	mov	__inten, a
                                    308 ;	pdk_24Cxx_PROG.c: 24: }
      000082 7A 00                  309 	ret
                                    310 ;	pdk_24Cxx_PROG.c: 25: uint8_t _sdcc_external_startup(void)
                                    311 ;	-----------------------------------------
                                    312 ;	 function _sdcc_external_startup
                                    313 ;	-----------------------------------------
      000084                        314 __sdcc_external_startup:
                                    315 ;	pdk_24Cxx_PROG.c: 27: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000084 34 57                  316 	mov	a, #0x34
      000086 03 01                  317 	mov	__clkmd, a
                                    318 ;	pdk_24Cxx_PROG.c: 28: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      000088 52 54                  319 	and	a, #'R'                        
      00008A 43 54                  320 	and	a, #'C'                        
      00008C 01 54                  321 	and	a, #((1))          
      00008E 00 54                  322 	and	a, #((8000000))     
      000090 12 54                  323 	and	a, #((8000000)>>8)  
      000092 7A 54                  324 	and	a, #((8000000)>>16) 
      000094 00 54                  325 	and	a, #((8000000)>>24) 
      000096 88 54                  326 	and	a, #((5000))     
      000098 13 54                  327 	and	a, #((5000)>>8)  
      00009A 0B 54                  328 	and	a, #((0x0B))           
                                    329 ;	pdk_24Cxx_PROG.c: 29: return 0;							  //perform normal initialization
                                    330 ;	pdk_24Cxx_PROG.c: 30: }
      00009C 00 02                  331 	ret	#0x00
                                    332 ;	pdk_24Cxx_PROG.c: 41: uint8_t readline()
                                    333 ;	-----------------------------------------
                                    334 ;	 function readline
                                    335 ;	-----------------------------------------
      00009E                        336 _readline:
                                    337 ;	pdk_24Cxx_PROG.c: 46: while (UART_kbhit())
      00009E 35 26                  338 	clear	_readline_sloc0_1_0+0
      0000A0                        339 00104$:
      0000A0 1C 71                  340 	call	_UART_kbhit
      0000A2 00 53                  341 	cneqsn	a, #0x00
      0000A4 50 60                  342 	goto	00104$
                                    343 ;	pdk_24Cxx_PROG.c: 48: u[cnt_t] = UART_getchar();
      0000A6 16 57                  344 	mov	a, #(_u + 0)
      0000A8 35 18                  345 	add	a, _readline_sloc0_1_0+0
      0000AA 72 00                  346 	push	af
      0000AC 0C 71                  347 	call	_UART_getchar
      0000AE 36 17                  348 	mov	_readline_sloc1_1_0+0, a
      0000B0 73 00                  349 	pop	af
      0000B2 00 17                  350 	mov	p, a
      0000B4 36 1F                  351 	mov	a, _readline_sloc1_1_0+0
      0000B6 00 07                  352 	idxm	p, a
                                    353 ;	pdk_24Cxx_PROG.c: 49: if (u[cnt_t] == 'T' && u[cnt_t - 1] == 'S')
      0000B8 36 1F                  354 	mov	a, _readline_sloc1_1_0+0
      0000BA 54 52                  355 	ceqsn	a, #0x54
      0000BC 6A 60                  356 	goto	00102$
      0000BE 35 1F                  357 	mov	a, _readline_sloc0_1_0+0
      0000C0 01 51                  358 	sub	a, #0x01
      0000C2 37 17                  359 	mov	_readline_sloc2_1_0+0, a
      0000C4 16 57                  360 	mov	a, #(_u + 0)
      0000C6 37 18                  361 	add	a, _readline_sloc2_1_0+0
      0000C8 00 17                  362 	mov	p, a
      0000CA 01 07                  363 	idxm	a, p
      0000CC 53 52                  364 	ceqsn	a, #0x53
      0000CE 6A 60                  365 	goto	00102$
                                    366 ;	pdk_24Cxx_PROG.c: 51: return cnt_t - 1;
      0000D0 37 1F                  367 	mov	a, _readline_sloc2_1_0+0
      0000D2 7A 00                  368 	ret
      0000D4                        369 00102$:
                                    370 ;	pdk_24Cxx_PROG.c: 53: cnt_t++;
      0000D4 35 24                  371 	inc	_readline_sloc0_1_0+0
      0000D6 50 60                  372 	goto	00104$
                                    373 ;	pdk_24Cxx_PROG.c: 56: }
      0000D8 7A 00                  374 	ret
                                    375 ;	pdk_24Cxx_PROG.c: 58: int main(void)
                                    376 ;	-----------------------------------------
                                    377 ;	 function main
                                    378 ;	-----------------------------------------
      0000DA                        379 _main:
                                    380 ;	pdk_24Cxx_PROG.c: 60: setb(PBC, 4);
      0000DA 14 3E                  381 	set1	__pbc, #4
                                    382 ;	pdk_24Cxx_PROG.c: 61: TIM3_Config();
      0000DC 38 70                  383 	call	_TIM3_Config
                                    384 ;	pdk_24Cxx_PROG.c: 62: I2C_begin();
      0000DE 43 73                  385 	call	_I2C_begin
                                    386 ;	pdk_24Cxx_PROG.c: 63: UART_IO_config();
      0000E0 EC 70                  387 	call	_UART_IO_config
                                    388 ;	pdk_24Cxx_PROG.c: 64: UART_begin();
      0000E2 FE 70                  389 	call	_UART_begin
                                    390 ;	pdk_24Cxx_PROG.c: 65: INTRQ = 0;
      0000E4 00 57                  391 	mov	a, #0x00
      0000E6 05 01                  392 	mov	__intrq, a
                                    393 ;	pdk_24Cxx_PROG.c: 66: sei();
      0000E8 78 00                  394 	engint
                                    395 ;	pdk_24Cxx_PROG.c: 67: UART_print("\rOK\r");
      0000EA 25 57                  396 	mov	a, #<(___str_0 + 0)
      0000EC 62 17                  397 	mov	_UART_print_PARM_1+0, a
      0000EE 85 57                  398 	mov	a, #>(___str_0 + 0x8000 + 0)
      0000F0 63 17                  399 	mov	_UART_print_PARM_1+1, a
      0000F2 46 71                  400 	call	_UART_print
                                    401 ;	pdk_24Cxx_PROG.c: 70: while (1)
      0000F4                        402 00114$:
                                    403 ;	pdk_24Cxx_PROG.c: 73: i = 0;
      0000F4 2C 26                  404 	clear	_i+0
      0000F6 2D 26                  405 	clear	_i+1
                                    406 ;	pdk_24Cxx_PROG.c: 74: while (UART_kbhit())
      0000F8                        407 00101$:
      0000F8 1C 71                  408 	call	_UART_kbhit
      0000FA 00 53                  409 	cneqsn	a, #0x00
      0000FC 8C 60                  410 	goto	00103$
                                    411 ;	pdk_24Cxx_PROG.c: 76: u[i++] = UART_getchar();
      0000FE 2D 1F                  412 	mov	a, _i+1
      000100 00 17                  413 	mov	p, a
      000102 2C 1F                  414 	mov	a, _i+0
      000104 2C 24                  415 	inc	_i+0
      000106 2D 20                  416 	addc	_i+1
      000108 16 50                  417 	add	a, #(_u + 0)
      00010A 72 00                  418 	push	af
      00010C 0C 71                  419 	call	_UART_getchar
      00010E 00 17                  420 	mov	p, a
      000110 73 00                  421 	pop	af
      000112 00 27                  422 	xch	a, p
      000114 00 07                  423 	idxm	p, a
      000116 7C 60                  424 	goto	00101$
      000118                        425 00103$:
                                    426 ;	pdk_24Cxx_PROG.c: 78: u[i++] = '\r';
      000118 2D 1F                  427 	mov	a, _i+1
      00011A 00 17                  428 	mov	p, a
      00011C 2C 1F                  429 	mov	a, _i+0
      00011E 2C 24                  430 	inc	_i+0
      000120 2D 20                  431 	addc	_i+1
      000122 16 50                  432 	add	a, #(_u + 0)
      000124 00 17                  433 	mov	p, a
      000126 0D 57                  434 	mov	a, #0x0d
      000128 00 07                  435 	idxm	p, a
                                    436 ;	pdk_24Cxx_PROG.c: 79: u[i] = '\0';
      00012A 16 57                  437 	mov	a, #(_u + 0)
      00012C 2C 18                  438 	add	a, _i+0
      00012E 00 17                  439 	mov	p, a
      000130 00 57                  440 	mov	a, #0x00
      000132 00 07                  441 	idxm	p, a
                                    442 ;	pdk_24Cxx_PROG.c: 87: if (u[0] == '5' && u[1] == '2') // match signal
      000134 16 1F                  443 	mov	a, _u+0
      000136 35 52                  444 	ceqsn	a, #0x35
      000138 B9 60                  445 	goto	00108$
      00013A 17 1F                  446 	mov	a, _u+1
      00013C 32 52                  447 	ceqsn	a, #0x32
      00013E B9 60                  448 	goto	00108$
                                    449 ;	pdk_24Cxx_PROG.c: 89: UART_print("PFS173\r\n"); //send signal back to PC
      000140 2A 57                  450 	mov	a, #<(___str_1 + 0)
      000142 62 17                  451 	mov	_UART_print_PARM_1+0, a
      000144 85 57                  452 	mov	a, #>(___str_1 + 0x8000 + 0)
      000146 63 17                  453 	mov	_UART_print_PARM_1+1, a
      000148 46 71                  454 	call	_UART_print
                                    455 ;	pdk_24Cxx_PROG.c: 90: while (!ret)
      00014A                        456 00104$:
      00014A 30 1F                  457 	mov	a, _ret+0
      00014C 00 52                  458 	ceqsn	a, #0x00
      00014E B9 60                  459 	goto	00108$
                                    460 ;	pdk_24Cxx_PROG.c: 92: temp = readline();
      000150 4F 70                  461 	call	_readline
      000152 2F 17                  462 	mov	_temp+0, a
                                    463 ;	pdk_24Cxx_PROG.c: 93: u[temp] = '\0';
      000154 16 57                  464 	mov	a, #(_u + 0)
      000156 2F 18                  465 	add	a, _temp+0
      000158 00 17                  466 	mov	p, a
      00015A 00 57                  467 	mov	a, #0x00
      00015C 00 07                  468 	idxm	p, a
                                    469 ;	pdk_24Cxx_PROG.c: 94: UART_print(u);
      00015E 16 57                  470 	mov	a, #(_u + 0)
      000160 62 17                  471 	mov	_UART_print_PARM_1+0, a
      000162 63 26                  472 	clear	_UART_print_PARM_1+1
      000164 46 71                  473 	call	_UART_print
                                    474 ;	pdk_24Cxx_PROG.c: 95: UART_print("\r\n");
      000166 33 57                  475 	mov	a, #<(___str_2 + 0)
      000168 62 17                  476 	mov	_UART_print_PARM_1+0, a
      00016A 85 57                  477 	mov	a, #>(___str_2 + 0x8000 + 0)
      00016C 63 17                  478 	mov	_UART_print_PARM_1+1, a
      00016E 46 71                  479 	call	_UART_print
      000170 A5 60                  480 	goto	00104$
      000172                        481 00108$:
                                    482 ;	pdk_24Cxx_PROG.c: 98: if (aaa == 1)
      000172 2E 1F                  483 	mov	a, _aaa+0
      000174 01 52                  484 	ceqsn	a, #0x01
      000176 BE 60                  485 	goto	00111$
                                    486 ;	pdk_24Cxx_PROG.c: 100: setb(PB, 4);
      000178 13 3E                  487 	set1	__pb, #4
      00017A BF 60                  488 	goto	00112$
      00017C                        489 00111$:
                                    490 ;	pdk_24Cxx_PROG.c: 105: clrb(PB, 4);
      00017C 13 3A                  491 	set0	__pb, #4
      00017E                        492 00112$:
                                    493 ;	pdk_24Cxx_PROG.c: 109: _delay_ms(900);
      00017E BE 57                  494 	mov	a, #0xbe
      000180 AA 17                  495 	mov	__delay_loop_32_PARM_1+0, a
      000182 27 57                  496 	mov	a, #0x27
      000184 AB 17                  497 	mov	__delay_loop_32_PARM_1+1, a
      000186 09 57                  498 	mov	a, #0x09
      000188 AC 17                  499 	mov	__delay_loop_32_PARM_1+2, a
      00018A AD 26                  500 	clear	__delay_loop_32_PARM_1+3
      00018C 51 73                  501 	call	__delay_loop_32
      00018E 7A 60                  502 	goto	00114$
                                    503 ;	pdk_24Cxx_PROG.c: 111: }
      000190 7A 00                  504 	ret
                                    505 ;	pdk_24Cxx_PROG.c: 112: void TIM3_interrupt()
                                    506 ;	-----------------------------------------
                                    507 ;	 function TIM3_interrupt
                                    508 ;	-----------------------------------------
      000192                        509 _TIM3_interrupt:
                                    510 ;	pdk_24Cxx_PROG.c: 114: if (aaa == 1)
      000192 2E 1F                  511 	mov	a, _aaa+0
      000194 01 52                  512 	ceqsn	a, #0x01
      000196 CE 60                  513 	goto	00102$
                                    514 ;	pdk_24Cxx_PROG.c: 116: aaa = 0;
      000198 2E 26                  515 	clear	_aaa+0
      00019A D0 60                  516 	goto	00104$
      00019C                        517 00102$:
                                    518 ;	pdk_24Cxx_PROG.c: 120: aaa = 1;
      00019C 01 57                  519 	mov	a, #0x01
      00019E 2E 17                  520 	mov	_aaa+0, a
      0001A0                        521 00104$:
                                    522 ;	pdk_24Cxx_PROG.c: 122: }
      0001A0 7A 00                  523 	ret
                                    524 ;	pdk_24Cxx_PROG.c: 124: void interrupt(void) __interrupt(0)
                                    525 ;	-----------------------------------------
                                    526 ;	 function interrupt
                                    527 ;	-----------------------------------------
      0001A2                        528 _interrupt:
      0001A2 72 00                  529 	push	af
      0001A4 00 1F                  530 	mov	a, p
      0001A6 72 00                  531 	push	af
                                    532 ;	pdk_24Cxx_PROG.c: 127: if (INTRQ & INTRQ_TM2)
      0001A8 85 01                  533 	mov	a, __intrq
      0001AA 40 54                  534 	and	a, #0x40
      0001AC 00 53                  535 	cneqsn	a, #0x00
      0001AE DA 60                  536 	goto	00102$
                                    537 ;	pdk_24Cxx_PROG.c: 129: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      0001B0 05 3B                  538 	set0	__intrq, #6
                                    539 ;	pdk_24Cxx_PROG.c: 130: TIM2_interrupt();
      0001B2 F6 71                  540 	call	_TIM2_interrupt
      0001B4                        541 00102$:
                                    542 ;	pdk_24Cxx_PROG.c: 133: if (INTRQ & INTRQ_TM3)
      0001B4 85 01                  543 	mov	a, __intrq
      0001B6 80 54                  544 	and	a, #0x80
      0001B8 00 53                  545 	cneqsn	a, #0x00
      0001BA E0 60                  546 	goto	00104$
                                    547 ;	pdk_24Cxx_PROG.c: 135: INTRQ &= ~INTRQ_TM3; // Mark TM3 interrupt request processed
      0001BC 85 3B                  548 	set0	__intrq, #7
                                    549 ;	pdk_24Cxx_PROG.c: 136: TIM3_interrupt();
      0001BE C9 70                  550 	call	_TIM3_interrupt
      0001C0                        551 00104$:
                                    552 ;	pdk_24Cxx_PROG.c: 139: if (INTRQ & INTRQ_PA4)
      0001C0 85 01                  553 	mov	a, __intrq
      0001C2 02 54                  554 	and	a, #0x02
      0001C4 00 53                  555 	cneqsn	a, #0x00
      0001C6 E8 60                  556 	goto	00107$
                                    557 ;	pdk_24Cxx_PROG.c: 141: INTRQ &= ~INTRQ_PA4;
      0001C8 85 38                  558 	set0	__intrq, #1
                                    559 ;	pdk_24Cxx_PROG.c: 142: TM3B = 0;
      0001CA 00 57                  560 	mov	a, #0x00
      0001CC 37 01                  561 	mov	__tm3b, a
                                    562 ;	pdk_24Cxx_PROG.c: 143: PA4_interrupt();
      0001CE 45 72                  563 	call	_PA4_interrupt
      0001D0                        564 00107$:
                                    565 ;	pdk_24Cxx_PROG.c: 145: }
      0001D0 73 00                  566 	pop	af
      0001D2 00 17                  567 	mov	p, a
      0001D4 73 00                  568 	pop	af
      0001D6 7B 00                  569 	reti
                                    570 	.area CODE
                                    571 	.area CONST
                                    572 	.area CONST
      000A4A                        573 ___str_0:
      000A4A 0D 02                  574 	ret #0x0d
      000A4C 4F 02                  575 	ret #0x4f	; O
      000A4E 4B 02                  576 	ret #0x4b	; K
      000A50 0D 02                  577 	ret #0x0d
      000A52 00 02                  578 	ret #0x00
                                    579 	.area CODE
                                    580 	.area CONST
      000A54                        581 ___str_1:
      000A54 50 02                  582 	ret #0x50	; P
      000A56 46 02                  583 	ret #0x46	; F
      000A58 53 02                  584 	ret #0x53	; S
      000A5A 31 02                  585 	ret #0x31	; 1
      000A5C 37 02                  586 	ret #0x37	; 7
      000A5E 33 02                  587 	ret #0x33	; 3
      000A60 0D 02                  588 	ret #0x0d
      000A62 0A 02                  589 	ret #0x0a
      000A64 00 02                  590 	ret #0x00
                                    591 	.area CODE
                                    592 	.area CONST
      000A66                        593 ___str_2:
      000A66 0D 02                  594 	ret #0x0d
      000A68 0A 02                  595 	ret #0x0a
      000A6A 00 02                  596 	ret #0x00
                                    597 	.area CODE
                                    598 	.area CABS (ABS)
