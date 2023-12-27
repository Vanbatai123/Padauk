                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module delay
                                      6 	.optsdcc -mpdk13
                                      7 	
                                      8 
                                      9 ; default segment ordering in RAM for linker
                                     10 	.area DATA
                                     11 	.area OSEG (OVR,DATA)
                                     12 
                                     13 ;--------------------------------------------------------
                                     14 ; Public variables in this module
                                     15 ;--------------------------------------------------------
                                     16 	.globl __delay_loop_32_PARM_1
                                     17 	.globl __delay_loop_16_PARM_1
                                     18 	.globl __delay_loop_8_PARM_1
                                     19 	.globl __delay_loop_8
                                     20 	.globl __delay_loop_16
                                     21 	.globl __delay_loop_32
                                     22 ;--------------------------------------------------------
                                     23 ; special function registers
                                     24 ;--------------------------------------------------------
                                     25 	.area RSEG (ABS)
      000002                         26 	.org 0x0000
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000021                         31 __delay_loop_8_PARM_1:
      000021                         32 	.ds 1
      000022                         33 __delay_loop_16_PARM_1:
      000022                         34 	.ds 2
      000024                         35 __delay_loop_32_PARM_1:
      000024                         36 	.ds 4
                                     37 ;--------------------------------------------------------
                                     38 ; overlayable items in ram
                                     39 ;--------------------------------------------------------
                                     40 ;--------------------------------------------------------
                                     41 ; absolute external ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DABS (ABS)
                                     44 ;--------------------------------------------------------
                                     45 ; global & static initialisations
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area GSINIT
                                     49 	.area GSFINAL
                                     50 	.area GSINIT
                                     51 ;--------------------------------------------------------
                                     52 ; Home
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area HOME
                                     56 ;--------------------------------------------------------
                                     57 ; code
                                     58 ;--------------------------------------------------------
                                     59 	.area CODE
                                     60 ;	delay.c: 5: void _delay_loop_8(uint8_t loop_ctr) {
                                     61 ;	-----------------------------------------
                                     62 ;	 function _delay_loop_8
                                     63 ;	-----------------------------------------
      000490                         64 __delay_loop_8:
                                     65 ;	delay.c: 15: __endasm;
      000490                         66 	00001$:
                                     67 ; 4 cycles per loop
      000490 E1 08                   68 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000492 48 1A                   69 	goto	00001$ ; 2 cycles
      000494                         70 00101$:
                                     71 ;	delay.c: 16: }
      000494 3A 00                   72 	ret
                                     73 ;	delay.c: 19: void _delay_loop_16(uint16_t loop_ctr) {
                                     74 ;	-----------------------------------------
                                     75 ;	 function _delay_loop_16
                                     76 ;	-----------------------------------------
      000496                         77 __delay_loop_16:
                                     78 ;	delay.c: 36: __endasm;
      000496                         79 	00001$:
                                     80 ; 8 cycles per loop
      000496 00 00                   81 	nop	; 1 cycle
      000498 62 09                   82 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00049A 63 08                   83 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      00049C E2 07                   84 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      00049E 63 07                   85 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      0004A0 00 0D                   86 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      0004A2 4B 1A                   87 	goto	00001$ ; 2 cycles
      0004A4                         88 00101$:
                                     89 ;	delay.c: 37: }
      0004A4 3A 00                   90 	ret
                                     91 ;	delay.c: 40: void _delay_loop_32(uint32_t loop_ctr) {
                                     92 ;	-----------------------------------------
                                     93 ;	 function _delay_loop_32
                                     94 ;	-----------------------------------------
      0004A6                         95 __delay_loop_32:
                                     96 ;	delay.c: 65: __endasm;
      0004A6                         97 	00001$:
                                     98 ; 12 cycles per loop
      0004A6 00 00                   99 	nop	; 1 cycle
      0004A8 64 09                  100 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      0004AA 65 08                  101 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      0004AC 66 08                  102 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      0004AE 67 08                  103 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      0004B0 E4 07                  104 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      0004B2 65 07                  105 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      0004B4 66 07                  106 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      0004B6 67 07                  107 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      0004B8 00 0D                  108 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      0004BA 53 1A                  109 	goto	00001$ ; 2 cycles
      0004BC                        110 00101$:
                                    111 ;	delay.c: 66: }
      0004BC 3A 00                  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area CABS (ABS)
