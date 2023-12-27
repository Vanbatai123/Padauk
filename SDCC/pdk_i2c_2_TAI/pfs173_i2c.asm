;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module pfs173_i2c
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _main
	.globl _setTime
	.globl _digitalClockDisplay
	.globl _readDS1307
	.globl _dec2bcd
	.globl _bcd2dec
	.globl __sdcc_external_startup
	.globl _I2C_read
	.globl _I2C_requestFrom
	.globl _I2C_endTransmission
	.globl _I2C_write2
	.globl _I2C_beginTransmission
	.globl _UART_printNum
	.globl _PB5_interrupt
	.globl _TIM2_interrupt
	.globl _UART_print
	.globl _UART_rx_off
	.globl _UART_IO_config
	.globl _UART_begin
	.globl __delay_loop_32
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
	.globl _setTime_PARM_7
	.globl _setTime_PARM_6
	.globl _setTime_PARM_5
	.globl _setTime_PARM_4
	.globl _setTime_PARM_3
	.globl _setTime_PARM_2
	.globl _setTime_PARM_1
	.globl _dec2bcd_PARM_1
	.globl _bcd2dec_PARM_1
	.globl _year
	.globl _month
	.globl _wday
	.globl _day2
	.globl _hour
	.globl _minute
	.globl _second
	.globl _aaa
	.globl _i
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
_i::
	.ds 1
_aaa::
	.ds 1
_second::
	.ds 1
_minute::
	.ds 1
_hour::
	.ds 1
_day2::
	.ds 1
_wday::
	.ds 1
_month::
	.ds 1
_year::
	.ds 2
_bcd2dec_PARM_1:
	.ds 1
_bcd2dec_sloc0_1_0:
	.ds 2
_bcd2dec_sloc1_1_0:
	.ds 1
_dec2bcd_PARM_1:
	.ds 1
_dec2bcd_sloc2_1_0:
	.ds 2
_dec2bcd_sloc3_1_0:
	.ds 1
_setTime_PARM_1:
	.ds 1
_setTime_PARM_2:
	.ds 1
_setTime_PARM_3:
	.ds 1
_setTime_PARM_4:
	.ds 1
_setTime_PARM_5:
	.ds 1
_setTime_PARM_6:
	.ds 1
_setTime_PARM_7:
	.ds 1
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
	mov	sp, a
	call	__sdcc_external_startup
	goto	__sdcc_gs_init_startup
	.area GSINIT
__sdcc_gs_init_startup:
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
;	pfs173_i2c.c: 17: uint8_t i = 0;
	clear	_i+0
;	pfs173_i2c.c: 18: uint8_t aaa = 0;
	clear	_aaa+0
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
;	pfs173_i2c.c: 22: uint8_t _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	pfs173_i2c.c: 24: EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	mov	a, #0x34
	mov	__clkmd, a
;	pfs173_i2c.c: 25: EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	and	a, #'R'                        
	and	a, #'C'                        
	and	a, #((1))          
	and	a, #((8000000))     
	and	a, #((8000000)>>8)  
	and	a, #((8000000)>>16) 
	and	a, #((8000000)>>24) 
	and	a, #((5000))     
	and	a, #((5000)>>8)  
	and	a, #((0x0B))           
;	pfs173_i2c.c: 26: return 0;							  //perform normal initialization
;	pfs173_i2c.c: 27: }
	ret	#0x00
;	pfs173_i2c.c: 30: uint8_t bcd2dec(uint8_t num)
;	-----------------------------------------
;	 function bcd2dec
;	-----------------------------------------
_bcd2dec:
;	pfs173_i2c.c: 32: return ((num / 16 * 10) + (num % 16));
	mov	a, _bcd2dec_PARM_1+0
	mov	_bcd2dec_sloc0_1_0+0, a
	clear	_bcd2dec_sloc0_1_0+1
	mov	a, _bcd2dec_sloc0_1_0+0
	mov	__divsint_PARM_1+0, a
	mov	a, _bcd2dec_sloc0_1_0+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x10
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	p, a
	sl	a
	sl	a
	add	a, p
	sl	a
	mov	_bcd2dec_sloc1_1_0+0, a
	mov	a, _bcd2dec_sloc0_1_0+0
	and	a, #0x0f
	add	a, _bcd2dec_sloc1_1_0+0
;	pfs173_i2c.c: 33: }
	ret
;	pfs173_i2c.c: 35: uint8_t dec2bcd(uint8_t num)
;	-----------------------------------------
;	 function dec2bcd
;	-----------------------------------------
_dec2bcd:
;	pfs173_i2c.c: 37: return ((num / 10 * 16) + (num % 10));
	mov	a, _dec2bcd_PARM_1+0
	mov	_dec2bcd_sloc2_1_0+0, a
	clear	_dec2bcd_sloc2_1_0+1
	mov	a, _dec2bcd_sloc2_1_0+0
	mov	__divsint_PARM_1+0, a
	mov	a, _dec2bcd_sloc2_1_0+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	_dec2bcd_sloc3_1_0+0, a
	sl	_dec2bcd_sloc3_1_0+0
	sl	_dec2bcd_sloc3_1_0+0
	sl	_dec2bcd_sloc3_1_0+0
	sl	_dec2bcd_sloc3_1_0+0
	mov	a, _dec2bcd_sloc2_1_0+0
	mov	__modsint_PARM_1+0, a
	mov	a, _dec2bcd_sloc2_1_0+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, _dec2bcd_sloc3_1_0+0
;	pfs173_i2c.c: 38: }
	ret
;	pfs173_i2c.c: 39: void readDS1307()
;	-----------------------------------------
;	 function readDS1307
;	-----------------------------------------
_readDS1307:
;	pfs173_i2c.c: 41: I2C_beginTransmission(DS1307);
	mov	a, #0x68
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pfs173_i2c.c: 42: I2C_write2(0x00);
	clear	_I2C_write2_PARM_1+0
	call	_I2C_write2
;	pfs173_i2c.c: 43: I2C_endTransmission();
	call	_I2C_endTransmission
;	pfs173_i2c.c: 44: I2C_requestFrom(DS1307, NumberOfFields);
	mov	a, #0x68
	mov	_I2C_requestFrom_PARM_1+0, a
	mov	a, #0x07
	mov	_I2C_requestFrom_PARM_2+0, a
	call	_I2C_requestFrom
;	pfs173_i2c.c: 45: second = bcd2dec(I2C_read() & 0x7f);
	call	_I2C_read
	and	a, #0x7f
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_second+0, a
;	pfs173_i2c.c: 46: minute = bcd2dec(I2C_read());
	call	_I2C_read
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_minute+0, a
;	pfs173_i2c.c: 47: hour = bcd2dec(I2C_read() & 0x3f); // chế độ 24h.
	call	_I2C_read
	and	a, #0x3f
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_hour+0, a
;	pfs173_i2c.c: 48: wday = bcd2dec(I2C_read());
	call	_I2C_read
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_wday+0, a
;	pfs173_i2c.c: 49: day2 = bcd2dec(I2C_read());
	call	_I2C_read
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_day2+0, a
;	pfs173_i2c.c: 50: month = bcd2dec(I2C_read());
	call	_I2C_read
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_month+0, a
;	pfs173_i2c.c: 51: year = bcd2dec(I2C_read());
	call	_I2C_read
	mov	_bcd2dec_PARM_1+0, a
	call	_bcd2dec
	mov	_year+0, a
	clear	_year+1
;	pfs173_i2c.c: 52: year += 2000;
	mov	a, _year+0
	add	a, #0xd0
	mov	p, a
	mov	a, _year+1
	addc	a
	add	a, #0x07
	mov	_year+1, a
	mov	a, p
	mov	_year+0, a
;	pfs173_i2c.c: 53: }
	ret
;	pfs173_i2c.c: 55: void digitalClockDisplay()
;	-----------------------------------------
;	 function digitalClockDisplay
;	-----------------------------------------
_digitalClockDisplay:
;	pfs173_i2c.c: 58: UART_printNum(hour);
	mov	a, _hour+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 59: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 60: UART_printNum(minute);
	mov	a, _minute+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 61: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 62: UART_printNum(second);
	mov	a, _second+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 63: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 64: UART_printNum(day2);
	mov	a, _day2+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 65: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 66: UART_printNum(month);
	mov	a, _month+0
	mov	_UART_printNum_PARM_1+0, a
	clear	_UART_printNum_PARM_1+1
	call	_UART_printNum
;	pfs173_i2c.c: 67: UART_print("-");
	mov	a, #<(___str_0 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_0 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 68: UART_printNum(year);
	mov	a, _year+0
	mov	_UART_printNum_PARM_1+0, a
	mov	a, _year+1
	mov	_UART_printNum_PARM_1+1, a
	call	_UART_printNum
;	pfs173_i2c.c: 69: UART_print("\r");
	mov	a, #<(___str_1 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_1 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	goto	_UART_print
;	pfs173_i2c.c: 70: }
	ret
;	pfs173_i2c.c: 73: void setTime(uint8_t hr, uint8_t min, uint8_t sec, uint8_t wd, uint8_t d, uint8_t mth, uint8_t yr)
;	-----------------------------------------
;	 function setTime
;	-----------------------------------------
_setTime:
;	pfs173_i2c.c: 75: I2C_beginTransmission(DS1307);
	mov	a, #0x68
	mov	_I2C_beginTransmission_PARM_1+0, a
	call	_I2C_beginTransmission
;	pfs173_i2c.c: 76: I2C_write2(0x00); // đặt lại pointer
	clear	_I2C_write2_PARM_1+0
	call	_I2C_write2
;	pfs173_i2c.c: 77: I2C_write2(dec2bcd(sec));
	mov	a, _setTime_PARM_3+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 78: I2C_write2(dec2bcd(min));
	mov	a, _setTime_PARM_2+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 79: I2C_write2(dec2bcd(hr));
	mov	a, _setTime_PARM_1+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 80: I2C_write2(dec2bcd(wd)); // day2 of week: Sunday2 = 1, Saturday2 = 7
	mov	a, _setTime_PARM_4+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 81: I2C_write2(dec2bcd(d));
	mov	a, _setTime_PARM_5+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 82: I2C_write2(dec2bcd(mth));
	mov	a, _setTime_PARM_6+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 83: I2C_write2(dec2bcd(yr));
	mov	a, _setTime_PARM_7+0
	mov	_dec2bcd_PARM_1+0, a
	call	_dec2bcd
	mov	_I2C_write2_PARM_1+0, a
	call	_I2C_write2
;	pfs173_i2c.c: 84: I2C_endTransmission();
	goto	_I2C_endTransmission
;	pfs173_i2c.c: 85: }
	ret
;	pfs173_i2c.c: 87: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	pfs173_i2c.c: 89: UART_IO_config();
	call	_UART_IO_config
;	pfs173_i2c.c: 90: UART_begin();
	call	_UART_begin
;	pfs173_i2c.c: 91: INTRQ = 0;
	mov	a, #0x00
	mov	__intrq, a
;	pfs173_i2c.c: 92: sei();
	engint
;	pfs173_i2c.c: 93: UART_rx_off();
	call	_UART_rx_off
;	pfs173_i2c.c: 94: UART_print("\rOK\r");
	mov	a, #<(___str_2 + 0)
	mov	_UART_print_PARM_1+0, a
	mov	a, #>(___str_2 + 0x8000 + 0)
	mov	_UART_print_PARM_1+1, a
	call	_UART_print
;	pfs173_i2c.c: 96: PBC |= (1 << SDA);
	set1	__pbc, #6
;	pfs173_i2c.c: 97: PBC |= (1 << SCL);
	set1	__pbc, #7
;	pfs173_i2c.c: 99: setTime(12, 30, 45, 1, 8, 2, 15); // 12:30:45 CN 08-02-2015
	mov	a, #0x0c
	mov	_setTime_PARM_1+0, a
	mov	a, #0x1e
	mov	_setTime_PARM_2+0, a
	mov	a, #0x2d
	mov	_setTime_PARM_3+0, a
	mov	a, #0x01
	mov	_setTime_PARM_4+0, a
	mov	a, #0x08
	mov	_setTime_PARM_5+0, a
	mov	a, #0x02
	mov	_setTime_PARM_6+0, a
	mov	a, #0x0f
	mov	_setTime_PARM_7+0, a
	call	_setTime
;	pfs173_i2c.c: 101: while (1)
00102$:
;	pfs173_i2c.c: 104: readDS1307();
	call	_readDS1307
;	pfs173_i2c.c: 107: digitalClockDisplay();
	call	_digitalClockDisplay
;	pfs173_i2c.c: 109: _delay_ms(900);
	mov	a, #0xbe
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x27
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x09
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
;	pfs173_i2c.c: 110: _delay_ms(900);
	mov	a, #0xbe
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x27
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x09
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
;	pfs173_i2c.c: 111: _delay_ms(900);
	mov	a, #0xbe
	mov	__delay_loop_32_PARM_1+0, a
	mov	a, #0x27
	mov	__delay_loop_32_PARM_1+1, a
	mov	a, #0x09
	mov	__delay_loop_32_PARM_1+2, a
	clear	__delay_loop_32_PARM_1+3
	call	__delay_loop_32
	goto	00102$
;	pfs173_i2c.c: 113: }
	ret
;	pfs173_i2c.c: 116: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	pfs173_i2c.c: 119: if (INTRQ & INTRQ_TM2)
	mov	a, __intrq
	and	a, #0x40
	cneqsn	a, #0x00
	goto	00102$
;	pfs173_i2c.c: 121: INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
	set0	__intrq, #6
;	pfs173_i2c.c: 122: TIM2_interrupt();
	call	_TIM2_interrupt
00102$:
;	pfs173_i2c.c: 125: if (INTRQ & INTRQ_PB5)
	mov	a, __intrq
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00105$
;	pfs173_i2c.c: 127: INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
	set0	__intrq, #0
;	pfs173_i2c.c: 128: PB5_interrupt();
	call	_PB5_interrupt
00105$:
;	pfs173_i2c.c: 130: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CONST
___str_0:
	ret #0x2d	; -
	ret #0x00
	.area CODE
	.area CONST
___str_1:
	ret #0x0d
	ret #0x00
	.area CODE
	.area CONST
___str_2:
	ret #0x0d
	ret #0x4f	; O
	ret #0x4b	; K
	ret #0x0d
	ret #0x00
	.area CODE
	.area CABS (ABS)
