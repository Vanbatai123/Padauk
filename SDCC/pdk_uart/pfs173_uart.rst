                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
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
                                     16 	.globl _interrupt
                                     17 	.globl _main
                                     18 	.globl __sdcc_external_startup
                                     19 	.globl _PB5_interrupt
                                     20 	.globl _TIM2_interrupt
                                     21 	.globl _UART_print
                                     22 	.globl _UART_IO_config
                                     23 	.globl _UART_begin
                                     24 	.globl __t16c
                                     25 	.globl __rop
                                     26 	.globl __bgtr
                                     27 	.globl __ilrcr
                                     28 	.globl __pwmg2dtl
                                     29 	.globl __pwmg2dth
                                     30 	.globl __pwmg2c
                                     31 	.globl __pwmg1dtl
                                     32 	.globl __pwmg1dth
                                     33 	.globl __pwmg1c
                                     34 	.globl __pwmgcubl
                                     35 	.globl __pwmgcubh
                                     36 	.globl __pwmg0dtl
                                     37 	.globl __pwmg0dth
                                     38 	.globl __pwmgclk
                                     39 	.globl __pwmg0c
                                     40 	.globl __tm3b
                                     41 	.globl __tm3s
                                     42 	.globl __tm3ct
                                     43 	.globl __tm3c
                                     44 	.globl __tm2b
                                     45 	.globl __tm2s
                                     46 	.globl __tm2ct
                                     47 	.globl __tm2c
                                     48 	.globl __gpcs
                                     49 	.globl __gpcc
                                     50 	.globl __misclvr
                                     51 	.globl __misc2
                                     52 	.globl __misc
                                     53 	.globl __adcrgc
                                     54 	.globl __adcr
                                     55 	.globl __adcm
                                     56 	.globl __adcc
                                     57 	.globl __pcpl
                                     58 	.globl __pbpl
                                     59 	.globl __pcph
                                     60 	.globl __pcc
                                     61 	.globl __pc
                                     62 	.globl __pbph
                                     63 	.globl __pbc
                                     64 	.globl __pb
                                     65 	.globl __paph
                                     66 	.globl __pac
                                     67 	.globl __pa
                                     68 	.globl __pcdier
                                     69 	.globl __pbdier
                                     70 	.globl __padier
                                     71 	.globl __integs
                                     72 	.globl __ihrcr
                                     73 	.globl __eoscr
                                     74 	.globl __t16m
                                     75 	.globl __intrq
                                     76 	.globl __inten
                                     77 	.globl __clkmd
                                     78 	.globl __sp
                                     79 	.globl __flag
                                     80 	.globl _i
                                     81 	.globl _u
                                     82 	.globl _x
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
      000002                        149 _x::
      000002                        150 	.ds 1
      000003                        151 _u::
      000003                        152 	.ds 20
      000017                        153 _i::
      000017                        154 	.ds 2
                                    155 ;--------------------------------------------------------
                                    156 ; overlayable items in ram
                                    157 ;--------------------------------------------------------
                                    158 ;--------------------------------------------------------
                                    159 ; Stack segment in internal ram
                                    160 ;--------------------------------------------------------
                                    161 	.area	SSEG
      000052                        162 __start__stack:
      000052                        163 	.ds	1
                                    164 
                                    165 ;--------------------------------------------------------
                                    166 ; absolute external ram data
                                    167 ;--------------------------------------------------------
                                    168 	.area DABS (ABS)
                                    169 ;--------------------------------------------------------
                                    170 ; interrupt vector
                                    171 ;--------------------------------------------------------
                                    172 	.area HOME
      000022                        173 __interrupt_vect:
                                    174 	.area	HEADER (ABS)
      000020                        175 	.org	 0x0020
      000020 40 60                  176 	goto	_interrupt
                                    177 ;--------------------------------------------------------
                                    178 ; global & static initialisations
                                    179 ;--------------------------------------------------------
                                    180 	.area HOME
                                    181 	.area GSINIT
                                    182 	.area GSFINAL
                                    183 	.area GSINIT
                                    184 	.area	PREG (ABS)
      000000                        185 	.org 0x00
      000000                        186 p::
      000000                        187 	.ds 2
                                    188 	.area	HEADER (ABS)
      000000                        189 	.org 0x0000
      000000 00 00                  190 	nop
      000002 01 26                  191 	clear	p+1
      000004 52 57                  192 	mov	a, #s_OSEG
      000006 01 50                  193 	add	a, #l_OSEG + 1
      000008 FE 54                  194 	and	a, #0xfe
      00000A 02 01                  195 	mov.io	sp, a
      00000C 24 70                  196 	call	__sdcc_external_startup
      00000E 12 60                  197 	goto	s_GSINIT
                                    198 	.area GSINIT
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
      000032 50 50                  209 	add	a, #l_DATA
      000034 00 2E                  210 	ceqsn	a, p
      000036 15 60                  211 	goto	00001$
                                    212 ;	pfs173_uart.c: 19: char x = 'G';
      000038 47 57                  213 	mov	a, #0x47
      00003A 02 17                  214 	mov	_x+0, a
                                    215 ;	pfs173_uart.c: 21: int i = 0;
      00003C 17 26                  216 	clear	_i+0
      00003E 18 26                  217 	clear	_i+1
                                    218 	.area GSFINAL
      000046 11 60                  219 	goto	__sdcc_program_startup
                                    220 ;--------------------------------------------------------
                                    221 ; Home
                                    222 ;--------------------------------------------------------
                                    223 	.area HOME
                                    224 	.area HOME
      000022                        225 __sdcc_program_startup:
      000022 31 60                  226 	goto	_main
                                    227 ;	return from main will return to caller
                                    228 ;--------------------------------------------------------
                                    229 ; code
                                    230 ;--------------------------------------------------------
                                    231 	.area CODE
                                    232 ;	pfs173_uart.c: 12: uint8_t _sdcc_external_startup(void)
                                    233 ;	-----------------------------------------
                                    234 ;	 function _sdcc_external_startup
                                    235 ;	-----------------------------------------
      000048                        236 __sdcc_external_startup:
                                    237 ;	pfs173_uart.c: 14: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
      000048 34 57                  238 	mov	a, #0x34
      00004A 03 01                  239 	mov.io	__clkmd, a
                                    240 ;	pfs173_uart.c: 15: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
      00004C 52 54                  241 	and	a, #'R'                        
      00004E 43 54                  242 	and	a, #'C'                        
      000050 01 54                  243 	and	a, #((1))          
      000052 00 54                  244 	and	a, #((8000000))     
      000054 12 54                  245 	and	a, #((8000000)>>8)  
      000056 7A 54                  246 	and	a, #((8000000)>>16) 
      000058 00 54                  247 	and	a, #((8000000)>>24) 
      00005A 88 54                  248 	and	a, #((5000))     
      00005C 13 54                  249 	and	a, #((5000)>>8)  
      00005E 0B 54                  250 	and	a, #((0x0B))           
                                    251 ;	pfs173_uart.c: 16: return 0;							  //perform normal initialization
                                    252 ;	pfs173_uart.c: 17: }
      000060 00 02                  253 	ret	#0x00
                                    254 ;	pfs173_uart.c: 23: int main(void)
                                    255 ;	-----------------------------------------
                                    256 ;	 function main
                                    257 ;	-----------------------------------------
      000062                        258 _main:
                                    259 ;	pfs173_uart.c: 25: UART_IO_config();
      000062 53 70                  260 	call	_UART_IO_config
                                    261 ;	pfs173_uart.c: 26: INTEGS = INTEGS_PB5_FALLING;
      000064 02 57                  262 	mov	a, #0x02
      000066 0C 01                  263 	mov.io	__integs, a
                                    264 ;	pfs173_uart.c: 27: INTEN |= INTEN_PB5;
      000068 04 3C                  265 	set1.io	__inten, #0
                                    266 ;	pfs173_uart.c: 28: UART_begin();
      00006A 60 70                  267 	call	_UART_begin
                                    268 ;	pfs173_uart.c: 29: INTRQ = 0;
      00006C 00 57                  269 	mov	a, #0x00
      00006E 05 01                  270 	mov.io	__intrq, a
                                    271 ;	pfs173_uart.c: 30: sei();
      000070 78 00                  272 	engint
                                    273 ;	pfs173_uart.c: 32: while(1)
      000072                        274 00102$:
                                    275 ;	pfs173_uart.c: 33: UART_print("\rOK\r");
      000072 2C 57                  276 	mov	a, #<(___str_0 + 0)
      000074 43 17                  277 	mov	_UART_print_PARM_1+0, a
      000076 81 57                  278 	mov	a, #>(___str_0 + 0x8000 + 0)
      000078 44 17                  279 	mov	_UART_print_PARM_1+1, a
      00007A A2 70                  280 	call	_UART_print
      00007C 39 60                  281 	goto	00102$
                                    282 ;	pfs173_uart.c: 46: _delay_ms(500);
                                    283 ;	pfs173_uart.c: 48: }
      00007E 7A 00                  284 	ret
                                    285 ;	pfs173_uart.c: 51: void interrupt(void) __interrupt(0)
                                    286 ;	-----------------------------------------
                                    287 ;	 function interrupt
                                    288 ;	-----------------------------------------
      000080                        289 _interrupt:
      000080 72 00                  290 	push	af
      000082 00 1F                  291 	mov	a, p
      000084 72 00                  292 	push	af
                                    293 ;	pfs173_uart.c: 54: if (INTRQ & INTRQ_TM2)
      000086 85 01                  294 	mov.io	a, __intrq
      000088 40 54                  295 	and	a, #0x40
      00008A 00 53                  296 	cneqsn	a, #0x00
      00008C 49 60                  297 	goto	00102$
                                    298 ;	pfs173_uart.c: 56: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
      00008E 05 3B                  299 	set0.io	__intrq, #6
                                    300 ;	pfs173_uart.c: 57: TIM2_interrupt();
      000090 B8 70                  301 	call	_TIM2_interrupt
      000092                        302 00102$:
                                    303 ;	pfs173_uart.c: 60: if (INTRQ & INTRQ_PB5)
      000092 85 01                  304 	mov.io	a, __intrq
      000094 01 54                  305 	and	a, #0x01
      000096 00 53                  306 	cneqsn	a, #0x00
      000098 4F 60                  307 	goto	00105$
                                    308 ;	pfs173_uart.c: 62: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
      00009A 05 38                  309 	set0.io	__intrq, #0
                                    310 ;	pfs173_uart.c: 63: PB5_interrupt();
      00009C 01 71                  311 	call	_PB5_interrupt
      00009E                        312 00105$:
                                    313 ;	pfs173_uart.c: 65: }
      00009E 73 00                  314 	pop	af
      0000A0 00 17                  315 	mov	p, a
      0000A2 73 00                  316 	pop	af
      0000A4 7B 00                  317 	reti
                                    318 	.area CODE
                                    319 	.area CONST
                                    320 	.area CONST
      000258                        321 ___str_0:
      000258 0D 02                  322 	ret #0x0d
      00025A 4F 02                  323 	ret #0x4f	; O
      00025C 4B 02                  324 	ret #0x4b	; K
      00025E 0D 02                  325 	ret #0x0d
      000260 00 02                  326 	ret #0x00
                                    327 	.area CODE
                                    328 	.area CABS (ABS)
