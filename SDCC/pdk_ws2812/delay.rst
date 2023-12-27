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
      000004                         26 	.org 0x0000
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000057                         31 __delay_loop_8_PARM_1:
      000057                         32 	.ds 1
      000058                         33 __delay_loop_16_PARM_1:
      000058                         34 	.ds 2
      00005A                         35 __delay_loop_32_PARM_1:
      00005A                         36 	.ds 4
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
      00066C                         64 __delay_loop_8:
                                     65 ;	delay.c: 15: __endasm;
      00066C                         66 	00001$:
                                     67 ; 4 cycles per loop
      00066C 57 23                   68 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      00066E 36 63                   69 	goto	00001$ ; 2 cycles
      000670                         70 00101$:
                                     71 ;	delay.c: 16: }
      000670 7A 00                   72 	ret
                                     73 ;	delay.c: 19: void _delay_loop_16(uint16_t loop_ctr) {
                                     74 ;	-----------------------------------------
                                     75 ;	 function _delay_loop_16
                                     76 ;	-----------------------------------------
      000672                         77 __delay_loop_16:
                                     78 ;	delay.c: 36: __endasm;
      000672                         79 	00001$:
                                     80 ; 8 cycles per loop
      000672 00 00                   81 	nop	; 1 cycle
      000674 58 25                   82 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      000676 59 21                   83 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      000678 58 1F                   84 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      00067A 59 1D                   85 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      00067C 00 34                   86 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00067E 39 63                   87 	goto	00001$ ; 2 cycles
      000680                         88 00101$:
                                     89 ;	delay.c: 37: }
      000680 7A 00                   90 	ret
                                     91 ;	delay.c: 40: void _delay_loop_32(uint32_t loop_ctr) {
                                     92 ;	-----------------------------------------
                                     93 ;	 function _delay_loop_32
                                     94 ;	-----------------------------------------
      000682                         95 __delay_loop_32:
                                     96 ;	delay.c: 65: __endasm;
      000682                         97 	00001$:
                                     98 ; 12 cycles per loop
      000682 00 00                   99 	nop	; 1 cycle
      000684 5A 25                  100 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      000686 5B 21                  101 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      000688 5C 21                  102 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      00068A 5D 21                  103 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      00068C 5A 1F                  104 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      00068E 5B 1D                  105 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000690 5C 1D                  106 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000692 5D 1D                  107 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000694 00 34                  108 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000696 41 63                  109 	goto	00001$ ; 2 cycles
      000698                        110 00101$:
                                    111 ;	delay.c: 66: }
      000698 7A 00                  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area CABS (ABS)
