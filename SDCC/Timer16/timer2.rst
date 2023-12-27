                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timer2
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
                                     16 	.globl _main
                                     17 	.globl __sdcc_external_startup
                                     18 	.globl _interrupt
                                     19 	.globl __delay_loop_32
                                     20 	.globl __delay_loop_16
                                     21 	.globl __delay_loop_8
                                     22 	.globl __t16c
                                     23 	.globl __rop
                                     24 	.globl __bgtr
                                     25 	.globl __ilrcr
                                     26 	.globl __pwmg2dtl
                                     27 	.globl __pwmg2dth
                                     28 	.globl __pwmg2c
                                     29 	.globl __pwmg1dtl
                                     30 	.globl __pwmg1dth
                                     31 	.globl __pwmg1c
                                     32 	.globl __pwmgcubl
                                     33 	.globl __pwmgcubh
                                     34 	.globl __pwmg0dtl
                                     35 	.globl __pwmg0dth
                                     36 	.globl __pwmgclk
                                     37 	.globl __pwmg0c
                                     38 	.globl __tm3b
                                     39 	.globl __tm3s
                                     40 	.globl __tm3ct
                                     41 	.globl __tm3c
                                     42 	.globl __tm2b
                                     43 	.globl __tm2s
                                     44 	.globl __tm2ct
                                     45 	.globl __tm2c
                                     46 	.globl __gpcs
                                     47 	.globl __gpcc
                                     48 	.globl __misclvr
                                     49 	.globl __misc2
                                     50 	.globl __misc
                                     51 	.globl __adcrgc
                                     52 	.globl __adcr
                                     53 	.globl __adcm
                                     54 	.globl __adcc
                                     55 	.globl __pcpl
                                     56 	.globl __pbpl
                                     57 	.globl __pcph
                                     58 	.globl __pcc
                                     59 	.globl __pc
                                     60 	.globl __pbph
                                     61 	.globl __pbc
                                     62 	.globl __pb
                                     63 	.globl __paph
                                     64 	.globl __pac
                                     65 	.globl __pa
                                     66 	.globl __pcdier
                                     67 	.globl __pbdier
                                     68 	.globl __padier
                                     69 	.globl __integs
                                     70 	.globl __ihrcr
                                     71 	.globl __eoscr
                                     72 	.globl __t16m
                                     73 	.globl __intrq
                                     74 	.globl __inten
                                     75 	.globl __clkmd
                                     76 	.globl __sp
                                     77 	.globl __flag
                                     78 	.globl _flag
                                     79 	.globl _cnt
                                     80 	.globl __delay_loop_32_PARM_1
                                     81 	.globl __delay_loop_16_PARM_1
                                     82 	.globl __delay_loop_8_PARM_1
                                     83 ;--------------------------------------------------------
                                     84 ; special function registers
                                     85 ;--------------------------------------------------------
                                     86 	.area RSEG (ABS)
      000000                         87 	.org 0x0000
                           000000    88 __flag	=	0x0000
                           000002    89 __sp	=	0x0002
                           000003    90 __clkmd	=	0x0003
                           000004    91 __inten	=	0x0004
                           000005    92 __intrq	=	0x0005
                           000006    93 __t16m	=	0x0006
                           00000A    94 __eoscr	=	0x000a
                           00000B    95 __ihrcr	=	0x000b
                           00000C    96 __integs	=	0x000c
                           00000D    97 __padier	=	0x000d
                           00000E    98 __pbdier	=	0x000e
                           00000F    99 __pcdier	=	0x000f
                           000010   100 __pa	=	0x0010
                           000011   101 __pac	=	0x0011
                           000012   102 __paph	=	0x0012
                           000013   103 __pb	=	0x0013
                           000014   104 __pbc	=	0x0014
                           000015   105 __pbph	=	0x0015
                           000016   106 __pc	=	0x0016
                           000017   107 __pcc	=	0x0017
                           000018   108 __pcph	=	0x0018
                           000019   109 __pbpl	=	0x0019
                           00001A   110 __pcpl	=	0x001a
                           000020   111 __adcc	=	0x0020
                           000021   112 __adcm	=	0x0021
                           000022   113 __adcr	=	0x0022
                           000024   114 __adcrgc	=	0x0024
                           000026   115 __misc	=	0x0026
                           000027   116 __misc2	=	0x0027
                           000028   117 __misclvr	=	0x0028
                           00002B   118 __gpcc	=	0x002b
                           00002C   119 __gpcs	=	0x002c
                           000030   120 __tm2c	=	0x0030
                           000031   121 __tm2ct	=	0x0031
                           000032   122 __tm2s	=	0x0032
                           000033   123 __tm2b	=	0x0033
                           000034   124 __tm3c	=	0x0034
                           000035   125 __tm3ct	=	0x0035
                           000036   126 __tm3s	=	0x0036
                           000037   127 __tm3b	=	0x0037
                           000040   128 __pwmg0c	=	0x0040
                           000041   129 __pwmgclk	=	0x0041
                           000042   130 __pwmg0dth	=	0x0042
                           000043   131 __pwmg0dtl	=	0x0043
                           000044   132 __pwmgcubh	=	0x0044
                           000045   133 __pwmgcubl	=	0x0045
                           000046   134 __pwmg1c	=	0x0046
                           000048   135 __pwmg1dth	=	0x0048
                           000049   136 __pwmg1dtl	=	0x0049
                           00004C   137 __pwmg2c	=	0x004c
                           00004E   138 __pwmg2dth	=	0x004e
                           00004F   139 __pwmg2dtl	=	0x004f
                           000062   140 __ilrcr	=	0x0062
                           000063   141 __bgtr	=	0x0063
                           000067   142 __rop	=	0x0067
      000000                        143 __t16c::
      000000                        144 	.ds 2
                                    145 ;--------------------------------------------------------
                                    146 ; ram data
                                    147 ;--------------------------------------------------------
                                    148 	.area DATA
      000002                        149 __delay_loop_8_PARM_1:
      000002                        150 	.ds 1
      000003                        151 __delay_loop_16_PARM_1:
      000003                        152 	.ds 2
      000005                        153 __delay_loop_32_PARM_1:
      000005                        154 	.ds 4
      000009                        155 _cnt::
      000009                        156 	.ds 4
      00000D                        157 _flag::
      00000D                        158 	.ds 1
                                    159 ;--------------------------------------------------------
                                    160 ; overlayable items in ram
                                    161 ;--------------------------------------------------------
                                    162 ;--------------------------------------------------------
                                    163 ; Stack segment in internal ram
                                    164 ;--------------------------------------------------------
                                    165 	.area	SSEG
      00000E                        166 __start__stack:
      00000E                        167 	.ds	1
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
      000020 39 60                  180 	goto	_interrupt
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
      000004 0E 57                  196 	mov	a, #s_OSEG
      000006 01 50                  197 	add	a, #l_OSEG + 1
      000008 FE 54                  198 	and	a, #0xfe
      00000A 02 01                  199 	mov.io	sp, a
      00000C 59 70                  200 	call	__sdcc_external_startup
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
      000032 0C 50                  213 	add	a, #l_DATA
      000034 00 2E                  214 	ceqsn	a, p
      000036 15 60                  215 	goto	00001$
                                    216 ;	timer2.c: 10: uint32_t cnt = 0;
      000038 09 26                  217 	clear	_cnt+0
      00003A 0A 26                  218 	clear	_cnt+1
      00003C 0B 26                  219 	clear	_cnt+2
      00003E 0C 26                  220 	clear	_cnt+3
                                    221 ;	timer2.c: 11: uint8_t flag = 0;
      000040 0D 26                  222 	clear	_flag+0
                                    223 	.area GSFINAL
      000042 11 60                  224 	goto	__sdcc_program_startup
                                    225 ;--------------------------------------------------------
                                    226 ; Home
                                    227 ;--------------------------------------------------------
                                    228 	.area HOME
                                    229 	.area HOME
      000022                        230 __sdcc_program_startup:
      000022 66 60                  231 	goto	_main
                                    232 ;	return from main will return to caller
                                    233 ;--------------------------------------------------------
                                    234 ; code
                                    235 ;--------------------------------------------------------
                                    236 	.area CODE
                                    237 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    238 ;	-----------------------------------------
                                    239 ;	 function _delay_loop_8
                                    240 ;	-----------------------------------------
      000044                        241 __delay_loop_8:
                                    242 ;	delay.h: 44: __endasm;
      000044                        243 	00001$:
                                    244 ; 4 cycles per loop
      000044 02 23                  245 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000046 22 60                  246 	goto	00001$ ; 2 cycles
      000048                        247 00101$:
                                    248 ;	delay.h: 45: }
      000048 7A 00                  249 	ret
                                    250 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    251 ;	-----------------------------------------
                                    252 ;	 function _delay_loop_16
                                    253 ;	-----------------------------------------
      00004A                        254 __delay_loop_16:
                                    255 ;	delay.h: 65: __endasm;
      00004A                        256 	00001$:
                                    257 ; 8 cycles per loop
      00004A 00 00                  258 	nop	; 1 cycle
      00004C 03 25                  259 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00004E 04 21                  260 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000050 03 1F                  261 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000052 04 1D                  262 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000054 00 34                  263 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000056 25 60                  264 	goto	00001$ ; 2 cycles
      000058                        265 00101$:
                                    266 ;	delay.h: 66: }
      000058 7A 00                  267 	ret
                                    268 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    269 ;	-----------------------------------------
                                    270 ;	 function _delay_loop_32
                                    271 ;	-----------------------------------------
      00005A                        272 __delay_loop_32:
                                    273 ;	delay.h: 94: __endasm;
      00005A                        274 	00001$:
                                    275 ; 12 cycles per loop
      00005A 00 00                  276 	nop	; 1 cycle
      00005C 05 25                  277 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      00005E 06 21                  278 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000060 07 21                  279 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000062 08 21                  280 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000064 05 1F                  281 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000066 06 1D                  282 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000068 07 1D                  283 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      00006A 08 1D                  284 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      00006C 00 34                  285 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00006E 2D 60                  286 	goto	00001$ ; 2 cycles
      000070                        287 00101$:
                                    288 ;	delay.h: 95: }
      000070 7A 00                  289 	ret
                                    290 ;	timer2.c: 13: void interrupt(void) __interrupt(0)
                                    291 ;	-----------------------------------------
                                    292 ;	 function interrupt
                                    293 ;	-----------------------------------------
      000072                        294 _interrupt:
      000072 72 00                  295 	push	af
      000074 00 1F                  296 	mov	a, p
      000076 72 00                  297 	push	af
                                    298 ;	timer2.c: 15: if( INTRQ & INTRQ_TM2 )                       //TM2 interrupt request?
      000078 85 01                  299 	mov.io	a, __intrq
      00007A 40 54                  300 	and	a, #0x40
      00007C 00 53                  301 	cneqsn	a, #0x00
      00007E 55 60                  302 	goto	00105$
                                    303 ;	timer2.c: 17: INTRQ &= ~INTRQ_TM2;                        //mark TM2 interrupt request processed
      000080 05 3B                  304 	set0.io	__intrq, #6
                                    305 ;	timer2.c: 18: cnt++;
      000082 09 24                  306 	inc	_cnt+0
      000084 0A 20                  307 	addc	_cnt+1
      000086 0B 20                  308 	addc	_cnt+2
      000088 0C 20                  309 	addc	_cnt+3
                                    310 ;	timer2.c: 19: if(cnt >= 200)
      00008A 09 1F                  311 	mov	a, _cnt+0
      00008C C8 51                  312 	sub	a, #0xc8
      00008E 0A 1F                  313 	mov	a, _cnt+1
      000090 61 00                  314 	subc	a
      000092 0B 1F                  315 	mov	a, _cnt+2
      000094 61 00                  316 	subc	a
      000096 0C 1F                  317 	mov	a, _cnt+3
      000098 61 00                  318 	subc	a
      00009A 80 30                  319 	t0sn.io	f, c
      00009C 55 60                  320 	goto	00105$
                                    321 ;	timer2.c: 21: cnt = 0;
      00009E 09 26                  322 	clear	_cnt+0
      0000A0 0A 26                  323 	clear	_cnt+1
      0000A2 0B 26                  324 	clear	_cnt+2
      0000A4 0C 26                  325 	clear	_cnt+3
                                    326 ;	timer2.c: 22: flag = 1;
      0000A6 01 57                  327 	mov	a, #0x01
      0000A8 0D 17                  328 	mov	_flag+0, a
      0000AA                        329 00105$:
                                    330 ;	timer2.c: 25: }
      0000AA 73 00                  331 	pop	af
      0000AC 00 17                  332 	mov	p, a
      0000AE 73 00                  333 	pop	af
      0000B0 7B 00                  334 	reti
                                    335 ;	timer2.c: 27: unsigned char _sdcc_external_startup(void)
                                    336 ;	-----------------------------------------
                                    337 ;	 function _sdcc_external_startup
                                    338 ;	-----------------------------------------
      0000B2                        339 __sdcc_external_startup:
                                    340 ;	timer2.c: 29: EASY_PDK_INIT_SYSCLOCK_8MHZ();        //use 8MHz sysclock
      0000B2 34 57                  341 	mov	a, #0x34
      0000B4 03 01                  342 	mov.io	__clkmd, a
                                    343 ;	timer2.c: 30: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      0000B6 52 54                  344 	and	a, #'R'                        
      0000B8 43 54                  345 	and	a, #'C'                        
      0000BA 01 54                  346 	and	a, #((1))          
      0000BC 00 54                  347 	and	a, #((8000000))     
      0000BE 12 54                  348 	and	a, #((8000000)>>8)  
      0000C0 7A 54                  349 	and	a, #((8000000)>>16) 
      0000C2 00 54                  350 	and	a, #((8000000)>>24) 
      0000C4 88 54                  351 	and	a, #((5000))     
      0000C6 13 54                  352 	and	a, #((5000)>>8)  
      0000C8 0B 54                  353 	and	a, #((0x0B))           
                                    354 ;	timer2.c: 31: return 0;                             //perform normal initialization
                                    355 ;	timer2.c: 32: }
      0000CA 00 02                  356 	ret	#0x00
                                    357 ;	timer2.c: 34: void main(void)
                                    358 ;	-----------------------------------------
                                    359 ;	 function main
                                    360 ;	-----------------------------------------
      0000CC                        361 _main:
                                    362 ;	timer2.c: 37: PBC = 0xFF;
      0000CC FF 57                  363 	mov	a, #0xff
      0000CE 14 01                  364 	mov.io	__pbc, a
                                    365 ;	timer2.c: 39: TM2C = TM2C_CLK_IHRC;                         //use IHRC -> 16 Mhz
      0000D0 20 57                  366 	mov	a, #0x20
      0000D2 30 01                  367 	mov.io	__tm2c, a
                                    368 ;	timer2.c: 40: TM2S = TM2S_PRESCALE_DIV64 | TM2S_SCALE_NONE;  //no prescale, scale 2 ~> 8MHz
      0000D4 60 57                  369 	mov	a, #0x60
      0000D6 32 01                  370 	mov.io	__tm2s, a
                                    371 ;	timer2.c: 41: TM2B = 250;                                    //divide by 69 ~> 115942 Hz (apx. 115200)
      0000D8 FA 57                  372 	mov	a, #0xfa
      0000DA 33 01                  373 	mov.io	__tm2b, a
                                    374 ;	timer2.c: 43: INTEN = INTEN_TM2;                            //enable TM2 interrupt, send out initial stop bits and autobaud char
      0000DC 40 57                  375 	mov	a, #0x40
      0000DE 04 01                  376 	mov.io	__inten, a
                                    377 ;	timer2.c: 44: sei();                                   //enable global interrupts
      0000E0 78 00                  378 	engint
                                    379 ;	timer2.c: 48: while (!flag);
      0000E2                        380 00101$:
      0000E2 0D 1F                  381 	mov	a, _flag+0
      0000E4 00 53                  382 	cneqsn	a, #0x00
      0000E6 71 60                  383 	goto	00101$
                                    384 ;	timer2.c: 50: daobit(PB, 4);
      0000E8 10 57                  385 	mov	a, #0x10
      0000EA 93 00                  386 	xor.io	__pb, a
                                    387 ;	timer2.c: 52: flag = 0;
      0000EC 0D 26                  388 	clear	_flag+0
      0000EE 71 60                  389 	goto	00101$
                                    390 ;	timer2.c: 54: }
      0000F0 7A 00                  391 	ret
                                    392 	.area CODE
                                    393 	.area CONST
                                    394 	.area CABS (ABS)
