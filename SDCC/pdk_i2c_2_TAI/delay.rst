                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
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
      00008A                         31 __delay_loop_8_PARM_1:
      00008A                         32 	.ds 1
      00008B                         33 __delay_loop_16_PARM_1:
      00008B                         34 	.ds 2
      00008D                         35 __delay_loop_32_PARM_1:
      00008D                         36 	.ds 4
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
      000730                         64 __delay_loop_8:
                                     65 ;	delay.c: 14: __endasm;
      000730                         66 	00001$:
                                     67 ; 4 cycles per loop
      000730 8A 23                   68 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000732 98 63                   69 	goto	00001$ ; 2 cycles
      000734                         70 00101$:
                                     71 ;	delay.c: 15: }
      000734 7A 00                   72 	ret
                                     73 ;	delay.c: 18: void _delay_loop_16(uint16_t loop_ctr) {
                                     74 ;	-----------------------------------------
                                     75 ;	 function _delay_loop_16
                                     76 ;	-----------------------------------------
      000736                         77 __delay_loop_16:
                                     78 ;	delay.c: 35: __endasm;
      000736                         79 	00001$:
                                     80 ; 8 cycles per loop
      000736 00 00                   81 	nop	; 1 cycle
      000738 8B 25                   82 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00073A 8C 21                   83 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      00073C 8B 1F                   84 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      00073E 8C 1D                   85 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000740 00 34                   86 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000742 9B 63                   87 	goto	00001$ ; 2 cycles
      000744                         88 00101$:
                                     89 ;	delay.c: 36: }
      000744 7A 00                   90 	ret
                                     91 ;	delay.c: 39: void _delay_loop_32(uint32_t loop_ctr) {
                                     92 ;	-----------------------------------------
                                     93 ;	 function _delay_loop_32
                                     94 ;	-----------------------------------------
      000746                         95 __delay_loop_32:
                                     96 ;	delay.c: 64: __endasm;
      000746                         97 	00001$:
                                     98 ; 12 cycles per loop
      000746 00 00                   99 	nop	; 1 cycle
      000748 8D 25                  100 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      00074A 8E 21                  101 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      00074C 8F 21                  102 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      00074E 90 21                  103 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000750 8D 1F                  104 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000752 8E 1D                  105 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000754 8F 1D                  106 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000756 90 1D                  107 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      000758 00 34                  108 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00075A A3 63                  109 	goto	00001$ ; 2 cycles
      00075C                        110 00101$:
                                    111 ;	delay.c: 65: }
      00075C 7A 00                  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area CABS (ABS)
