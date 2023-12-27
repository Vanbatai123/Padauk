                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_uart
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
                                     16 	.globl __t16c
                                     17 	.globl __rop
                                     18 	.globl __bgtr
                                     19 	.globl __ilrcr
                                     20 	.globl __pwmg2dtl
                                     21 	.globl __pwmg2dth
                                     22 	.globl __pwmg2c
                                     23 	.globl __pwmg1dtl
                                     24 	.globl __pwmg1dth
                                     25 	.globl __pwmg1c
                                     26 	.globl __pwmgcubl
                                     27 	.globl __pwmgcubh
                                     28 	.globl __pwmg0dtl
                                     29 	.globl __pwmg0dth
                                     30 	.globl __pwmgclk
                                     31 	.globl __pwmg0c
                                     32 	.globl __tm3b
                                     33 	.globl __tm3s
                                     34 	.globl __tm3ct
                                     35 	.globl __tm3c
                                     36 	.globl __tm2b
                                     37 	.globl __tm2s
                                     38 	.globl __tm2ct
                                     39 	.globl __tm2c
                                     40 	.globl __gpcs
                                     41 	.globl __gpcc
                                     42 	.globl __misclvr
                                     43 	.globl __misc2
                                     44 	.globl __misc
                                     45 	.globl __adcrgc
                                     46 	.globl __adcr
                                     47 	.globl __adcm
                                     48 	.globl __adcc
                                     49 	.globl __pcpl
                                     50 	.globl __pbpl
                                     51 	.globl __pcph
                                     52 	.globl __pcc
                                     53 	.globl __pc
                                     54 	.globl __pbph
                                     55 	.globl __pbc
                                     56 	.globl __pb
                                     57 	.globl __paph
                                     58 	.globl __pac
                                     59 	.globl __pa
                                     60 	.globl __pcdier
                                     61 	.globl __pbdier
                                     62 	.globl __padier
                                     63 	.globl __integs
                                     64 	.globl __ihrcr
                                     65 	.globl __eoscr
                                     66 	.globl __t16m
                                     67 	.globl __intrq
                                     68 	.globl __inten
                                     69 	.globl __clkmd
                                     70 	.globl __sp
                                     71 	.globl __flag
                                     72 	.globl _UART_print_PARM_1
                                     73 	.globl _putchar_PARM_1
                                     74 	.globl _UART_begin
                                     75 	.globl _TIM2_interrupt
                                     76 	.globl _putchar
                                     77 	.globl _UART_print
                                     78 ;--------------------------------------------------------
                                     79 ; special function registers
                                     80 ;--------------------------------------------------------
                                     81 	.area RSEG (ABS)
      000002                         82 	.org 0x0000
                           000000    83 __flag	=	0x0000
                           000002    84 __sp	=	0x0002
                           000003    85 __clkmd	=	0x0003
                           000004    86 __inten	=	0x0004
                           000005    87 __intrq	=	0x0005
                           000006    88 __t16m	=	0x0006
                           00000A    89 __eoscr	=	0x000a
                           00000B    90 __ihrcr	=	0x000b
                           00000C    91 __integs	=	0x000c
                           00000D    92 __padier	=	0x000d
                           00000E    93 __pbdier	=	0x000e
                           00000F    94 __pcdier	=	0x000f
                           000010    95 __pa	=	0x0010
                           000011    96 __pac	=	0x0011
                           000012    97 __paph	=	0x0012
                           000013    98 __pb	=	0x0013
                           000014    99 __pbc	=	0x0014
                           000015   100 __pbph	=	0x0015
                           000016   101 __pc	=	0x0016
                           000017   102 __pcc	=	0x0017
                           000018   103 __pcph	=	0x0018
                           000019   104 __pbpl	=	0x0019
                           00001A   105 __pcpl	=	0x001a
                           000020   106 __adcc	=	0x0020
                           000021   107 __adcm	=	0x0021
                           000022   108 __adcr	=	0x0022
                           000024   109 __adcrgc	=	0x0024
                           000026   110 __misc	=	0x0026
                           000027   111 __misc2	=	0x0027
                           000028   112 __misclvr	=	0x0028
                           00002B   113 __gpcc	=	0x002b
                           00002C   114 __gpcs	=	0x002c
                           000030   115 __tm2c	=	0x0030
                           000031   116 __tm2ct	=	0x0031
                           000032   117 __tm2s	=	0x0032
                           000033   118 __tm2b	=	0x0033
                           000034   119 __tm3c	=	0x0034
                           000035   120 __tm3ct	=	0x0035
                           000036   121 __tm3s	=	0x0036
                           000037   122 __tm3b	=	0x0037
                           000040   123 __pwmg0c	=	0x0040
                           000041   124 __pwmgclk	=	0x0041
                           000042   125 __pwmg0dth	=	0x0042
                           000043   126 __pwmg0dtl	=	0x0043
                           000044   127 __pwmgcubh	=	0x0044
                           000045   128 __pwmgcubl	=	0x0045
                           000046   129 __pwmg1c	=	0x0046
                           000048   130 __pwmg1dth	=	0x0048
                           000049   131 __pwmg1dtl	=	0x0049
                           00004C   132 __pwmg2c	=	0x004c
                           00004E   133 __pwmg2dth	=	0x004e
                           00004F   134 __pwmg2dtl	=	0x004f
                           000062   135 __ilrcr	=	0x0062
                           000063   136 __bgtr	=	0x0063
                           000067   137 __rop	=	0x0067
      000002                        138 __t16c::
      000002                        139 	.ds 2
                                    140 ;--------------------------------------------------------
                                    141 ; ram data
                                    142 ;--------------------------------------------------------
                                    143 	.area DATA
      000037                        144 _putchar_PARM_1:
      000037                        145 	.ds 2
      000039                        146 _UART_print_PARM_1:
      000039                        147 	.ds 2
      00003B                        148 _UART_print_sloc0_1_0:
      00003B                        149 	.ds 1
                                    150 ;--------------------------------------------------------
                                    151 ; overlayable items in ram
                                    152 ;--------------------------------------------------------
                                    153 ;--------------------------------------------------------
                                    154 ; absolute external ram data
                                    155 ;--------------------------------------------------------
                                    156 	.area DABS (ABS)
                                    157 ;--------------------------------------------------------
                                    158 ; global & static initialisations
                                    159 ;--------------------------------------------------------
                                    160 	.area HOME
                                    161 	.area GSINIT
                                    162 	.area GSFINAL
                                    163 	.area GSINIT
                                    164 ;--------------------------------------------------------
                                    165 ; Home
                                    166 ;--------------------------------------------------------
                                    167 	.area HOME
                                    168 	.area HOME
                                    169 ;--------------------------------------------------------
                                    170 ; code
                                    171 ;--------------------------------------------------------
                                    172 	.area CODE
                                    173 ;	pdk_uart.c: 6: void UART_begin()
                                    174 ;	-----------------------------------------
                                    175 ;	 function UART_begin
                                    176 ;	-----------------------------------------
      000338                        177 _UART_begin:
                                    178 ;	pdk_uart.c: 9: TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
      000338 20 57                  179 	mov	a, #0x20
      00033A 30 01                  180 	mov.io	__tm2c, a
                                    181 ;	pdk_uart.c: 10: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2; // No prescale, scale 2 ~> 8MHz
      00033C 01 57                  182 	mov	a, #0x01
      00033E 32 01                  183 	mov.io	__tm2s, a
                                    184 ;	pdk_uart.c: 11: TM2B = 69;									 // Divide by 69 ~> 115942 Hz (apx. 115200)
      000340 45 57                  185 	mov	a, #0x45
      000342 33 01                  186 	mov.io	__tm2b, a
                                    187 ;	pdk_uart.c: 13: PAC |= (1 << UART_TX_PIN); // Enable TX Pin as output
      000344 91 3D                  188 	set1.io	__pac, #3
                                    189 ;	pdk_uart.c: 15: txdata = 0xD55F;	// Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
      000346 5F 57                  190 	mov	a, #0x5f
      000348 09 17                  191 	mov	_txdata+0, a
      00034A D5 57                  192 	mov	a, #0xd5
      00034C 0A 17                  193 	mov	_txdata+1, a
                                    194 ;	pdk_uart.c: 16: INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      00034E 04 3F                  195 	set1.io	__inten, #6
                                    196 ;	pdk_uart.c: 17: }
      000350 7A 00                  197 	ret
                                    198 ;	pdk_uart.c: 20: void TIM2_interrupt()
                                    199 ;	-----------------------------------------
                                    200 ;	 function TIM2_interrupt
                                    201 ;	-----------------------------------------
      000352                        202 _TIM2_interrupt:
                                    203 ;	pdk_uart.c: 22: if (txdata)
      000352 09 1F                  204 	mov	a, _txdata+0
      000354 0A 1D                  205 	or	a, _txdata+1
      000356 00 53                  206 	cneqsn	a, #0x00
      000358 B8 61                  207 	goto	00106$
                                    208 ;	pdk_uart.c: 24: if (txdata & 0x01)			 // Check bit (1/0) for sending
      00035A 0A 1F                  209 	mov	a, _txdata+1
      00035C 00 17                  210 	mov	p, a
      00035E 09 1F                  211 	mov	a, _txdata+0
      000360 01 54                  212 	and	a, #0x01
      000362 00 53                  213 	cneqsn	a, #0x00
      000364 B5 61                  214 	goto	00102$
                                    215 ;	pdk_uart.c: 25: setb(PA, UART_TX_PIN); // Send 1 on TX Pin
      000366 90 3D                  216 	set1.io	__pa, #3
      000368 B6 61                  217 	goto	00103$
      00036A                        218 00102$:
                                    219 ;	pdk_uart.c: 27: clrb(PA, UART_TX_PIN); // Send 0 on TX Pin
      00036A 90 39                  220 	set0.io	__pa, #3
      00036C                        221 00103$:
                                    222 ;	pdk_uart.c: 28: txdata >>= 1;				 // Shift txdata
      00036C 0A 2A                  223 	sr	_txdata+1
      00036E 09 2C                  224 	src	_txdata+0
      000370                        225 00106$:
                                    226 ;	pdk_uart.c: 30: }
      000370 7A 00                  227 	ret
                                    228 ;	pdk_uart.c: 32: int putchar(int c)
                                    229 ;	-----------------------------------------
                                    230 ;	 function putchar
                                    231 ;	-----------------------------------------
      000372                        232 _putchar:
                                    233 ;	pdk_uart.c: 34: while (txdata)
      000372                        234 00101$:
      000372 09 1F                  235 	mov	a, _txdata+0
      000374 0A 1D                  236 	or	a, _txdata+1
      000376 00 52                  237 	ceqsn	a, #0x00
      000378 B9 61                  238 	goto	00101$
                                    239 ;	pdk_uart.c: 36: INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
      00037A 04 3B                  240 	set0.io	__inten, #6
                                    241 ;	pdk_uart.c: 37: txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
      00037C 38 1F                  242 	mov	a, _putchar_PARM_1+1
      00037E 00 17                  243 	mov	p, a
      000380 37 1F                  244 	mov	a, _putchar_PARM_1+0
      000382 6B 00                  245 	sl	a
      000384 00 2D                  246 	slc	p
      000386 80 4C                  247 	set1	p, #1
      000388 09 17                  248 	mov	_txdata+0, a
      00038A 00 1F                  249 	mov	a, p
      00038C 0A 17                  250 	mov	_txdata+1, a
                                    251 ;	pdk_uart.c: 38: INTEN |= INTEN_TM2;		   // Enable TM2
      00038E 04 3F                  252 	set1.io	__inten, #6
                                    253 ;	pdk_uart.c: 39: return (c);
      000390 38 1F                  254 	mov	a, _putchar_PARM_1+1
      000392 00 17                  255 	mov	p, a
      000394 37 1F                  256 	mov	a, _putchar_PARM_1+0
                                    257 ;	pdk_uart.c: 40: }
      000396 7A 00                  258 	ret
                                    259 ;	pdk_uart.c: 42: void UART_print(char* str)
                                    260 ;	-----------------------------------------
                                    261 ;	 function UART_print
                                    262 ;	-----------------------------------------
      000398                        263 _UART_print:
                                    264 ;	pdk_uart.c: 45: while(str[i]!='\0')
      000398 3B 26                  265 	clear	_UART_print_sloc0_1_0+0
      00039A                        266 00101$:
      00039A 39 1F                  267 	mov	a, _UART_print_PARM_1+0
      00039C 3B 18                  268 	add	a, _UART_print_sloc0_1_0+0
      00039E 00 17                  269 	mov	p, a
      0003A0 3A 1F                  270 	mov	a, _UART_print_PARM_1+1
      0003A2 60 00                  271 	addc	a
      0003A4 E1 71                  272 	call	__gptrget
      0003A6 00 53                  273 	cneqsn	a, #0x00
      0003A8 E0 61                  274 	goto	00104$
                                    275 ;	pdk_uart.c: 46: putchar(str[i++]);
      0003AA 39 1F                  276 	mov	a, _UART_print_PARM_1+0
      0003AC 3B 18                  277 	add	a, _UART_print_sloc0_1_0+0
      0003AE 00 17                  278 	mov	p, a
      0003B0 3A 1F                  279 	mov	a, _UART_print_PARM_1+1
      0003B2 60 00                  280 	addc	a
      0003B4 3B 24                  281 	inc	_UART_print_sloc0_1_0+0
      0003B6 E1 71                  282 	call	__gptrget
      0003B8 37 17                  283 	mov	_putchar_PARM_1+0, a
      0003BA 38 26                  284 	clear	_putchar_PARM_1+1
      0003BC B9 71                  285 	call	_putchar
      0003BE CD 61                  286 	goto	00101$
      0003C0                        287 00104$:
                                    288 ;	pdk_uart.c: 47: }
      0003C0 7A 00                  289 	ret
                                    290 	.area CODE
                                    291 	.area CONST
                                    292 	.area CABS (ABS)
