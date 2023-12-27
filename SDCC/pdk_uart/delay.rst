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
      000004                         26 	.org 0x0000
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      00004B                         31 __delay_loop_8_PARM_1:
      00004B                         32 	.ds 1
      00004C                         33 __delay_loop_16_PARM_1:
      00004C                         34 	.ds 2
      00004E                         35 __delay_loop_32_PARM_1:
      00004E                         36 	.ds 4
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
      000212                         64 __delay_loop_8:
                                     65 ;	delay.c: 14: __endasm;
      000212                         66 	00001$:
                                     67 ; 4 cycles per loop
      000212 4B 23                   68 	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
      000214 09 61                   69 	goto	00001$ ; 2 cycles
      000216                         70 00101$:
                                     71 ;	delay.c: 15: }
      000216 7A 00                   72 	ret
                                     73 ;	delay.c: 18: void _delay_loop_16(uint16_t loop_ctr) {
                                     74 ;	-----------------------------------------
                                     75 ;	 function _delay_loop_16
                                     76 ;	-----------------------------------------
      000218                         77 __delay_loop_16:
                                     78 ;	delay.c: 35: __endasm;
      000218                         79 	00001$:
                                     80 ; 8 cycles per loop
      000218 00 00                   81 	nop	; 1 cycle
      00021A 4C 25                   82 	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
      00021C 4D 21                   83 	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
      00021E 4C 1F                   84 	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
      000220 4D 1D                   85 	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
      000222 00 34                   86 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      000224 0C 61                   87 	goto	00001$ ; 2 cycles
      000226                         88 00101$:
                                     89 ;	delay.c: 36: }
      000226 7A 00                   90 	ret
                                     91 ;	delay.c: 39: void _delay_loop_32(uint32_t loop_ctr) {
                                     92 ;	-----------------------------------------
                                     93 ;	 function _delay_loop_32
                                     94 ;	-----------------------------------------
      000228                         95 __delay_loop_32:
                                     96 ;	delay.c: 64: __endasm;
      000228                         97 	00001$:
                                     98 ; 12 cycles per loop
      000228 00 00                   99 	nop	; 1 cycle
      00022A 4E 25                  100 	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
      00022C 4F 21                  101 	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
      00022E 50 21                  102 	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
      000230 51 21                  103 	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
      000232 4E 1F                  104 	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
      000234 4F 1D                  105 	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
      000236 50 1D                  106 	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
      000238 51 1D                  107 	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
      00023A 00 34                  108 	t1sn	f, z ; 1 cycle + 1 cycle for final skip
      00023C 14 61                  109 	goto	00001$ ; 2 cycles
      00023E                        110 00101$:
                                    111 ;	delay.c: 65: }
      00023E 7A 00                  112 	ret
                                    113 	.area CODE
                                    114 	.area CONST
                                    115 	.area CABS (ABS)
