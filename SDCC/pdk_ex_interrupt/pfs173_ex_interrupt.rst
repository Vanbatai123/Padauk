                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_ex_interrupt
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
                                     78 	.globl _counter
                                     79 	.globl __delay_loop_32_PARM_1
                                     80 	.globl __delay_loop_16_PARM_1
                                     81 	.globl __delay_loop_8_PARM_1
                                     82 ;--------------------------------------------------------
                                     83 ; special function registers
                                     84 ;--------------------------------------------------------
                                     85 	.area RSEG (ABS)
      000000                         86 	.org 0x0000
                           000000    87 __flag	=	0x0000
                           000002    88 __sp	=	0x0002
                           000003    89 __clkmd	=	0x0003
                           000004    90 __inten	=	0x0004
                           000005    91 __intrq	=	0x0005
                           000006    92 __t16m	=	0x0006
                           00000A    93 __eoscr	=	0x000a
                           00000B    94 __ihrcr	=	0x000b
                           00000C    95 __integs	=	0x000c
                           00000D    96 __padier	=	0x000d
                           00000E    97 __pbdier	=	0x000e
                           00000F    98 __pcdier	=	0x000f
                           000010    99 __pa	=	0x0010
                           000011   100 __pac	=	0x0011
                           000012   101 __paph	=	0x0012
                           000013   102 __pb	=	0x0013
                           000014   103 __pbc	=	0x0014
                           000015   104 __pbph	=	0x0015
                           000016   105 __pc	=	0x0016
                           000017   106 __pcc	=	0x0017
                           000018   107 __pcph	=	0x0018
                           000019   108 __pbpl	=	0x0019
                           00001A   109 __pcpl	=	0x001a
                           000020   110 __adcc	=	0x0020
                           000021   111 __adcm	=	0x0021
                           000022   112 __adcr	=	0x0022
                           000024   113 __adcrgc	=	0x0024
                           000026   114 __misc	=	0x0026
                           000027   115 __misc2	=	0x0027
                           000028   116 __misclvr	=	0x0028
                           00002B   117 __gpcc	=	0x002b
                           00002C   118 __gpcs	=	0x002c
                           000030   119 __tm2c	=	0x0030
                           000031   120 __tm2ct	=	0x0031
                           000032   121 __tm2s	=	0x0032
                           000033   122 __tm2b	=	0x0033
                           000034   123 __tm3c	=	0x0034
                           000035   124 __tm3ct	=	0x0035
                           000036   125 __tm3s	=	0x0036
                           000037   126 __tm3b	=	0x0037
                           000040   127 __pwmg0c	=	0x0040
                           000041   128 __pwmgclk	=	0x0041
                           000042   129 __pwmg0dth	=	0x0042
                           000043   130 __pwmg0dtl	=	0x0043
                           000044   131 __pwmgcubh	=	0x0044
                           000045   132 __pwmgcubl	=	0x0045
                           000046   133 __pwmg1c	=	0x0046
                           000048   134 __pwmg1dth	=	0x0048
                           000049   135 __pwmg1dtl	=	0x0049
                           00004C   136 __pwmg2c	=	0x004c
                           00004E   137 __pwmg2dth	=	0x004e
                           00004F   138 __pwmg2dtl	=	0x004f
                           000062   139 __ilrcr	=	0x0062
                           000063   140 __bgtr	=	0x0063
                           000067   141 __rop	=	0x0067
      000000                        142 __t16c::
      000000                        143 	.ds 2
                                    144 ;--------------------------------------------------------
                                    145 ; ram data
                                    146 ;--------------------------------------------------------
                                    147 	.area DATA
      000002                        148 __delay_loop_8_PARM_1:
      000002                        149 	.ds 1
      000003                        150 __delay_loop_16_PARM_1:
      000003                        151 	.ds 2
      000005                        152 __delay_loop_32_PARM_1:
      000005                        153 	.ds 4
      000009                        154 _counter::
      000009                        155 	.ds 2
                                    156 ;--------------------------------------------------------
                                    157 ; overlayable items in ram
                                    158 ;--------------------------------------------------------
                                    159 ;--------------------------------------------------------
                                    160 ; Stack segment in internal ram
                                    161 ;--------------------------------------------------------
                                    162 	.area	SSEG
      00000B                        163 __start__stack:
      00000B                        164 	.ds	1
                                    165 
                                    166 ;--------------------------------------------------------
                                    167 ; absolute external ram data
                                    168 ;--------------------------------------------------------
                                    169 	.area DABS (ABS)
                                    170 ;--------------------------------------------------------
                                    171 ; interrupt vector
                                    172 ;--------------------------------------------------------
                                    173 	.area HOME
      000022                        174 __interrupt_vect:
                                    175 	.area	HEADER (ABS)
      000020                        176 	.org	 0x0020
      000020 4F 60                  177 	goto	_interrupt
                                    178 ;--------------------------------------------------------
                                    179 ; global & static initialisations
                                    180 ;--------------------------------------------------------
                                    181 	.area HOME
                                    182 	.area GSINIT
                                    183 	.area GSFINAL
                                    184 	.area GSINIT
                                    185 	.area	PREG (ABS)
      000000                        186 	.org 0x00
      000000                        187 p::
      000000                        188 	.ds 2
                                    189 	.area	HEADER (ABS)
      000000                        190 	.org 0x0000
      000000 00 00                  191 	nop
      000002 01 26                  192 	clear	p+1
      000004 0B 57                  193 	mov	a, #s_OSEG
      000006 01 50                  194 	add	a, #l_OSEG + 1
      000008 FE 54                  195 	and	a, #0xfe
      00000A 02 01                  196 	mov.io	sp, a
      00000C 34 70                  197 	call	__sdcc_external_startup
      00000E 12 60                  198 	goto	s_GSINIT
                                    199 	.area GSINIT
      000024                        200 __sdcc_init_data:
      000024 02 57                  201 	mov	a, #s_DATA
      000026 00 17                  202 	mov	p, a
      000028 19 60                  203 	goto	00002$
      00002A                        204 00001$:
      00002A 00 57                  205 	mov	a, #0x00
      00002C 00 07                  206 	idxm	p, a
      00002E 00 24                  207 	inc	p
      000030 02 57                  208 	mov	a, #s_DATA
      000032                        209 00002$:
      000032 09 50                  210 	add	a, #l_DATA
      000034 00 2E                  211 	ceqsn	a, p
      000036 15 60                  212 	goto	00001$
                                    213 	.area GSFINAL
      000038 11 60                  214 	goto	__sdcc_program_startup
                                    215 ;--------------------------------------------------------
                                    216 ; Home
                                    217 ;--------------------------------------------------------
                                    218 	.area HOME
                                    219 	.area HOME
      000022                        220 __sdcc_program_startup:
      000022 43 60                  221 	goto	_main
                                    222 ;	return from main will return to caller
                                    223 ;--------------------------------------------------------
                                    224 ; code
                                    225 ;--------------------------------------------------------
                                    226 	.area CODE
                                    227 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    228 ;	-----------------------------------------
                                    229 ;	 function _delay_loop_8
                                    230 ;	-----------------------------------------
      00003A                        231 __delay_loop_8:
                                    232 ;	delay.h: 44: __endasm;
      00003A                        233 	00001$:
                                    234 ; 4 cycles per loop
      00003A 02 23                  235 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00003C 1D 60                  236 	goto	00001$ ; 2 cycles
      00003E                        237 00101$:
                                    238 ;	delay.h: 45: }
      00003E 7A 00                  239 	ret
                                    240 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    241 ;	-----------------------------------------
                                    242 ;	 function _delay_loop_16
                                    243 ;	-----------------------------------------
      000040                        244 __delay_loop_16:
                                    245 ;	delay.h: 65: __endasm;
      000040                        246 	00001$:
                                    247 ; 8 cycles per loop
      000040 00 00                  248 	nop	; 1 cycle
      000042 03 25                  249 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000044 04 21                  250 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000046 03 1F                  251 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 1D                  252 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 00 34                  253 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00004C 20 60                  254 	goto	00001$ ; 2 cycles
      00004E                        255 00101$:
                                    256 ;	delay.h: 66: }
      00004E 7A 00                  257 	ret
                                    258 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    259 ;	-----------------------------------------
                                    260 ;	 function _delay_loop_32
                                    261 ;	-----------------------------------------
      000050                        262 __delay_loop_32:
                                    263 ;	delay.h: 94: __endasm;
      000050                        264 	00001$:
                                    265 ; 12 cycles per loop
      000050 00 00                  266 	nop	; 1 cycle
      000052 05 25                  267 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000054 06 21                  268 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000056 07 21                  269 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000058 08 21                  270 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005A 05 1F                  271 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00005C 06 1D                  272 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00005E 07 1D                  273 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000060 08 1D                  274 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000062 00 34                  275 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000064 28 60                  276 	goto	00001$ ; 2 cycles
      000066                        277 00101$:
                                    278 ;	delay.h: 95: }
      000066 7A 00                  279 	ret
                                    280 ;	pfs173_ex_interrupt.c: 8: uint8_t _sdcc_external_startup(void)
                                    281 ;	-----------------------------------------
                                    282 ;	 function _sdcc_external_startup
                                    283 ;	-----------------------------------------
      000068                        284 __sdcc_external_startup:
                                    285 ;	pfs173_ex_interrupt.c: 10: ROP = ROP_INT_SRC_PB5;
      000068 02 57                  286 	mov	a, #0x02
      00006A 67 01                  287 	mov.io	__rop, a
                                    288 ;	pfs173_ex_interrupt.c: 11: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      00006C 34 57                  289 	mov	a, #0x34
      00006E 03 01                  290 	mov.io	__clkmd, a
                                    291 ;	pfs173_ex_interrupt.c: 12: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      000070 52 54                  292 	and	a, #'R'                        
      000072 43 54                  293 	and	a, #'C'                        
      000074 01 54                  294 	and	a, #((1))          
      000076 00 54                  295 	and	a, #((8000000))     
      000078 12 54                  296 	and	a, #((8000000)>>8)  
      00007A 7A 54                  297 	and	a, #((8000000)>>16) 
      00007C 00 54                  298 	and	a, #((8000000)>>24) 
      00007E 88 54                  299 	and	a, #((5000))     
      000080 13 54                  300 	and	a, #((5000)>>8)  
      000082 0B 54                  301 	and	a, #((0x0B))           
                                    302 ;	pfs173_ex_interrupt.c: 13: return 0;							  //perform normal initialization
                                    303 ;	pfs173_ex_interrupt.c: 14: }
      000084 00 02                  304 	ret	#0x00
                                    305 ;	pfs173_ex_interrupt.c: 16: void main(void)
                                    306 ;	-----------------------------------------
                                    307 ;	 function main
                                    308 ;	-----------------------------------------
      000086                        309 _main:
                                    310 ;	pfs173_ex_interrupt.c: 18: setb(PBC, 4);
      000086 14 3E                  311 	set1.io	__pbc, #4
                                    312 ;	pfs173_ex_interrupt.c: 19: setb(PBDIER, 5);
      000088 8E 3E                  313 	set1.io	__pbdier, #5
                                    314 ;	pfs173_ex_interrupt.c: 20: setb(PBPH, 5);
      00008A 95 3E                  315 	set1.io	__pbph, #5
                                    316 ;	pfs173_ex_interrupt.c: 23: INTEN = INTEN_PB5;
      00008C 01 57                  317 	mov	a, #0x01
      00008E 04 01                  318 	mov.io	__inten, a
                                    319 ;	pfs173_ex_interrupt.c: 24: INTEGS = INTEGS_PB5_FALLING;
      000090 02 57                  320 	mov	a, #0x02
      000092 0C 01                  321 	mov.io	__integs, a
                                    322 ;	pfs173_ex_interrupt.c: 26: INTRQ = 0;
      000094 00 57                  323 	mov	a, #0x00
      000096 05 01                  324 	mov.io	__intrq, a
                                    325 ;	pfs173_ex_interrupt.c: 27: sei();
      000098 78 00                  326 	engint
                                    327 ;	pfs173_ex_interrupt.c: 29: while (1)
      00009A                        328 00102$:
      00009A 4D 60                  329 	goto	00102$
                                    330 ;	pfs173_ex_interrupt.c: 37: }
      00009C 7A 00                  331 	ret
                                    332 ;	pfs173_ex_interrupt.c: 39: void interrupt(void) __interrupt(0)
                                    333 ;	-----------------------------------------
                                    334 ;	 function interrupt
                                    335 ;	-----------------------------------------
      00009E                        336 _interrupt:
      00009E 72 00                  337 	push	af
      0000A0 00 1F                  338 	mov	a, p
      0000A2 72 00                  339 	push	af
                                    340 ;	pfs173_ex_interrupt.c: 41: if (INTRQ & INTRQ_PB5)
      0000A4 85 01                  341 	mov.io	a, __intrq
      0000A6 01 54                  342 	and	a, #0x01
      0000A8 00 53                  343 	cneqsn	a, #0x00
      0000AA 61 60                  344 	goto	00103$
                                    345 ;	pfs173_ex_interrupt.c: 43: INTRQ &= ~INTRQ_PB5;
      0000AC 05 38                  346 	set0.io	__intrq, #0
                                    347 ;	pfs173_ex_interrupt.c: 45: _delay_ms(300);
      0000AE 3E 57                  348 	mov	a, #0x3e
      0000B0 05 17                  349 	mov	__delay_loop_32_PARM_1+0, a
      0000B2 0D 57                  350 	mov	a, #0x0d
      0000B4 06 17                  351 	mov	__delay_loop_32_PARM_1+1, a
      0000B6 03 57                  352 	mov	a, #0x03
      0000B8 07 17                  353 	mov	__delay_loop_32_PARM_1+2, a
      0000BA 08 26                  354 	clear	__delay_loop_32_PARM_1+3
      0000BC 28 70                  355 	call	__delay_loop_32
                                    356 ;	pfs173_ex_interrupt.c: 46: daobit(PB, 4);
      0000BE 10 57                  357 	mov	a, #0x10
      0000C0 93 00                  358 	xor.io	__pb, a
      0000C2                        359 00103$:
                                    360 ;	pfs173_ex_interrupt.c: 48: }
      0000C2 73 00                  361 	pop	af
      0000C4 00 17                  362 	mov	p, a
      0000C6 73 00                  363 	pop	af
      0000C8 7B 00                  364 	reti
                                    365 	.area CODE
                                    366 	.area CONST
                                    367 	.area CABS (ABS)
