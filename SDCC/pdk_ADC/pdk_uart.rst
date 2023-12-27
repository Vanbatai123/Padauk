                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
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
                                     72 	.globl _UART_printNum_PARM_1
                                     73 	.globl _UART_print_PARM_1
                                     74 	.globl _putchar_PARM_1
                                     75 	.globl _UART_begin
                                     76 	.globl _TIM2_interrupt
                                     77 	.globl _putchar
                                     78 	.globl _UART_print
                                     79 	.globl _UART_printNum
                                     80 ;--------------------------------------------------------
                                     81 ; special function registers
                                     82 ;--------------------------------------------------------
                                     83 	.area RSEG (ABS)
      000002                         84 	.org 0x0000
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
      000002                        140 __t16c::
      000002                        141 	.ds 2
                                    142 ;--------------------------------------------------------
                                    143 ; ram data
                                    144 ;--------------------------------------------------------
                                    145 	.area DATA
      000014                        146 _putchar_PARM_1:
      000014                        147 	.ds 2
      000016                        148 _UART_print_PARM_1:
      000016                        149 	.ds 2
      000018                        150 _UART_print_sloc0_1_0:
      000018                        151 	.ds 1
      000019                        152 _UART_printNum_PARM_1:
      000019                        153 	.ds 2
      00001B                        154 _UART_printNum_dis_65536_22:
      00001B                        155 	.ds 5
                                    156 ;--------------------------------------------------------
                                    157 ; overlayable items in ram
                                    158 ;--------------------------------------------------------
                                    159 ;--------------------------------------------------------
                                    160 ; absolute external ram data
                                    161 ;--------------------------------------------------------
                                    162 	.area DABS (ABS)
                                    163 ;--------------------------------------------------------
                                    164 ; global & static initialisations
                                    165 ;--------------------------------------------------------
                                    166 	.area HOME
                                    167 	.area GSINIT
                                    168 	.area GSFINAL
                                    169 	.area GSINIT
                                    170 ;--------------------------------------------------------
                                    171 ; Home
                                    172 ;--------------------------------------------------------
                                    173 	.area HOME
                                    174 	.area HOME
                                    175 ;--------------------------------------------------------
                                    176 ; code
                                    177 ;--------------------------------------------------------
                                    178 	.area CODE
                                    179 ;	pdk_uart.c: 6: void UART_begin()
                                    180 ;	-----------------------------------------
                                    181 ;	 function UART_begin
                                    182 ;	-----------------------------------------
      000158                        183 _UART_begin:
                                    184 ;	pdk_uart.c: 9: TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
      000158 20 57                  185 	mov	a, #0x20
      00015A 30 01                  186 	mov.io	__tm2c, a
                                    187 ;	pdk_uart.c: 10: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2; // No prescale, scale 2 ~> 8MHz
      00015C 01 57                  188 	mov	a, #0x01
      00015E 32 01                  189 	mov.io	__tm2s, a
                                    190 ;	pdk_uart.c: 11: TM2B = 69;									 // Divide by 69 ~> 115942 Hz (apx. 115200)
      000160 45 57                  191 	mov	a, #0x45
      000162 33 01                  192 	mov.io	__tm2b, a
                                    193 ;	pdk_uart.c: 13: PAC |= (1 << UART_TX_PIN); // Enable TX Pin as output
      000164 91 3F                  194 	set1.io	__pac, #7
                                    195 ;	pdk_uart.c: 15: txdata = 0xD55F;	// Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
      000166 5F 57                  196 	mov	a, #0x5f
      000168 09 17                  197 	mov	_txdata+0, a
      00016A D5 57                  198 	mov	a, #0xd5
      00016C 0A 17                  199 	mov	_txdata+1, a
                                    200 ;	pdk_uart.c: 16: INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      00016E 04 3F                  201 	set1.io	__inten, #6
                                    202 ;	pdk_uart.c: 17: }
      000170 7A 00                  203 	ret
                                    204 ;	pdk_uart.c: 20: void TIM2_interrupt()
                                    205 ;	-----------------------------------------
                                    206 ;	 function TIM2_interrupt
                                    207 ;	-----------------------------------------
      000172                        208 _TIM2_interrupt:
                                    209 ;	pdk_uart.c: 22: if (txdata)
      000172 09 1F                  210 	mov	a, _txdata+0
      000174 0A 1D                  211 	or	a, _txdata+1
      000176 00 53                  212 	cneqsn	a, #0x00
      000178 C8 60                  213 	goto	00106$
                                    214 ;	pdk_uart.c: 24: if (txdata & 0x01)			 // Check bit (1/0) for sending
      00017A 0A 1F                  215 	mov	a, _txdata+1
      00017C 00 17                  216 	mov	p, a
      00017E 09 1F                  217 	mov	a, _txdata+0
      000180 01 54                  218 	and	a, #0x01
      000182 00 53                  219 	cneqsn	a, #0x00
      000184 C5 60                  220 	goto	00102$
                                    221 ;	pdk_uart.c: 25: setb(PA, UART_TX_PIN); // Send 1 on TX Pin
      000186 90 3F                  222 	set1.io	__pa, #7
      000188 C6 60                  223 	goto	00103$
      00018A                        224 00102$:
                                    225 ;	pdk_uart.c: 27: clrb(PA, UART_TX_PIN); // Send 0 on TX Pin
      00018A 90 3B                  226 	set0.io	__pa, #7
      00018C                        227 00103$:
                                    228 ;	pdk_uart.c: 28: txdata >>= 1;				 // Shift txdata
      00018C 0A 2A                  229 	sr	_txdata+1
      00018E 09 2C                  230 	src	_txdata+0
      000190                        231 00106$:
                                    232 ;	pdk_uart.c: 30: }
      000190 7A 00                  233 	ret
                                    234 ;	pdk_uart.c: 32: int putchar(int c)
                                    235 ;	-----------------------------------------
                                    236 ;	 function putchar
                                    237 ;	-----------------------------------------
      000192                        238 _putchar:
                                    239 ;	pdk_uart.c: 34: while (txdata)
      000192                        240 00101$:
      000192 09 1F                  241 	mov	a, _txdata+0
      000194 0A 1D                  242 	or	a, _txdata+1
      000196 00 52                  243 	ceqsn	a, #0x00
      000198 C9 60                  244 	goto	00101$
                                    245 ;	pdk_uart.c: 36: INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
      00019A 04 3B                  246 	set0.io	__inten, #6
                                    247 ;	pdk_uart.c: 37: txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
      00019C 15 1F                  248 	mov	a, _putchar_PARM_1+1
      00019E 00 17                  249 	mov	p, a
      0001A0 14 1F                  250 	mov	a, _putchar_PARM_1+0
      0001A2 6B 00                  251 	sl	a
      0001A4 00 2D                  252 	slc	p
      0001A6 80 4C                  253 	set1	p, #1
      0001A8 09 17                  254 	mov	_txdata+0, a
      0001AA 00 1F                  255 	mov	a, p
      0001AC 0A 17                  256 	mov	_txdata+1, a
                                    257 ;	pdk_uart.c: 38: INTEN |= INTEN_TM2;		   // Enable TM2
      0001AE 04 3F                  258 	set1.io	__inten, #6
                                    259 ;	pdk_uart.c: 39: return (c);
      0001B0 15 1F                  260 	mov	a, _putchar_PARM_1+1
      0001B2 00 17                  261 	mov	p, a
      0001B4 14 1F                  262 	mov	a, _putchar_PARM_1+0
                                    263 ;	pdk_uart.c: 40: }
      0001B6 7A 00                  264 	ret
                                    265 ;	pdk_uart.c: 42: void UART_print(char* str)
                                    266 ;	-----------------------------------------
                                    267 ;	 function UART_print
                                    268 ;	-----------------------------------------
      0001B8                        269 _UART_print:
                                    270 ;	pdk_uart.c: 45: while(str[i]!='\0')
      0001B8 18 26                  271 	clear	_UART_print_sloc0_1_0+0
      0001BA                        272 00101$:
      0001BA 16 1F                  273 	mov	a, _UART_print_PARM_1+0
      0001BC 18 18                  274 	add	a, _UART_print_sloc0_1_0+0
      0001BE 00 17                  275 	mov	p, a
      0001C0 17 1F                  276 	mov	a, _UART_print_PARM_1+1
      0001C2 60 00                  277 	addc	a
      0001C4 96 72                  278 	call	__gptrget
      0001C6 00 53                  279 	cneqsn	a, #0x00
      0001C8 F0 60                  280 	goto	00104$
                                    281 ;	pdk_uart.c: 46: putchar(str[i++]);
      0001CA 16 1F                  282 	mov	a, _UART_print_PARM_1+0
      0001CC 18 18                  283 	add	a, _UART_print_sloc0_1_0+0
      0001CE 00 17                  284 	mov	p, a
      0001D0 17 1F                  285 	mov	a, _UART_print_PARM_1+1
      0001D2 60 00                  286 	addc	a
      0001D4 18 24                  287 	inc	_UART_print_sloc0_1_0+0
      0001D6 96 72                  288 	call	__gptrget
      0001D8 14 17                  289 	mov	_putchar_PARM_1+0, a
      0001DA 15 26                  290 	clear	_putchar_PARM_1+1
      0001DC C9 70                  291 	call	_putchar
      0001DE DD 60                  292 	goto	00101$
      0001E0                        293 00104$:
                                    294 ;	pdk_uart.c: 47: }
      0001E0 7A 00                  295 	ret
                                    296 ;	pdk_uart.c: 48: void UART_printNum(int num)
                                    297 ;	-----------------------------------------
                                    298 ;	 function UART_printNum
                                    299 ;	-----------------------------------------
      0001E2                        300 _UART_printNum:
                                    301 ;	pdk_uart.c: 51: if (num > 999)
      0001E2 E7 57                  302 	mov	a, #0xe7
      0001E4 19 19                  303 	sub	a, _UART_printNum_PARM_1+0
      0001E6 03 57                  304 	mov	a, #0x03
      0001E8 1A 1B                  305 	subc	a, _UART_printNum_PARM_1+1
      0001EA 80 31                  306 	t0sn.io	f, ov
      0001EC 80 56                  307 	xor	a, #0x80
      0001EE 6B 00                  308 	sl	a
      0001F0 80 34                  309 	t1sn.io	f, c
      0001F2 33 61                  310 	goto	00108$
                                    311 ;	pdk_uart.c: 53: dis[0] = num / 1000 + 48;
      0001F4 19 1F                  312 	mov	a, _UART_printNum_PARM_1+0
      0001F6 35 17                  313 	mov	__divsint_PARM_1+0, a
      0001F8 1A 1F                  314 	mov	a, _UART_printNum_PARM_1+1
      0001FA 36 17                  315 	mov	__divsint_PARM_1+1, a
      0001FC E8 57                  316 	mov	a, #0xe8
      0001FE 37 17                  317 	mov	__divsint_PARM_2+0, a
      000200 03 57                  318 	mov	a, #0x03
      000202 38 17                  319 	mov	__divsint_PARM_2+1, a
      000204 36 72                  320 	call	__divsint
      000206 30 50                  321 	add	a, #0x30
      000208 1B 17                  322 	mov	_UART_printNum_dis_65536_22+0, a
                                    323 ;	pdk_uart.c: 54: dis[1] = (num / 100) % 10 + 48;
      00020A 19 1F                  324 	mov	a, _UART_printNum_PARM_1+0
      00020C 35 17                  325 	mov	__divsint_PARM_1+0, a
      00020E 1A 1F                  326 	mov	a, _UART_printNum_PARM_1+1
      000210 36 17                  327 	mov	__divsint_PARM_1+1, a
      000212 64 57                  328 	mov	a, #0x64
      000214 37 17                  329 	mov	__divsint_PARM_2+0, a
      000216 38 26                  330 	clear	__divsint_PARM_2+1
      000218 36 72                  331 	call	__divsint
      00021A 28 17                  332 	mov	__modsint_PARM_1+0, a
      00021C 00 1F                  333 	mov	a, p
      00021E 29 17                  334 	mov	__modsint_PARM_1+1, a
      000220 0A 57                  335 	mov	a, #0x0a
      000222 2A 17                  336 	mov	__modsint_PARM_2+0, a
      000224 2B 26                  337 	clear	__modsint_PARM_2+1
      000226 CF 71                  338 	call	__modsint
      000228 30 50                  339 	add	a, #0x30
      00022A 1C 17                  340 	mov	_UART_printNum_dis_65536_22+1, a
                                    341 ;	pdk_uart.c: 55: dis[2] = (num / 10) % 10 + 48;
      00022C 19 1F                  342 	mov	a, _UART_printNum_PARM_1+0
      00022E 35 17                  343 	mov	__divsint_PARM_1+0, a
      000230 1A 1F                  344 	mov	a, _UART_printNum_PARM_1+1
      000232 36 17                  345 	mov	__divsint_PARM_1+1, a
      000234 0A 57                  346 	mov	a, #0x0a
      000236 37 17                  347 	mov	__divsint_PARM_2+0, a
      000238 38 26                  348 	clear	__divsint_PARM_2+1
      00023A 36 72                  349 	call	__divsint
      00023C 28 17                  350 	mov	__modsint_PARM_1+0, a
      00023E 00 1F                  351 	mov	a, p
      000240 29 17                  352 	mov	__modsint_PARM_1+1, a
      000242 0A 57                  353 	mov	a, #0x0a
      000244 2A 17                  354 	mov	__modsint_PARM_2+0, a
      000246 2B 26                  355 	clear	__modsint_PARM_2+1
      000248 CF 71                  356 	call	__modsint
      00024A 30 50                  357 	add	a, #0x30
      00024C 1D 17                  358 	mov	_UART_printNum_dis_65536_22+2, a
                                    359 ;	pdk_uart.c: 56: dis[3] = num % 10 + 48;
      00024E 19 1F                  360 	mov	a, _UART_printNum_PARM_1+0
      000250 28 17                  361 	mov	__modsint_PARM_1+0, a
      000252 1A 1F                  362 	mov	a, _UART_printNum_PARM_1+1
      000254 29 17                  363 	mov	__modsint_PARM_1+1, a
      000256 0A 57                  364 	mov	a, #0x0a
      000258 2A 17                  365 	mov	__modsint_PARM_2+0, a
      00025A 2B 26                  366 	clear	__modsint_PARM_2+1
      00025C CF 71                  367 	call	__modsint
      00025E 30 50                  368 	add	a, #0x30
      000260 1E 17                  369 	mov	_UART_printNum_dis_65536_22+3, a
                                    370 ;	pdk_uart.c: 57: dis[4] = '\0';
      000262 1F 26                  371 	clear	_UART_printNum_dis_65536_22+4
      000264 86 61                  372 	goto	00109$
      000266                        373 00108$:
                                    374 ;	pdk_uart.c: 59: else if (num > 99)
      000266 63 57                  375 	mov	a, #0x63
      000268 19 19                  376 	sub	a, _UART_printNum_PARM_1+0
      00026A 00 57                  377 	mov	a, #0x00
      00026C 1A 1B                  378 	subc	a, _UART_printNum_PARM_1+1
      00026E 80 31                  379 	t0sn.io	f, ov
      000270 80 56                  380 	xor	a, #0x80
      000272 6B 00                  381 	sl	a
      000274 80 34                  382 	t1sn.io	f, c
      000276 63 61                  383 	goto	00105$
                                    384 ;	pdk_uart.c: 61: dis[0] = num / 100 + 48;
      000278 19 1F                  385 	mov	a, _UART_printNum_PARM_1+0
      00027A 35 17                  386 	mov	__divsint_PARM_1+0, a
      00027C 1A 1F                  387 	mov	a, _UART_printNum_PARM_1+1
      00027E 36 17                  388 	mov	__divsint_PARM_1+1, a
      000280 64 57                  389 	mov	a, #0x64
      000282 37 17                  390 	mov	__divsint_PARM_2+0, a
      000284 38 26                  391 	clear	__divsint_PARM_2+1
      000286 36 72                  392 	call	__divsint
      000288 30 50                  393 	add	a, #0x30
      00028A 1B 17                  394 	mov	_UART_printNum_dis_65536_22+0, a
                                    395 ;	pdk_uart.c: 62: dis[1] = (num / 10) % 10 + 48;
      00028C 19 1F                  396 	mov	a, _UART_printNum_PARM_1+0
      00028E 35 17                  397 	mov	__divsint_PARM_1+0, a
      000290 1A 1F                  398 	mov	a, _UART_printNum_PARM_1+1
      000292 36 17                  399 	mov	__divsint_PARM_1+1, a
      000294 0A 57                  400 	mov	a, #0x0a
      000296 37 17                  401 	mov	__divsint_PARM_2+0, a
      000298 38 26                  402 	clear	__divsint_PARM_2+1
      00029A 36 72                  403 	call	__divsint
      00029C 28 17                  404 	mov	__modsint_PARM_1+0, a
      00029E 00 1F                  405 	mov	a, p
      0002A0 29 17                  406 	mov	__modsint_PARM_1+1, a
      0002A2 0A 57                  407 	mov	a, #0x0a
      0002A4 2A 17                  408 	mov	__modsint_PARM_2+0, a
      0002A6 2B 26                  409 	clear	__modsint_PARM_2+1
      0002A8 CF 71                  410 	call	__modsint
      0002AA 30 50                  411 	add	a, #0x30
      0002AC 1C 17                  412 	mov	_UART_printNum_dis_65536_22+1, a
                                    413 ;	pdk_uart.c: 63: dis[2] = num % 10 + 48;
      0002AE 19 1F                  414 	mov	a, _UART_printNum_PARM_1+0
      0002B0 28 17                  415 	mov	__modsint_PARM_1+0, a
      0002B2 1A 1F                  416 	mov	a, _UART_printNum_PARM_1+1
      0002B4 29 17                  417 	mov	__modsint_PARM_1+1, a
      0002B6 0A 57                  418 	mov	a, #0x0a
      0002B8 2A 17                  419 	mov	__modsint_PARM_2+0, a
      0002BA 2B 26                  420 	clear	__modsint_PARM_2+1
      0002BC CF 71                  421 	call	__modsint
      0002BE 30 50                  422 	add	a, #0x30
      0002C0 1D 17                  423 	mov	_UART_printNum_dis_65536_22+2, a
                                    424 ;	pdk_uart.c: 64: dis[3] = '\0';
      0002C2 1E 26                  425 	clear	_UART_printNum_dis_65536_22+3
      0002C4 86 61                  426 	goto	00109$
      0002C6                        427 00105$:
                                    428 ;	pdk_uart.c: 66: else if (num > 9)
      0002C6 09 57                  429 	mov	a, #0x09
      0002C8 19 19                  430 	sub	a, _UART_printNum_PARM_1+0
      0002CA 00 57                  431 	mov	a, #0x00
      0002CC 1A 1B                  432 	subc	a, _UART_printNum_PARM_1+1
      0002CE 80 31                  433 	t0sn.io	f, ov
      0002D0 80 56                  434 	xor	a, #0x80
      0002D2 6B 00                  435 	sl	a
      0002D4 80 34                  436 	t1sn.io	f, c
      0002D6 82 61                  437 	goto	00102$
                                    438 ;	pdk_uart.c: 68: dis[0] = num / 10 + 48;
      0002D8 19 1F                  439 	mov	a, _UART_printNum_PARM_1+0
      0002DA 35 17                  440 	mov	__divsint_PARM_1+0, a
      0002DC 1A 1F                  441 	mov	a, _UART_printNum_PARM_1+1
      0002DE 36 17                  442 	mov	__divsint_PARM_1+1, a
      0002E0 0A 57                  443 	mov	a, #0x0a
      0002E2 37 17                  444 	mov	__divsint_PARM_2+0, a
      0002E4 38 26                  445 	clear	__divsint_PARM_2+1
      0002E6 36 72                  446 	call	__divsint
      0002E8 30 50                  447 	add	a, #0x30
      0002EA 1B 17                  448 	mov	_UART_printNum_dis_65536_22+0, a
                                    449 ;	pdk_uart.c: 69: dis[1] = num % 10 + 48;
      0002EC 19 1F                  450 	mov	a, _UART_printNum_PARM_1+0
      0002EE 28 17                  451 	mov	__modsint_PARM_1+0, a
      0002F0 1A 1F                  452 	mov	a, _UART_printNum_PARM_1+1
      0002F2 29 17                  453 	mov	__modsint_PARM_1+1, a
      0002F4 0A 57                  454 	mov	a, #0x0a
      0002F6 2A 17                  455 	mov	__modsint_PARM_2+0, a
      0002F8 2B 26                  456 	clear	__modsint_PARM_2+1
      0002FA CF 71                  457 	call	__modsint
      0002FC 30 50                  458 	add	a, #0x30
      0002FE 1C 17                  459 	mov	_UART_printNum_dis_65536_22+1, a
                                    460 ;	pdk_uart.c: 70: dis[2] = '\0';
      000300 1D 26                  461 	clear	_UART_printNum_dis_65536_22+2
      000302 86 61                  462 	goto	00109$
      000304                        463 00102$:
                                    464 ;	pdk_uart.c: 74: dis[0] = num + 48;
      000304 19 1F                  465 	mov	a, _UART_printNum_PARM_1+0
      000306 30 50                  466 	add	a, #0x30
      000308 1B 17                  467 	mov	_UART_printNum_dis_65536_22+0, a
                                    468 ;	pdk_uart.c: 75: dis[1] = '\0';
      00030A 1C 26                  469 	clear	_UART_printNum_dis_65536_22+1
      00030C                        470 00109$:
                                    471 ;	pdk_uart.c: 77: UART_print(dis);
      00030C 1B 57                  472 	mov	a, #(_UART_printNum_dis_65536_22 + 0)
      00030E 16 17                  473 	mov	_UART_print_PARM_1+0, a
      000310 17 26                  474 	clear	_UART_print_PARM_1+1
      000312 DC 60                  475 	goto	_UART_print
                                    476 ;	pdk_uart.c: 78: }
      000314 7A 00                  477 	ret
                                    478 	.area CODE
                                    479 	.area CONST
                                    480 	.area CABS (ABS)
