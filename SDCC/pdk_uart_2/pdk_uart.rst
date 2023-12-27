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
                                     72 	.globl _putchar_PARM_1
                                     73 	.globl _UART_begin
                                     74 	.globl _TIM2_interrupt
                                     75 	.globl _putchar
                                     76 ;--------------------------------------------------------
                                     77 ; special function registers
                                     78 ;--------------------------------------------------------
                                     79 	.area RSEG (ABS)
      000002                         80 	.org 0x0000
                           000000    81 __flag	=	0x0000
                           000002    82 __sp	=	0x0002
                           000003    83 __clkmd	=	0x0003
                           000004    84 __inten	=	0x0004
                           000005    85 __intrq	=	0x0005
                           000006    86 __t16m	=	0x0006
                           00000A    87 __eoscr	=	0x000a
                           00000B    88 __ihrcr	=	0x000b
                           00000C    89 __integs	=	0x000c
                           00000D    90 __padier	=	0x000d
                           00000E    91 __pbdier	=	0x000e
                           00000F    92 __pcdier	=	0x000f
                           000010    93 __pa	=	0x0010
                           000011    94 __pac	=	0x0011
                           000012    95 __paph	=	0x0012
                           000013    96 __pb	=	0x0013
                           000014    97 __pbc	=	0x0014
                           000015    98 __pbph	=	0x0015
                           000016    99 __pc	=	0x0016
                           000017   100 __pcc	=	0x0017
                           000018   101 __pcph	=	0x0018
                           000019   102 __pbpl	=	0x0019
                           00001A   103 __pcpl	=	0x001a
                           000020   104 __adcc	=	0x0020
                           000021   105 __adcm	=	0x0021
                           000022   106 __adcr	=	0x0022
                           000024   107 __adcrgc	=	0x0024
                           000026   108 __misc	=	0x0026
                           000027   109 __misc2	=	0x0027
                           000028   110 __misclvr	=	0x0028
                           00002B   111 __gpcc	=	0x002b
                           00002C   112 __gpcs	=	0x002c
                           000030   113 __tm2c	=	0x0030
                           000031   114 __tm2ct	=	0x0031
                           000032   115 __tm2s	=	0x0032
                           000033   116 __tm2b	=	0x0033
                           000034   117 __tm3c	=	0x0034
                           000035   118 __tm3ct	=	0x0035
                           000036   119 __tm3s	=	0x0036
                           000037   120 __tm3b	=	0x0037
                           000040   121 __pwmg0c	=	0x0040
                           000041   122 __pwmgclk	=	0x0041
                           000042   123 __pwmg0dth	=	0x0042
                           000043   124 __pwmg0dtl	=	0x0043
                           000044   125 __pwmgcubh	=	0x0044
                           000045   126 __pwmgcubl	=	0x0045
                           000046   127 __pwmg1c	=	0x0046
                           000048   128 __pwmg1dth	=	0x0048
                           000049   129 __pwmg1dtl	=	0x0049
                           00004C   130 __pwmg2c	=	0x004c
                           00004E   131 __pwmg2dth	=	0x004e
                           00004F   132 __pwmg2dtl	=	0x004f
                           000062   133 __ilrcr	=	0x0062
                           000063   134 __bgtr	=	0x0063
                           000067   135 __rop	=	0x0067
      000002                        136 __t16c::
      000002                        137 	.ds 2
                                    138 ;--------------------------------------------------------
                                    139 ; ram data
                                    140 ;--------------------------------------------------------
                                    141 	.area DATA
      00000B                        142 _putchar_PARM_1:
      00000B                        143 	.ds 2
                                    144 ;--------------------------------------------------------
                                    145 ; overlayable items in ram
                                    146 ;--------------------------------------------------------
                                    147 ;--------------------------------------------------------
                                    148 ; absolute external ram data
                                    149 ;--------------------------------------------------------
                                    150 	.area DABS (ABS)
                                    151 ;--------------------------------------------------------
                                    152 ; global & static initialisations
                                    153 ;--------------------------------------------------------
                                    154 	.area HOME
                                    155 	.area GSINIT
                                    156 	.area GSFINAL
                                    157 	.area GSINIT
                                    158 ;--------------------------------------------------------
                                    159 ; Home
                                    160 ;--------------------------------------------------------
                                    161 	.area HOME
                                    162 	.area HOME
                                    163 ;--------------------------------------------------------
                                    164 ; code
                                    165 ;--------------------------------------------------------
                                    166 	.area CODE
                                    167 ;	pdk_uart.c: 6: void UART_begin()
                                    168 ;	-----------------------------------------
                                    169 ;	 function UART_begin
                                    170 ;	-----------------------------------------
      0000C2                        171 _UART_begin:
                                    172 ;	pdk_uart.c: 9: TM2C = TM2C_CLK_IHRC;						 // Use IHRC -> 16 Mhz
      0000C2 20 57                  173 	mov	a, #0x20
      0000C4 30 01                  174 	mov.io	__tm2c, a
                                    175 ;	pdk_uart.c: 10: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV2; // No prescale, scale 2 ~> 8MHz
      0000C6 01 57                  176 	mov	a, #0x01
      0000C8 32 01                  177 	mov.io	__tm2s, a
                                    178 ;	pdk_uart.c: 11: TM2B = 69;									 // Divide by 69 ~> 115942 Hz (apx. 115200)
      0000CA 45 57                  179 	mov	a, #0x45
      0000CC 33 01                  180 	mov.io	__tm2b, a
                                    181 ;	pdk_uart.c: 13: PAC |= (1 << UART_TX_PIN); // Enable TX Pin as output
      0000CE 91 3F                  182 	set1.io	__pac, #7
                                    183 ;	pdk_uart.c: 15: txdata = 0xD55F;	// Setup 2 stop bits, 0x55 char for autobaud, 1 start bit, 5 stop bits
      0000D0 5F 57                  184 	mov	a, #0x5f
      0000D2 09 17                  185 	mov	_txdata+0, a
      0000D4 D5 57                  186 	mov	a, #0xd5
      0000D6 0A 17                  187 	mov	_txdata+1, a
                                    188 ;	pdk_uart.c: 16: INTEN |= INTEN_TM2; // Enable TM2 interrupt, send out initial stop bits and autobaud char
      0000D8 04 3F                  189 	set1.io	__inten, #6
                                    190 ;	pdk_uart.c: 17: }
      0000DA 7A 00                  191 	ret
                                    192 ;	pdk_uart.c: 20: void TIM2_interrupt()
                                    193 ;	-----------------------------------------
                                    194 ;	 function TIM2_interrupt
                                    195 ;	-----------------------------------------
      0000DC                        196 _TIM2_interrupt:
                                    197 ;	pdk_uart.c: 22: if (txdata)
      0000DC 09 1F                  198 	mov	a, _txdata+0
      0000DE 0A 1D                  199 	or	a, _txdata+1
      0000E0 00 53                  200 	cneqsn	a, #0x00
      0000E2 7D 60                  201 	goto	00106$
                                    202 ;	pdk_uart.c: 24: if (txdata & 0x01)			 // Check bit (1/0) for sending
      0000E4 0A 1F                  203 	mov	a, _txdata+1
      0000E6 00 17                  204 	mov	p, a
      0000E8 09 1F                  205 	mov	a, _txdata+0
      0000EA 01 54                  206 	and	a, #0x01
      0000EC 00 53                  207 	cneqsn	a, #0x00
      0000EE 7A 60                  208 	goto	00102$
                                    209 ;	pdk_uart.c: 25: setb(PA, UART_TX_PIN); // Send 1 on TX Pin
      0000F0 90 3F                  210 	set1.io	__pa, #7
      0000F2 7B 60                  211 	goto	00103$
      0000F4                        212 00102$:
                                    213 ;	pdk_uart.c: 27: clrb(PA, UART_TX_PIN); // Send 0 on TX Pin
      0000F4 90 3B                  214 	set0.io	__pa, #7
      0000F6                        215 00103$:
                                    216 ;	pdk_uart.c: 28: txdata >>= 1;				 // Shift txdata
      0000F6 0A 2A                  217 	sr	_txdata+1
      0000F8 09 2C                  218 	src	_txdata+0
      0000FA                        219 00106$:
                                    220 ;	pdk_uart.c: 30: }
      0000FA 7A 00                  221 	ret
                                    222 ;	pdk_uart.c: 32: int putchar(int c)
                                    223 ;	-----------------------------------------
                                    224 ;	 function putchar
                                    225 ;	-----------------------------------------
      0000FC                        226 _putchar:
                                    227 ;	pdk_uart.c: 34: while (txdata)
      0000FC                        228 00101$:
      0000FC 09 1F                  229 	mov	a, _txdata+0
      0000FE 0A 1D                  230 	or	a, _txdata+1
      000100 00 52                  231 	ceqsn	a, #0x00
      000102 7E 60                  232 	goto	00101$
                                    233 ;	pdk_uart.c: 36: INTEN &= ~INTEN_TM2;	   // Disable TM2 (setup of 16 bit value txdata is non atomic)
      000104 04 3B                  234 	set0.io	__inten, #6
                                    235 ;	pdk_uart.c: 37: txdata = (c << 1) | 0x200; // Setup txdata with start and stop bit
      000106 0C 1F                  236 	mov	a, _putchar_PARM_1+1
      000108 00 17                  237 	mov	p, a
      00010A 0B 1F                  238 	mov	a, _putchar_PARM_1+0
      00010C 6B 00                  239 	sl	a
      00010E 00 2D                  240 	slc	p
      000110 80 4C                  241 	set1	p, #1
      000112 09 17                  242 	mov	_txdata+0, a
      000114 00 1F                  243 	mov	a, p
      000116 0A 17                  244 	mov	_txdata+1, a
                                    245 ;	pdk_uart.c: 38: INTEN |= INTEN_TM2;		   // Enable TM2
      000118 04 3F                  246 	set1.io	__inten, #6
                                    247 ;	pdk_uart.c: 39: return (c);
      00011A 0C 1F                  248 	mov	a, _putchar_PARM_1+1
      00011C 00 17                  249 	mov	p, a
      00011E 0B 1F                  250 	mov	a, _putchar_PARM_1+0
                                    251 ;	pdk_uart.c: 40: }
      000120 7A 00                  252 	ret
                                    253 	.area CODE
                                    254 	.area CONST
                                    255 	.area CABS (ABS)
