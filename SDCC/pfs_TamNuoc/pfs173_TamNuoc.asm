;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pfs173_TamNuoc
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _main
	.globl _TIM3_begin
	.globl _ADC_read
	.globl _GPIO_begin
	.globl __sdcc_external_startup
	.globl __delay_loop_32
	.globl __delay_loop_16
	.globl __delay_loop_8
	.globl __t16c
	.globl __rop
	.globl __bgtr
	.globl __ilrcr
	.globl __pwmg2dtl
	.globl __pwmg2dth
	.globl __pwmg2c
	.globl __pwmg1dtl
	.globl __pwmg1dth
	.globl __pwmg1c
	.globl __pwmgcubl
	.globl __pwmgcubh
	.globl __pwmg0dtl
	.globl __pwmg0dth
	.globl __pwmgclk
	.globl __pwmg0c
	.globl __tm3b
	.globl __tm3s
	.globl __tm3ct
	.globl __tm3c
	.globl __tm2b
	.globl __tm2s
	.globl __tm2ct
	.globl __tm2c
	.globl __gpcs
	.globl __gpcc
	.globl __misclvr
	.globl __misc2
	.globl __misc
	.globl __adcrgc
	.globl __adcr
	.globl __adcm
	.globl __adcc
	.globl __pcpl
	.globl __pbpl
	.globl __pcph
	.globl __pcc
	.globl __pc
	.globl __pbph
	.globl __pbc
	.globl __pb
	.globl __paph
	.globl __pac
	.globl __pa
	.globl __pcdier
	.globl __pbdier
	.globl __padier
	.globl __integs
	.globl __ihrcr
	.globl __eoscr
	.globl __t16m
	.globl __intrq
	.globl __inten
	.globl __clkmd
	.globl __sp
	.globl __flag
	.globl _i
	.globl _adc_val
	.globl _on_flag
	.globl _mode3
	.globl _mode
	.globl _motor_val
	.globl _timer_cnt
	.globl __delay_loop_32_PARM_1
	.globl __delay_loop_16_PARM_1
	.globl __delay_loop_8_PARM_1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG (ABS)
	.org 0x0000
__flag	=	0x0000
__sp	=	0x0002
__clkmd	=	0x0003
__inten	=	0x0004
__intrq	=	0x0005
__t16m	=	0x0006
__eoscr	=	0x000a
__ihrcr	=	0x000b
__integs	=	0x000c
__padier	=	0x000d
__pbdier	=	0x000e
__pcdier	=	0x000f
__pa	=	0x0010
__pac	=	0x0011
__paph	=	0x0012
__pb	=	0x0013
__pbc	=	0x0014
__pbph	=	0x0015
__pc	=	0x0016
__pcc	=	0x0017
__pcph	=	0x0018
__pbpl	=	0x0019
__pcpl	=	0x001a
__adcc	=	0x0020
__adcm	=	0x0021
__adcr	=	0x0022
__adcrgc	=	0x0024
__misc	=	0x0026
__misc2	=	0x0027
__misclvr	=	0x0028
__gpcc	=	0x002b
__gpcs	=	0x002c
__tm2c	=	0x0030
__tm2ct	=	0x0031
__tm2s	=	0x0032
__tm2b	=	0x0033
__tm3c	=	0x0034
__tm3ct	=	0x0035
__tm3s	=	0x0036
__tm3b	=	0x0037
__pwmg0c	=	0x0040
__pwmgclk	=	0x0041
__pwmg0dth	=	0x0042
__pwmg0dtl	=	0x0043
__pwmgcubh	=	0x0044
__pwmgcubl	=	0x0045
__pwmg1c	=	0x0046
__pwmg1dth	=	0x0048
__pwmg1dtl	=	0x0049
__pwmg2c	=	0x004c
__pwmg2dth	=	0x004e
__pwmg2dtl	=	0x004f
__ilrcr	=	0x0062
__bgtr	=	0x0063
__rop	=	0x0067
__t16c::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
__delay_loop_8_PARM_1:
	.ds 1
__delay_loop_16_PARM_1:
	.ds 2
__delay_loop_32_PARM_1:
	.ds 4
_timer_cnt::
	.ds 1
_motor_val::
	.ds 1
_mode::
	.ds 1
_mode3::
	.ds 2
_on_flag::
	.ds 1
_adc_val::
	.ds 1
_i::
	.ds 1
_interrupt_sloc0_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	.area	HEADER (ABS)
	.org	 0x0020
	goto	_interrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	.area	PREG (ABS)
	.org 0x00
p::
	.ds 2
	.area	HEADER (ABS)
	.org 0x0000
	nop
	clear	p+1
	mov	a, #s_OSEG
	add	a, #l_OSEG + 1
	and	a, #0xfe
	mov.io	sp, a
	call	__sdcc_external_startup
	goto	s_GSINIT
	.area GSINIT
__sdcc_init_data:
	mov	a, #s_DATA
	mov	p, a
	goto	00002$
00001$:
	mov	a, #0x00
	idxm	p, a
	inc	p
	mov	a, #s_DATA
00002$:
	add	a, #l_DATA
	ceqsn	a, p
	goto	00001$
;	pfs173_TamNuoc.c: 118: uint8_t timer_cnt = 0, motor_val = 0;
	clear	_timer_cnt+0
;	pfs173_TamNuoc.c: 118: uint8_t mode = 1;
	clear	_motor_val+0
;	pfs173_TamNuoc.c: 119: uint16_t mode3 = 1;
	mov	a, #0x01
	mov	_mode+0, a
;	pfs173_TamNuoc.c: 120: uint8_t on_flag = 0;
	mov	a, #0x01
	mov	_mode3+0, a
	clear	_mode3+1
;	pfs173_TamNuoc.c: 121: uint8_t adc_val = 0;
	clear	_on_flag+0
;	pfs173_TamNuoc.c: 122: uint8_t i = 0;
	clear	_adc_val+0
;	pfs173_TamNuoc.c: 123: void main(void)
	clear	_i+0
	.area GSFINAL
	goto	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	goto	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	delay.h: 34: void _delay_loop_8(uint8_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_8
;	-----------------------------------------
__delay_loop_8:
;	delay.h: 44: __endasm;
	00001$:
; 4 cycles per loop
	dzsn	__delay_loop_8_PARM_1 ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 45: }
	ret
;	delay.h: 48: void _delay_loop_16(uint16_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_16
;	-----------------------------------------
__delay_loop_16:
;	delay.h: 65: __endasm;
	00001$:
; 8 cycles per loop
	nop	; 1 cycle
	dec	__delay_loop_16_PARM_1+0 ; 1 cycle
	subc	__delay_loop_16_PARM_1+1 ; 1 cycle
	mov	a, __delay_loop_16_PARM_1+0 ; 1 cycle
	or	a, __delay_loop_16_PARM_1+1 ; 1 cycle
	t1sn	f, z ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 66: }
	ret
;	delay.h: 69: void _delay_loop_32(uint32_t loop_ctr) {
;	-----------------------------------------
;	 function _delay_loop_32
;	-----------------------------------------
__delay_loop_32:
;	delay.h: 94: __endasm;
	00001$:
; 12 cycles per loop
	nop	; 1 cycle
	dec	__delay_loop_32_PARM_1+0 ; 1 cycle
	subc	__delay_loop_32_PARM_1+1 ; 1 cycle
	subc	__delay_loop_32_PARM_1+2 ; 1 cycle
	subc	__delay_loop_32_PARM_1+3 ; 1 cycle
	mov	a, __delay_loop_32_PARM_1+0 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+1 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+2 ; 1 cycle
	or	a, __delay_loop_32_PARM_1+3 ; 1 cycle
	t1sn	f, z ; 1 cycle + 1 cycle for final skip
	goto	00001$ ; 2 cycles
00101$:
;	delay.h: 95: }
	ret
;	pfs173_TamNuoc.c: 57: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pfs173_TamNuoc.c: 59: EASY_PDK_INIT_SYSCLOCK_1MHZ();		  // use 8MHz sysclock
	mov	a, #0x1c
	mov.io	__clkmd, a
;	pfs173_TamNuoc.c: 60: EASY_PDK_CALIBRATE_IHRC(F_CPU, 3000); // tune SYSCLK to 8MHz @ 4.000V
	and	a, #'R'                        
	and	a, #'C'                        
	and	a, #((1))          
	and	a, #((1000000))     
	and	a, #((1000000)>>8)  
	and	a, #((1000000)>>16) 
	and	a, #((1000000)>>24) 
	and	a, #((3000))     
	and	a, #((3000)>>8)  
	and	a, #((0x0B))           
;	pfs173_TamNuoc.c: 61: return 0;							  // perform normal initialization
;	pfs173_TamNuoc.c: 62: }
	ret	#0x00
;	pfs173_TamNuoc.c: 63: void GPIO_begin(void)
;	-----------------------------------------
;	 function GPIO_begin
;	-----------------------------------------
_GPIO_begin:
;	pfs173_TamNuoc.c: 66: setb(PxC_LED_1, PIN_LED_1);
	set1.io	__pac, #7
;	pfs173_TamNuoc.c: 67: setb(PxC_LED_2, PIN_LED_2);
	set1.io	__pac, #4
;	pfs173_TamNuoc.c: 68: setb(PxC_LED_3, PIN_LED_3);
	set1.io	__pbc, #6
;	pfs173_TamNuoc.c: 69: setb(PxC_LED_4, PIN_LED_4);
	set1.io	__pac, #6
;	pfs173_TamNuoc.c: 71: setb(Px_LED_1, PIN_LED_1);
	set1.io	__pa, #7
;	pfs173_TamNuoc.c: 72: setb(Px_LED_2, PIN_LED_2);
	set1.io	__pa, #4
;	pfs173_TamNuoc.c: 73: setb(Px_LED_3, PIN_LED_3);
	set1.io	__pb, #6
;	pfs173_TamNuoc.c: 74: setb(Px_LED_4, PIN_LED_4);
	set1.io	__pa, #6
;	pfs173_TamNuoc.c: 77: setb(PxC_MOTOR, PIN_MOTOR);
	set1.io	__pac, #0
;	pfs173_TamNuoc.c: 81: clrb(PxC_SW_1, PIN_SW_1);	 //
	set0.io	__pbc, #3
;	pfs173_TamNuoc.c: 82: setb(PxPH_SW_1, PIN_SW_1);	 // set BUTTON pin as input
	set1.io	__pbph, #3
;	pfs173_TamNuoc.c: 83: setb(PxDIER_SW_1, PIN_SW_1); //
	set1.io	__pbdier, #3
;	pfs173_TamNuoc.c: 87: clrb(PxC_SW_2, PIN_SW_2);	 //
	set0.io	__pbc, #2
;	pfs173_TamNuoc.c: 88: setb(PxPH_SW_2, PIN_SW_2);	 // set BUTTON pin as input
	set1.io	__pbph, #2
;	pfs173_TamNuoc.c: 89: clrb(PxDIER_SW_2, PIN_SW_2); //
	set0.io	__pbdier, #2
;	pfs173_TamNuoc.c: 92: ADCRGC = ADCRG_ADC_REF_VDD;				  // ADC reference voltage is VDD
	mov	a, #0x00
	mov.io	__adcrgc, a
;	pfs173_TamNuoc.c: 93: ADCM = ADCM_CLK_SYSCLK_DIV16;			  // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
	mov	a, #0x08
	mov.io	__adcm, a
;	pfs173_TamNuoc.c: 95: clrb(PxC_ADC, PIN_ADC);					  // disable PA.0 GPIO output
	set0.io	__pbc, #0
;	pfs173_TamNuoc.c: 96: clrb(PxPH_ADC, PIN_ADC);				  // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
	set0.io	__pbph, #0
;	pfs173_TamNuoc.c: 97: clrb(PxDIER_ADC, PIN_ADC);				  // disable PA.0 GPIO input
	set0.io	__pbdier, #0
;	pfs173_TamNuoc.c: 98: ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
	mov	a, #0x80
	mov.io	__adcc, a
;	pfs173_TamNuoc.c: 100: }
	ret
;	pfs173_TamNuoc.c: 102: uint8_t ADC_read()
;	-----------------------------------------
;	 function ADC_read
;	-----------------------------------------
_ADC_read:
;	pfs173_TamNuoc.c: 104: ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
	set1.io	__adcc, #6
;	pfs173_TamNuoc.c: 105: while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
00101$:
	mov.io	a, __adcc
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00101$
;	pfs173_TamNuoc.c: 108: return ADCR; // read the ADC value
	mov.io	a, __adcr
;	pfs173_TamNuoc.c: 109: }
	ret
;	pfs173_TamNuoc.c: 110: void TIM3_begin()
;	-----------------------------------------
;	 function TIM3_begin
;	-----------------------------------------
_TIM3_begin:
;	pfs173_TamNuoc.c: 112: TM3C = TM3C_CLK_IHRC;							// Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov.io	__tm3c, a
;	pfs173_TamNuoc.c: 113: TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV4; // No prescale, scale 64 ~> 0.25MHz
	mov	a, #0x20
	mov.io	__tm3s, a
;	pfs173_TamNuoc.c: 114: TM3B = 62;										// Divide by 62 ~> 4000 Hz 0.25ms
	mov	a, #0x3e
	mov.io	__tm3b, a
;	pfs173_TamNuoc.c: 116: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
	set1.io	__inten, #7
;	pfs173_TamNuoc.c: 117: }
	ret
;	pfs173_TamNuoc.c: 124: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pfs173_TamNuoc.c: 126: TIM3_begin();
	call	_TIM3_begin
;	pfs173_TamNuoc.c: 127: GPIO_begin();
	call	_GPIO_begin
;	pfs173_TamNuoc.c: 129: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	pfs173_TamNuoc.c: 130: sei(); // Enable global interrupts
	engint
;	pfs173_TamNuoc.c: 131: while (1)
00129$:
;	pfs173_TamNuoc.c: 134: if (inbit(Px_SW_1, PIN_SW_1) == 0)
	mov.io	a, __pb
	and	a, #0x08
	sr	a
	sr	a
	sr	a
	ceqsn	a, #0x00
	goto	00105$
;	pfs173_TamNuoc.c: 136: while (inbit(Px_SW_1, PIN_SW_1) == 0)
00101$:
	mov.io	a, __pb
	and	a, #0x08
	sr	a
	sr	a
	sr	a
	cneqsn	a, #0x00
	goto	00101$
;	pfs173_TamNuoc.c: 138: on_flag = 0;
	clear	_on_flag+0
;	pfs173_TamNuoc.c: 139: _delay_ms(100);
	mov	a, #0xd2
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x30
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
00105$:
;	pfs173_TamNuoc.c: 142: _delay_ms(10);
	mov	a, #0xe0
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x04
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pfs173_TamNuoc.c: 145: i = 0;
	clear	_i+0
;	pfs173_TamNuoc.c: 146: while (on_flag == 0)
00112$:
	mov	a, _on_flag+0
	ceqsn	a, #0x00
	goto	00114$
;	pfs173_TamNuoc.c: 148: INTEN &= ~INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
	set0.io	__inten, #7
;	pfs173_TamNuoc.c: 149: on_flag = 0;
	clear	_on_flag+0
;	pfs173_TamNuoc.c: 150: motor_val = 0;
	clear	_motor_val+0
;	pfs173_TamNuoc.c: 151: clrb(Px_MOTOR, PIN_MOTOR);
	set0.io	__pa, #0
;	pfs173_TamNuoc.c: 152: setb(Px_LED_1, PIN_LED_1);
	set1.io	__pa, #7
;	pfs173_TamNuoc.c: 153: setb(Px_LED_2, PIN_LED_2);
	set1.io	__pa, #4
;	pfs173_TamNuoc.c: 154: setb(Px_LED_3, PIN_LED_3);
	set1.io	__pb, #6
;	pfs173_TamNuoc.c: 155: setb(Px_LED_4, PIN_LED_4);
	set1.io	__pa, #6
00132$:
;	pfs173_TamNuoc.c: 156: for (; i < 8; i++)
	mov	a, _i+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00106$
;	pfs173_TamNuoc.c: 158: daobit(Px_LED_4, PIN_LED_4);
	mov	a, #0x40
	xor.io	__pa, a
;	pfs173_TamNuoc.c: 159: _delay_ms(50);
	mov	a, #0x68
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x18
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pfs173_TamNuoc.c: 156: for (; i < 8; i++)
	inc	_i+0
	goto	00132$
00106$:
;	pfs173_TamNuoc.c: 161: __stopsys(); // deep sleep
	stopsys
;	pfs173_TamNuoc.c: 162: if (inbit(Px_SW_1, PIN_SW_1) == 0)
	mov.io	a, __pb
	and	a, #0x08
	sr	a
	sr	a
	sr	a
	ceqsn	a, #0x00
	goto	00112$
;	pfs173_TamNuoc.c: 164: _delay_ms(100);
	mov	a, #0xd2
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x30
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pfs173_TamNuoc.c: 165: while (inbit(Px_SW_1, PIN_SW_1) == 0)
00107$:
	mov.io	a, __pb
	and	a, #0x08
	sr	a
	sr	a
	sr	a
	cneqsn	a, #0x00
	goto	00107$
;	pfs173_TamNuoc.c: 168: INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
	set1.io	__inten, #7
;	pfs173_TamNuoc.c: 169: on_flag = 1;
	mov	a, #0x01
	mov	_on_flag+0, a
;	pfs173_TamNuoc.c: 170: break;
00114$:
;	pfs173_TamNuoc.c: 174: if (inbit(Px_SW_2, PIN_SW_2) == 0)
	mov.io	a, __pb
	and	a, #0x04
	sr	a
	sr	a
	ceqsn	a, #0x00
	goto	00121$
;	pfs173_TamNuoc.c: 176: while (inbit(Px_SW_2, PIN_SW_2) == 0)
00115$:
	mov.io	a, __pb
	and	a, #0x04
	sr	a
	sr	a
	cneqsn	a, #0x00
	goto	00115$
;	pfs173_TamNuoc.c: 178: mode++;
	inc	_mode+0
;	pfs173_TamNuoc.c: 179: if (mode > 4)
	mov	a, #0x04
	sub	a, _mode+0
	t1sn.io	f, c
	goto	00119$
;	pfs173_TamNuoc.c: 181: mode = 1;
	mov	a, #0x01
	mov	_mode+0, a
00119$:
;	pfs173_TamNuoc.c: 183: _delay_ms(100);
	mov	a, #0xd2
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x30
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
00121$:
;	pfs173_TamNuoc.c: 185: switch (mode)
	mov	a, _mode+0
	cneqsn	a, #0x01
	goto	00122$
00204$:
	mov	a, _mode+0
	cneqsn	a, #0x02
	goto	00123$
	mov	a, _mode+0
	cneqsn	a, #0x03
	goto	00124$
00206$:
	mov	a, _mode+0
	cneqsn	a, #0x04
	goto	00125$
00207$:
	goto	00129$
;	pfs173_TamNuoc.c: 187: case 1:
00122$:
;	pfs173_TamNuoc.c: 188: motor_val = 100;
	mov	a, #0x64
	mov	_motor_val+0, a
;	pfs173_TamNuoc.c: 189: setb(Px_LED_4, PIN_LED_4);
	set1.io	__pa, #6
;	pfs173_TamNuoc.c: 190: clrb(Px_LED_1, PIN_LED_1);
	set0.io	__pa, #7
;	pfs173_TamNuoc.c: 191: break;
	goto	00129$
;	pfs173_TamNuoc.c: 193: case 2:
00123$:
;	pfs173_TamNuoc.c: 194: motor_val = 60;
	mov	a, #0x3c
	mov	_motor_val+0, a
;	pfs173_TamNuoc.c: 195: setb(Px_LED_1, PIN_LED_1);
	set1.io	__pa, #7
;	pfs173_TamNuoc.c: 196: clrb(Px_LED_2, PIN_LED_2);
	set0.io	__pa, #4
;	pfs173_TamNuoc.c: 197: break;
	goto	00129$
;	pfs173_TamNuoc.c: 199: case 3:
00124$:
;	pfs173_TamNuoc.c: 200: setb(Px_LED_2, PIN_LED_2);
	set1.io	__pa, #4
;	pfs173_TamNuoc.c: 201: clrb(Px_LED_3, PIN_LED_3);
	set0.io	__pb, #6
;	pfs173_TamNuoc.c: 202: break;
	goto	00129$
;	pfs173_TamNuoc.c: 204: case 4:
00125$:
;	pfs173_TamNuoc.c: 205: motor_val = 25;
	mov	a, #0x19
	mov	_motor_val+0, a
;	pfs173_TamNuoc.c: 206: setb(Px_LED_3, PIN_LED_3);
	set1.io	__pb, #6
;	pfs173_TamNuoc.c: 207: clrb(Px_LED_4, PIN_LED_4);
	set0.io	__pa, #6
;	pfs173_TamNuoc.c: 208: break;
	goto	00129$
;	pfs173_TamNuoc.c: 212: }
;	pfs173_TamNuoc.c: 214: }
	ret
;	pfs173_TamNuoc.c: 216: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pfs173_TamNuoc.c: 218: if (INTRQ & INTRQ_TM3)
	mov.io	a, __intrq
	and	a, #0x80
	cneqsn	a, #0x00
	goto	00118$
;	pfs173_TamNuoc.c: 220: timer_cnt++;
	inc	_timer_cnt+0
;	pfs173_TamNuoc.c: 221: if (timer_cnt >= 100)
	mov	a, _timer_cnt+0
	sub	a, #0x64
	t0sn.io	f, c
	goto	00102$
;	pfs173_TamNuoc.c: 223: timer_cnt = 0;
	clear	_timer_cnt+0
00102$:
;	pfs173_TamNuoc.c: 225: if (mode == 3)
	mov	a, _mode+0
	ceqsn	a, #0x03
	goto	00112$
;	pfs173_TamNuoc.c: 227: if (mode3 == 1)
	mov	a, _mode3+0
	mov	_interrupt_sloc0_1_0+0, a
	mov	a, _mode3+1
	mov	_interrupt_sloc0_1_0+1, a
	mov	a, _interrupt_sloc0_1_0+0
	ceqsn	a, #0x01
	goto	00109$
	mov	a, _interrupt_sloc0_1_0+1
	ceqsn	a, #0x00
	goto	00109$
;	pfs173_TamNuoc.c: 229: motor_val = 100;
	mov	a, #0x64
	mov	_motor_val+0, a
	goto	00110$
00109$:
;	pfs173_TamNuoc.c: 231: else if (mode3 == 5000)
	mov	a, _interrupt_sloc0_1_0+0
	ceqsn	a, #0x88
	goto	00106$
	mov	a, _interrupt_sloc0_1_0+1
	ceqsn	a, #0x13
	goto	00106$
;	pfs173_TamNuoc.c: 233: motor_val = 60;
	mov	a, #0x3c
	mov	_motor_val+0, a
	goto	00110$
00106$:
;	pfs173_TamNuoc.c: 235: else if (mode3 == 8000)
	mov	a, _interrupt_sloc0_1_0+0
	ceqsn	a, #0x40
	goto	00110$
	mov	a, _interrupt_sloc0_1_0+1
	ceqsn	a, #0x1f
	goto	00110$
;	pfs173_TamNuoc.c: 237: mode3 = 0;
	clear	_mode3+0
	clear	_mode3+1
00110$:
;	pfs173_TamNuoc.c: 239: mode3++;
	inc	_mode3+0
	addc	_mode3+1
00112$:
;	pfs173_TamNuoc.c: 241: if (timer_cnt < motor_val)
	mov	a, _timer_cnt+0
	sub	a, _motor_val+0
	t1sn.io	f, c
	goto	00114$
;	pfs173_TamNuoc.c: 243: setb(Px_MOTOR, PIN_MOTOR);
	set1.io	__pa, #0
	goto	00115$
00114$:
;	pfs173_TamNuoc.c: 247: clrb(Px_MOTOR, PIN_MOTOR);
	set0.io	__pa, #0
00115$:
;	pfs173_TamNuoc.c: 250: INTRQ &= ~INTRQ_TM3;
	set0.io	__intrq, #7
00118$:
;	pfs173_TamNuoc.c: 252: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CABS (ABS)
