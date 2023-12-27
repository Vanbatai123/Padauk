                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
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
                                     20 	.globl _UART_print
                                     21 	.globl _TIM2_interrupt
                                     22 	.globl _UART_begin
                                     23 	.globl __delay_loop_32
                                     24 	.globl __delay_loop_16
                                     25 	.globl __delay_loop_8
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
                                     82 	.globl _txdata
                                     83 	.globl __delay_loop_32_PARM_1
                                     84 	.globl __delay_loop_16_PARM_1
                                     85 	.globl __delay_loop_8_PARM_1
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
      000002                        152 __delay_loop_8_PARM_1:
      000002                        153 	.ds 1
      000003                        154 __delay_loop_16_PARM_1:
      000003                        155 	.ds 2
      000005                        156 __delay_loop_32_PARM_1:
      000005                        157 	.ds 4
      000009                        158 _txdata::
      000009                        159 	.ds 2
      00000B                        160 _main_sloc0_1_0:
      00000B                        161 	.ds 4
      00000F                        162 _main_sloc1_1_0:
      00000F                        163 	.ds 4
      000013                        164 _main_sloc2_1_0:
      000013                        165 	.ds 1
                                    166 ;--------------------------------------------------------
                                    167 ; overlayable items in ram
                                    168 ;--------------------------------------------------------
                                    169 ;--------------------------------------------------------
                                    170 ; Stack segment in internal ram
                                    171 ;--------------------------------------------------------
                                    172 	.area	SSEG
      00004B                        173 __start__stack:
      00004B                        174 	.ds	1
                                    175 
                                    176 ;--------------------------------------------------------
                                    177 ; absolute external ram data
                                    178 ;--------------------------------------------------------
                                    179 	.area DABS (ABS)
                                    180 ;--------------------------------------------------------
                                    181 ; interrupt vector
                                    182 ;--------------------------------------------------------
                                    183 	.area HOME
      000022                        184 __interrupt_vect:
                                    185 	.area	HEADER (ABS)
      000020                        186 	.org	 0x0020
      000020 9F 60                  187 	goto	_interrupt
                                    188 ;--------------------------------------------------------
                                    189 ; global & static initialisations
                                    190 ;--------------------------------------------------------
                                    191 	.area HOME
                                    192 	.area GSINIT
                                    193 	.area GSFINAL
                                    194 	.area GSINIT
                                    195 	.area	PREG (ABS)
      000000                        196 	.org 0x00
      000000                        197 p::
      000000                        198 	.ds 2
                                    199 	.area	HEADER (ABS)
      000000                        200 	.org 0x0000
      000000 00 00                  201 	nop
      000002 01 26                  202 	clear	p+1
      000004 43 57                  203 	mov	a, #s_OSEG
      000006 09 50                  204 	add	a, #l_OSEG + 1
      000008 FE 54                  205 	and	a, #0xfe
      00000A 02 01                  206 	mov.io	sp, a
      00000C 34 70                  207 	call	__sdcc_external_startup
      00000E 12 60                  208 	goto	s_GSINIT
                                    209 	.area GSINIT
      000024                        210 __sdcc_init_data:
      000024 02 57                  211 	mov	a, #s_DATA
      000026 00 17                  212 	mov	p, a
      000028 19 60                  213 	goto	00002$
      00002A                        214 00001$:
      00002A 00 57                  215 	mov	a, #0x00
      00002C 00 07                  216 	idxm	p, a
      00002E 00 24                  217 	inc	p
      000030 02 57                  218 	mov	a, #s_DATA
      000032                        219 00002$:
      000032 41 50                  220 	add	a, #l_DATA
      000034 00 2E                  221 	ceqsn	a, p
      000036 15 60                  222 	goto	00001$
                                    223 	.area GSFINAL
      000038 11 60                  224 	goto	__sdcc_program_startup
                                    225 ;--------------------------------------------------------
                                    226 ; Home
                                    227 ;--------------------------------------------------------
                                    228 	.area HOME
                                    229 	.area HOME
      000022                        230 __sdcc_program_startup:
      000022 41 60                  231 	goto	_main
                                    232 ;	return from main will return to caller
                                    233 ;--------------------------------------------------------
                                    234 ; code
                                    235 ;--------------------------------------------------------
                                    236 	.area CODE
                                    237 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    238 ;	-----------------------------------------
                                    239 ;	 function _delay_loop_8
                                    240 ;	-----------------------------------------
      00003A                        241 __delay_loop_8:
                                    242 ;	delay.h: 44: __endasm;
      00003A                        243 	00001$:
                                    244 ; 4 cycles per loop
      00003A 02 23                  245 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00003C 1D 60                  246 	goto	00001$ ; 2 cycles
      00003E                        247 00101$:
                                    248 ;	delay.h: 45: }
      00003E 7A 00                  249 	ret
                                    250 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    251 ;	-----------------------------------------
                                    252 ;	 function _delay_loop_16
                                    253 ;	-----------------------------------------
      000040                        254 __delay_loop_16:
                                    255 ;	delay.h: 65: __endasm;
      000040                        256 	00001$:
                                    257 ; 8 cycles per loop
      000040 00 00                  258 	nop	; 1 cycle
      000042 03 25                  259 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000044 04 21                  260 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000046 03 1F                  261 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 1D                  262 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 00 34                  263 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00004C 20 60                  264 	goto	00001$ ; 2 cycles
      00004E                        265 00101$:
                                    266 ;	delay.h: 66: }
      00004E 7A 00                  267 	ret
                                    268 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    269 ;	-----------------------------------------
                                    270 ;	 function _delay_loop_32
                                    271 ;	-----------------------------------------
      000050                        272 __delay_loop_32:
                                    273 ;	delay.h: 94: __endasm;
      000050                        274 	00001$:
                                    275 ; 12 cycles per loop
      000050 00 00                  276 	nop	; 1 cycle
      000052 05 25                  277 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000054 06 21                  278 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000056 07 21                  279 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000058 08 21                  280 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005A 05 1F                  281 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00005C 06 1D                  282 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00005E 07 1D                  283 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000060 08 1D                  284 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000062 00 34                  285 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000064 28 60                  286 	goto	00001$ ; 2 cycles
      000066                        287 00101$:
                                    288 ;	delay.h: 95: }
      000066 7A 00                  289 	ret
                                    290 ;	main.c: 13: uint8_t _sdcc_external_startup(void)
                                    291 ;	-----------------------------------------
                                    292 ;	 function _sdcc_external_startup
                                    293 ;	-----------------------------------------
      000068                        294 __sdcc_external_startup:
                                    295 ;	main.c: 15: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
      000068 34 57                  296 	mov	a, #0x34
      00006A 03 01                  297 	mov.io	__clkmd, a
                                    298 ;	main.c: 16: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
      00006C 52 54                  299 	and	a, #'R'                        
      00006E 43 54                  300 	and	a, #'C'                        
      000070 01 54                  301 	and	a, #((1))          
      000072 00 54                  302 	and	a, #((8000000))     
      000074 12 54                  303 	and	a, #((8000000)>>8)  
      000076 7A 54                  304 	and	a, #((8000000)>>16) 
      000078 00 54                  305 	and	a, #((8000000)>>24) 
      00007A 88 54                  306 	and	a, #((5000))     
      00007C 13 54                  307 	and	a, #((5000)>>8)  
      00007E 0B 54                  308 	and	a, #((0x0B))           
                                    309 ;	main.c: 17: return 0;							  // perform normal initialization
                                    310 ;	main.c: 18: }
      000080 00 02                  311 	ret	#0x00
                                    312 ;	main.c: 20: int main(void)
                                    313 ;	-----------------------------------------
                                    314 ;	 function main
                                    315 ;	-----------------------------------------
      000082                        316 _main:
                                    317 ;	main.c: 23: UART_begin(); // Initialize UART engine
      000082 AC 70                  318 	call	_UART_begin
                                    319 ;	main.c: 25: INTRQ = 0;
      000084 00 57                  320 	mov	a, #0x00
      000086 05 01                  321 	mov.io	__intrq, a
                                    322 ;	main.c: 26: sei(); // Enable global interrupts
      000088 78 00                  323 	engint
                                    324 ;	main.c: 29: ADCRGC = ADCRG_ADC_REF_VDD; // ADC reference voltage is VDD
      00008A 00 57                  325 	mov	a, #0x00
      00008C 24 01                  326 	mov.io	__adcrgc, a
                                    327 ;	main.c: 31: ADCM = ADCM_CLK_SYSCLK_DIV16;				   // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
      00008E 08 57                  328 	mov	a, #0x08
      000090 21 01                  329 	mov.io	__adcm, a
                                    330 ;	main.c: 32: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD16_BANDGAP; // enable ADC and use channel 16 (internal bandgap voltage 1.2V)
      000092 BC 57                  331 	mov	a, #0xbc
      000094 20 01                  332 	mov.io	__adcc, a
                                    333 ;	main.c: 36: UART_print("Measuring VDD (VBandGap): ");
      000096 A2 57                  334 	mov	a, #<(___str_0 + 0)
      000098 16 17                  335 	mov	_UART_print_PARM_1+0, a
      00009A 82 57                  336 	mov	a, #>(___str_0 + 0x8000 + 0)
      00009C 17 17                  337 	mov	_UART_print_PARM_1+1, a
      00009E DC 70                  338 	call	_UART_print
                                    339 ;	main.c: 38: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
      0000A0 20 3F                  340 	set1.io	__adcc, #6
                                    341 ;	main.c: 39: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
      0000A2                        342 00101$:
      0000A2 A0 01                  343 	mov.io	a, __adcc
      0000A4 40 54                  344 	and	a, #0x40
      0000A6 00 53                  345 	cneqsn	a, #0x00
      0000A8 51 60                  346 	goto	00101$
                                    347 ;	main.c: 41: uint8_t adcval = ADCR; // read the ADC value
      0000AA A2 01                  348 	mov.io	a, __adcr
                                    349 ;	main.c: 44: uint32_t vdd = (1200UL * 255) / adcval;
      0000AC 24 17                  350 	mov	__divulong_PARM_2+0, a
      0000AE 25 26                  351 	clear	__divulong_PARM_2+1
      0000B0 26 26                  352 	clear	__divulong_PARM_2+2
      0000B2 27 26                  353 	clear	__divulong_PARM_2+3
      0000B4 50 57                  354 	mov	a, #0x50
      0000B6 20 17                  355 	mov	__divulong_PARM_1+0, a
      0000B8 AB 57                  356 	mov	a, #0xab
      0000BA 21 17                  357 	mov	__divulong_PARM_1+1, a
      0000BC 04 57                  358 	mov	a, #0x04
      0000BE 22 17                  359 	mov	__divulong_PARM_1+2, a
      0000C0 23 26                  360 	clear	__divulong_PARM_1+3
      0000C2 0B 57                  361 	mov	a, #_main_sloc0_1_0
      0000C4 72 00                  362 	push	af
      0000C6 8B 71                  363 	call	__divulong
      0000C8 82 01                  364 	mov.io	a, sp
      0000CA FE 50                  365 	add	a, #-2
      0000CC 02 01                  366 	mov.io	sp, a
      0000CE 0B 1F                  367 	mov	a, _main_sloc0_1_0+0
      0000D0 0F 17                  368 	mov	_main_sloc1_1_0+0, a
      0000D2 0C 1F                  369 	mov	a, _main_sloc0_1_0+1
      0000D4 10 17                  370 	mov	_main_sloc1_1_0+1, a
      0000D6 0D 1F                  371 	mov	a, _main_sloc0_1_0+2
      0000D8 11 17                  372 	mov	_main_sloc1_1_0+2, a
      0000DA 0E 1F                  373 	mov	a, _main_sloc0_1_0+3
      0000DC 12 17                  374 	mov	_main_sloc1_1_0+3, a
                                    375 ;	main.c: 46: UART_printNum(vdd);
      0000DE 0F 1F                  376 	mov	a, _main_sloc1_1_0+0
      0000E0 19 17                  377 	mov	_UART_printNum_PARM_1+0, a
      0000E2 10 1F                  378 	mov	a, _main_sloc1_1_0+1
      0000E4 1A 17                  379 	mov	_UART_printNum_PARM_1+1, a
      0000E6 F1 70                  380 	call	_UART_printNum
                                    381 ;	main.c: 47: UART_print(" mV\n");
      0000E8 BD 57                  382 	mov	a, #<(___str_1 + 0)
      0000EA 16 17                  383 	mov	_UART_print_PARM_1+0, a
      0000EC 82 57                  384 	mov	a, #>(___str_1 + 0x8000 + 0)
      0000EE 17 17                  385 	mov	_UART_print_PARM_1+1, a
      0000F0 DC 70                  386 	call	_UART_print
                                    387 ;	main.c: 51: PBC &= ~(1 << 0);						   // disable PA.0 GPIO output
      0000F2 14 38                  388 	set0.io	__pbc, #0
                                    389 ;	main.c: 52: PBPH &= ~(1 << 0);						   // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
      0000F4 15 38                  390 	set0.io	__pbph, #0
                                    391 ;	main.c: 53: PBDIER &= ~(1 << 0);					   // disable PA.0 GPIO input
      0000F6 0E 38                  392 	set0.io	__pbdier, #0
                                    393 ;	main.c: 54: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
      0000F8 80 57                  394 	mov	a, #0x80
      0000FA 20 01                  395 	mov.io	__adcc, a
                                    396 ;	main.c: 56: UART_print("Start ADC on PA.0\n");
      0000FC C2 57                  397 	mov	a, #<(___str_2 + 0)
      0000FE 16 17                  398 	mov	_UART_print_PARM_1+0, a
      000100 82 57                  399 	mov	a, #>(___str_2 + 0x8000 + 0)
      000102 17 17                  400 	mov	_UART_print_PARM_1+1, a
      000104 DC 70                  401 	call	_UART_print
                                    402 ;	main.c: 57: while (1)
      000106                        403 00108$:
                                    404 ;	main.c: 59: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
      000106 20 3F                  405 	set1.io	__adcc, #6
                                    406 ;	main.c: 60: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
      000108                        407 00104$:
      000108 A0 01                  408 	mov.io	a, __adcc
      00010A 40 54                  409 	and	a, #0x40
      00010C 00 53                  410 	cneqsn	a, #0x00
      00010E 84 60                  411 	goto	00104$
                                    412 ;	main.c: 63: uint8_t adcval = ADCR; // read the ADC value
      000110 A2 01                  413 	mov.io	a, __adcr
      000112 13 17                  414 	mov	_main_sloc2_1_0+0, a
                                    415 ;	main.c: 64: UART_print("PA.0 : ");
      000114 D5 57                  416 	mov	a, #<(___str_3 + 0)
      000116 16 17                  417 	mov	_UART_print_PARM_1+0, a
      000118 82 57                  418 	mov	a, #>(___str_3 + 0x8000 + 0)
      00011A 17 17                  419 	mov	_UART_print_PARM_1+1, a
      00011C DC 70                  420 	call	_UART_print
                                    421 ;	main.c: 65: UART_printNum(adcval);
      00011E 13 1F                  422 	mov	a, _main_sloc2_1_0+0
      000120 19 17                  423 	mov	_UART_printNum_PARM_1+0, a
      000122 1A 26                  424 	clear	_UART_printNum_PARM_1+1
      000124 F1 70                  425 	call	_UART_printNum
                                    426 ;	main.c: 66: UART_print("\n");
      000126 DD 57                  427 	mov	a, #<(___str_4 + 0)
      000128 16 17                  428 	mov	_UART_print_PARM_1+0, a
      00012A 82 57                  429 	mov	a, #>(___str_4 + 0x8000 + 0)
      00012C 17 17                  430 	mov	_UART_print_PARM_1+1, a
      00012E DC 70                  431 	call	_UART_print
                                    432 ;	main.c: 67: _delay_ms(50);
      000130 4E 57                  433 	mov	a, #0x4e
      000132 03 17                  434 	mov	__delay_loop_16_PARM_1+0, a
      000134 C3 57                  435 	mov	a, #0xc3
      000136 04 17                  436 	mov	__delay_loop_16_PARM_1+1, a
      000138 20 70                  437 	call	__delay_loop_16
      00013A 83 60                  438 	goto	00108$
                                    439 ;	main.c: 70: }
      00013C 7A 00                  440 	ret
                                    441 ;	main.c: 73: void interrupt(void) __interrupt(0)
                                    442 ;	-----------------------------------------
                                    443 ;	 function interrupt
                                    444 ;	-----------------------------------------
      00013E                        445 _interrupt:
      00013E 72 00                  446 	push	af
      000140 00 1F                  447 	mov	a, p
      000142 72 00                  448 	push	af
                                    449 ;	main.c: 76: if (INTRQ & INTRQ_TM2)
      000144 85 01                  450 	mov.io	a, __intrq
      000146 40 54                  451 	and	a, #0x40
      000148 00 53                  452 	cneqsn	a, #0x00
      00014A A8 60                  453 	goto	00103$
                                    454 ;	main.c: 78: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      00014C 05 3B                  455 	set0.io	__intrq, #6
                                    456 ;	main.c: 80: TIM2_interrupt();
      00014E B9 70                  457 	call	_TIM2_interrupt
      000150                        458 00103$:
                                    459 ;	main.c: 82: }
      000150 73 00                  460 	pop	af
      000152 00 17                  461 	mov	p, a
      000154 73 00                  462 	pop	af
      000156 7B 00                  463 	reti
                                    464 	.area CODE
                                    465 	.area CONST
                                    466 	.area CONST
      000544                        467 ___str_0:
      000544 4D 02                  468 	ret #0x4d	; M
      000546 65 02                  469 	ret #0x65	; e
      000548 61 02                  470 	ret #0x61	; a
      00054A 73 02                  471 	ret #0x73	; s
      00054C 75 02                  472 	ret #0x75	; u
      00054E 72 02                  473 	ret #0x72	; r
      000550 69 02                  474 	ret #0x69	; i
      000552 6E 02                  475 	ret #0x6e	; n
      000554 67 02                  476 	ret #0x67	; g
      000556 20 02                  477 	ret #0x20	;  
      000558 56 02                  478 	ret #0x56	; V
      00055A 44 02                  479 	ret #0x44	; D
      00055C 44 02                  480 	ret #0x44	; D
      00055E 20 02                  481 	ret #0x20	;  
      000560 28 02                  482 	ret #0x28	; (
      000562 56 02                  483 	ret #0x56	; V
      000564 42 02                  484 	ret #0x42	; B
      000566 61 02                  485 	ret #0x61	; a
      000568 6E 02                  486 	ret #0x6e	; n
      00056A 64 02                  487 	ret #0x64	; d
      00056C 47 02                  488 	ret #0x47	; G
      00056E 61 02                  489 	ret #0x61	; a
      000570 70 02                  490 	ret #0x70	; p
      000572 29 02                  491 	ret #0x29	; )
      000574 3A 02                  492 	ret #0x3a	; :
      000576 20 02                  493 	ret #0x20	;  
      000578 00 02                  494 	ret #0x00
                                    495 	.area CODE
                                    496 	.area CONST
      00057A                        497 ___str_1:
      00057A 20 02                  498 	ret #0x20	;  
      00057C 6D 02                  499 	ret #0x6d	; m
      00057E 56 02                  500 	ret #0x56	; V
      000580 0A 02                  501 	ret #0x0a
      000582 00 02                  502 	ret #0x00
                                    503 	.area CODE
                                    504 	.area CONST
      000584                        505 ___str_2:
      000584 53 02                  506 	ret #0x53	; S
      000586 74 02                  507 	ret #0x74	; t
      000588 61 02                  508 	ret #0x61	; a
      00058A 72 02                  509 	ret #0x72	; r
      00058C 74 02                  510 	ret #0x74	; t
      00058E 20 02                  511 	ret #0x20	;  
      000590 41 02                  512 	ret #0x41	; A
      000592 44 02                  513 	ret #0x44	; D
      000594 43 02                  514 	ret #0x43	; C
      000596 20 02                  515 	ret #0x20	;  
      000598 6F 02                  516 	ret #0x6f	; o
      00059A 6E 02                  517 	ret #0x6e	; n
      00059C 20 02                  518 	ret #0x20	;  
      00059E 50 02                  519 	ret #0x50	; P
      0005A0 41 02                  520 	ret #0x41	; A
      0005A2 2E 02                  521 	ret #0x2e	; .
      0005A4 30 02                  522 	ret #0x30	; 0
      0005A6 0A 02                  523 	ret #0x0a
      0005A8 00 02                  524 	ret #0x00
                                    525 	.area CODE
                                    526 	.area CONST
      0005AA                        527 ___str_3:
      0005AA 50 02                  528 	ret #0x50	; P
      0005AC 41 02                  529 	ret #0x41	; A
      0005AE 2E 02                  530 	ret #0x2e	; .
      0005B0 30 02                  531 	ret #0x30	; 0
      0005B2 20 02                  532 	ret #0x20	;  
      0005B4 3A 02                  533 	ret #0x3a	; :
      0005B6 20 02                  534 	ret #0x20	;  
      0005B8 00 02                  535 	ret #0x00
                                    536 	.area CODE
                                    537 	.area CONST
      0005BA                        538 ___str_4:
      0005BA 0A 02                  539 	ret #0x0a
      0005BC 00 02                  540 	ret #0x00
                                    541 	.area CODE
                                    542 	.area CABS (ABS)
