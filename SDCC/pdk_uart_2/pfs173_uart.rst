                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pfs173_uart
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
                                     18 	.globl _softuart_putchar
                                     19 	.globl _softuart_init
                                     20 	.globl __delay_loop_32
                                     21 	.globl __delay_loop_16
                                     22 	.globl __delay_loop_8
                                     23 	.globl __t16c
                                     24 	.globl __rop
                                     25 	.globl __bgtr
                                     26 	.globl __ilrcr
                                     27 	.globl __pwmg2dtl
                                     28 	.globl __pwmg2dth
                                     29 	.globl __pwmg2c
                                     30 	.globl __pwmg1dtl
                                     31 	.globl __pwmg1dth
                                     32 	.globl __pwmg1c
                                     33 	.globl __pwmgcubl
                                     34 	.globl __pwmgcubh
                                     35 	.globl __pwmg0dtl
                                     36 	.globl __pwmg0dth
                                     37 	.globl __pwmgclk
                                     38 	.globl __pwmg0c
                                     39 	.globl __tm3b
                                     40 	.globl __tm3s
                                     41 	.globl __tm3ct
                                     42 	.globl __tm3c
                                     43 	.globl __tm2b
                                     44 	.globl __tm2s
                                     45 	.globl __tm2ct
                                     46 	.globl __tm2c
                                     47 	.globl __gpcs
                                     48 	.globl __gpcc
                                     49 	.globl __misclvr
                                     50 	.globl __misc2
                                     51 	.globl __misc
                                     52 	.globl __adcrgc
                                     53 	.globl __adcr
                                     54 	.globl __adcm
                                     55 	.globl __adcc
                                     56 	.globl __pcpl
                                     57 	.globl __pbpl
                                     58 	.globl __pcph
                                     59 	.globl __pcc
                                     60 	.globl __pc
                                     61 	.globl __pbph
                                     62 	.globl __pbc
                                     63 	.globl __pb
                                     64 	.globl __paph
                                     65 	.globl __pac
                                     66 	.globl __pa
                                     67 	.globl __pcdier
                                     68 	.globl __pbdier
                                     69 	.globl __padier
                                     70 	.globl __integs
                                     71 	.globl __ihrcr
                                     72 	.globl __eoscr
                                     73 	.globl __t16m
                                     74 	.globl __intrq
                                     75 	.globl __inten
                                     76 	.globl __clkmd
                                     77 	.globl __sp
                                     78 	.globl __flag
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
                                    154 ;--------------------------------------------------------
                                    155 ; overlayable items in ram 
                                    156 ;--------------------------------------------------------
                                    157 ;--------------------------------------------------------
                                    158 ; Stack segment in internal ram 
                                    159 ;--------------------------------------------------------
                                    160 	.area	SSEG
      FFFFFF                        161 __start__stack:
      FFFFFF                        162 	.ds	1
                                    163 
                                    164 ;--------------------------------------------------------
                                    165 ; absolute external ram data
                                    166 ;--------------------------------------------------------
                                    167 	.area DABS (ABS)
                                    168 ;--------------------------------------------------------
                                    169 ; interrupt vector 
                                    170 ;--------------------------------------------------------
                                    171 	.area HOME
      000022                        172 __interrupt_vect:
                                    173 	.area	HEADER (ABS)
      000020                        174 	.org	 0x0020
      000020 7B 00                  175 	reti
                                    176 ;--------------------------------------------------------
                                    177 ; global & static initialisations
                                    178 ;--------------------------------------------------------
                                    179 	.area HOME
                                    180 	.area GSINIT
                                    181 	.area GSFINAL
                                    182 	.area GSINIT
                                    183 	.area	PREG (ABS)
      000000                        184 	.org 0x00
      000000                        185 p::
      000000                        186 	.ds 2
                                    187 	.area	HEADER (ABS)
      000000                        188 	.org 0x0000
      000000 00 00                  189 	nop
      000002 01 26                  190 	clear	p+1
      000004 37 57                  191 	mov	a, #s_OSEG
      000006 03 50                  192 	add	a, #l_OSEG + 1
      000008 FE 54                  193 	and	a, #0xfe
      00000A 02 01                  194 	mov	sp, a
      00000C 34 70                  195 	call	__sdcc_external_startup
      00000E 12 60                  196 	goto	__sdcc_gs_init_startup
                                    197 	.area GSINIT
      000024                        198 __sdcc_gs_init_startup:
      000024                        199 __sdcc_init_data:
      000024 02 57                  200 	mov	a, #s_DATA
      000026 00 17                  201 	mov	p, a
      000028 19 60                  202 	goto	00002$
      00002A                        203 00001$:
      00002A 00 57                  204 	mov	a, #0x00
      00002C 00 07                  205 	idxm	p, a
      00002E 00 24                  206 	inc	p
      000030 02 57                  207 	mov	a, #s_DATA
      000032                        208 00002$:
      000032 35 50                  209 	add	a, #l_DATA
      000034 00 2E                  210 	ceqsn	a, p
      000036 15 60                  211 	goto	00001$
                                    212 	.area GSFINAL
      000038 11 60                  213 	goto	__sdcc_program_startup
                                    214 ;--------------------------------------------------------
                                    215 ; Home
                                    216 ;--------------------------------------------------------
                                    217 	.area HOME
                                    218 	.area HOME
      000022                        219 __sdcc_program_startup:
      000022 41 60                  220 	goto	_main
                                    221 ;	return from main will return to caller
                                    222 ;--------------------------------------------------------
                                    223 ; code
                                    224 ;--------------------------------------------------------
                                    225 	.area CODE
                                    226 ;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
                                    227 ;	-----------------------------------------
                                    228 ;	 function _delay_loop_8
                                    229 ;	-----------------------------------------
      00003A                        230 __delay_loop_8:
                                    231 ;	delay.h: 44: __endasm;
      00003A                        232 	00001$:
                                    233 ; 4 cycles per loop
      00003A 02 23                  234 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00003C 1D 60                  235 	goto	00001$ ; 2 cycles
      00003E                        236 00101$:
                                    237 ;	delay.h: 45: }
      00003E 7A 00                  238 	ret
                                    239 ;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
                                    240 ;	-----------------------------------------
                                    241 ;	 function _delay_loop_16
                                    242 ;	-----------------------------------------
      000040                        243 __delay_loop_16:
                                    244 ;	delay.h: 65: __endasm;
      000040                        245 	00001$:
                                    246 ; 8 cycles per loop
      000040 00 00                  247 	nop	; 1 cycle
      000042 03 25                  248 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000044 04 21                  249 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000046 03 1F                  250 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000048 04 1D                  251 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00004A 00 34                  252 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00004C 20 60                  253 	goto	00001$ ; 2 cycles
      00004E                        254 00101$:
                                    255 ;	delay.h: 66: }
      00004E 7A 00                  256 	ret
                                    257 ;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
                                    258 ;	-----------------------------------------
                                    259 ;	 function _delay_loop_32
                                    260 ;	-----------------------------------------
      000050                        261 __delay_loop_32:
                                    262 ;	delay.h: 94: __endasm;
      000050                        263 	00001$:
                                    264 ; 12 cycles per loop
      000050 00 00                  265 	nop	; 1 cycle
      000052 05 25                  266 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000054 06 21                  267 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000056 07 21                  268 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000058 08 21                  269 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00005A 05 1F                  270 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00005C 06 1D                  271 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      00005E 07 1D                  272 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000060 08 1D                  273 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000062 00 34                  274 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000064 28 60                  275 	goto	00001$ ; 2 cycles
      000066                        276 00101$:
                                    277 ;	delay.h: 95: }
      000066 7A 00                  278 	ret
                                    279 ;	pfs173_uart.c: 8: uint8_t _sdcc_external_startup(void)
                                    280 ;	-----------------------------------------
                                    281 ;	 function _sdcc_external_startup
                                    282 ;	-----------------------------------------
      000068                        283 __sdcc_external_startup:
                                    284 ;	pfs173_uart.c: 10: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000068 34 57                  285 	mov	a, #0x34
      00006A 03 01                  286 	mov	__clkmd, a
                                    287 ;	pfs173_uart.c: 11: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      00006C 52 54                  288 	and	a, #'R'                        
      00006E 43 54                  289 	and	a, #'C'                        
      000070 01 54                  290 	and	a, #((1))          
      000072 00 54                  291 	and	a, #((8000000))     
      000074 12 54                  292 	and	a, #((8000000)>>8)  
      000076 7A 54                  293 	and	a, #((8000000)>>16) 
      000078 00 54                  294 	and	a, #((8000000)>>24) 
      00007A 88 54                  295 	and	a, #((5000))     
      00007C 13 54                  296 	and	a, #((5000)>>8)  
      00007E 0B 54                  297 	and	a, #((0x0B))           
                                    298 ;	pfs173_uart.c: 12: return 0;							  //perform normal initialization
                                    299 ;	pfs173_uart.c: 13: }
      000080 00 02                  300 	ret	#0x00
                                    301 ;	pfs173_uart.c: 15: int main(void)
                                    302 ;	-----------------------------------------
                                    303 ;	 function main
                                    304 ;	-----------------------------------------
      000082                        305 _main:
                                    306 ;	pfs173_uart.c: 17: softuart_init();
      000082 7E 70                  307 	call	_softuart_init
                                    308 ;	pfs173_uart.c: 19: while (1)
      000084                        309 00102$:
                                    310 ;	pfs173_uart.c: 21: softuart_putchar('[');
      000084 5B 57                  311 	mov	a, #0x5b
      000086 32 17                  312 	mov	_softuart_putchar_PARM_1+0, a
      000088 CF 70                  313 	call	_softuart_putchar
                                    314 ;	pfs173_uart.c: 22: softuart_putchar('\n');
      00008A 0A 57                  315 	mov	a, #0x0a
      00008C 32 17                  316 	mov	_softuart_putchar_PARM_1+0, a
      00008E CF 70                  317 	call	_softuart_putchar
                                    318 ;	pfs173_uart.c: 23: _delay_ms(1000);
      000090 29 57                  319 	mov	a, #0x29
      000092 05 17                  320 	mov	__delay_loop_32_PARM_1+0, a
      000094 2C 57                  321 	mov	a, #0x2c
      000096 06 17                  322 	mov	__delay_loop_32_PARM_1+1, a
      000098 0A 57                  323 	mov	a, #0x0a
      00009A 07 17                  324 	mov	__delay_loop_32_PARM_1+2, a
      00009C 08 26                  325 	clear	__delay_loop_32_PARM_1+3
      00009E 28 70                  326 	call	__delay_loop_32
      0000A0 42 60                  327 	goto	00102$
                                    328 ;	pfs173_uart.c: 25: }
      0000A2 7A 00                  329 	ret
                                    330 	.area CODE
                                    331 	.area CONST
                                    332 	.area CABS (ABS)
