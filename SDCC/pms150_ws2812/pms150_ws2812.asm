;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pms150_ws2812
	.optsdcc -mpdk13
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bfv
	.globl _gfv
	.globl _rfv
	.globl _bsv
	.globl _gsv
	.globl _rsv
	.globl _bv
	.globl _gv
	.globl _rv
	.globl _mode
	.globl _mode_delay
	.globl _main
	.globl _standby
	.globl _interrupt
	.globl _IR_read
	.globl _IR_init
	.globl _NEO_writeColor
	.globl _NEO_sendByte
	.globl _LED__SendOne_
	.globl _LED__SendZero_
	.globl _BUTTON_init
	.globl __sdcc_external_startup
	.globl __delay_loop_16
	.globl __t16c
	.globl __ilrcr
	.globl __gpcs
	.globl __tm2ct
	.globl __tm2c
	.globl __misc
	.globl __gpcc
	.globl __bgtr
	.globl __tm2s
	.globl __paph
	.globl __pac
	.globl __pa
	.globl __padier
	.globl __integs
	.globl __ihrcr
	.globl __eoscr
	.globl __tm2b
	.globl __t16m
	.globl __intrq
	.globl __inten
	.globl __clkmd
	.globl __sp
	.globl __flag
	.globl _txdata
	.globl _changeColor_PARM_3
	.globl _changeColor_PARM_2
	.globl _changeColor_PARM_1
	.globl _NEO_writeColor_PARM_3
	.globl _NEO_writeColor_PARM_2
	.globl _NEO_writeColor_PARM_1
	.globl _NEO_sendByte_PARM_1
	.globl _count_ms1
	.globl _count_ms
	.globl _lm
	.globl _huef
	.globl _hue1
	.globl _hue
	.globl _mode_counter
	.globl _command
	.globl _light_mode
	.globl _button_press
	.globl _button_flag
	.globl _button_value
	.globl _changeColor
	.globl _switchColor
	.globl _fadeColor
	.globl _my_delay_ms
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
__tm2b	=	0x0009
__eoscr	=	0x000a
__ihrcr	=	0x000b
__integs	=	0x000c
__padier	=	0x000d
__pa	=	0x0010
__pac	=	0x0011
__paph	=	0x0012
__tm2s	=	0x0017
__bgtr	=	0x0019
__gpcc	=	0x001a
__misc	=	0x001b
__tm2c	=	0x001c
__tm2ct	=	0x001d
__gpcs	=	0x001e
__ilrcr	=	0x001f
__t16c::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_button_value::
	.ds 1
_button_flag::
	.ds 1
_button_press::
	.ds 1
_light_mode::
	.ds 1
_command::
	.ds 1
_mode_counter::
	.ds 1
_hue::
	.ds 1
_hue1::
	.ds 1
_huef::
	.ds 1
_lm::
	.ds 1
_count_ms::
	.ds 2
_count_ms1::
	.ds 2
_NEO_sendByte_PARM_1:
	.ds 1
_NEO_sendByte_sloc0_1_0:
	.ds 1
_NEO_writeColor_PARM_1:
	.ds 1
_NEO_writeColor_PARM_2:
	.ds 1
_NEO_writeColor_PARM_3:
	.ds 1
_changeColor_PARM_1:
	.ds 2
_changeColor_PARM_2:
	.ds 2
_changeColor_PARM_3:
	.ds 2
_changeColor_sloc6_1_0:
	.ds 1
_my_delay_ms_sloc7_1_0:
	.ds 2
_txdata::
	.ds 2
_main_sloc8_1_0:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
	.area	OSEG (OVR,DATA)
_IR_read_sloc1_1_0:
	.ds 4
_IR_read_sloc2_1_0:
	.ds 1
_IR_read_sloc3_1_0:
	.ds 2
_IR_read_sloc4_1_0:
	.ds 1
_IR_read_sloc5_1_0:
	.ds 1
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
;	pms150_ws2812.c: 82: uint8_t button_flag = 0;
	clear	_button_flag+0
;	pms150_ws2812.c: 83: uint8_t button_press = 0;
	clear	_button_press+0
;	pms150_ws2812.c: 85: uint8_t light_mode = 0;
	clear	_light_mode+0
;	pms150_ws2812.c: 87: uint8_t mode_counter = 0;
	clear	_mode_counter+0
;	pms150_ws2812.c: 102: uint8_t hue = 0;
	clear	_hue+0
;	pms150_ws2812.c: 103: uint8_t hue1 = 0;
	clear	_hue1+0
;	pms150_ws2812.c: 104: uint8_t huef = 0;
	clear	_huef+0
;	pms150_ws2812.c: 106: uint8_t lm = 0;
	clear	_lm+0
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
;	pms150_ws2812.c: 14: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pms150_ws2812.c: 16: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	mov	a, #0x34
	mov.io	__clkmd, a
;	pms150_ws2812.c: 17: EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); // tune SYSCLK to 8MHz @ 4.000V
	and	a, #'R'                        
	and	a, #'C'                        
	and	a, #((1))          
	and	a, #((8000000))     
	and	a, #((8000000)>>8)  
	and	a, #((8000000)>>16) 
	and	a, #((8000000)>>24) 
	and	a, #((4000))     
	and	a, #((4000)>>8)  
	and	a, #((0x0B))           
;	pms150_ws2812.c: 18: return 0;							  // perform normal initialization
;	pms150_ws2812.c: 19: }
	ret	#0x00
;	pms150_ws2812.c: 120: void BUTTON_init(void)
;	-----------------------------------------
;	 function BUTTON_init
;	-----------------------------------------
_BUTTON_init:
;	pms150_ws2812.c: 122: setb(Px, BUTTON_PIN); // pullup on IR pin
	set1.io	__pa, #6
;	pms150_ws2812.c: 123: clrb(PxC, BUTTON_PIN);
	set0.io	__pac, #6
;	pms150_ws2812.c: 124: setb(PxPH, BUTTON_PIN);	  // set BUTTON pin as input
	set1.io	__paph, #6
;	pms150_ws2812.c: 125: setb(PxDIER, BUTTON_PIN); // set BUTTON pin as input
	set1.io	__padier, #6
;	pms150_ws2812.c: 126: }
	ret
;	pms150_ws2812.c: 139: void LED__SendZero_()
;	-----------------------------------------
;	 function LED__SendZero_
;	-----------------------------------------
_LED__SendZero_:
;	pms150_ws2812.c: 141: setb(Px, NEO_PIN);
	set1.io	__pa, #3
;	pms150_ws2812.c: 142: __nop();
	nop
;	pms150_ws2812.c: 143: __nop();
	nop
;	pms150_ws2812.c: 144: clrb(Px, NEO_PIN);
	set0.io	__pa, #3
;	pms150_ws2812.c: 145: __nop();
	nop
;	pms150_ws2812.c: 146: __nop();
	nop
;	pms150_ws2812.c: 147: __nop();
	nop
;	pms150_ws2812.c: 148: __nop();
	nop
;	pms150_ws2812.c: 149: }
	ret
;	pms150_ws2812.c: 150: void LED__SendOne_()
;	-----------------------------------------
;	 function LED__SendOne_
;	-----------------------------------------
_LED__SendOne_:
;	pms150_ws2812.c: 152: setb(Px, NEO_PIN);
	set1.io	__pa, #3
;	pms150_ws2812.c: 153: __nop();
	nop
;	pms150_ws2812.c: 154: __nop();
	nop
;	pms150_ws2812.c: 155: __nop();
	nop
;	pms150_ws2812.c: 156: __nop();
	nop
;	pms150_ws2812.c: 157: __nop();
	nop
;	pms150_ws2812.c: 158: __nop();
	nop
;	pms150_ws2812.c: 159: __nop();
	nop
;	pms150_ws2812.c: 160: clrb(Px, NEO_PIN);
	set0.io	__pa, #3
;	pms150_ws2812.c: 161: }
	ret
;	pms150_ws2812.c: 162: void NEO_sendByte(uint8_t dat)
;	-----------------------------------------
;	 function NEO_sendByte
;	-----------------------------------------
_NEO_sendByte:
;	pms150_ws2812.c: 164: if (dat & 0x80)
	mov	a, _NEO_sendByte_PARM_1+0
	mov	_NEO_sendByte_sloc0_1_0+0, a
	and	a, #0x80
	ceqsn	a, #0x00
	goto	00159$
	goto	00102$
00159$:
;	pms150_ws2812.c: 165: LED__SendOne_();
	call	_LED__SendOne_
	goto	00103$
00102$:
;	pms150_ws2812.c: 167: LED__SendZero_();
	call	_LED__SendZero_
00103$:
;	pms150_ws2812.c: 168: if (dat & 0x40)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x40
	ceqsn	a, #0x00
	goto	00160$
	goto	00105$
00160$:
;	pms150_ws2812.c: 169: LED__SendOne_();
	call	_LED__SendOne_
	goto	00106$
00105$:
;	pms150_ws2812.c: 171: LED__SendZero_();
	call	_LED__SendZero_
00106$:
;	pms150_ws2812.c: 172: if (dat & 0x20)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x20
	ceqsn	a, #0x00
	goto	00161$
	goto	00108$
00161$:
;	pms150_ws2812.c: 173: LED__SendOne_();
	call	_LED__SendOne_
	goto	00109$
00108$:
;	pms150_ws2812.c: 175: LED__SendZero_();
	call	_LED__SendZero_
00109$:
;	pms150_ws2812.c: 176: if (dat & 0x10)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x10
	ceqsn	a, #0x00
	goto	00162$
	goto	00111$
00162$:
;	pms150_ws2812.c: 177: LED__SendOne_();
	call	_LED__SendOne_
	goto	00112$
00111$:
;	pms150_ws2812.c: 179: LED__SendZero_();
	call	_LED__SendZero_
00112$:
;	pms150_ws2812.c: 180: if (dat & 0x08)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x08
	ceqsn	a, #0x00
	goto	00163$
	goto	00114$
00163$:
;	pms150_ws2812.c: 181: LED__SendOne_();
	call	_LED__SendOne_
	goto	00115$
00114$:
;	pms150_ws2812.c: 183: LED__SendZero_();
	call	_LED__SendZero_
00115$:
;	pms150_ws2812.c: 184: if (dat & 0x04)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x04
	ceqsn	a, #0x00
	goto	00164$
	goto	00117$
00164$:
;	pms150_ws2812.c: 185: LED__SendOne_();
	call	_LED__SendOne_
	goto	00118$
00117$:
;	pms150_ws2812.c: 187: LED__SendZero_();
	call	_LED__SendZero_
00118$:
;	pms150_ws2812.c: 188: if (dat & 0x02)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x02
	ceqsn	a, #0x00
	goto	00165$
	goto	00120$
00165$:
;	pms150_ws2812.c: 189: LED__SendOne_();
	call	_LED__SendOne_
	goto	00121$
00120$:
;	pms150_ws2812.c: 191: LED__SendZero_();
	call	_LED__SendZero_
00121$:
;	pms150_ws2812.c: 192: if (dat & 0x01)
	mov	a, _NEO_sendByte_sloc0_1_0+0
	and	a, #0x01
	ceqsn	a, #0x00
	goto	00166$
	goto	00123$
00166$:
;	pms150_ws2812.c: 193: LED__SendOne_();
	goto	_LED__SendOne_
	goto	00125$
00123$:
;	pms150_ws2812.c: 195: LED__SendZero_();
	goto	_LED__SendZero_
00125$:
;	pms150_ws2812.c: 196: }
	ret
;	pms150_ws2812.c: 199: void NEO_writeColor(uint8_t r, uint8_t g, uint8_t b)
;	-----------------------------------------
;	 function NEO_writeColor
;	-----------------------------------------
_NEO_writeColor:
;	pms150_ws2812.c: 202: NEO_sendByte(g);
	mov	a, _NEO_writeColor_PARM_2+0
	mov	_NEO_sendByte_PARM_1+0, a
	call	_NEO_sendByte
;	pms150_ws2812.c: 203: NEO_sendByte(r);
	mov	a, _NEO_writeColor_PARM_1+0
	mov	_NEO_sendByte_PARM_1+0, a
	call	_NEO_sendByte
;	pms150_ws2812.c: 204: NEO_sendByte(b);
	mov	a, _NEO_writeColor_PARM_3+0
	mov	_NEO_sendByte_PARM_1+0, a
	goto	_NEO_sendByte
;	pms150_ws2812.c: 217: }
	ret
;	pms150_ws2812.c: 254: void IR_init(void)
;	-----------------------------------------
;	 function IR_init
;	-----------------------------------------
_IR_init:
;	pms150_ws2812.c: 256: setb(Px, IR_PIN);	  // pullup on IR pin
	set1.io	__pa, #4
;	pms150_ws2812.c: 257: clrb(PxC, IR_PIN);	  // set IR pin as input
	set0.io	__pac, #4
;	pms150_ws2812.c: 258: setb(PxPH, IR_PIN);	  // set IR pin pull up
	set1.io	__paph, #4
;	pms150_ws2812.c: 259: setb(PxDIER, IR_PIN); // set IR pin as input
	set1.io	__padier, #4
;	pms150_ws2812.c: 267: T16M = T16_CLK_SYSCLK | T16_CLK_DIV4 | T16_INTSRC_8BIT; // timer clock=8MHz/4/2^9 => 0.256ms
	mov	a, #0x28
	mov.io	__t16m, a
;	pms150_ws2812.c: 268: T16C = 0;
	clear	p
	stt16	p
;	pms150_ws2812.c: 269: INTEN |= INTEN_T16; // enable TM16 interrupt
	set1.io	__inten, #2
;	pms150_ws2812.c: 270: INTRQ = 0;
	mov	a, #0x00
	mov.io	__intrq, a
;	pms150_ws2812.c: 271: }
	ret
;	pms150_ws2812.c: 275: uint8_t IR_read(void)
;	-----------------------------------------
;	 function IR_read
;	-----------------------------------------
_IR_read:
;	pms150_ws2812.c: 277: uint32_t data = 0x00000000; // variable for received data
	clear	_IR_read_sloc1_1_0+0
	clear	_IR_read_sloc1_1_0+1
	clear	_IR_read_sloc1_1_0+2
	clear	_IR_read_sloc1_1_0+3
;	pms150_ws2812.c: 280: count_ms = 0;
	clear	_count_ms+0
	clear	_count_ms+1
;	pms150_ws2812.c: 282: for (uint8_t i = 0; i < 33; i++) // receive 32 bits
	clear	_IR_read_sloc2_1_0+0
00123$:
	mov	a, _IR_read_sloc2_1_0+0
	sub	a, #0x21
	t1sn.io	f, c
	goto	00119$
;	pms150_ws2812.c: 284: data = data << 1;
	sl	_IR_read_sloc1_1_0+0
	slc	_IR_read_sloc1_1_0+1
	slc	_IR_read_sloc1_1_0+2
	slc	_IR_read_sloc1_1_0+3
;	pms150_ws2812.c: 285: while (inbit(Px, IR_PIN) == 0 && count_ms != 100)
00102$:
	mov.io	a, __pa
	and	a, #0x10
	swap	a
	and	a, #0x0f
	ceqsn	a, #0x00
	goto	00106$
	mov	a, _count_ms+1
	mov	p, a
	mov	a, _count_ms+0
	ceqsn	a, #0x64
	goto	00102$
	mov	a, p
	ceqsn	a, #0x00
	goto	00102$
;	pms150_ws2812.c: 287: while (inbit(Px, IR_PIN) == 1 && count_ms != 100)
00106$:
	mov.io	a, __pa
	and	a, #0x10
	swap	a
	and	a, #0x0f
	ceqsn	a, #0x01
	goto	00108$
	mov	a, _count_ms+1
	mov	p, a
	mov	a, _count_ms+0
	ceqsn	a, #0x64
	goto	00106$
	mov	a, p
	ceqsn	a, #0x00
	goto	00106$
00108$:
;	pms150_ws2812.c: 289: count_ms1 = count_ms;
	mov	a, _count_ms+0
	mov	_count_ms1+0, a
	mov	a, _count_ms+1
	mov	_count_ms1+1, a
;	pms150_ws2812.c: 290: if (count_ms1 == 100)
	mov	a, _count_ms1+0
	mov	_IR_read_sloc3_1_0+0, a
	mov	a, _count_ms1+1
	mov	_IR_read_sloc3_1_0+1, a
	mov	a, _IR_read_sloc3_1_0+0
	ceqsn	a, #0x64
	goto	00110$
	mov	a, _IR_read_sloc3_1_0+1
	ceqsn	a, #0x00
	goto	00110$
;	pms150_ws2812.c: 293: return IR_FAIL;
	ret	#0xf1
00110$:
;	pms150_ws2812.c: 295: if (i == 0 && (count_ms1 < 40 || count_ms1 > 65)) // first bit is not a Start bit
	mov	a, _IR_read_sloc2_1_0+0
	ceqsn	a, #0x00
	goto	00115$
	mov	a, _IR_read_sloc3_1_0+0
	sub	a, #0x28
	mov	a, _IR_read_sloc3_1_0+1
	subc	a
	t0sn.io	f, c
	goto	00114$
	mov	a, #0x41
	sub	a, _IR_read_sloc3_1_0+0
	mov	a, #0x00
	subc	a, _IR_read_sloc3_1_0+1
	t1sn.io	f, c
	goto	00115$
00114$:
;	pms150_ws2812.c: 297: return IR_FAIL;
	ret	#0xf1
00115$:
;	pms150_ws2812.c: 299: else if (7 < count_ms1 && count_ms1 < 11)
	mov	a, #0x07
	sub	a, _count_ms1+0
	mov	a, #0x00
	subc	a, _count_ms1+1
	t1sn.io	f, c
	goto	00116$
	mov	a, _count_ms1+1
	mov	p, a
	mov	a, _count_ms1+0
	sub	a, #0x0b
	mov	a, p
	subc	a
	t1sn.io	f, c
	goto	00116$
;	pms150_ws2812.c: 301: data |= 0x00000001;
	mov	a, #0x01
	or	_IR_read_sloc1_1_0+0, a
00116$:
;	pms150_ws2812.c: 304: count_ms = 0;
	clear	_count_ms+0
	clear	_count_ms+1
;	pms150_ws2812.c: 282: for (uint8_t i = 0; i < 33; i++) // receive 32 bits
	inc	_IR_read_sloc2_1_0+0
	goto	00123$
00119$:
;	pms150_ws2812.c: 309: uint8_t cmd1 = data >> 8; // get first  command byte
	mov	a, _IR_read_sloc1_1_0+1
	mov	_IR_read_sloc4_1_0+0, a
;	pms150_ws2812.c: 310: uint8_t cmd2 = data;	  // get second command byte
	mov	a, _IR_read_sloc1_1_0+0
	mov	_IR_read_sloc5_1_0+0, a
;	pms150_ws2812.c: 311: if (((uint16_t)cmd1 + (uint16_t)cmd2) < 255)
	clear	p
	mov	a, _IR_read_sloc4_1_0+0
	add	a, _IR_read_sloc5_1_0+0
	push	af
	addc	p
	pop	af
	sub	a, #0xff
	mov	a, p
	subc	a
	t1sn.io	f, c
	goto	00121$
;	pms150_ws2812.c: 312: return IR_FAIL; // if second command byte is not the inverse of the first
	ret	#0xf1
00121$:
;	pms150_ws2812.c: 318: return cmd1; // return command code
	mov	a, _IR_read_sloc4_1_0+0
;	pms150_ws2812.c: 319: }
	ret
;	pms150_ws2812.c: 322: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pms150_ws2812.c: 333: if (INTRQ & INTRQ_T16)
	mov.io	a, __intrq
	mov	p, a
	t1sn	p, #2
	goto	00105$
;	pms150_ws2812.c: 335: INTRQ &= ~INTRQ_T16;
	set0.io	__intrq, #2
;	pms150_ws2812.c: 337: count_ms++;
	inc	_count_ms+0
	addc	_count_ms+1
;	pms150_ws2812.c: 338: if (count_ms == 100)
	mov	a, _count_ms+1
	mov	p, a
	mov	a, _count_ms+0
	ceqsn	a, #0x64
	goto	00105$
	mov	a, p
	ceqsn	a, #0x00
	goto	00105$
;	pms150_ws2812.c: 340: count_ms = 100;
	mov	a, #0x64
	mov	_count_ms+0, a
	clear	_count_ms+1
00105$:
;	pms150_ws2812.c: 343: }
	pop	af
	mov	p, a
	pop	af
	reti
;	pms150_ws2812.c: 351: void standby(void)
;	-----------------------------------------
;	 function standby
;	-----------------------------------------
_standby:
;	pms150_ws2812.c: 354: changeColor(0, 0, 0);
	clear	_changeColor_PARM_1+0
	clear	_changeColor_PARM_1+1
	clear	_changeColor_PARM_2+0
	clear	_changeColor_PARM_2+1
	clear	_changeColor_PARM_3+0
	clear	_changeColor_PARM_3+1
	call	_changeColor
;	pms150_ws2812.c: 355: while (1)
00106$:
;	pms150_ws2812.c: 359: if (IR_available() == 0)
	mov.io	a, __pa
	and	a, #0x10
	swap	a
	and	a, #0x0f
	ceqsn	a, #0x00
	goto	00106$
;	pms150_ws2812.c: 360: if (IR_read() == BIR_OK)
	call	_IR_read
	ceqsn	a, #0x1c
	goto	00106$
;	pms150_ws2812.c: 361: break; // exit on power button
;	pms150_ws2812.c: 363: }
	ret
;	pms150_ws2812.c: 369: void changeColor(int r, int g, int b)
;	-----------------------------------------
;	 function changeColor
;	-----------------------------------------
_changeColor:
;	pms150_ws2812.c: 371: cli();
	disgint
;	pms150_ws2812.c: 372: for (uint8_t i = NEO_PIXELS; i; i--)
	mov	a, #0x18
	mov	_changeColor_sloc6_1_0+0, a
00103$:
	mov	a, _changeColor_sloc6_1_0+0
	ceqsn	a, #0x00
	goto	00116$
	goto	00101$
00116$:
;	pms150_ws2812.c: 373: NEO_writeColor(r, g, b);
	mov	a, _changeColor_PARM_1+0
	mov	_NEO_writeColor_PARM_1+0, a
	mov	a, _changeColor_PARM_2+0
	mov	_NEO_writeColor_PARM_2+0, a
	mov	a, _changeColor_PARM_3+0
	mov	_NEO_writeColor_PARM_3+0, a
	call	_NEO_writeColor
;	pms150_ws2812.c: 372: for (uint8_t i = NEO_PIXELS; i; i--)
	dec	_changeColor_sloc6_1_0+0
	goto	00103$
00101$:
;	pms150_ws2812.c: 374: sei();
	engint
;	pms150_ws2812.c: 375: }
	ret
;	pms150_ws2812.c: 377: void switchColor(void)
;	-----------------------------------------
;	 function switchColor
;	-----------------------------------------
_switchColor:
;	pms150_ws2812.c: 379: changeColor(rv[hue], gv[hue], bv[hue]);
	mov	a, #<(_rv + 0)
	add	a, _hue+0
	mov	p, a
	mov	a, #>(_rv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_1+0, a
	clear	_changeColor_PARM_1+1
	mov	a, #<(_gv + 0)
	add	a, _hue+0
	mov	p, a
	mov	a, #>(_gv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_2+0, a
	clear	_changeColor_PARM_2+1
	mov	a, #<(_bv + 0)
	add	a, _hue+0
	mov	p, a
	mov	a, #>(_bv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_3+0, a
	clear	_changeColor_PARM_3+1
	call	_changeColor
;	pms150_ws2812.c: 380: hue++;
	inc	_hue+0
;	pms150_ws2812.c: 381: if (hue == 4)
	mov	a, _hue+0
	ceqsn	a, #0x04
	goto	00102$
;	pms150_ws2812.c: 382: hue = 0;
	clear	_hue+0
00102$:
;	pms150_ws2812.c: 383: my_delay_ms();
	goto	_my_delay_ms
;	pms150_ws2812.c: 394: }
	ret
;	pms150_ws2812.c: 396: void fadeColor(void)
;	-----------------------------------------
;	 function fadeColor
;	-----------------------------------------
_fadeColor:
;	pms150_ws2812.c: 398: changeColor(0, gfv, bfv[hue1]);
	call	_gfv+0
	mov	_changeColor_PARM_2+0, a
	clear	_changeColor_PARM_2+1
	mov	a, #<(_bfv + 0)
	add	a, _hue1+0
	mov	p, a
	mov	a, #>(_bfv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_3+0, a
	clear	_changeColor_PARM_3+1
	clear	_changeColor_PARM_1+0
	clear	_changeColor_PARM_1+1
	call	_changeColor
;	pms150_ws2812.c: 399: if (hue1 == 0)
	mov	a, _hue1+0
	ceqsn	a, #0x00
	goto	00102$
;	pms150_ws2812.c: 400: huef = 0;
	clear	_huef+0
00102$:
;	pms150_ws2812.c: 401: if (hue1 == 6)
	mov	a, _hue1+0
	ceqsn	a, #0x06
	goto	00104$
;	pms150_ws2812.c: 402: huef = 1;
	mov	a, #0x01
	mov	_huef+0, a
00104$:
;	pms150_ws2812.c: 403: if (huef == 1)
	mov	a, _huef+0
	ceqsn	a, #0x01
	goto	00106$
;	pms150_ws2812.c: 404: hue1--;
	dec	_hue1+0
00106$:
;	pms150_ws2812.c: 405: if (huef == 0)
	mov	a, _huef+0
	ceqsn	a, #0x00
	goto	00108$
;	pms150_ws2812.c: 406: hue1++;
	inc	_hue1+0
00108$:
;	pms150_ws2812.c: 407: my_delay_ms();
	goto	_my_delay_ms
;	pms150_ws2812.c: 425: }
	ret
;	pms150_ws2812.c: 427: void my_delay_ms(void)
;	-----------------------------------------
;	 function my_delay_ms
;	-----------------------------------------
_my_delay_ms:
;	pms150_ws2812.c: 429: for (int x = 0; x <= mode_delay[light_mode - 7]; x++)
	clear	_my_delay_ms_sloc7_1_0+0
	clear	_my_delay_ms_sloc7_1_0+1
00103$:
	mov	a, _light_mode+0
	sub	a, #0x07
	push	af
	sl	a
	mov	a, #0x00
	subc	a
	mov	p, a
	pop	af
	add	a, #<(_mode_delay + 0)
	xch	a, p
	addc	a
	add	a, #>(_mode_delay + 0x8000 + 0)
	call	__gptrget
	clear	p
	sub	a, _my_delay_ms_sloc7_1_0+0
	mov	a, p
	subc	a, _my_delay_ms_sloc7_1_0+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t0sn.io	f, c
	goto	00105$
;	pms150_ws2812.c: 430: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pms150_ws2812.c: 429: for (int x = 0; x <= mode_delay[light_mode - 7]; x++)
	inc	_my_delay_ms_sloc7_1_0+0
	addc	_my_delay_ms_sloc7_1_0+1
	goto	00103$
00105$:
;	pms150_ws2812.c: 431: }
	ret
;	pms150_ws2812.c: 438: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pms150_ws2812.c: 444: NEO_init();	   // init Neopixels
	set1.io	__pac, #3
;	pms150_ws2812.c: 445: IR_init();	   // init IR receiver
	call	_IR_init
;	pms150_ws2812.c: 446: BUTTON_init(); // init Button
	call	_BUTTON_init
;	pms150_ws2812.c: 447: sei();		   // enable global interrupts
	engint
;	pms150_ws2812.c: 448: light_mode = 0;
	clear	_light_mode+0
;	pms150_ws2812.c: 449: lm = 0;
	clear	_lm+0
;	pms150_ws2812.c: 473: while (1)
00143$:
;	pms150_ws2812.c: 476: button_value = inbit(Px, BUTTON_PIN); // get value of button pin
	mov.io	a, __pa
	and	a, #0x40
	mov	_button_value+0, a
	mov	a, #6
00246$:
	sr	_button_value+0
	dzsn	a
	goto	00246$
;	pms150_ws2812.c: 478: if (button_value == 1 && !button_flag)
	mov	a, _button_value+0
	ceqsn	a, #0x01
	goto	00102$
	mov	a, _button_flag+0
	ceqsn	a, #0x00
	goto	00102$
;	pms150_ws2812.c: 480: button_flag = 1;
	mov	a, #0x01
	mov	_button_flag+0, a
00102$:
;	pms150_ws2812.c: 482: if (button_value == 0 && button_flag)
	mov	a, _button_value+0
	ceqsn	a, #0x00
	goto	00107$
	mov	a, _button_flag+0
	ceqsn	a, #0x00
	goto	00247$
	goto	00107$
00247$:
;	pms150_ws2812.c: 484: button_flag = 0;
	clear	_button_flag+0
;	pms150_ws2812.c: 486: light_mode++;
	inc	_light_mode+0
;	pms150_ws2812.c: 487: if (light_mode == 11)
	mov	a, _light_mode+0
	ceqsn	a, #0x0b
	goto	00107$
;	pms150_ws2812.c: 489: light_mode = 0;
	clear	_light_mode+0
00107$:
;	pms150_ws2812.c: 512: if (light_mode <= 6)
	mov	a, #0x06
	sub	a, _light_mode+0
	t0sn.io	f, c
	goto	00110$
;	pms150_ws2812.c: 514: changeColor(rsv[light_mode], gsv[light_mode], bsv[light_mode]);
	mov	a, #<(_rsv + 0)
	add	a, _light_mode+0
	mov	p, a
	mov	a, #>(_rsv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_1+0, a
	clear	_changeColor_PARM_1+1
	mov	a, #<(_gsv + 0)
	add	a, _light_mode+0
	mov	p, a
	mov	a, #>(_gsv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_2+0, a
	clear	_changeColor_PARM_2+1
	mov	a, #<(_bsv + 0)
	add	a, _light_mode+0
	mov	p, a
	mov	a, #>(_bsv + 0x8000 + 0)
	addc	a
	call	__gptrget
	mov	_changeColor_PARM_3+0, a
	clear	_changeColor_PARM_3+1
	call	_changeColor
00110$:
;	pms150_ws2812.c: 517: if (light_mode == 7 || light_mode == 8)
	mov	a, _light_mode+0
	ceqsn	a, #0x07
	goto	00249$
	goto	00111$
00249$:
	mov	a, _light_mode+0
	ceqsn	a, #0x08
	goto	00112$
00111$:
;	pms150_ws2812.c: 519: switchColor();
	call	_switchColor
00112$:
;	pms150_ws2812.c: 522: if (light_mode == 9)
	mov	a, _light_mode+0
	ceqsn	a, #0x09
	goto	00173$
;	pms150_ws2812.c: 524: fadeColor();
	call	_fadeColor
;	pms150_ws2812.c: 528: for (uint8_t i = 80; i; i--)
00173$:
	mov	a, #0x50
	mov	_main_sloc8_1_0+0, a
00146$:
	mov	a, _main_sloc8_1_0+0
	ceqsn	a, #0x00
	goto	00250$
	goto	00143$
00250$:
;	pms150_ws2812.c: 530: if (IR_available() == 0 && button_value == 1)
	mov.io	a, __pa
	and	a, #0x10
	swap	a
	and	a, #0x0f
	ceqsn	a, #0x00
	goto	00139$
	mov	a, _button_value+0
	ceqsn	a, #0x01
	goto	00139$
;	pms150_ws2812.c: 532: command = IR_read();
	call	_IR_read
;	pms150_ws2812.c: 542: if (command == BIR_1)
	mov	_command+0, a
	ceqsn	a, #0x45
	goto	00117$
;	pms150_ws2812.c: 544: light_mode = 0;
	clear	_light_mode+0
00117$:
;	pms150_ws2812.c: 546: if (command == BIR_2)
	mov	a, _command+0
	ceqsn	a, #0x46
	goto	00119$
;	pms150_ws2812.c: 548: light_mode = 1;
	mov	a, #0x01
	mov	_light_mode+0, a
00119$:
;	pms150_ws2812.c: 550: if (command == BIR_3)
	mov	a, _command+0
	ceqsn	a, #0x47
	goto	00121$
;	pms150_ws2812.c: 552: light_mode = 2;
	mov	a, #0x02
	mov	_light_mode+0, a
00121$:
;	pms150_ws2812.c: 554: if (command == BIR_4)
	mov	a, _command+0
	ceqsn	a, #0x44
	goto	00123$
;	pms150_ws2812.c: 556: light_mode = 3;
	mov	a, #0x03
	mov	_light_mode+0, a
00123$:
;	pms150_ws2812.c: 558: if (command == BIR_5)
	mov	a, _command+0
	ceqsn	a, #0x40
	goto	00125$
;	pms150_ws2812.c: 560: light_mode = 4;
	mov	a, #0x04
	mov	_light_mode+0, a
00125$:
;	pms150_ws2812.c: 562: if (command == BIR_6)
	mov	a, _command+0
	ceqsn	a, #0x43
	goto	00127$
;	pms150_ws2812.c: 564: light_mode = 5;
	mov	a, #0x05
	mov	_light_mode+0, a
00127$:
;	pms150_ws2812.c: 566: if (command == BIR_7)
	mov	a, _command+0
	ceqsn	a, #0x07
	goto	00129$
;	pms150_ws2812.c: 568: light_mode = 6;
	mov	a, #0x06
	mov	_light_mode+0, a
00129$:
;	pms150_ws2812.c: 571: if (command == BIR_IZQ)
	mov	a, _command+0
	ceqsn	a, #0x08
	goto	00131$
;	pms150_ws2812.c: 573: light_mode = 7;
	mov	a, #0x07
	mov	_light_mode+0, a
00131$:
;	pms150_ws2812.c: 575: if (command == BIR_DER)
	mov	a, _command+0
	ceqsn	a, #0x5a
	goto	00133$
;	pms150_ws2812.c: 577: light_mode = 8;
	mov	a, #0x08
	mov	_light_mode+0, a
00133$:
;	pms150_ws2812.c: 579: if (command == BIR_ARR)
	mov	a, _command+0
	ceqsn	a, #0x18
	goto	00135$
;	pms150_ws2812.c: 581: light_mode = 9;
	mov	a, #0x09
	mov	_light_mode+0, a
00135$:
;	pms150_ws2812.c: 584: if (command == BIR_OK)
	mov	a, _command+0
	ceqsn	a, #0x1c
	goto	00139$
;	pms150_ws2812.c: 586: standby();
	call	_standby
00139$:
;	pms150_ws2812.c: 608: _delay_ms(1);
	mov	a, #0xe6
	mov	__delay_loop_16_PARM_1+0, a
	mov	a, #0x03
	mov	__delay_loop_16_PARM_1+1, a
	call	__delay_loop_16
;	pms150_ws2812.c: 528: for (uint8_t i = 80; i; i--)
	dec	_main_sloc8_1_0+0
	goto	00146$
;	pms150_ws2812.c: 611: }
	ret
	.area CODE
	.area CONST
_mode_delay:
	ret #0xdc	; 220
	ret #0x96	; 150
	ret #0x96	; 150
	ret #0x64	; 100	'd'
_mode:
	ret #0x45	; 69	'E'
	ret #0x46	; 70	'F'
	ret #0x47	; 71	'G'
	ret #0x44	; 68	'D'
	ret #0x40	; 64
	ret #0x43	; 67	'C'
	ret #0x07	; 7
	ret #0x08	; 8
	ret #0x5a	; 90	'Z'
	ret #0x18	; 24
	ret #0x52	; 82	'R'
_rv:
	ret #0x00	; 0
	ret #0xfd	; 253
	ret #0xd8	; 216
	ret #0xef	; 239
_gv:
	ret #0xe4	; 228
	ret #0x54	; 84	'T'
	ret #0x00	; 0
	ret #0x00	; 0
_bv:
	ret #0xff	; 255
	ret #0x02	; 2
	ret #0xeb	; 235
	ret #0x0b	; 11
_rsv:
	ret #0x00	; 0
	ret #0xff	; 255
	ret #0x37	; 55	'7'
	ret #0xfd	; 253
	ret #0xff	; 255
	ret #0xff	; 255
	ret #0xef	; 239
	ret #0x00
_gsv:
	ret #0x75	; 117	'u'
	ret #0x00	; 0
	ret #0xeb	; 235
	ret #0x54	; 84	'T'
	ret #0xff	; 255
	ret #0xf2	; 242
	ret #0x00	; 0
	ret #0x00
_bsv:
	ret #0xd8	; 216
	ret #0x64	; 100	'd'
	ret #0x00	; 0
	ret #0x02	; 2
	ret #0xff	; 255
	ret #0x00	; 0
	ret #0x0b	; 11
	ret #0x00
_rfv:
	ret #0x00	; 0
_gfv:
	ret #0xff	; 255
_bfv:
	ret #0xff	; 255
	ret #0xc8	; 200
	ret #0x9b	; 155
	ret #0x64	; 100	'd'
	ret #0x37	; 55	'7'
	ret #0x00	; 0
	.area CABS (ABS)
