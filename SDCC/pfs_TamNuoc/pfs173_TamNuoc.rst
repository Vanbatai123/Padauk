                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_TamNuoc
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
                                     18 	.globl _TIM3_begin
                                     19 	.globl _ADC_read
                                     20 	.globl _GPIO_begin
                                     21 	.globl __sdcc_external_startup
                                     22 	.globl __delay_loop_32
                                     23 	.globl __delay_loop_16
                                     24 	.globl __delay_loop_8
                                     25 	.globl __t16c
                                     26 	.globl __rop
                                     27 	.globl __bgtr
                                     28 	.globl __ilrcr
                                     29 	.globl __pwmg2dtl
                                     30 	.globl __pwmg2dth
                                     31 	.globl __pwmg2c
                                     32 	.globl __pwmg1dtl
                                     33 	.globl __pwmg1dth
                                     34 	.globl __pwmg1c
                                     35 	.globl __pwmgcubl
                                     36 	.globl __pwmgcubh
                                     37 	.globl __pwmg0dtl
                                     38 	.globl __pwmg0dth
                                     39 	.globl __pwmgclk
                                     40 	.globl __pwmg0c
                                     41 	.globl __tm3b
                                     42 	.globl __tm3s
                                     43 	.globl __tm3ct
                                     44 	.globl __tm3c
                                     45 	.globl __tm2b
                                     46 	.globl __tm2s
                                     47 	.globl __tm2ct
                                     48 	.globl __tm2c
                                     49 	.globl __gpcs
                                     50 	.globl __gpcc
                                     51 	.globl __misclvr
                                     52 	.globl __misc2
                                     53 	.globl __misc
                                     54 	.globl __adcrgc
                                     55 	.globl __adcr
                                     56 	.globl __adcm
                                     57 	.globl __adcc
                                     58 	.globl __pcpl
                                     59 	.globl __pbpl
                                     60 	.globl __pcph
                                     61 	.globl __pcc
                                     62 	.globl __pc
                                     63 	.globl __pbph
                                     64 	.globl __pbc
                                     65 	.globl __pb
                                     66 	.globl __paph
                                     67 	.globl __pac
                                     68 	.globl __pa
                                     69 	.globl __pcdier
                                     70 	.globl __pbdier
                                     71 	.globl __padier
                                     72 	.globl __integs
                                     73 	.globl __ihrcr
                                     74 	.globl __eoscr
                                     75 	.globl __t16m
                                     76 	.globl __intrq
                                     77 	.globl __inten
                                     78 	.globl __clkmd
                                     79 	.globl __sp
                                     80 	.globl __flag
                                     81 	.globl _i
                                     82 	.globl _adc_val
                                     83 	.globl _on_flag
                                     84 	.globl _mode3
                                     85 	.globl _mode
                                     86 	.globl _motor_val
                                     87 	.globl _timer_cnt
                                     88 	.globl __delay_loop_32_PARM_1
                                     89 	.globl __delay_loop_16_PARM_1
                                     90 	.globl __delay_loop_8_PARM_1
                                     91 ;--------------------------------------------------------
                                     92 ; special function registers
                                     93 ;--------------------------------------------------------
                                     94 	.area RSEG (ABS)
      000000                         95 	.org 0x0000
                           000000    96 __flag	=	0x0000
                           000002    97 __sp	=	0x0002
                           000003    98 __clkmd	=	0x0003
                           000004    99 __inten	=	0x0004
                           000005   100 __intrq	=	0x0005
                           000006   101 __t16m	=	0x0006
                           00000A   102 __eoscr	=	0x000a
                           00000B   103 __ihrcr	=	0x000b
                           00000C   104 __integs	=	0x000c
                           00000D   105 __padier	=	0x000d
                           00000E   106 __pbdier	=	0x000e
                           00000F   107 __pcdier	=	0x000f
                           000010   108 __pa	=	0x0010
                           000011   109 __pac	=	0x0011
                           000012   110 __paph	=	0x0012
                           000013   111 __pb	=	0x0013
                           000014   112 __pbc	=	0x0014
                           000015   113 __pbph	=	0x0015
                           000016   114 __pc	=	0x0016
                           000017   115 __pcc	=	0x0017
                           000018   116 __pcph	=	0x0018
                           000019   117 __pbpl	=	0x0019
                           00001A   118 __pcpl	=	0x001a
                           000020   119 __adcc	=	0x0020
                           000021   120 __adcm	=	0x0021
                           000022   121 __adcr	=	0x0022
                           000024   122 __adcrgc	=	0x0024
                           000026   123 __misc	=	0x0026
                           000027   124 __misc2	=	0x0027
                           000028   125 __misclvr	=	0x0028
                           00002B   126 __gpcc	=	0x002b
                           00002C   127 __gpcs	=	0x002c
                           000030   128 __tm2c	=	0x0030
                           000031   129 __tm2ct	=	0x0031
                           000032   130 __tm2s	=	0x0032
                           000033   131 __tm2b	=	0x0033
                           000034   132 __tm3c	=	0x0034
                           000035   133 __tm3ct	=	0x0035
                           000036   134 __tm3s	=	0x0036
                           000037   135 __tm3b	=	0x0037
                           000040   136 __pwmg0c	=	0x0040
                           000041   137 __pwmgclk	=	0x0041
                           000042   138 __pwmg0dth	=	0x0042
                           000043   139 __pwmg0dtl	=	0x0043
                           000044   140 __pwmgcubh	=	0x0044
                           000045   141 __pwmgcubl	=	0x0045
                           000046   142 __pwmg1c	=	0x0046
                           000048   143 __pwmg1dth	=	0x0048
                           000049   144 __pwmg1dtl	=	0x0049
                           00004C   145 __pwmg2c	=	0x004c
                           00004E   146 __pwmg2dth	=	0x004e
                           00004F   147 __pwmg2dtl	=	0x004f
                           000062   148 __ilrcr	=	0x0062
                           000063   149 __bgtr	=	0x0063
                           000067   150 __rop	=	0x0067
      000000                        151 __t16c::
      000000                        152 	.ds 2
                                    153 ;--------------------------------------------------------
                                    154 ; ram data
                                    155 ;--------------------------------------------------------
                                    156 	.area DATA
      000002                        157 __delay_loop_8_PARM_1:
      000002                        158 	.ds 1
      000003                        159 __delay_loop_16_PARM_1:
      000003                        160 	.ds 2
      000005                        161 __delay_loop_32_PARM_1:
      000005                        162 	.ds 4
      000009                        163 _timer_cnt::
      000009                        164 	.ds 1
      00000A                        165 _motor_val::
      00000A                        166 	.ds 1
      00000B                        167 _mode::
      00000B                        168 	.ds 1
      00000C                        169 _mode3::
      00000C                        170 	.ds 2
      00000E                        171 _on_flag::
      00000E                        172 	.ds 1
      00000F                        173 _adc_val::
      00000F                        174 	.ds 1
      000010                        175 _i::
      000010                        176 	.ds 1
      000011                        177 _interrupt_sloc0_1_0:
      000011                        178 	.ds 2
                                    179 ;--------------------------------------------------------
                                    180 ; overlayable items in ram
                                    181 ;--------------------------------------------------------
                                    182 ;--------------------------------------------------------
                                    183 ; Stack segment in internal ram
                                    184 ;--------------------------------------------------------
                                    185 	.area	SSEG
      000013                        186 __start__stack:
      000013                        187 	.ds	1
                                    188 
                                    189 ;--------------------------------------------------------
                                    190 ; absolute external ram data
                                    191 ;--------------------------------------------------------
                                    192 	.area DABS (ABS)
                                    193 ;--------------------------------------------------------
                                    194 ; interrupt vector
                                    195 ;--------------------------------------------------------
                                    196 	.area HOME
      000022                        197 __interrupt_vect:
                                    198 	.area	HEADER (ABS)
      000020                        199 	.org	 0x0020
      000020 F9 60                  200 	goto	_interrupt
                                    201 ;--------------------------------------------------------
                                    202 ; global & static initialisations
                                    203 ;--------------------------------------------------------
                                    204 	.area HOME
                                    205 	.area GSINIT
                                    206 	.area GSFINAL
                                    207 	.area GSINIT
                                    208 	.area	PREG (ABS)
      000000                        209 	.org 0x00
      000000                        210 p::
      000000                        211 	.ds 2
                                    212 	.area	HEADER (ABS)
      000000                        213 	.org 0x0000
      000000 00 00                  214 	nop
      000002 01 26                  215 	clear	p+1
      000004 13 57                  216 	mov	a, #s_OSEG
      000006 01 50                  217 	add	a, #l_OSEG + 1
      000008 FE 54                  218 	and	a, #0xfe
      00000A 02 01                  219 	mov.io	sp, a
      00000C 3E 70                  220 	call	__sdcc_external_startup
      00000E 12 60                  221 	goto	s_GSINIT
                                    222 	.area GSINIT
      000024                        223 __sdcc_init_data:
      000024 02 57                  224 	mov	a, #s_DATA
      000026 00 17                  225 	mov	p, a
      000028 19 60                  226 	goto	00002$
      00002A                        227 00001$:
      00002A 00 57                  228 	mov	a, #0x00
      00002C 00 07                  229 	idxm	p, a
      00002E 00 24                  230 	inc	p
      000030 02 57                  231 	mov	a, #s_DATA
      000032                        232 00002$:
      000032 11 50                  233 	add	a, #l_DATA
      000034 00 2E                  234 	ceqsn	a, p
      000036 15 60                  235 	goto	00001$
                                    236 ;	pfs173_TamNuoc.c: 118: uint8_t timer_cnt = 0, motor_val = 0;
      000038 09 26                  237 	clear	_timer_cnt+0
                                    238 ;	pfs173_TamNuoc.c: 118: uint8_t mode = 1;
      00003A 0A 26                  239 	clear	_motor_val+0
                                    240 ;	pfs173_TamNuoc.c: 119: uint16_t mode3 = 1;
      00003C 01 57                  241 	mov	a, #0x01
      00003E 0B 17                  242 	mov	_mode+0, a
                                    243 ;	pfs173_TamNuoc.c: 120: uint8_t on_flag = 0;
      000040 01 57                  244 	mov	a, #0x01
      000042 0C 17                  245 	mov	_mode3+0, a
      000044 0D 26                  246 	clear	_mode3+1
                                    247 ;	pfs173_TamNuoc.c: 121: uint8_t adc_val = 0;
      000046 0E 26                  248 	clear	_on_flag+0
                                    249 ;	pfs173_TamNuoc.c: 122: uint8_t i = 0;
      000048 0F 26                  250 	clear	_adc_val+0
                                    251 ;	pfs173_TamNuoc.c: 123: void main(void)
      00004A 10 26                  252 	clear	_i+0
                                    253 	.area GSFINAL
      00004C 11 60                  254 	goto	__sdcc_program_startup
                                    255 ;--------------------------------------------------------
                                    256 ; Home
                                    257 ;--------------------------------------------------------
                                    258 	.area HOME
                                    259 	.area HOME
      000022                        260 __sdcc_program_startup:
      000022 73 60                  261 	goto	_main
                                    262 ;	return from main will return to caller
                                    263 ;--------------------------------------------------------
                                    264 ; code
                                    265 ;--------------------------------------------------------
                                    266 	.area CODE
                                    267 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    268 ;	-----------------------------------------
                                    269 ;	 function _delay_loop_8
                                    270 ;	-----------------------------------------
      00004E                        271 __delay_loop_8:
                                    272 ;	delay.h: 44: __endasm;
      00004E                        273 	00001$:
                                    274 ; 4 cycles per loop
      00004E 02 23                  275 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000050 27 60                  276 	goto	00001$ ; 2 cycles
      000052                        277 00101$:
                                    278 ;	delay.h: 45: }
      000052 7A 00                  279 	ret
                                    280 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    281 ;	-----------------------------------------
                                    282 ;	 function _delay_loop_16
                                    283 ;	-----------------------------------------
      000054                        284 __delay_loop_16:
                                    285 ;	delay.h: 65: __endasm;
      000054                        286 	00001$:
                                    287 ; 8 cycles per loop
      000054 00 00                  288 	nop	; 1 cycle
      000056 03 25                  289 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000058 04 21                  290 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      00005A 03 1F                  291 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      00005C 04 1D                  292 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00005E 00 34                  293 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000060 2A 60                  294 	goto	00001$ ; 2 cycles
      000062                        295 00101$:
                                    296 ;	delay.h: 66: }
      000062 7A 00                  297 	ret
                                    298 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    299 ;	-----------------------------------------
                                    300 ;	 function _delay_loop_32
                                    301 ;	-----------------------------------------
      000064                        302 __delay_loop_32:
                                    303 ;	delay.h: 94: __endasm;
      000064                        304 	00001$:
                                    305 ; 12 cycles per loop
      000064 00 00                  306 	nop	; 1 cycle
      000066 05 25                  307 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000068 06 21                  308 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      00006A 07 21                  309 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      00006C 08 21                  310 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00006E 05 1F                  311 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000070 06 1D                  312 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000072 07 1D                  313 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000074 08 1D                  314 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000076 00 34                  315 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000078 32 60                  316 	goto	00001$ ; 2 cycles
      00007A                        317 00101$:
                                    318 ;	delay.h: 95: }
      00007A 7A 00                  319 	ret
                                    320 ;	pfs173_TamNuoc.c: 57: uint8_t _sdcc_external_startup(void)
                                    321 ;	-----------------------------------------
                                    322 ;	 function _sdcc_external_startup
                                    323 ;	-----------------------------------------
      00007C                        324 __sdcc_external_startup:
                                    325 ;	pfs173_TamNuoc.c: 59: EASY_PDK_INIT_SYSCLOCK_1MHZ();		  // use 8MHz sysclock
      00007C 1C 57                  326 	mov	a, #0x1c
      00007E 03 01                  327 	mov.io	__clkmd, a
                                    328 ;	pfs173_TamNuoc.c: 60: EASY_PDK_CALIBRATE_IHRC(F_CPU, 3000); // tune SYSCLK to 8MHz @ 4.000V
      000080 52 54                  329 	and	a, #'R'                        
      000082 43 54                  330 	and	a, #'C'                        
      000084 01 54                  331 	and	a, #((1))          
      000086 40 54                  332 	and	a, #((1000000))     
      000088 42 54                  333 	and	a, #((1000000)>>8)  
      00008A 0F 54                  334 	and	a, #((1000000)>>16) 
      00008C 00 54                  335 	and	a, #((1000000)>>24) 
      00008E B8 54                  336 	and	a, #((3000))     
      000090 0B 54                  337 	and	a, #((3000)>>8)  
      000092 0B 54                  338 	and	a, #((0x0B))           
                                    339 ;	pfs173_TamNuoc.c: 61: return 0;							  // perform normal initialization
                                    340 ;	pfs173_TamNuoc.c: 62: }
      000094 00 02                  341 	ret	#0x00
                                    342 ;	pfs173_TamNuoc.c: 63: void GPIO_begin(void)
                                    343 ;	-----------------------------------------
                                    344 ;	 function GPIO_begin
                                    345 ;	-----------------------------------------
      000096                        346 _GPIO_begin:
                                    347 ;	pfs173_TamNuoc.c: 66: setb(PxC_LED_1, PIN_LED_1);
      000096 91 3F                  348 	set1.io	__pac, #7
                                    349 ;	pfs173_TamNuoc.c: 67: setb(PxC_LED_2, PIN_LED_2);
      000098 11 3E                  350 	set1.io	__pac, #4
                                    351 ;	pfs173_TamNuoc.c: 68: setb(PxC_LED_3, PIN_LED_3);
      00009A 14 3F                  352 	set1.io	__pbc, #6
                                    353 ;	pfs173_TamNuoc.c: 69: setb(PxC_LED_4, PIN_LED_4);
      00009C 11 3F                  354 	set1.io	__pac, #6
                                    355 ;	pfs173_TamNuoc.c: 71: setb(Px_LED_1, PIN_LED_1);
      00009E 90 3F                  356 	set1.io	__pa, #7
                                    357 ;	pfs173_TamNuoc.c: 72: setb(Px_LED_2, PIN_LED_2);
      0000A0 10 3E                  358 	set1.io	__pa, #4
                                    359 ;	pfs173_TamNuoc.c: 73: setb(Px_LED_3, PIN_LED_3);
      0000A2 13 3F                  360 	set1.io	__pb, #6
                                    361 ;	pfs173_TamNuoc.c: 74: setb(Px_LED_4, PIN_LED_4);
      0000A4 10 3F                  362 	set1.io	__pa, #6
                                    363 ;	pfs173_TamNuoc.c: 77: setb(PxC_MOTOR, PIN_MOTOR);
      0000A6 11 3C                  364 	set1.io	__pac, #0
                                    365 ;	pfs173_TamNuoc.c: 81: clrb(PxC_SW_1, PIN_SW_1);	 //
      0000A8 94 39                  366 	set0.io	__pbc, #3
                                    367 ;	pfs173_TamNuoc.c: 82: setb(PxPH_SW_1, PIN_SW_1);	 // set BUTTON pin as input
      0000AA 95 3D                  368 	set1.io	__pbph, #3
                                    369 ;	pfs173_TamNuoc.c: 83: setb(PxDIER_SW_1, PIN_SW_1); //
      0000AC 8E 3D                  370 	set1.io	__pbdier, #3
                                    371 ;	pfs173_TamNuoc.c: 87: clrb(PxC_SW_2, PIN_SW_2);	 //
      0000AE 14 39                  372 	set0.io	__pbc, #2
                                    373 ;	pfs173_TamNuoc.c: 88: setb(PxPH_SW_2, PIN_SW_2);	 // set BUTTON pin as input
      0000B0 15 3D                  374 	set1.io	__pbph, #2
                                    375 ;	pfs173_TamNuoc.c: 89: clrb(PxDIER_SW_2, PIN_SW_2); //
      0000B2 0E 39                  376 	set0.io	__pbdier, #2
                                    377 ;	pfs173_TamNuoc.c: 92: ADCRGC = ADCRG_ADC_REF_VDD;				  // ADC reference voltage is VDD
      0000B4 00 57                  378 	mov	a, #0x00
      0000B6 24 01                  379 	mov.io	__adcrgc, a
                                    380 ;	pfs173_TamNuoc.c: 93: ADCM = ADCM_CLK_SYSCLK_DIV16;			  // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
      0000B8 08 57                  381 	mov	a, #0x08
      0000BA 21 01                  382 	mov.io	__adcm, a
                                    383 ;	pfs173_TamNuoc.c: 95: clrb(PxC_ADC, PIN_ADC);					  // disable PA.0 GPIO output
      0000BC 14 38                  384 	set0.io	__pbc, #0
                                    385 ;	pfs173_TamNuoc.c: 96: clrb(PxPH_ADC, PIN_ADC);				  // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
      0000BE 15 38                  386 	set0.io	__pbph, #0
                                    387 ;	pfs173_TamNuoc.c: 97: clrb(PxDIER_ADC, PIN_ADC);				  // disable PA.0 GPIO input
      0000C0 0E 38                  388 	set0.io	__pbdier, #0
                                    389 ;	pfs173_TamNuoc.c: 98: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
      0000C2 80 57                  390 	mov	a, #0x80
      0000C4 20 01                  391 	mov.io	__adcc, a
                                    392 ;	pfs173_TamNuoc.c: 100: }
      0000C6 7A 00                  393 	ret
                                    394 ;	pfs173_TamNuoc.c: 102: uint8_t ADC_read()
                                    395 ;	-----------------------------------------
                                    396 ;	 function ADC_read
                                    397 ;	-----------------------------------------
      0000C8                        398 _ADC_read:
                                    399 ;	pfs173_TamNuoc.c: 104: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
      0000C8 20 3F                  400 	set1.io	__adcc, #6
                                    401 ;	pfs173_TamNuoc.c: 105: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
      0000CA                        402 00101$:
      0000CA A0 01                  403 	mov.io	a, __adcc
      0000CC 40 54                  404 	and	a, #0x40
      0000CE 00 53                  405 	cneqsn	a, #0x00
      0000D0 65 60                  406 	goto	00101$
                                    407 ;	pfs173_TamNuoc.c: 108: return ADCR; // read the ADC value
      0000D2 A2 01                  408 	mov.io	a, __adcr
                                    409 ;	pfs173_TamNuoc.c: 109: }
      0000D4 7A 00                  410 	ret
                                    411 ;	pfs173_TamNuoc.c: 110: void TIM3_begin()
                                    412 ;	-----------------------------------------
                                    413 ;	 function TIM3_begin
                                    414 ;	-----------------------------------------
      0000D6                        415 _TIM3_begin:
                                    416 ;	pfs173_TamNuoc.c: 112: TM3C = TM3C_CLK_IHRC;							// Use IHRC -> 16 Mhz
      0000D6 20 57                  417 	mov	a, #0x20
      0000D8 34 01                  418 	mov.io	__tm3c, a
                                    419 ;	pfs173_TamNuoc.c: 113: TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV4; // No prescale, scale 64 ~> 0.25MHz
      0000DA 20 57                  420 	mov	a, #0x20
      0000DC 36 01                  421 	mov.io	__tm3s, a
                                    422 ;	pfs173_TamNuoc.c: 114: TM3B = 62;										// Divide by 62 ~> 4000 Hz 0.25ms
      0000DE 3E 57                  423 	mov	a, #0x3e
      0000E0 37 01                  424 	mov.io	__tm3b, a
                                    425 ;	pfs173_TamNuoc.c: 116: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      0000E2 84 3F                  426 	set1.io	__inten, #7
                                    427 ;	pfs173_TamNuoc.c: 117: }
      0000E4 7A 00                  428 	ret
                                    429 ;	pfs173_TamNuoc.c: 124: void main(void)
                                    430 ;	-----------------------------------------
                                    431 ;	 function main
                                    432 ;	-----------------------------------------
      0000E6                        433 _main:
                                    434 ;	pfs173_TamNuoc.c: 126: TIM3_begin();
      0000E6 6B 70                  435 	call	_TIM3_begin
                                    436 ;	pfs173_TamNuoc.c: 127: GPIO_begin();
      0000E8 4B 70                  437 	call	_GPIO_begin
                                    438 ;	pfs173_TamNuoc.c: 129: INTRQ = 0;
      0000EA 00 57                  439 	mov	a, #0x00
      0000EC 05 01                  440 	mov.io	__intrq, a
                                    441 ;	pfs173_TamNuoc.c: 130: sei(); // Enable global interrupts
      0000EE 78 00                  442 	engint
                                    443 ;	pfs173_TamNuoc.c: 131: while (1)
      0000F0                        444 00129$:
                                    445 ;	pfs173_TamNuoc.c: 134: if (inbit(Px_SW_1, PIN_SW_1) == 0)
      0000F0 93 01                  446 	mov.io	a, __pb
      0000F2 08 54                  447 	and	a, #0x08
      0000F4 6A 00                  448 	sr	a
      0000F6 6A 00                  449 	sr	a
      0000F8 6A 00                  450 	sr	a
      0000FA 00 52                  451 	ceqsn	a, #0x00
      0000FC 8C 60                  452 	goto	00105$
                                    453 ;	pfs173_TamNuoc.c: 136: while (inbit(Px_SW_1, PIN_SW_1) == 0)
      0000FE                        454 00101$:
      0000FE 93 01                  455 	mov.io	a, __pb
      000100 08 54                  456 	and	a, #0x08
      000102 6A 00                  457 	sr	a
      000104 6A 00                  458 	sr	a
      000106 6A 00                  459 	sr	a
      000108 00 53                  460 	cneqsn	a, #0x00
      00010A 7F 60                  461 	goto	00101$
                                    462 ;	pfs173_TamNuoc.c: 138: on_flag = 0;
      00010C 0E 26                  463 	clear	_on_flag+0
                                    464 ;	pfs173_TamNuoc.c: 139: _delay_ms(100);
      00010E D2 57                  465 	mov	a, #0xd2
      000110 03 17                  466 	mov	__delay_loop_16_PARM_1+0, a
      000112 30 57                  467 	mov	a, #0x30
      000114 04 17                  468 	mov	__delay_loop_16_PARM_1+1, a
      000116 2A 70                  469 	call	__delay_loop_16
      000118                        470 00105$:
                                    471 ;	pfs173_TamNuoc.c: 142: _delay_ms(10);
      000118 E0 57                  472 	mov	a, #0xe0
      00011A 03 17                  473 	mov	__delay_loop_16_PARM_1+0, a
      00011C 04 57                  474 	mov	a, #0x04
      00011E 04 17                  475 	mov	__delay_loop_16_PARM_1+1, a
      000120 2A 70                  476 	call	__delay_loop_16
                                    477 ;	pfs173_TamNuoc.c: 145: i = 0;
      000122 10 26                  478 	clear	_i+0
                                    479 ;	pfs173_TamNuoc.c: 146: while (on_flag == 0)
      000124                        480 00112$:
      000124 0E 1F                  481 	mov	a, _on_flag+0
      000126 00 52                  482 	ceqsn	a, #0x00
      000128 C1 60                  483 	goto	00114$
                                    484 ;	pfs173_TamNuoc.c: 148: INTEN &= ~INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      00012A 84 3B                  485 	set0.io	__inten, #7
                                    486 ;	pfs173_TamNuoc.c: 149: on_flag = 0;
      00012C 0E 26                  487 	clear	_on_flag+0
                                    488 ;	pfs173_TamNuoc.c: 150: motor_val = 0;
      00012E 0A 26                  489 	clear	_motor_val+0
                                    490 ;	pfs173_TamNuoc.c: 151: clrb(Px_MOTOR, PIN_MOTOR);
      000130 10 38                  491 	set0.io	__pa, #0
                                    492 ;	pfs173_TamNuoc.c: 152: setb(Px_LED_1, PIN_LED_1);
      000132 90 3F                  493 	set1.io	__pa, #7
                                    494 ;	pfs173_TamNuoc.c: 153: setb(Px_LED_2, PIN_LED_2);
      000134 10 3E                  495 	set1.io	__pa, #4
                                    496 ;	pfs173_TamNuoc.c: 154: setb(Px_LED_3, PIN_LED_3);
      000136 13 3F                  497 	set1.io	__pb, #6
                                    498 ;	pfs173_TamNuoc.c: 155: setb(Px_LED_4, PIN_LED_4);
      000138 10 3F                  499 	set1.io	__pa, #6
      00013A                        500 00132$:
                                    501 ;	pfs173_TamNuoc.c: 156: for (; i < 8; i++)
      00013A 10 1F                  502 	mov	a, _i+0
      00013C 08 51                  503 	sub	a, #0x08
      00013E 80 34                  504 	t1sn.io	f, c
      000140 AA 60                  505 	goto	00106$
                                    506 ;	pfs173_TamNuoc.c: 158: daobit(Px_LED_4, PIN_LED_4);
      000142 40 57                  507 	mov	a, #0x40
      000144 90 00                  508 	xor.io	__pa, a
                                    509 ;	pfs173_TamNuoc.c: 159: _delay_ms(50);
      000146 68 57                  510 	mov	a, #0x68
      000148 03 17                  511 	mov	__delay_loop_16_PARM_1+0, a
      00014A 18 57                  512 	mov	a, #0x18
      00014C 04 17                  513 	mov	__delay_loop_16_PARM_1+1, a
      00014E 2A 70                  514 	call	__delay_loop_16
                                    515 ;	pfs173_TamNuoc.c: 156: for (; i < 8; i++)
      000150 10 24                  516 	inc	_i+0
      000152 9D 60                  517 	goto	00132$
      000154                        518 00106$:
                                    519 ;	pfs173_TamNuoc.c: 161: __stopsys(); // deep sleep
      000154 76 00                  520 	stopsys
                                    521 ;	pfs173_TamNuoc.c: 162: if (inbit(Px_SW_1, PIN_SW_1) == 0)
      000156 93 01                  522 	mov.io	a, __pb
      000158 08 54                  523 	and	a, #0x08
      00015A 6A 00                  524 	sr	a
      00015C 6A 00                  525 	sr	a
      00015E 6A 00                  526 	sr	a
      000160 00 52                  527 	ceqsn	a, #0x00
      000162 92 60                  528 	goto	00112$
                                    529 ;	pfs173_TamNuoc.c: 164: _delay_ms(100);
      000164 D2 57                  530 	mov	a, #0xd2
      000166 03 17                  531 	mov	__delay_loop_16_PARM_1+0, a
      000168 30 57                  532 	mov	a, #0x30
      00016A 04 17                  533 	mov	__delay_loop_16_PARM_1+1, a
      00016C 2A 70                  534 	call	__delay_loop_16
                                    535 ;	pfs173_TamNuoc.c: 165: while (inbit(Px_SW_1, PIN_SW_1) == 0)
      00016E                        536 00107$:
      00016E 93 01                  537 	mov.io	a, __pb
      000170 08 54                  538 	and	a, #0x08
      000172 6A 00                  539 	sr	a
      000174 6A 00                  540 	sr	a
      000176 6A 00                  541 	sr	a
      000178 00 53                  542 	cneqsn	a, #0x00
      00017A B7 60                  543 	goto	00107$
                                    544 ;	pfs173_TamNuoc.c: 168: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      00017C 84 3F                  545 	set1.io	__inten, #7
                                    546 ;	pfs173_TamNuoc.c: 169: on_flag = 1;
      00017E 01 57                  547 	mov	a, #0x01
      000180 0E 17                  548 	mov	_on_flag+0, a
                                    549 ;	pfs173_TamNuoc.c: 170: break;
      000182                        550 00114$:
                                    551 ;	pfs173_TamNuoc.c: 174: if (inbit(Px_SW_2, PIN_SW_2) == 0)
      000182 93 01                  552 	mov.io	a, __pb
      000184 04 54                  553 	and	a, #0x04
      000186 6A 00                  554 	sr	a
      000188 6A 00                  555 	sr	a
      00018A 00 52                  556 	ceqsn	a, #0x00
      00018C D9 60                  557 	goto	00121$
                                    558 ;	pfs173_TamNuoc.c: 176: while (inbit(Px_SW_2, PIN_SW_2) == 0)
      00018E                        559 00115$:
      00018E 93 01                  560 	mov.io	a, __pb
      000190 04 54                  561 	and	a, #0x04
      000192 6A 00                  562 	sr	a
      000194 6A 00                  563 	sr	a
      000196 00 53                  564 	cneqsn	a, #0x00
      000198 C7 60                  565 	goto	00115$
                                    566 ;	pfs173_TamNuoc.c: 178: mode++;
      00019A 0B 24                  567 	inc	_mode+0
                                    568 ;	pfs173_TamNuoc.c: 179: if (mode > 4)
      00019C 04 57                  569 	mov	a, #0x04
      00019E 0B 19                  570 	sub	a, _mode+0
      0001A0 80 34                  571 	t1sn.io	f, c
      0001A2 D4 60                  572 	goto	00119$
                                    573 ;	pfs173_TamNuoc.c: 181: mode = 1;
      0001A4 01 57                  574 	mov	a, #0x01
      0001A6 0B 17                  575 	mov	_mode+0, a
      0001A8                        576 00119$:
                                    577 ;	pfs173_TamNuoc.c: 183: _delay_ms(100);
      0001A8 D2 57                  578 	mov	a, #0xd2
      0001AA 03 17                  579 	mov	__delay_loop_16_PARM_1+0, a
      0001AC 30 57                  580 	mov	a, #0x30
      0001AE 04 17                  581 	mov	__delay_loop_16_PARM_1+1, a
      0001B0 2A 70                  582 	call	__delay_loop_16
      0001B2                        583 00121$:
                                    584 ;	pfs173_TamNuoc.c: 185: switch (mode)
      0001B2 0B 1F                  585 	mov	a, _mode+0
      0001B4 01 53                  586 	cneqsn	a, #0x01
      0001B6 E6 60                  587 	goto	00122$
      0001B8                        588 00204$:
      0001B8 0B 1F                  589 	mov	a, _mode+0
      0001BA 02 53                  590 	cneqsn	a, #0x02
      0001BC EB 60                  591 	goto	00123$
      0001BE 0B 1F                  592 	mov	a, _mode+0
      0001C0 03 53                  593 	cneqsn	a, #0x03
      0001C2 F0 60                  594 	goto	00124$
      0001C4                        595 00206$:
      0001C4 0B 1F                  596 	mov	a, _mode+0
      0001C6 04 53                  597 	cneqsn	a, #0x04
      0001C8 F3 60                  598 	goto	00125$
      0001CA                        599 00207$:
      0001CA 78 60                  600 	goto	00129$
                                    601 ;	pfs173_TamNuoc.c: 187: case 1:
      0001CC                        602 00122$:
                                    603 ;	pfs173_TamNuoc.c: 188: motor_val = 100;
      0001CC 64 57                  604 	mov	a, #0x64
      0001CE 0A 17                  605 	mov	_motor_val+0, a
                                    606 ;	pfs173_TamNuoc.c: 189: setb(Px_LED_4, PIN_LED_4);
      0001D0 10 3F                  607 	set1.io	__pa, #6
                                    608 ;	pfs173_TamNuoc.c: 190: clrb(Px_LED_1, PIN_LED_1);
      0001D2 90 3B                  609 	set0.io	__pa, #7
                                    610 ;	pfs173_TamNuoc.c: 191: break;
      0001D4 78 60                  611 	goto	00129$
                                    612 ;	pfs173_TamNuoc.c: 193: case 2:
      0001D6                        613 00123$:
                                    614 ;	pfs173_TamNuoc.c: 194: motor_val = 60;
      0001D6 3C 57                  615 	mov	a, #0x3c
      0001D8 0A 17                  616 	mov	_motor_val+0, a
                                    617 ;	pfs173_TamNuoc.c: 195: setb(Px_LED_1, PIN_LED_1);
      0001DA 90 3F                  618 	set1.io	__pa, #7
                                    619 ;	pfs173_TamNuoc.c: 196: clrb(Px_LED_2, PIN_LED_2);
      0001DC 10 3A                  620 	set0.io	__pa, #4
                                    621 ;	pfs173_TamNuoc.c: 197: break;
      0001DE 78 60                  622 	goto	00129$
                                    623 ;	pfs173_TamNuoc.c: 199: case 3:
      0001E0                        624 00124$:
                                    625 ;	pfs173_TamNuoc.c: 200: setb(Px_LED_2, PIN_LED_2);
      0001E0 10 3E                  626 	set1.io	__pa, #4
                                    627 ;	pfs173_TamNuoc.c: 201: clrb(Px_LED_3, PIN_LED_3);
      0001E2 13 3B                  628 	set0.io	__pb, #6
                                    629 ;	pfs173_TamNuoc.c: 202: break;
      0001E4 78 60                  630 	goto	00129$
                                    631 ;	pfs173_TamNuoc.c: 204: case 4:
      0001E6                        632 00125$:
                                    633 ;	pfs173_TamNuoc.c: 205: motor_val = 25;
      0001E6 19 57                  634 	mov	a, #0x19
      0001E8 0A 17                  635 	mov	_motor_val+0, a
                                    636 ;	pfs173_TamNuoc.c: 206: setb(Px_LED_3, PIN_LED_3);
      0001EA 13 3F                  637 	set1.io	__pb, #6
                                    638 ;	pfs173_TamNuoc.c: 207: clrb(Px_LED_4, PIN_LED_4);
      0001EC 10 3B                  639 	set0.io	__pa, #6
                                    640 ;	pfs173_TamNuoc.c: 208: break;
      0001EE 78 60                  641 	goto	00129$
                                    642 ;	pfs173_TamNuoc.c: 212: }
                                    643 ;	pfs173_TamNuoc.c: 214: }
      0001F0 7A 00                  644 	ret
                                    645 ;	pfs173_TamNuoc.c: 216: void interrupt(void) __interrupt(0)
                                    646 ;	-----------------------------------------
                                    647 ;	 function interrupt
                                    648 ;	-----------------------------------------
      0001F2                        649 _interrupt:
      0001F2 72 00                  650 	push	af
      0001F4 00 1F                  651 	mov	a, p
      0001F6 72 00                  652 	push	af
                                    653 ;	pfs173_TamNuoc.c: 218: if (INTRQ & INTRQ_TM3)
      0001F8 85 01                  654 	mov.io	a, __intrq
      0001FA 80 54                  655 	and	a, #0x80
      0001FC 00 53                  656 	cneqsn	a, #0x00
      0001FE 31 61                  657 	goto	00118$
                                    658 ;	pfs173_TamNuoc.c: 220: timer_cnt++;
      000200 09 24                  659 	inc	_timer_cnt+0
                                    660 ;	pfs173_TamNuoc.c: 221: if (timer_cnt >= 100)
      000202 09 1F                  661 	mov	a, _timer_cnt+0
      000204 64 51                  662 	sub	a, #0x64
      000206 80 30                  663 	t0sn.io	f, c
      000208 06 61                  664 	goto	00102$
                                    665 ;	pfs173_TamNuoc.c: 223: timer_cnt = 0;
      00020A 09 26                  666 	clear	_timer_cnt+0
      00020C                        667 00102$:
                                    668 ;	pfs173_TamNuoc.c: 225: if (mode == 3)
      00020C 0B 1F                  669 	mov	a, _mode+0
      00020E 03 52                  670 	ceqsn	a, #0x03
      000210 29 61                  671 	goto	00112$
                                    672 ;	pfs173_TamNuoc.c: 227: if (mode3 == 1)
      000212 0C 1F                  673 	mov	a, _mode3+0
      000214 11 17                  674 	mov	_interrupt_sloc0_1_0+0, a
      000216 0D 1F                  675 	mov	a, _mode3+1
      000218 12 17                  676 	mov	_interrupt_sloc0_1_0+1, a
      00021A 11 1F                  677 	mov	a, _interrupt_sloc0_1_0+0
      00021C 01 52                  678 	ceqsn	a, #0x01
      00021E 16 61                  679 	goto	00109$
      000220 12 1F                  680 	mov	a, _interrupt_sloc0_1_0+1
      000222 00 52                  681 	ceqsn	a, #0x00
      000224 16 61                  682 	goto	00109$
                                    683 ;	pfs173_TamNuoc.c: 229: motor_val = 100;
      000226 64 57                  684 	mov	a, #0x64
      000228 0A 17                  685 	mov	_motor_val+0, a
      00022A 27 61                  686 	goto	00110$
      00022C                        687 00109$:
                                    688 ;	pfs173_TamNuoc.c: 231: else if (mode3 == 5000)
      00022C 11 1F                  689 	mov	a, _interrupt_sloc0_1_0+0
      00022E 88 52                  690 	ceqsn	a, #0x88
      000230 1F 61                  691 	goto	00106$
      000232 12 1F                  692 	mov	a, _interrupt_sloc0_1_0+1
      000234 13 52                  693 	ceqsn	a, #0x13
      000236 1F 61                  694 	goto	00106$
                                    695 ;	pfs173_TamNuoc.c: 233: motor_val = 60;
      000238 3C 57                  696 	mov	a, #0x3c
      00023A 0A 17                  697 	mov	_motor_val+0, a
      00023C 27 61                  698 	goto	00110$
      00023E                        699 00106$:
                                    700 ;	pfs173_TamNuoc.c: 235: else if (mode3 == 8000)
      00023E 11 1F                  701 	mov	a, _interrupt_sloc0_1_0+0
      000240 40 52                  702 	ceqsn	a, #0x40
      000242 27 61                  703 	goto	00110$
      000244 12 1F                  704 	mov	a, _interrupt_sloc0_1_0+1
      000246 1F 52                  705 	ceqsn	a, #0x1f
      000248 27 61                  706 	goto	00110$
                                    707 ;	pfs173_TamNuoc.c: 237: mode3 = 0;
      00024A 0C 26                  708 	clear	_mode3+0
      00024C 0D 26                  709 	clear	_mode3+1
      00024E                        710 00110$:
                                    711 ;	pfs173_TamNuoc.c: 239: mode3++;
      00024E 0C 24                  712 	inc	_mode3+0
      000250 0D 20                  713 	addc	_mode3+1
      000252                        714 00112$:
                                    715 ;	pfs173_TamNuoc.c: 241: if (timer_cnt < motor_val)
      000252 09 1F                  716 	mov	a, _timer_cnt+0
      000254 0A 19                  717 	sub	a, _motor_val+0
      000256 80 34                  718 	t1sn.io	f, c
      000258 2F 61                  719 	goto	00114$
                                    720 ;	pfs173_TamNuoc.c: 243: setb(Px_MOTOR, PIN_MOTOR);
      00025A 10 3C                  721 	set1.io	__pa, #0
      00025C 30 61                  722 	goto	00115$
      00025E                        723 00114$:
                                    724 ;	pfs173_TamNuoc.c: 247: clrb(Px_MOTOR, PIN_MOTOR);
      00025E 10 38                  725 	set0.io	__pa, #0
      000260                        726 00115$:
                                    727 ;	pfs173_TamNuoc.c: 250: INTRQ &= ~INTRQ_TM3;
      000260 85 3B                  728 	set0.io	__intrq, #7
      000262                        729 00118$:
                                    730 ;	pfs173_TamNuoc.c: 252: }
      000262 73 00                  731 	pop	af
      000264 00 17                  732 	mov	p, a
      000266 73 00                  733 	pop	af
      000268 7B 00                  734 	reti
                                    735 	.area CODE
                                    736 	.area CONST
                                    737 	.area CABS (ABS)
