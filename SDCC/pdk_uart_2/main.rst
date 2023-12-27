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
                                     19 	.globl _TIM2_interrupt
                                     20 	.globl _UART_begin
                                     21 	.globl __delay_loop_32
                                     22 	.globl __delay_loop_16
                                     23 	.globl __delay_loop_8
                                     24 	.globl _puts
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
                                     81 	.globl _txdata
                                     82 	.globl __delay_loop_32_PARM_1
                                     83 	.globl __delay_loop_16_PARM_1
                                     84 	.globl __delay_loop_8_PARM_1
                                     85 ;--------------------------------------------------------
                                     86 ; special function registers
                                     87 ;--------------------------------------------------------
                                     88 	.area RSEG (ABS)
      000000                         89 	.org 0x0000
                           000000    90 __flag	=	0x0000
                           000002    91 __sp	=	0x0002
                           000003    92 __clkmd	=	0x0003
                           000004    93 __inten	=	0x0004
                           000005    94 __intrq	=	0x0005
                           000006    95 __t16m	=	0x0006
                           00000A    96 __eoscr	=	0x000a
                           00000B    97 __ihrcr	=	0x000b
                           00000C    98 __integs	=	0x000c
                           00000D    99 __padier	=	0x000d
                           00000E   100 __pbdier	=	0x000e
                           00000F   101 __pcdier	=	0x000f
                           000010   102 __pa	=	0x0010
                           000011   103 __pac	=	0x0011
                           000012   104 __paph	=	0x0012
                           000013   105 __pb	=	0x0013
                           000014   106 __pbc	=	0x0014
                           000015   107 __pbph	=	0x0015
                           000016   108 __pc	=	0x0016
                           000017   109 __pcc	=	0x0017
                           000018   110 __pcph	=	0x0018
                           000019   111 __pbpl	=	0x0019
                           00001A   112 __pcpl	=	0x001a
                           000020   113 __adcc	=	0x0020
                           000021   114 __adcm	=	0x0021
                           000022   115 __adcr	=	0x0022
                           000024   116 __adcrgc	=	0x0024
                           000026   117 __misc	=	0x0026
                           000027   118 __misc2	=	0x0027
                           000028   119 __misclvr	=	0x0028
                           00002B   120 __gpcc	=	0x002b
                           00002C   121 __gpcs	=	0x002c
                           000030   122 __tm2c	=	0x0030
                           000031   123 __tm2ct	=	0x0031
                           000032   124 __tm2s	=	0x0032
                           000033   125 __tm2b	=	0x0033
                           000034   126 __tm3c	=	0x0034
                           000035   127 __tm3ct	=	0x0035
                           000036   128 __tm3s	=	0x0036
                           000037   129 __tm3b	=	0x0037
                           000040   130 __pwmg0c	=	0x0040
                           000041   131 __pwmgclk	=	0x0041
                           000042   132 __pwmg0dth	=	0x0042
                           000043   133 __pwmg0dtl	=	0x0043
                           000044   134 __pwmgcubh	=	0x0044
                           000045   135 __pwmgcubl	=	0x0045
                           000046   136 __pwmg1c	=	0x0046
                           000048   137 __pwmg1dth	=	0x0048
                           000049   138 __pwmg1dtl	=	0x0049
                           00004C   139 __pwmg2c	=	0x004c
                           00004E   140 __pwmg2dth	=	0x004e
                           00004F   141 __pwmg2dtl	=	0x004f
                           000062   142 __ilrcr	=	0x0062
                           000063   143 __bgtr	=	0x0063
                           000067   144 __rop	=	0x0067
      000000                        145 __t16c::
      000000                        146 	.ds 2
                                    147 ;--------------------------------------------------------
                                    148 ; ram data
                                    149 ;--------------------------------------------------------
                                    150 	.area DATA
      000002                        151 __delay_loop_8_PARM_1:
      000002                        152 	.ds 1
      000003                        153 __delay_loop_16_PARM_1:
      000003                        154 	.ds 2
      000005                        155 __delay_loop_32_PARM_1:
      000005                        156 	.ds 4
      000009                        157 _txdata::
      000009                        158 	.ds 2
                                    159 ;--------------------------------------------------------
                                    160 ; overlayable items in ram
                                    161 ;--------------------------------------------------------
                                    162 ;--------------------------------------------------------
                                    163 ; Stack segment in internal ram
                                    164 ;--------------------------------------------------------
                                    165 	.area	SSEG
      000011                        166 __start__stack:
      000011                        167 	.ds	1
                                    168 
                                    169 ;--------------------------------------------------------
                                    170 ; absolute external ram data
                                    171 ;--------------------------------------------------------
                                    172 	.area DABS (ABS)
                                    173 ;--------------------------------------------------------
                                    174 ; interrupt vector
                                    175 ;--------------------------------------------------------
                                    176 	.area HOME
      000022                        177 __interrupt_vect:
                                    178 	.area	HEADER (ABS)
      000020                        179 	.org	 0x0020
      000020 54 60                  180 	goto	_interrupt
                                    181 ;--------------------------------------------------------
                                    182 ; global & static initialisations
                                    183 ;--------------------------------------------------------
                                    184 	.area HOME
                                    185 	.area GSINIT
                                    186 	.area GSFINAL
                                    187 	.area GSINIT
                                    188 	.area	PREG (ABS)
      000000                        189 	.org 0x00
      000000                        190 p::
      000000                        191 	.ds 2
                                    192 	.area	HEADER (ABS)
      000000                        193 	.org 0x0000
      000000 00 00                  194 	nop
      000002 01 26                  195 	clear	p+1
      000004 11 57                  196 	mov	a, #s_OSEG
      000006 01 50                  197 	add	a, #l_OSEG + 1
      000008 FE 54                  198 	and	a, #0xfe
      00000A 02 01                  199 	mov.io	sp, a
      00000C 34 70                  200 	call	__sdcc_external_startup
      00000E 12 60                  201 	goto	s_GSINIT
                                    202 	.area GSINIT
      000024                        203 __sdcc_init_data:
      000024 02 57                  204 	mov	a, #s_DATA
      000026 00 17                  205 	mov	p, a
      000028 19 60                  206 	goto	00002$
      00002A                        207 00001$:
      00002A 00 57                  208 	mov	a, #0x00
      00002C 00 07                  209 	idxm	p, a
      00002E 00 24                  210 	inc	p
      000030 02 57                  211 	mov	a, #s_DATA
      000032                        212 00002$:
      000032 0F 50                  213 	add	a, #l_DATA
      000034 00 2E                  214 	ceqsn	a, p
      000036 15 60                  215 	goto	00001$
                                    216 	.area GSFINAL
      000038 11 60                  217 	goto	__sdcc_program_startup
                                    218 ;--------------------------------------------------------
                                    219 ; Home
                                    220 ;--------------------------------------------------------
                                    221 	.area HOME
                                    222 	.area HOME
      000022                        223 __sdcc_program_startup:
      000022 41 60                  224 	goto	_main
                                    225 ;	return from main will return to caller
                                    226 ;--------------------------------------------------------
                                    227 ; code
                                    228 ;--------------------------------------------------------
                                    229 	.area CODE
                                    230 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    231 ;	-----------------------------------------
                                    232 ;	 function _delay_loop_8
                                    233 ;	-----------------------------------------
      00003A                        234 __delay_loop_8:
                                    235 ;	delay.h: 44: __endasm;
      00003A                        236 	00001$:
                                    237 ; 4 cycles per loop
      00003A 02 23                  238 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00003C 1D 60                  239 	goto	00001$ ; 2 cycles
      00003E                        240 00101$:
                                    241 ;	delay.h: 45: }
      00003E 7A 00                  242 	ret
                                    243 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    244 ;	-----------------------------------------
                                    245 ;	 function _delay_loop_16
                                    246 ;	-----------------------------------------
      000040                        247 __delay_loop_16:
                                    248 ;	delay.h: 65: __endasm;
      000040                        249 	00001$:
                                    250 ; 8 cycles per loop
      000040 00 00                  251 	nop	; 1 cycle
      000042 03 25                  252 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000044 04 21                  253 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000046 03 1F                  254 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 1D                  255 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 00 34                  256 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00004C 20 60                  257 	goto	00001$ ; 2 cycles
      00004E                        258 00101$:
                                    259 ;	delay.h: 66: }
      00004E 7A 00                  260 	ret
                                    261 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    262 ;	-----------------------------------------
                                    263 ;	 function _delay_loop_32
                                    264 ;	-----------------------------------------
      000050                        265 __delay_loop_32:
                                    266 ;	delay.h: 94: __endasm;
      000050                        267 	00001$:
                                    268 ; 12 cycles per loop
      000050 00 00                  269 	nop	; 1 cycle
      000052 05 25                  270 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000054 06 21                  271 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000056 07 21                  272 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000058 08 21                  273 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005A 05 1F                  274 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00005C 06 1D                  275 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00005E 07 1D                  276 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000060 08 1D                  277 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000062 00 34                  278 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000064 28 60                  279 	goto	00001$ ; 2 cycles
      000066                        280 00101$:
                                    281 ;	delay.h: 95: }
      000066 7A 00                  282 	ret
                                    283 ;	main.c: 13: uint8_t _sdcc_external_startup(void)
                                    284 ;	-----------------------------------------
                                    285 ;	 function _sdcc_external_startup
                                    286 ;	-----------------------------------------
      000068                        287 __sdcc_external_startup:
                                    288 ;	main.c: 15: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000068 34 57                  289 	mov	a, #0x34
      00006A 03 01                  290 	mov.io	__clkmd, a
                                    291 ;	main.c: 16: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); //tune SYSCLK to 8MHz @ 4.000V
      00006C 52 54                  292 	and	a, #'R'                        
      00006E 43 54                  293 	and	a, #'C'                        
      000070 01 54                  294 	and	a, #((1))          
      000072 00 54                  295 	and	a, #((8000000))     
      000074 12 54                  296 	and	a, #((8000000)>>8)  
      000076 7A 54                  297 	and	a, #((8000000)>>16) 
      000078 00 54                  298 	and	a, #((8000000)>>24) 
      00007A A0 54                  299 	and	a, #((4000))     
      00007C 0F 54                  300 	and	a, #((4000)>>8)  
      00007E 0B 54                  301 	and	a, #((0x0B))           
                                    302 ;	main.c: 17: return 0;							  //perform normal initialization
                                    303 ;	main.c: 18: }
      000080 00 02                  304 	ret	#0x00
                                    305 ;	main.c: 20: int main(void)
                                    306 ;	-----------------------------------------
                                    307 ;	 function main
                                    308 ;	-----------------------------------------
      000082                        309 _main:
                                    310 ;	main.c: 23: UART_begin(); // Initialize UART engine
      000082 61 70                  311 	call	_UART_begin
                                    312 ;	main.c: 25: INTRQ = 0;
      000084 00 57                  313 	mov	a, #0x00
      000086 05 01                  314 	mov.io	__intrq, a
                                    315 ;	main.c: 26: sei(); // Enable global interrupts
      000088 78 00                  316 	engint
                                    317 ;	main.c: 27: while (1)
      00008A                        318 00102$:
                                    319 ;	main.c: 29: puts("Hello World!");
      00008A B9 57                  320 	mov	a, #<(___str_0 + 0)
      00008C 0D 17                  321 	mov	_puts_PARM_1+0, a
      00008E 80 57                  322 	mov	a, #>(___str_0 + 0x8000 + 0)
      000090 0E 17                  323 	mov	_puts_PARM_1+1, a
      000092 91 70                  324 	call	_puts
                                    325 ;	main.c: 30: _delay_ms(1000);
      000094 29 57                  326 	mov	a, #0x29
      000096 05 17                  327 	mov	__delay_loop_32_PARM_1+0, a
      000098 2C 57                  328 	mov	a, #0x2c
      00009A 06 17                  329 	mov	__delay_loop_32_PARM_1+1, a
      00009C 0A 57                  330 	mov	a, #0x0a
      00009E 07 17                  331 	mov	__delay_loop_32_PARM_1+2, a
      0000A0 08 26                  332 	clear	__delay_loop_32_PARM_1+3
      0000A2 28 70                  333 	call	__delay_loop_32
      0000A4 45 60                  334 	goto	00102$
                                    335 ;	main.c: 32: }
      0000A6 7A 00                  336 	ret
                                    337 ;	main.c: 35: void interrupt(void) __interrupt(0)
                                    338 ;	-----------------------------------------
                                    339 ;	 function interrupt
                                    340 ;	-----------------------------------------
      0000A8                        341 _interrupt:
      0000A8 72 00                  342 	push	af
      0000AA 00 1F                  343 	mov	a, p
      0000AC 72 00                  344 	push	af
                                    345 ;	main.c: 38: if (INTRQ & INTRQ_TM2)
      0000AE 85 01                  346 	mov.io	a, __intrq
      0000B0 40 54                  347 	and	a, #0x40
      0000B2 00 53                  348 	cneqsn	a, #0x00
      0000B4 5D 60                  349 	goto	00103$
                                    350 ;	main.c: 40: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      0000B6 05 3B                  351 	set0.io	__intrq, #6
                                    352 ;	main.c: 42: TIM2_interrupt();
      0000B8 6E 70                  353 	call	_TIM2_interrupt
      0000BA                        354 00103$:
                                    355 ;	main.c: 44: }
      0000BA 73 00                  356 	pop	af
      0000BC 00 17                  357 	mov	p, a
      0000BE 73 00                  358 	pop	af
      0000C0 7B 00                  359 	reti
                                    360 	.area CODE
                                    361 	.area CONST
                                    362 	.area CONST
      000172                        363 ___str_0:
      000172 48 02                  364 	ret #0x48	; H
      000174 65 02                  365 	ret #0x65	; e
      000176 6C 02                  366 	ret #0x6c	; l
      000178 6C 02                  367 	ret #0x6c	; l
      00017A 6F 02                  368 	ret #0x6f	; o
      00017C 20 02                  369 	ret #0x20	;  
      00017E 57 02                  370 	ret #0x57	; W
      000180 6F 02                  371 	ret #0x6f	; o
      000182 72 02                  372 	ret #0x72	; r
      000184 6C 02                  373 	ret #0x6c	; l
      000186 64 02                  374 	ret #0x64	; d
      000188 21 02                  375 	ret #0x21	; !
      00018A 00 02                  376 	ret #0x00
                                    377 	.area CODE
                                    378 	.area CABS (ABS)
