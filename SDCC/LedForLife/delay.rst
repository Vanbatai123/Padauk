                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module delay
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
                                     16 	.globl __delay_loop_32
                                     17 	.globl __delay_loop_16
                                     18 	.globl __delay_loop_8
                                     19 	.globl __delay_loop_32_PARM_1
                                     20 	.globl __delay_loop_16_PARM_1
                                     21 	.globl __delay_loop_8_PARM_1
                                     22 ;--------------------------------------------------------
                                     23 ; special function registers
                                     24 ;--------------------------------------------------------
                                     25 	.area RSEG (ABS)
      000006                         26 	.org 0x0000
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      00009B                         31 __delay_loop_8_PARM_1:
      00009B                         32 	.ds 1
      00009C                         33 __delay_loop_16_PARM_1:
      00009C                         34 	.ds 2
      00009E                         35 __delay_loop_32_PARM_1:
      00009E                         36 	.ds 4
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
                                     60 ;	delay.c: 4: void _delay_loop_8(uint8_t loop_ctr) {
                                     61 ;	-----------------------------------------
                                     62 ;	 function _delay_loop_8
                                     63 ;	-----------------------------------------
      00059A                         64 __delay_loop_8:
                                     65 ;	delay.c: 14: __endasm;
      00059A                         66 	00001$:
                                     67 ; 4 cycles per loop
      00059A 9B 23                   68 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00059C CD 62                   69 	goto	00001$ ; 2 cycles
      00059E                         70 00101$:
                                     71 ;	delay.c: 15: }
      00059E 7A 00                   72 	ret
                                     73 ;	delay.c: 18: void _delay_loop_16(uint16_t loop_ctr) {
                                     74 ;	-----------------------------------------
                                     75 ;	 function _delay_loop_16
                                     76 ;	-----------------------------------------
      0005A0                         77 __delay_loop_16:
                                     78 ;	delay.c: 35: __endasm;
      0005A0                         79 	00001$:
                                     80 ; 8 cycles per loop
      0005A0 00 00                   81 	nop	; 1 cycle
      0005A2 9C 25                   82 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      0005A4 9D 21                   83 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      0005A6 9C 1F                   84 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      0005A8 9D 1D                   85 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      0005AA 00 34                   86 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      0005AC D0 62                   87 	goto	00001$ ; 2 cycles
      0005AE                         88 00101$:
                                     89 ;	delay.c: 36: }
      0005AE 7A 00                   90 	ret
                                     91 ;	delay.c: 39: void _delay_loop_32(uint32_t loop_ctr) {
                                     92 ;	-----------------------------------------
                                     93 ;	 function _delay_loop_32
                                     94 ;	-----------------------------------------
      0005B0                         95 __delay_loop_32:
                                     96 ;	delay.c: 64: __endasm;
      0005B0                         97 	00001$:
                                     98 ; 12 cycles per loop
      0005B0 00 00                   99 	nop	; 1 cycle
      0005B2 9E 25                  100 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      0005B4 9F 21                  101 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      0005B6 A0 21                  102 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      0005B8 A1 21                  103 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      0005BA 9E 1F                  104 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      0005BC 9F 1D                  105 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      0005BE A0 1D                  106 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      0005C0 A1 1D                  107 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      0005C2 00 34                  108 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      0005C4 D8 62                  109 	goto	00001$ ; 2 cycles
      0005C6                        110 00101$:
                                    111 ;	delay.c: 65: }
      0005C6 7A 00                  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area CABS (ABS)
