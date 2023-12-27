                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module pdk_IRremote
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
                                     16 	.globl _MATCH_SPACE
                                     17 	.globl _MATCH_MARK
                                     18 	.globl _MATCH
                                     19 	.globl __t16c
                                     20 	.globl __rop
                                     21 	.globl __bgtr
                                     22 	.globl __ilrcr
                                     23 	.globl __pwmg2dtl
                                     24 	.globl __pwmg2dth
                                     25 	.globl __pwmg2c
                                     26 	.globl __pwmg1dtl
                                     27 	.globl __pwmg1dth
                                     28 	.globl __pwmg1c
                                     29 	.globl __pwmgcubl
                                     30 	.globl __pwmgcubh
                                     31 	.globl __pwmg0dtl
                                     32 	.globl __pwmg0dth
                                     33 	.globl __pwmgclk
                                     34 	.globl __pwmg0c
                                     35 	.globl __tm3b
                                     36 	.globl __tm3s
                                     37 	.globl __tm3ct
                                     38 	.globl __tm3c
                                     39 	.globl __tm2b
                                     40 	.globl __tm2s
                                     41 	.globl __tm2ct
                                     42 	.globl __tm2c
                                     43 	.globl __gpcs
                                     44 	.globl __gpcc
                                     45 	.globl __misclvr
                                     46 	.globl __misc2
                                     47 	.globl __misc
                                     48 	.globl __adcrgc
                                     49 	.globl __adcr
                                     50 	.globl __adcm
                                     51 	.globl __adcc
                                     52 	.globl __pcpl
                                     53 	.globl __pbpl
                                     54 	.globl __pcph
                                     55 	.globl __pcc
                                     56 	.globl __pc
                                     57 	.globl __pbph
                                     58 	.globl __pbc
                                     59 	.globl __pb
                                     60 	.globl __paph
                                     61 	.globl __pac
                                     62 	.globl __pa
                                     63 	.globl __pcdier
                                     64 	.globl __pbdier
                                     65 	.globl __padier
                                     66 	.globl __integs
                                     67 	.globl __ihrcr
                                     68 	.globl __eoscr
                                     69 	.globl __t16m
                                     70 	.globl __intrq
                                     71 	.globl __inten
                                     72 	.globl __clkmd
                                     73 	.globl __sp
                                     74 	.globl __flag
                                     75 	.globl _IR_decode_PARM_1
                                     76 	.globl _IR_decodeNEC_PARM_1
                                     77 	.globl _MATCH_SPACE_PARM_2
                                     78 	.globl _MATCH_SPACE_PARM_1
                                     79 	.globl _MATCH_MARK_PARM_2
                                     80 	.globl _MATCH_MARK_PARM_1
                                     81 	.globl _MATCH_PARM_2
                                     82 	.globl _MATCH_PARM_1
                                     83 	.globl _rawbuf
                                     84 	.globl _rcvstate
                                     85 	.globl _rawlen
                                     86 	.globl _timer
                                     87 	.globl _IR_resume
                                     88 	.globl _IR_decodeNEC
                                     89 	.globl _IR_decode
                                     90 	.globl _IR_config
                                     91 	.globl _TIM3_interrupt
                                     92 ;--------------------------------------------------------
                                     93 ; special function registers
                                     94 ;--------------------------------------------------------
                                     95 	.area RSEG (ABS)
      000004                         96 	.org 0x0000
                           000000    97 __flag	=	0x0000
                           000002    98 __sp	=	0x0002
                           000003    99 __clkmd	=	0x0003
                           000004   100 __inten	=	0x0004
                           000005   101 __intrq	=	0x0005
                           000006   102 __t16m	=	0x0006
                           00000A   103 __eoscr	=	0x000a
                           00000B   104 __ihrcr	=	0x000b
                           00000C   105 __integs	=	0x000c
                           00000D   106 __padier	=	0x000d
                           00000E   107 __pbdier	=	0x000e
                           00000F   108 __pcdier	=	0x000f
                           000010   109 __pa	=	0x0010
                           000011   110 __pac	=	0x0011
                           000012   111 __paph	=	0x0012
                           000013   112 __pb	=	0x0013
                           000014   113 __pbc	=	0x0014
                           000015   114 __pbph	=	0x0015
                           000016   115 __pc	=	0x0016
                           000017   116 __pcc	=	0x0017
                           000018   117 __pcph	=	0x0018
                           000019   118 __pbpl	=	0x0019
                           00001A   119 __pcpl	=	0x001a
                           000020   120 __adcc	=	0x0020
                           000021   121 __adcm	=	0x0021
                           000022   122 __adcr	=	0x0022
                           000024   123 __adcrgc	=	0x0024
                           000026   124 __misc	=	0x0026
                           000027   125 __misc2	=	0x0027
                           000028   126 __misclvr	=	0x0028
                           00002B   127 __gpcc	=	0x002b
                           00002C   128 __gpcs	=	0x002c
                           000030   129 __tm2c	=	0x0030
                           000031   130 __tm2ct	=	0x0031
                           000032   131 __tm2s	=	0x0032
                           000033   132 __tm2b	=	0x0033
                           000034   133 __tm3c	=	0x0034
                           000035   134 __tm3ct	=	0x0035
                           000036   135 __tm3s	=	0x0036
                           000037   136 __tm3b	=	0x0037
                           000040   137 __pwmg0c	=	0x0040
                           000041   138 __pwmgclk	=	0x0041
                           000042   139 __pwmg0dth	=	0x0042
                           000043   140 __pwmg0dtl	=	0x0043
                           000044   141 __pwmgcubh	=	0x0044
                           000045   142 __pwmgcubl	=	0x0045
                           000046   143 __pwmg1c	=	0x0046
                           000048   144 __pwmg1dth	=	0x0048
                           000049   145 __pwmg1dtl	=	0x0049
                           00004C   146 __pwmg2c	=	0x004c
                           00004E   147 __pwmg2dth	=	0x004e
                           00004F   148 __pwmg2dtl	=	0x004f
                           000062   149 __ilrcr	=	0x0062
                           000063   150 __bgtr	=	0x0063
                           000067   151 __rop	=	0x0067
      000004                        152 __t16c::
      000004                        153 	.ds 2
                                    154 ;--------------------------------------------------------
                                    155 ; ram data
                                    156 ;--------------------------------------------------------
                                    157 	.area DATA
      00000D                        158 _timer::
      00000D                        159 	.ds 2
      00000F                        160 _rawlen::
      00000F                        161 	.ds 1
      000010                        162 _rcvstate::
      000010                        163 	.ds 1
      000011                        164 _rawbuf::
      000011                        165 	.ds 140
      00009D                        166 _MATCH_PARM_1:
      00009D                        167 	.ds 2
      00009F                        168 _MATCH_PARM_2:
      00009F                        169 	.ds 2
      0000A1                        170 _MATCH_sloc0_1_0:
      0000A1                        171 	.ds 4
      0000A5                        172 _MATCH_sloc1_1_0:
      0000A5                        173 	.ds 4
      0000A9                        174 _MATCH_sloc2_1_0:
      0000A9                        175 	.ds 4
      0000AD                        176 _MATCH_sloc3_1_0:
      0000AD                        177 	.ds 4
      0000B1                        178 _MATCH_sloc4_1_0:
      0000B1                        179 	.ds 4
      0000B5                        180 _MATCH_sloc5_1_0:
      0000B5                        181 	.ds 4
      0000B9                        182 _MATCH_sloc6_1_0:
      0000B9                        183 	.ds 2
      0000BB                        184 _MATCH_sloc7_1_0:
      0000BB                        185 	.ds 2
      0000BD                        186 _MATCH_MARK_PARM_1:
      0000BD                        187 	.ds 2
      0000BF                        188 _MATCH_MARK_PARM_2:
      0000BF                        189 	.ds 2
      0000C1                        190 _MATCH_SPACE_PARM_1:
      0000C1                        191 	.ds 2
      0000C3                        192 _MATCH_SPACE_PARM_2:
      0000C3                        193 	.ds 2
      0000C5                        194 _IR_decodeNEC_PARM_1:
      0000C5                        195 	.ds 2
      0000C7                        196 _IR_decodeNEC_sloc8_1_0:
      0000C7                        197 	.ds 1
      0000C8                        198 _IR_decodeNEC_sloc9_1_0:
      0000C8                        199 	.ds 1
      0000C9                        200 _IR_decode_PARM_1:
      0000C9                        201 	.ds 2
                                    202 ;--------------------------------------------------------
                                    203 ; overlayable items in ram 
                                    204 ;--------------------------------------------------------
                                    205 ;--------------------------------------------------------
                                    206 ; absolute external ram data
                                    207 ;--------------------------------------------------------
                                    208 	.area DABS (ABS)
                                    209 ;--------------------------------------------------------
                                    210 ; global & static initialisations
                                    211 ;--------------------------------------------------------
                                    212 	.area HOME
                                    213 	.area GSINIT
                                    214 	.area GSFINAL
                                    215 	.area GSINIT
                                    216 ;	pdk_IRremote.c: 10: uint16_t timer = 0;
      000038 0D 26                  217 	clear	_timer+0
      00003A 0E 26                  218 	clear	_timer+1
                                    219 ;	pdk_IRremote.c: 11: uint8_t rawlen = 0;
      00003C 0F 26                  220 	clear	_rawlen+0
                                    221 ;	pdk_IRremote.c: 12: uint8_t rcvstate = STATE_IDLE;
      00003E 02 57                  222 	mov	a, #0x02
      000040 10 17                  223 	mov	_rcvstate+0, a
                                    224 ;--------------------------------------------------------
                                    225 ; Home
                                    226 ;--------------------------------------------------------
                                    227 	.area HOME
                                    228 	.area HOME
                                    229 ;--------------------------------------------------------
                                    230 ; code
                                    231 ;--------------------------------------------------------
                                    232 	.area CODE
                                    233 ;	pdk_IRremote.c: 15: uint8_t MATCH(uint16_t measured, uint16_t desired)
                                    234 ;	-----------------------------------------
                                    235 ;	 function MATCH
                                    236 ;	-----------------------------------------
      000134                        237 _MATCH:
                                    238 ;	pdk_IRremote.c: 17: return measured >= TICKS_LOW(desired) && measured <= TICKS_HIGH(desired);
      000134 9F 1F                  239 	mov	a, _MATCH_PARM_2+0
      000136 A0 17                  240 	mov	___uint2fs_PARM_1+0, a
      000138 A0 1F                  241 	mov	a, _MATCH_PARM_2+1
      00013A A1 17                  242 	mov	___uint2fs_PARM_1+1, a
      00013C A1 57                  243 	mov	a, #_MATCH_sloc0_1_0
      00013E 72 00                  244 	push	af
      000140 D6 74                  245 	call	___uint2fs
      000142 82 01                  246 	mov	a, sp
      000144 FE 50                  247 	add	a, #-2
      000146 02 01                  248 	mov	sp, a
      000148 CB 26                  249 	clear	___fsmul_PARM_1+0
      00014A CC 26                  250 	clear	___fsmul_PARM_1+1
      00014C 40 57                  251 	mov	a, #0x40
      00014E CD 17                  252 	mov	___fsmul_PARM_1+2, a
      000150 3F 57                  253 	mov	a, #0x3f
      000152 CE 17                  254 	mov	___fsmul_PARM_1+3, a
      000154 A1 1F                  255 	mov	a, _MATCH_sloc0_1_0+0
      000156 CF 17                  256 	mov	___fsmul_PARM_2+0, a
      000158 A2 1F                  257 	mov	a, _MATCH_sloc0_1_0+1
      00015A D0 17                  258 	mov	___fsmul_PARM_2+1, a
      00015C A3 1F                  259 	mov	a, _MATCH_sloc0_1_0+2
      00015E D1 17                  260 	mov	___fsmul_PARM_2+2, a
      000160 A4 1F                  261 	mov	a, _MATCH_sloc0_1_0+3
      000162 D2 17                  262 	mov	___fsmul_PARM_2+3, a
      000164 A5 57                  263 	mov	a, #_MATCH_sloc1_1_0
      000166 72 00                  264 	push	af
      000168 45 72                  265 	call	___fsmul
      00016A 82 01                  266 	mov	a, sp
      00016C FE 50                  267 	add	a, #-2
      00016E 02 01                  268 	mov	sp, a
      000170 A5 1F                  269 	mov	a, _MATCH_sloc1_1_0+0
      000172 FE 17                  270 	mov	___fsdiv_PARM_1+0, a
      000174 A6 1F                  271 	mov	a, _MATCH_sloc1_1_0+1
      000176 FF 17                  272 	mov	___fsdiv_PARM_1+1, a
      000178 A7 1F                  273 	mov	a, _MATCH_sloc1_1_0+2
      00017A 00 17                  274 	mov	___fsdiv_PARM_1+2, a
      00017C A8 1F                  275 	mov	a, _MATCH_sloc1_1_0+3
      00017E 01 17                  276 	mov	___fsdiv_PARM_1+3, a
      000180 02 26                  277 	clear	___fsdiv_PARM_2+0
      000182 03 26                  278 	clear	___fsdiv_PARM_2+1
      000184 48 57                  279 	mov	a, #0x48
      000186 04 17                  280 	mov	___fsdiv_PARM_2+2, a
      000188 42 57                  281 	mov	a, #0x42
      00018A 05 17                  282 	mov	___fsdiv_PARM_2+3, a
      00018C A9 57                  283 	mov	a, #_MATCH_sloc2_1_0
      00018E 72 00                  284 	push	af
      000190 15 79                  285 	call	___fsdiv
      000192 82 01                  286 	mov	a, sp
      000194 FE 50                  287 	add	a, #-2
      000196 02 01                  288 	mov	sp, a
      000198 A9 1F                  289 	mov	a, _MATCH_sloc2_1_0+0
      00019A 94 17                  290 	mov	___fs2sint_PARM_1+0, a
      00019C AA 1F                  291 	mov	a, _MATCH_sloc2_1_0+1
      00019E 95 17                  292 	mov	___fs2sint_PARM_1+1, a
      0001A0 AB 1F                  293 	mov	a, _MATCH_sloc2_1_0+2
      0001A2 96 17                  294 	mov	___fs2sint_PARM_1+2, a
      0001A4 AC 1F                  295 	mov	a, _MATCH_sloc2_1_0+3
      0001A6 97 17                  296 	mov	___fs2sint_PARM_1+3, a
      0001A8 9A 74                  297 	call	___fs2sint
      0001AA 72 00                  298 	push	af
      0001AC 9D 1F                  299 	mov	a, _MATCH_PARM_1+0
      0001AE B9 17                  300 	mov	_MATCH_sloc6_1_0+0, a
      0001B0 73 00                  301 	pop	af
      0001B2 72 00                  302 	push	af
      0001B4 9E 1F                  303 	mov	a, _MATCH_PARM_1+1
      0001B6 BA 17                  304 	mov	_MATCH_sloc6_1_0+1, a
      0001B8 73 00                  305 	pop	af
      0001BA BB 17                  306 	mov	_MATCH_sloc7_1_0+0, a
      0001BC 00 1F                  307 	mov	a, p
      0001BE BC 17                  308 	mov	_MATCH_sloc7_1_0+1, a
      0001C0 B9 1F                  309 	mov	a, _MATCH_sloc6_1_0+0
      0001C2 BB 19                  310 	sub	a, _MATCH_sloc7_1_0+0
      0001C4 BA 1F                  311 	mov	a, _MATCH_sloc6_1_0+1
      0001C6 BC 1B                  312 	subc	a, _MATCH_sloc7_1_0+1
      0001C8 80 30                  313 	t0sn	f, c
      0001CA 30 61                  314 	goto	00103$
      0001CC CB 26                  315 	clear	___fsmul_PARM_1+0
      0001CE CC 26                  316 	clear	___fsmul_PARM_1+1
      0001D0 A0 57                  317 	mov	a, #0xa0
      0001D2 CD 17                  318 	mov	___fsmul_PARM_1+2, a
      0001D4 3F 57                  319 	mov	a, #0x3f
      0001D6 CE 17                  320 	mov	___fsmul_PARM_1+3, a
      0001D8 A1 1F                  321 	mov	a, _MATCH_sloc0_1_0+0
      0001DA CF 17                  322 	mov	___fsmul_PARM_2+0, a
      0001DC A2 1F                  323 	mov	a, _MATCH_sloc0_1_0+1
      0001DE D0 17                  324 	mov	___fsmul_PARM_2+1, a
      0001E0 A3 1F                  325 	mov	a, _MATCH_sloc0_1_0+2
      0001E2 D1 17                  326 	mov	___fsmul_PARM_2+2, a
      0001E4 A4 1F                  327 	mov	a, _MATCH_sloc0_1_0+3
      0001E6 D2 17                  328 	mov	___fsmul_PARM_2+3, a
      0001E8 AD 57                  329 	mov	a, #_MATCH_sloc3_1_0
      0001EA 72 00                  330 	push	af
      0001EC 45 72                  331 	call	___fsmul
      0001EE 82 01                  332 	mov	a, sp
      0001F0 FE 50                  333 	add	a, #-2
      0001F2 02 01                  334 	mov	sp, a
      0001F4 AD 1F                  335 	mov	a, _MATCH_sloc3_1_0+0
      0001F6 FE 17                  336 	mov	___fsdiv_PARM_1+0, a
      0001F8 AE 1F                  337 	mov	a, _MATCH_sloc3_1_0+1
      0001FA FF 17                  338 	mov	___fsdiv_PARM_1+1, a
      0001FC AF 1F                  339 	mov	a, _MATCH_sloc3_1_0+2
      0001FE 00 17                  340 	mov	___fsdiv_PARM_1+2, a
      000200 B0 1F                  341 	mov	a, _MATCH_sloc3_1_0+3
      000202 01 17                  342 	mov	___fsdiv_PARM_1+3, a
      000204 02 26                  343 	clear	___fsdiv_PARM_2+0
      000206 03 26                  344 	clear	___fsdiv_PARM_2+1
      000208 48 57                  345 	mov	a, #0x48
      00020A 04 17                  346 	mov	___fsdiv_PARM_2+2, a
      00020C 42 57                  347 	mov	a, #0x42
      00020E 05 17                  348 	mov	___fsdiv_PARM_2+3, a
      000210 B1 57                  349 	mov	a, #_MATCH_sloc4_1_0
      000212 72 00                  350 	push	af
      000214 15 79                  351 	call	___fsdiv
      000216 82 01                  352 	mov	a, sp
      000218 FE 50                  353 	add	a, #-2
      00021A 02 01                  354 	mov	sp, a
      00021C B1 1F                  355 	mov	a, _MATCH_sloc4_1_0+0
      00021E 3E 17                  356 	mov	___fsadd_PARM_1+0, a
      000220 B2 1F                  357 	mov	a, _MATCH_sloc4_1_0+1
      000222 3F 17                  358 	mov	___fsadd_PARM_1+1, a
      000224 B3 1F                  359 	mov	a, _MATCH_sloc4_1_0+2
      000226 40 17                  360 	mov	___fsadd_PARM_1+2, a
      000228 B4 1F                  361 	mov	a, _MATCH_sloc4_1_0+3
      00022A 41 17                  362 	mov	___fsadd_PARM_1+3, a
      00022C 42 26                  363 	clear	___fsadd_PARM_2+0
      00022E 43 26                  364 	clear	___fsadd_PARM_2+1
      000230 80 57                  365 	mov	a, #0x80
      000232 44 17                  366 	mov	___fsadd_PARM_2+2, a
      000234 3F 57                  367 	mov	a, #0x3f
      000236 45 17                  368 	mov	___fsadd_PARM_2+3, a
      000238 B5 57                  369 	mov	a, #_MATCH_sloc5_1_0
      00023A 72 00                  370 	push	af
      00023C 67 7A                  371 	call	___fsadd
      00023E 82 01                  372 	mov	a, sp
      000240 FE 50                  373 	add	a, #-2
      000242 02 01                  374 	mov	sp, a
      000244 B5 1F                  375 	mov	a, _MATCH_sloc5_1_0+0
      000246 94 17                  376 	mov	___fs2sint_PARM_1+0, a
      000248 B6 1F                  377 	mov	a, _MATCH_sloc5_1_0+1
      00024A 95 17                  378 	mov	___fs2sint_PARM_1+1, a
      00024C B7 1F                  379 	mov	a, _MATCH_sloc5_1_0+2
      00024E 96 17                  380 	mov	___fs2sint_PARM_1+2, a
      000250 B8 1F                  381 	mov	a, _MATCH_sloc5_1_0+3
      000252 97 17                  382 	mov	___fs2sint_PARM_1+3, a
      000254 9A 74                  383 	call	___fs2sint
      000256 B9 19                  384 	sub	a, _MATCH_sloc6_1_0+0
      000258 00 1F                  385 	mov	a, p
      00025A BA 1B                  386 	subc	a, _MATCH_sloc6_1_0+1
      00025C 80 34                  387 	t1sn	f, c
      00025E 32 61                  388 	goto	00104$
      000260                        389 00103$:
      000260 00 57                  390 	mov	a, #0x00
      000262 33 61                  391 	goto	00105$
      000264                        392 00104$:
      000264 01 57                  393 	mov	a, #0x01
      000266                        394 00105$:
                                    395 ;	pdk_IRremote.c: 18: }
      000266 7A 00                  396 	ret
                                    397 ;	pdk_IRremote.c: 19: uint8_t MATCH_MARK(uint16_t measured_ticks, uint16_t desired_us) { return MATCH(measured_ticks, (desired_us + MARK_EXCESS)); }
                                    398 ;	-----------------------------------------
                                    399 ;	 function MATCH_MARK
                                    400 ;	-----------------------------------------
      000268                        401 _MATCH_MARK:
      000268 BF 1F                  402 	mov	a, _MATCH_MARK_PARM_2+0
      00026A 64 50                  403 	add	a, #0x64
      00026C 00 17                  404 	mov	p, a
      00026E C0 1F                  405 	mov	a, _MATCH_MARK_PARM_2+1
      000270 60 00                  406 	addc	a
      000272 A0 17                  407 	mov	_MATCH_PARM_2+1, a
      000274 00 1F                  408 	mov	a, p
      000276 9F 17                  409 	mov	_MATCH_PARM_2+0, a
      000278 BD 1F                  410 	mov	a, _MATCH_MARK_PARM_1+0
      00027A 9D 17                  411 	mov	_MATCH_PARM_1+0, a
      00027C BE 1F                  412 	mov	a, _MATCH_MARK_PARM_1+1
      00027E 9E 17                  413 	mov	_MATCH_PARM_1+1, a
      000280 9A 60                  414 	goto	_MATCH
      000282 7A 00                  415 	ret
                                    416 ;	pdk_IRremote.c: 20: uint8_t MATCH_SPACE(uint16_t measured_ticks, uint16_t desired_us) { return MATCH(measured_ticks, (desired_us - MARK_EXCESS)); }
                                    417 ;	-----------------------------------------
                                    418 ;	 function MATCH_SPACE
                                    419 ;	-----------------------------------------
      000284                        420 _MATCH_SPACE:
      000284 C3 1F                  421 	mov	a, _MATCH_SPACE_PARM_2+0
      000286 64 51                  422 	sub	a, #0x64
      000288 00 17                  423 	mov	p, a
      00028A C4 1F                  424 	mov	a, _MATCH_SPACE_PARM_2+1
      00028C 61 00                  425 	subc	a
      00028E A0 17                  426 	mov	_MATCH_PARM_2+1, a
      000290 00 1F                  427 	mov	a, p
      000292 9F 17                  428 	mov	_MATCH_PARM_2+0, a
      000294 C1 1F                  429 	mov	a, _MATCH_SPACE_PARM_1+0
      000296 9D 17                  430 	mov	_MATCH_PARM_1+0, a
      000298 C2 1F                  431 	mov	a, _MATCH_SPACE_PARM_1+1
      00029A 9E 17                  432 	mov	_MATCH_PARM_1+1, a
      00029C 9A 60                  433 	goto	_MATCH
      00029E 7A 00                  434 	ret
                                    435 ;	pdk_IRremote.c: 23: void IR_resume(void)
                                    436 ;	-----------------------------------------
                                    437 ;	 function IR_resume
                                    438 ;	-----------------------------------------
      0002A0                        439 _IR_resume:
                                    440 ;	pdk_IRremote.c: 25: rcvstate = STATE_IDLE;
      0002A0 02 57                  441 	mov	a, #0x02
      0002A2 10 17                  442 	mov	_rcvstate+0, a
                                    443 ;	pdk_IRremote.c: 26: rawlen = 0;
      0002A4 0F 26                  444 	clear	_rawlen+0
                                    445 ;	pdk_IRremote.c: 27: }
      0002A6 7A 00                  446 	ret
                                    447 ;	pdk_IRremote.c: 29: uint8_t IR_decodeNEC(uint32_t *value)
                                    448 ;	-----------------------------------------
                                    449 ;	 function IR_decodeNEC
                                    450 ;	-----------------------------------------
      0002A8                        451 _IR_decodeNEC:
                                    452 ;	pdk_IRremote.c: 36: if(rawbuf[0] < 1000)//50ms
      0002A8 11 1F                  453 	mov	a, _rawbuf+0
      0002AA 00 17                  454 	mov	p, a
      0002AC 12 1F                  455 	mov	a, _rawbuf+1
      0002AE 00 27                  456 	xch	a, p
      0002B0 E8 51                  457 	sub	a, #0xe8
      0002B2 03 57                  458 	mov	a, #0x03
      0002B4 00 17                  459 	mov	p, a
      0002B6 00 1B                  460 	subc	a, p
      0002B8 80 34                  461 	t1sn	f, c
      0002BA 5F 61                  462 	goto	00102$
                                    463 ;	pdk_IRremote.c: 38: return ERR;
      0002BC 00 02                  464 	ret	#0x00
      0002BE                        465 00102$:
                                    466 ;	pdk_IRremote.c: 41: if (!MATCH_MARK(rawbuf[offset], NEC_HDR_MARK))
      0002BE 13 1F                  467 	mov	a, _rawbuf+2
      0002C0 BD 17                  468 	mov	_MATCH_MARK_PARM_1+0, a
      0002C2 14 1F                  469 	mov	a, _rawbuf+3
      0002C4 BE 17                  470 	mov	_MATCH_MARK_PARM_1+1, a
      0002C6 28 57                  471 	mov	a, #0x28
      0002C8 BF 17                  472 	mov	_MATCH_MARK_PARM_2+0, a
      0002CA 23 57                  473 	mov	a, #0x23
      0002CC C0 17                  474 	mov	_MATCH_MARK_PARM_2+1, a
      0002CE 34 71                  475 	call	_MATCH_MARK
      0002D0 00 52                  476 	ceqsn	a, #0x00
      0002D2 6B 61                  477 	goto	00104$
                                    478 ;	pdk_IRremote.c: 43: return ERR;
      0002D4 00 02                  479 	ret	#0x00
      0002D6                        480 00104$:
                                    481 ;	pdk_IRremote.c: 47: if (rawlen == 4 &&
      0002D6 0F 1F                  482 	mov	a, _rawlen+0
      0002D8 04 52                  483 	ceqsn	a, #0x04
      0002DA 92 61                  484 	goto	00106$
                                    485 ;	pdk_IRremote.c: 48: MATCH_SPACE(rawbuf[offset], NEC_RPT_SPACE) &&
      0002DC 15 1F                  486 	mov	a, _rawbuf+4
      0002DE C1 17                  487 	mov	_MATCH_SPACE_PARM_1+0, a
      0002E0 16 1F                  488 	mov	a, _rawbuf+5
      0002E2 C2 17                  489 	mov	_MATCH_SPACE_PARM_1+1, a
      0002E4 CA 57                  490 	mov	a, #0xca
      0002E6 C3 17                  491 	mov	_MATCH_SPACE_PARM_2+0, a
      0002E8 08 57                  492 	mov	a, #0x08
      0002EA C4 17                  493 	mov	_MATCH_SPACE_PARM_2+1, a
      0002EC 42 71                  494 	call	_MATCH_SPACE
      0002EE 00 53                  495 	cneqsn	a, #0x00
      0002F0 92 61                  496 	goto	00106$
                                    497 ;	pdk_IRremote.c: 49: MATCH_MARK(rawbuf[offset + 1], NEC_BIT_MARK))
      0002F2 17 1F                  498 	mov	a, _rawbuf+6
      0002F4 BD 17                  499 	mov	_MATCH_MARK_PARM_1+0, a
      0002F6 18 1F                  500 	mov	a, _rawbuf+7
      0002F8 BE 17                  501 	mov	_MATCH_MARK_PARM_1+1, a
      0002FA 30 57                  502 	mov	a, #0x30
      0002FC BF 17                  503 	mov	_MATCH_MARK_PARM_2+0, a
      0002FE 02 57                  504 	mov	a, #0x02
      000300 C0 17                  505 	mov	_MATCH_MARK_PARM_2+1, a
      000302 34 71                  506 	call	_MATCH_MARK
      000304 00 53                  507 	cneqsn	a, #0x00
      000306 92 61                  508 	goto	00106$
                                    509 ;	pdk_IRremote.c: 51: *value = REPEAT;
      000308 C5 1F                  510 	mov	a, _IR_decodeNEC_PARM_1+0
      00030A 00 17                  511 	mov	p, a
      00030C FF 57                  512 	mov	a, #0xff
      00030E 00 07                  513 	idxm	p, a
      000310 00 24                  514 	inc	p
      000312 FF 57                  515 	mov	a, #0xff
      000314 00 07                  516 	idxm	p, a
      000316 00 24                  517 	inc	p
      000318 FF 57                  518 	mov	a, #0xff
      00031A 00 07                  519 	idxm	p, a
      00031C 00 24                  520 	inc	p
      00031E FF 57                  521 	mov	a, #0xff
      000320 00 07                  522 	idxm	p, a
                                    523 ;	pdk_IRremote.c: 52: return DECODED;
      000322 01 02                  524 	ret	#0x01
      000324                        525 00106$:
                                    526 ;	pdk_IRremote.c: 54: if (rawlen < 2 * NEC_BITS + 4)
      000324 0F 1F                  527 	mov	a, _rawlen+0
      000326 44 51                  528 	sub	a, #0x44
      000328 80 34                  529 	t1sn	f, c
      00032A 97 61                  530 	goto	00110$
                                    531 ;	pdk_IRremote.c: 56: return ERR;
      00032C 00 02                  532 	ret	#0x00
      00032E                        533 00110$:
                                    534 ;	pdk_IRremote.c: 59: if (!MATCH_SPACE(rawbuf[offset], NEC_HDR_SPACE))
      00032E 15 1F                  535 	mov	a, _rawbuf+4
      000330 C1 17                  536 	mov	_MATCH_SPACE_PARM_1+0, a
      000332 16 1F                  537 	mov	a, _rawbuf+5
      000334 C2 17                  538 	mov	_MATCH_SPACE_PARM_1+1, a
      000336 94 57                  539 	mov	a, #0x94
      000338 C3 17                  540 	mov	_MATCH_SPACE_PARM_2+0, a
      00033A 11 57                  541 	mov	a, #0x11
      00033C C4 17                  542 	mov	_MATCH_SPACE_PARM_2+1, a
      00033E 42 71                  543 	call	_MATCH_SPACE
      000340 00 52                  544 	ceqsn	a, #0x00
      000342 A3 61                  545 	goto	00112$
                                    546 ;	pdk_IRremote.c: 61: return ERR;
      000344 00 02                  547 	ret	#0x00
      000346                        548 00112$:
                                    549 ;	pdk_IRremote.c: 63: offset++;
      000346 03 57                  550 	mov	a, #0x03
      000348 C7 17                  551 	mov	_IR_decodeNEC_sloc8_1_0+0, a
                                    552 ;	pdk_IRremote.c: 64: for (i = 0; i < NEC_BITS; i++)
      00034A C8 26                  553 	clear	_IR_decodeNEC_sloc9_1_0+0
      00034C                        554 00116$:
                                    555 ;	pdk_IRremote.c: 66: if (!MATCH_MARK(rawbuf[offset], NEC_BIT_MARK))
      00034C C7 1F                  556 	mov	a, _IR_decodeNEC_sloc8_1_0+0
      00034E 6B 00                  557 	sl	a
      000350 11 50                  558 	add	a, #(_rawbuf + 0)
      000352 00 17                  559 	mov	p, a
      000354 01 07                  560 	idxm	a, p
      000356 BD 17                  561 	mov	_MATCH_MARK_PARM_1+0, a
      000358 00 24                  562 	inc	p
      00035A 01 07                  563 	idxm	a, p
      00035C BE 17                  564 	mov	_MATCH_MARK_PARM_1+1, a
      00035E 30 57                  565 	mov	a, #0x30
      000360 BF 17                  566 	mov	_MATCH_MARK_PARM_2+0, a
      000362 02 57                  567 	mov	a, #0x02
      000364 C0 17                  568 	mov	_MATCH_MARK_PARM_2+1, a
      000366 34 71                  569 	call	_MATCH_MARK
      000368 00 52                  570 	ceqsn	a, #0x00
      00036A B7 61                  571 	goto	00114$
                                    572 ;	pdk_IRremote.c: 68: return ERR;
      00036C 00 02                  573 	ret	#0x00
      00036E                        574 00114$:
                                    575 ;	pdk_IRremote.c: 70: offset++;
      00036E C7 1F                  576 	mov	a, _IR_decodeNEC_sloc8_1_0+0
      000370 01 50                  577 	add	a, #0x01
                                    578 ;	pdk_IRremote.c: 71: offset++;
      000372 01 50                  579 	add	a, #0x01
      000374 C7 17                  580 	mov	_IR_decodeNEC_sloc8_1_0+0, a
                                    581 ;	pdk_IRremote.c: 64: for (i = 0; i < NEC_BITS; i++)
      000376 C8 24                  582 	inc	_IR_decodeNEC_sloc9_1_0+0
      000378 C8 1F                  583 	mov	a, _IR_decodeNEC_sloc9_1_0+0
      00037A 20 51                  584 	sub	a, #0x20
      00037C 80 30                  585 	t0sn	f, c
      00037E A6 61                  586 	goto	00116$
                                    587 ;	pdk_IRremote.c: 74: *value = data;
      000380 C5 1F                  588 	mov	a, _IR_decodeNEC_PARM_1+0
      000382 00 17                  589 	mov	p, a
      000384 00 57                  590 	mov	a, #0x00
      000386 00 07                  591 	idxm	p, a
      000388 00 24                  592 	inc	p
      00038A 00 57                  593 	mov	a, #0x00
      00038C 00 07                  594 	idxm	p, a
      00038E 00 24                  595 	inc	p
      000390 00 57                  596 	mov	a, #0x00
      000392 00 07                  597 	idxm	p, a
      000394 00 24                  598 	inc	p
      000396 00 57                  599 	mov	a, #0x00
      000398 00 07                  600 	idxm	p, a
                                    601 ;	pdk_IRremote.c: 75: return DECODED;
                                    602 ;	pdk_IRremote.c: 76: }
      00039A 01 02                  603 	ret	#0x01
                                    604 ;	pdk_IRremote.c: 80: uint8_t IR_decode(uint32_t *value)
                                    605 ;	-----------------------------------------
                                    606 ;	 function IR_decode
                                    607 ;	-----------------------------------------
      00039C                        608 _IR_decode:
                                    609 ;	pdk_IRremote.c: 82: if (rcvstate != STATE_STOP)
      00039C 10 1F                  610 	mov	a, _rcvstate+0
      00039E 05 53                  611 	cneqsn	a, #0x05
      0003A0 D2 61                  612 	goto	00102$
      0003A2                        613 00115$:
                                    614 ;	pdk_IRremote.c: 84: return ERR;
      0003A2 00 02                  615 	ret	#0x00
      0003A4                        616 00102$:
                                    617 ;	pdk_IRremote.c: 86: if (IR_decodeNEC(value))
      0003A4 C9 1F                  618 	mov	a, _IR_decode_PARM_1+0
      0003A6 C5 17                  619 	mov	_IR_decodeNEC_PARM_1+0, a
      0003A8 CA 1F                  620 	mov	a, _IR_decode_PARM_1+1
      0003AA C6 17                  621 	mov	_IR_decodeNEC_PARM_1+1, a
      0003AC 54 71                  622 	call	_IR_decodeNEC
      0003AE 00 53                  623 	cneqsn	a, #0x00
      0003B0 DA 61                  624 	goto	00104$
                                    625 ;	pdk_IRremote.c: 88: return DECODED;
      0003B2 01 02                  626 	ret	#0x01
      0003B4                        627 00104$:
                                    628 ;	pdk_IRremote.c: 92: IR_resume();
      0003B4 50 71                  629 	call	_IR_resume
                                    630 ;	pdk_IRremote.c: 93: return ERR;
                                    631 ;	pdk_IRremote.c: 94: }
      0003B6 00 02                  632 	ret	#0x00
                                    633 ;	pdk_IRremote.c: 96: void IR_config(void)
                                    634 ;	-----------------------------------------
                                    635 ;	 function IR_config
                                    636 ;	-----------------------------------------
      0003B8                        637 _IR_config:
                                    638 ;	pdk_IRremote.c: 102: setb(PBDIER, 4);
      0003B8 0E 3E                  639 	set1	__pbdier, #4
                                    640 ;	pdk_IRremote.c: 103: setb(PBPH, 4);
      0003BA 15 3E                  641 	set1	__pbph, #4
                                    642 ;	pdk_IRremote.c: 104: }
      0003BC 7A 00                  643 	ret
                                    644 ;	pdk_IRremote.c: 106: void TIM3_interrupt(void)
                                    645 ;	-----------------------------------------
                                    646 ;	 function TIM3_interrupt
                                    647 ;	-----------------------------------------
      0003BE                        648 _TIM3_interrupt:
                                    649 ;	pdk_IRremote.c: 111: irdata = inbit(PB, 4);
      0003BE 93 01                  650 	mov	a, __pb
      0003C0 10 54                  651 	and	a, #0x10
      0003C2 00 17                  652 	mov	p, a
      0003C4 00 2A                  653 	sr	p
      0003C6 00 2A                  654 	sr	p
      0003C8 00 2A                  655 	sr	p
      0003CA 00 2A                  656 	sr	p
                                    657 ;	pdk_IRremote.c: 114: timer++; // One more 50us tick
      0003CC 0D 24                  658 	inc	_timer+0
      0003CE 0E 20                  659 	addc	_timer+1
                                    660 ;	pdk_IRremote.c: 115: if (rawlen >= RAWBUF)
      0003D0 0F 1F                  661 	mov	a, _rawlen+0
      0003D2 46 51                  662 	sub	a, #0x46
      0003D4 80 30                  663 	t0sn	f, c
      0003D6 EE 61                  664 	goto	00102$
                                    665 ;	pdk_IRremote.c: 118: rcvstate = STATE_STOP;
      0003D8 05 57                  666 	mov	a, #0x05
      0003DA 10 17                  667 	mov	_rcvstate+0, a
      0003DC                        668 00102$:
                                    669 ;	pdk_IRremote.c: 120: switch (rcvstate)
      0003DC 10 1F                  670 	mov	a, _rcvstate+0
      0003DE 02 53                  671 	cneqsn	a, #0x02
      0003E0 FB 61                  672 	goto	00103$
      0003E2                        673 00168$:
      0003E2 10 1F                  674 	mov	a, _rcvstate+0
      0003E4 03 53                  675 	cneqsn	a, #0x03
      0003E6 12 62                  676 	goto	00109$
      0003E8                        677 00169$:
      0003E8 10 1F                  678 	mov	a, _rcvstate+0
      0003EA 04 53                  679 	cneqsn	a, #0x04
      0003EC 24 62                  680 	goto	00112$
      0003EE                        681 00170$:
      0003EE 10 1F                  682 	mov	a, _rcvstate+0
      0003F0 05 53                  683 	cneqsn	a, #0x05
      0003F2 3F 62                  684 	goto	00118$
      0003F4                        685 00171$:
      0003F4 44 62                  686 	goto	00122$
                                    687 ;	pdk_IRremote.c: 122: case STATE_IDLE: // In the middle of a gap
      0003F6                        688 00103$:
                                    689 ;	pdk_IRremote.c: 123: if (irdata == MARK)//0
      0003F6 00 1F                  690 	mov	a, p
      0003F8 00 52                  691 	ceqsn	a, #0x00
      0003FA 44 62                  692 	goto	00122$
                                    693 ;	pdk_IRremote.c: 125: if (timer < GAP_TICKS)//100 ~ 5000us
      0003FC 0D 1F                  694 	mov	a, _timer+0
      0003FE A0 51                  695 	sub	a, #0xa0
      000400 0E 1F                  696 	mov	a, _timer+1
      000402 61 00                  697 	subc	a
      000404 80 34                  698 	t1sn	f, c
      000406 07 62                  699 	goto	00105$
                                    700 ;	pdk_IRremote.c: 128: timer = 0;
      000408 0D 26                  701 	clear	_timer+0
      00040A 0E 26                  702 	clear	_timer+1
      00040C 44 62                  703 	goto	00122$
      00040E                        704 00105$:
                                    705 ;	pdk_IRremote.c: 134: rawbuf[rawlen++] = timer;
      00040E 01 57                  706 	mov	a, #0x01
      000410 0F 17                  707 	mov	_rawlen+0, a
      000412 0D 1F                  708 	mov	a, _timer+0
      000414 11 17                  709 	mov	_rawbuf+0, a
      000416 0E 1F                  710 	mov	a, _timer+1
      000418 12 17                  711 	mov	_rawbuf+1, a
                                    712 ;	pdk_IRremote.c: 135: timer = 0;
      00041A 0D 26                  713 	clear	_timer+0
      00041C 0E 26                  714 	clear	_timer+1
                                    715 ;	pdk_IRremote.c: 136: rcvstate = STATE_MARK;
      00041E 03 57                  716 	mov	a, #0x03
      000420 10 17                  717 	mov	_rcvstate+0, a
                                    718 ;	pdk_IRremote.c: 139: break;
      000422 44 62                  719 	goto	00122$
                                    720 ;	pdk_IRremote.c: 140: case STATE_MARK: // timing MARK
      000424                        721 00109$:
                                    722 ;	pdk_IRremote.c: 141: if (irdata == SPACE)
      000424 00 1F                  723 	mov	a, p
      000426 01 52                  724 	ceqsn	a, #0x01
      000428 44 62                  725 	goto	00122$
                                    726 ;	pdk_IRremote.c: 143: rawbuf[rawlen++] = timer;
      00042A 0F 1F                  727 	mov	a, _rawlen+0
      00042C 0F 24                  728 	inc	_rawlen+0
      00042E 6B 00                  729 	sl	a
      000430 11 50                  730 	add	a, #(_rawbuf + 0)
      000432 00 17                  731 	mov	p, a
      000434 0D 1F                  732 	mov	a, _timer+0
      000436 00 07                  733 	idxm	p, a
      000438 00 24                  734 	inc	p
      00043A 0E 1F                  735 	mov	a, _timer+1
      00043C 00 07                  736 	idxm	p, a
                                    737 ;	pdk_IRremote.c: 144: timer = 0;
      00043E 0D 26                  738 	clear	_timer+0
      000440 0E 26                  739 	clear	_timer+1
                                    740 ;	pdk_IRremote.c: 145: rcvstate = STATE_SPACE;
      000442 04 57                  741 	mov	a, #0x04
      000444 10 17                  742 	mov	_rcvstate+0, a
                                    743 ;	pdk_IRremote.c: 147: break;
      000446 44 62                  744 	goto	00122$
                                    745 ;	pdk_IRremote.c: 148: case STATE_SPACE: // timing SPACE
      000448                        746 00112$:
                                    747 ;	pdk_IRremote.c: 149: if (irdata == MARK)
      000448 00 1F                  748 	mov	a, p
      00044A 00 52                  749 	ceqsn	a, #0x00
      00044C 36 62                  750 	goto	00116$
                                    751 ;	pdk_IRremote.c: 151: rawbuf[rawlen++] = timer;
      00044E 0F 1F                  752 	mov	a, _rawlen+0
      000450 0F 24                  753 	inc	_rawlen+0
      000452 6B 00                  754 	sl	a
      000454 11 50                  755 	add	a, #(_rawbuf + 0)
      000456 00 17                  756 	mov	p, a
      000458 0D 1F                  757 	mov	a, _timer+0
      00045A 00 07                  758 	idxm	p, a
      00045C 00 24                  759 	inc	p
      00045E 0E 1F                  760 	mov	a, _timer+1
      000460 00 07                  761 	idxm	p, a
                                    762 ;	pdk_IRremote.c: 152: timer = 0;
      000462 0D 26                  763 	clear	_timer+0
      000464 0E 26                  764 	clear	_timer+1
                                    765 ;	pdk_IRremote.c: 153: rcvstate = STATE_MARK;
      000466 03 57                  766 	mov	a, #0x03
      000468 10 17                  767 	mov	_rcvstate+0, a
      00046A 44 62                  768 	goto	00122$
      00046C                        769 00116$:
                                    770 ;	pdk_IRremote.c: 157: if (timer > GAP_TICKS)
      00046C A0 57                  771 	mov	a, #0xa0
      00046E 0D 19                  772 	sub	a, _timer+0
      000470 00 57                  773 	mov	a, #0x00
      000472 0E 1B                  774 	subc	a, _timer+1
      000474 80 34                  775 	t1sn	f, c
      000476 44 62                  776 	goto	00122$
                                    777 ;	pdk_IRremote.c: 163: rcvstate = STATE_STOP;
      000478 05 57                  778 	mov	a, #0x05
      00047A 10 17                  779 	mov	_rcvstate+0, a
                                    780 ;	pdk_IRremote.c: 166: break;
      00047C 44 62                  781 	goto	00122$
                                    782 ;	pdk_IRremote.c: 167: case STATE_STOP: // waiting, measuring gap
      00047E                        783 00118$:
                                    784 ;	pdk_IRremote.c: 168: if (irdata == MARK)
      00047E 00 1F                  785 	mov	a, p
      000480 00 52                  786 	ceqsn	a, #0x00
      000482 44 62                  787 	goto	00122$
                                    788 ;	pdk_IRremote.c: 170: timer = 0;
      000484 0D 26                  789 	clear	_timer+0
      000486 0E 26                  790 	clear	_timer+1
                                    791 ;	pdk_IRremote.c: 173: }
      000488                        792 00122$:
                                    793 ;	pdk_IRremote.c: 174: }
      000488 7A 00                  794 	ret
                                    795 	.area CODE
                                    796 	.area CONST
                                    797 	.area CABS (ABS)
