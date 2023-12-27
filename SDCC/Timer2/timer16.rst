                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timer16
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
                                     18 	.globl __delay_loop_32
                                     19 	.globl __delay_loop_16
                                     20 	.globl __delay_loop_8
                                     21 	.globl __t16c
                                     22 	.globl __rop
                                     23 	.globl __bgtr
                                     24 	.globl __ilrcr
                                     25 	.globl __pwmg2dtl
                                     26 	.globl __pwmg2dth
                                     27 	.globl __pwmg2c
                                     28 	.globl __pwmg1dtl
                                     29 	.globl __pwmg1dth
                                     30 	.globl __pwmg1c
                                     31 	.globl __pwmgcubl
                                     32 	.globl __pwmgcubh
                                     33 	.globl __pwmg0dtl
                                     34 	.globl __pwmg0dth
                                     35 	.globl __pwmgclk
                                     36 	.globl __pwmg0c
                                     37 	.globl __tm3b
                                     38 	.globl __tm3s
                                     39 	.globl __tm3ct
                                     40 	.globl __tm3c
                                     41 	.globl __tm2b
                                     42 	.globl __tm2s
                                     43 	.globl __tm2ct
                                     44 	.globl __tm2c
                                     45 	.globl __gpcs
                                     46 	.globl __gpcc
                                     47 	.globl __misclvr
                                     48 	.globl __misc2
                                     49 	.globl __misc
                                     50 	.globl __adcrgc
                                     51 	.globl __adcr
                                     52 	.globl __adcm
                                     53 	.globl __adcc
                                     54 	.globl __pcpl
                                     55 	.globl __pbpl
                                     56 	.globl __pcph
                                     57 	.globl __pcc
                                     58 	.globl __pc
                                     59 	.globl __pbph
                                     60 	.globl __pbc
                                     61 	.globl __pb
                                     62 	.globl __paph
                                     63 	.globl __pac
                                     64 	.globl __pa
                                     65 	.globl __pcdier
                                     66 	.globl __pbdier
                                     67 	.globl __padier
                                     68 	.globl __integs
                                     69 	.globl __ihrcr
                                     70 	.globl __eoscr
                                     71 	.globl __t16m
                                     72 	.globl __intrq
                                     73 	.globl __inten
                                     74 	.globl __clkmd
                                     75 	.globl __sp
                                     76 	.globl __flag
                                     77 	.globl __delay_loop_32_PARM_1
                                     78 	.globl __delay_loop_16_PARM_1
                                     79 	.globl __delay_loop_8_PARM_1
                                     80 ;--------------------------------------------------------
                                     81 ; special function registers
                                     82 ;--------------------------------------------------------
                                     83 	.area RSEG (ABS)
      000000                         84 	.org 0x0000
                           000000    85 __flag	=	0x0000
                           000002    86 __sp	=	0x0002
                           000003    87 __clkmd	=	0x0003
                           000004    88 __inten	=	0x0004
                           000005    89 __intrq	=	0x0005
                           000006    90 __t16m	=	0x0006
                           00000A    91 __eoscr	=	0x000a
                           00000B    92 __ihrcr	=	0x000b
                           00000C    93 __integs	=	0x000c
                           00000D    94 __padier	=	0x000d
                           00000E    95 __pbdier	=	0x000e
                           00000F    96 __pcdier	=	0x000f
                           000010    97 __pa	=	0x0010
                           000011    98 __pac	=	0x0011
                           000012    99 __paph	=	0x0012
                           000013   100 __pb	=	0x0013
                           000014   101 __pbc	=	0x0014
                           000015   102 __pbph	=	0x0015
                           000016   103 __pc	=	0x0016
                           000017   104 __pcc	=	0x0017
                           000018   105 __pcph	=	0x0018
                           000019   106 __pbpl	=	0x0019
                           00001A   107 __pcpl	=	0x001a
                           000020   108 __adcc	=	0x0020
                           000021   109 __adcm	=	0x0021
                           000022   110 __adcr	=	0x0022
                           000024   111 __adcrgc	=	0x0024
                           000026   112 __misc	=	0x0026
                           000027   113 __misc2	=	0x0027
                           000028   114 __misclvr	=	0x0028
                           00002B   115 __gpcc	=	0x002b
                           00002C   116 __gpcs	=	0x002c
                           000030   117 __tm2c	=	0x0030
                           000031   118 __tm2ct	=	0x0031
                           000032   119 __tm2s	=	0x0032
                           000033   120 __tm2b	=	0x0033
                           000034   121 __tm3c	=	0x0034
                           000035   122 __tm3ct	=	0x0035
                           000036   123 __tm3s	=	0x0036
                           000037   124 __tm3b	=	0x0037
                           000040   125 __pwmg0c	=	0x0040
                           000041   126 __pwmgclk	=	0x0041
                           000042   127 __pwmg0dth	=	0x0042
                           000043   128 __pwmg0dtl	=	0x0043
                           000044   129 __pwmgcubh	=	0x0044
                           000045   130 __pwmgcubl	=	0x0045
                           000046   131 __pwmg1c	=	0x0046
                           000048   132 __pwmg1dth	=	0x0048
                           000049   133 __pwmg1dtl	=	0x0049
                           00004C   134 __pwmg2c	=	0x004c
                           00004E   135 __pwmg2dth	=	0x004e
                           00004F   136 __pwmg2dtl	=	0x004f
                           000062   137 __ilrcr	=	0x0062
                           000063   138 __bgtr	=	0x0063
                           000067   139 __rop	=	0x0067
      000000                        140 __t16c::
      000000                        141 	.ds 2
                                    142 ;--------------------------------------------------------
                                    143 ; ram data
                                    144 ;--------------------------------------------------------
                                    145 	.area DATA
      000002                        146 __delay_loop_8_PARM_1:
      000002                        147 	.ds 1
      000003                        148 __delay_loop_16_PARM_1:
      000003                        149 	.ds 2
      000005                        150 __delay_loop_32_PARM_1:
      000005                        151 	.ds 4
                                    152 ;--------------------------------------------------------
                                    153 ; overlayable items in ram 
                                    154 ;--------------------------------------------------------
                                    155 ;--------------------------------------------------------
                                    156 ; Stack segment in internal ram 
                                    157 ;--------------------------------------------------------
                                    158 	.area	SSEG
      FFFFFF                        159 __start__stack:
      FFFFFF                        160 	.ds	1
                                    161 
                                    162 ;--------------------------------------------------------
                                    163 ; absolute external ram data
                                    164 ;--------------------------------------------------------
                                    165 	.area DABS (ABS)
                                    166 ;--------------------------------------------------------
                                    167 ; interrupt vector 
                                    168 ;--------------------------------------------------------
                                    169 	.area HOME
      000022                        170 __interrupt_vect:
                                    171 	.area	HEADER (ABS)
      000020                        172 	.org	 0x0020
      000020 7B 00                  173 	reti
                                    174 ;--------------------------------------------------------
                                    175 ; global & static initialisations
                                    176 ;--------------------------------------------------------
                                    177 	.area HOME
                                    178 	.area GSINIT
                                    179 	.area GSFINAL
                                    180 	.area GSINIT
                                    181 	.area	PREG (ABS)
      000000                        182 	.org 0x00
      000000                        183 p::
      000000                        184 	.ds 2
                                    185 	.area	HEADER (ABS)
      000000                        186 	.org 0x0000
      000000 00 00                  187 	nop
      000002 01 26                  188 	clear	p+1
      000004 09 57                  189 	mov	a, #s_OSEG
      000006 01 50                  190 	add	a, #l_OSEG + 1
      000008 FE 54                  191 	and	a, #0xfe
      00000A 02 01                  192 	mov	sp, a
      00000C 34 70                  193 	call	__sdcc_external_startup
      00000E 12 60                  194 	goto	__sdcc_gs_init_startup
                                    195 	.area GSINIT
      000024                        196 __sdcc_gs_init_startup:
      000024                        197 __sdcc_init_data:
      000024 02 57                  198 	mov	a, #s_DATA
      000026 00 17                  199 	mov	p, a
      000028 19 60                  200 	goto	00002$
      00002A                        201 00001$:
      00002A 00 57                  202 	mov	a, #0x00
      00002C 00 07                  203 	idxm	p, a
      00002E 00 24                  204 	inc	p
      000030 02 57                  205 	mov	a, #s_DATA
      000032                        206 00002$:
      000032 07 50                  207 	add	a, #l_DATA
      000034 00 2E                  208 	ceqsn	a, p
      000036 15 60                  209 	goto	00001$
                                    210 	.area GSFINAL
      000038 11 60                  211 	goto	__sdcc_program_startup
                                    212 ;--------------------------------------------------------
                                    213 ; Home
                                    214 ;--------------------------------------------------------
                                    215 	.area HOME
                                    216 	.area HOME
      000022                        217 __sdcc_program_startup:
      000022 41 60                  218 	goto	_main
                                    219 ;	return from main will return to caller
                                    220 ;--------------------------------------------------------
                                    221 ; code
                                    222 ;--------------------------------------------------------
                                    223 	.area CODE
                                    224 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    225 ;	-----------------------------------------
                                    226 ;	 function _delay_loop_8
                                    227 ;	-----------------------------------------
      00003A                        228 __delay_loop_8:
                                    229 ;	delay.h: 44: __endasm;
      00003A                        230 	00001$:
                                    231 ; 4 cycles per loop
      00003A 02 23                  232 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00003C 1D 60                  233 	goto	00001$ ; 2 cycles
      00003E                        234 00101$:
                                    235 ;	delay.h: 45: }
      00003E 7A 00                  236 	ret
                                    237 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    238 ;	-----------------------------------------
                                    239 ;	 function _delay_loop_16
                                    240 ;	-----------------------------------------
      000040                        241 __delay_loop_16:
                                    242 ;	delay.h: 65: __endasm;
      000040                        243 	00001$:
                                    244 ; 8 cycles per loop
      000040 00 00                  245 	nop	; 1 cycle
      000042 03 25                  246 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000044 04 21                  247 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000046 03 1F                  248 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 1D                  249 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 00 34                  250 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00004C 20 60                  251 	goto	00001$ ; 2 cycles
      00004E                        252 00101$:
                                    253 ;	delay.h: 66: }
      00004E 7A 00                  254 	ret
                                    255 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    256 ;	-----------------------------------------
                                    257 ;	 function _delay_loop_32
                                    258 ;	-----------------------------------------
      000050                        259 __delay_loop_32:
                                    260 ;	delay.h: 94: __endasm;
      000050                        261 	00001$:
                                    262 ; 12 cycles per loop
      000050 00 00                  263 	nop	; 1 cycle
      000052 05 25                  264 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000054 06 21                  265 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000056 07 21                  266 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000058 08 21                  267 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005A 05 1F                  268 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00005C 06 1D                  269 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00005E 07 1D                  270 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000060 08 1D                  271 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000062 00 34                  272 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000064 28 60                  273 	goto	00001$ ; 2 cycles
      000066                        274 00101$:
                                    275 ;	delay.h: 95: }
      000066 7A 00                  276 	ret
                                    277 ;	timer16.c: 26: unsigned char _sdcc_external_startup(void)
                                    278 ;	-----------------------------------------
                                    279 ;	 function _sdcc_external_startup
                                    280 ;	-----------------------------------------
      000068                        281 __sdcc_external_startup:
                                    282 ;	timer16.c: 28: EASY_PDK_INIT_SYSCLOCK_8MHZ();        //use 8MHz sysclock
      000068 34 57                  283 	mov	a, #0x34
      00006A 03 01                  284 	mov	__clkmd, a
                                    285 ;	timer16.c: 29: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      00006C 52 54                  286 	and	a, #'R'                        
      00006E 43 54                  287 	and	a, #'C'                        
      000070 01 54                  288 	and	a, #((1))          
      000072 00 54                  289 	and	a, #((8000000))     
      000074 12 54                  290 	and	a, #((8000000)>>8)  
      000076 7A 54                  291 	and	a, #((8000000)>>16) 
      000078 00 54                  292 	and	a, #((8000000)>>24) 
      00007A 88 54                  293 	and	a, #((5000))     
      00007C 13 54                  294 	and	a, #((5000)>>8)  
      00007E 0B 54                  295 	and	a, #((0x0B))           
                                    296 ;	timer16.c: 30: return 0;                             //perform normal initialization
                                    297 ;	timer16.c: 31: }
      000080 00 02                  298 	ret	#0x00
                                    299 ;	timer16.c: 33: void main(void)
                                    300 ;	-----------------------------------------
                                    301 ;	 function main
                                    302 ;	-----------------------------------------
      000082                        303 _main:
                                    304 ;	timer16.c: 36: setb(PBC, 4);
      000082 14 3E                  305 	set1	__pbc, #4
                                    306 ;	timer16.c: 37: while (1)
      000084                        307 00102$:
                                    308 ;	timer16.c: 39: setb(PB, 4);
      000084 13 3E                  309 	set1	__pb, #4
                                    310 ;	timer16.c: 40: _delay_ms(1000);
      000086 29 57                  311 	mov	a, #0x29
      000088 05 17                  312 	mov	__delay_loop_32_PARM_1+0, a
      00008A 2C 57                  313 	mov	a, #0x2c
      00008C 06 17                  314 	mov	__delay_loop_32_PARM_1+1, a
      00008E 0A 57                  315 	mov	a, #0x0a
      000090 07 17                  316 	mov	__delay_loop_32_PARM_1+2, a
      000092 08 26                  317 	clear	__delay_loop_32_PARM_1+3
      000094 28 70                  318 	call	__delay_loop_32
                                    319 ;	timer16.c: 41: clrb(PB, 4);
      000096 13 3A                  320 	set0	__pb, #4
                                    321 ;	timer16.c: 42: _delay_ms(1000);
      000098 29 57                  322 	mov	a, #0x29
      00009A 05 17                  323 	mov	__delay_loop_32_PARM_1+0, a
      00009C 2C 57                  324 	mov	a, #0x2c
      00009E 06 17                  325 	mov	__delay_loop_32_PARM_1+1, a
      0000A0 0A 57                  326 	mov	a, #0x0a
      0000A2 07 17                  327 	mov	__delay_loop_32_PARM_1+2, a
      0000A4 08 26                  328 	clear	__delay_loop_32_PARM_1+3
      0000A6 28 70                  329 	call	__delay_loop_32
      0000A8 42 60                  330 	goto	00102$
                                    331 ;	timer16.c: 44: }
      0000AA 7A 00                  332 	ret
                                    333 	.area CODE
                                    334 	.area CONST
                                    335 	.area CABS (ABS)
