;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pdk_uart
	.optsdcc -mpdk15
	

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _UART_printNum_PARM_1
	.globl _UART_print_PARM_1
	.globl _UART_putC_PARM_1
	.globl _internal_tx_buffer
	.globl _bits_left_in_tx
	.globl _flag_tx_busy
	.globl _flag_rx_ready
	.globl _flag_rx_off
	.globl _qout
	.globl _start_bit
	.globl _qin
	.globl _UART_IO_config
	.globl _UART_begin
	.globl _UART_rx_on
	.globl _UART_rx_off
	.globl _UART_getchar
	.globl _UART_kbhit
	.globl _UART_flush_input_buffer
	.globl _UART_transmit_busy
	.globl _UART_putC
	.globl _UART_print
	.globl _UART_printNum
	.globl _TIM2_interrupt
	.globl _PB5_interrupt
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
_inbuf:
	.ds 32
_qin::
	.ds 1
_start_bit::
	.ds 1
_qout::
	.ds 1
_flag_rx_off::
	.ds 1
_flag_rx_ready::
	.ds 1
_flag_tx_busy::
	.ds 1
_bits_left_in_tx::
	.ds 1
_internal_tx_buffer::
	.ds 2
_UART_putC_PARM_1:
	.ds 1
_UART_print_PARM_1:
	.ds 2
_UART_print_sloc0_1_0:
	.ds 2
_UART_printNum_PARM_1:
	.ds 2
_UART_printNum_dis_65536_53:
	.ds 5
_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59:
	.ds 1
_TIM2_interrupt_rx_mask_65536_59:
	.ds 1
_TIM2_interrupt_bits_left_in_rx_65536_59:
	.ds 1
_TIM2_interrupt_internal_rx_buffer_65536_59:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;	pdk_uart.c: 174: static uint8_t flag_rx_waiting_for_stop_bit = SU_FALSE;
	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
;	pdk_uart.c: 26: volatile uint8_t qin, start_bit = 1;
	mov	a, #0x01
	mov	_start_bit+0, a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	pdk_uart.c: 35: void UART_IO_config(void)
;	-----------------------------------------
;	 function UART_IO_config
;	-----------------------------------------
_UART_IO_config:
;	pdk_uart.c: 37: ROP = ROP_INT_SRC_PB5;
	mov	a, #0x02
	mov.io	__rop, a
;	pdk_uart.c: 39: setb(UART_PxC, UART_TX);
	set1.io	__pbc, #7
;	pdk_uart.c: 41: setb(UART_PxDIER, UART_RX);
	set1.io	__pbdier, #5
;	pdk_uart.c: 42: setb(UART_PxPH, UART_RX);
	set1.io	__pbph, #5
;	pdk_uart.c: 44: INTEGS = INTEGS_PB5_FALLING;
	mov	a, #0x02
	mov.io	__integs, a
;	pdk_uart.c: 45: INTEN |= INTEN_PB5;
	set1.io	__inten, #0
;	pdk_uart.c: 46: }
	ret
;	pdk_uart.c: 48: static void TIM2_Config(void)
;	-----------------------------------------
;	 function TIM2_Config
;	-----------------------------------------
_TIM2_Config:
;	pdk_uart.c: 51: TM2C = TM2C_CLK_IHRC;						  // Use IHRC -> 16 Mhz
	mov	a, #0x20
	mov.io	__tm2c, a
;	pdk_uart.c: 52: TM2S = TM2S_PRESCALE_NONE | TM2S_SCALE_DIV16; // No prescale, scale 2 ~> 8MHz
	mov	a, #0x0f
	mov.io	__tm2s, a
;	pdk_uart.c: 53: TM2B = 103;									  // Divide by 69 ~> 115942 Hz (apx. 115200)
	mov	a, #0x67
	mov.io	__tm2b, a
;	pdk_uart.c: 58: }
	ret
;	pdk_uart.c: 60: void UART_begin(void)
;	-----------------------------------------
;	 function UART_begin
;	-----------------------------------------
_UART_begin:
;	pdk_uart.c: 62: flag_tx_busy = SU_FALSE;
	clear	_flag_tx_busy+0
;	pdk_uart.c: 63: flag_rx_ready = SU_FALSE;
	clear	_flag_rx_ready+0
;	pdk_uart.c: 64: flag_rx_off = SU_TRUE;
	mov	a, #0x01
	mov	_flag_rx_off+0, a
;	pdk_uart.c: 65: setb(UART_Px, UART_TX); /* mt: set to high to avoid garbage on init */
	set1.io	__pb, #7
;	pdk_uart.c: 67: TIM2_Config();
	call	_TIM2_Config
;	pdk_uart.c: 68: UART_rx_on();
	goto	_UART_rx_on
;	pdk_uart.c: 69: }
	ret
;	pdk_uart.c: 71: static void idle(void)
;	-----------------------------------------
;	 function idle
;	-----------------------------------------
_idle:
;	pdk_uart.c: 76: }
	ret
;	pdk_uart.c: 78: void UART_rx_on(void)
;	-----------------------------------------
;	 function UART_rx_on
;	-----------------------------------------
_UART_rx_on:
;	pdk_uart.c: 80: flag_rx_off = SU_FALSE;
	clear	_flag_rx_off+0
;	pdk_uart.c: 81: }
	ret
;	pdk_uart.c: 83: void UART_rx_off(void)
;	-----------------------------------------
;	 function UART_rx_off
;	-----------------------------------------
_UART_rx_off:
;	pdk_uart.c: 85: flag_rx_off = SU_TRUE;
	mov	a, #0x01
	mov	_flag_rx_off+0, a
;	pdk_uart.c: 86: }
	ret
;	pdk_uart.c: 88: char UART_getchar(void)
;	-----------------------------------------
;	 function UART_getchar
;	-----------------------------------------
_UART_getchar:
;	pdk_uart.c: 91: while (qout == qin)
00101$:
	mov	a, _qout+0
	cneqsn	a, _qin+0
	goto	00101$
00120$:
;	pdk_uart.c: 94: ch = inbuf[qout];
	mov	a, #(_inbuf + 0)
	add	a, _qout+0
	mov	p, a
	idxm	a, p
	mov	p, a
;	pdk_uart.c: 95: if (++qout >= UART_IN_BUF_SIZE)
	inc	_qout+0
	mov	a, _qout+0
	sub	a, #0x20
	t0sn.io	f, c
	goto	00105$
;	pdk_uart.c: 97: qout = 0;
	clear	_qout+0
00105$:
;	pdk_uart.c: 100: return (ch);
	mov	a, p
;	pdk_uart.c: 101: }
	ret
;	pdk_uart.c: 103: uint8_t UART_kbhit(void)
;	-----------------------------------------
;	 function UART_kbhit
;	-----------------------------------------
_UART_kbhit:
;	pdk_uart.c: 105: return (qin != qout); // 0 neu giong 1 neu khac
	mov	a, _qin+0
	ceqsn	a, _qout+0
	goto	00103$
	mov	a, #0x01
	goto	00104$
00103$:
	mov	a, #0x00
00104$:
	xor	a, #0x01
;	pdk_uart.c: 106: }
	ret
;	pdk_uart.c: 108: void UART_flush_input_buffer(void)
;	-----------------------------------------
;	 function UART_flush_input_buffer
;	-----------------------------------------
_UART_flush_input_buffer:
;	pdk_uart.c: 110: qin = 0;
	clear	_qin+0
;	pdk_uart.c: 111: qout = 0;
	clear	_qout+0
;	pdk_uart.c: 112: }
	ret
;	pdk_uart.c: 114: uint8_t UART_transmit_busy(void)
;	-----------------------------------------
;	 function UART_transmit_busy
;	-----------------------------------------
_UART_transmit_busy:
;	pdk_uart.c: 116: return (flag_tx_busy == SU_TRUE) ? 1 : 0;
	mov	a, _flag_tx_busy+0
	ceqsn	a, #0x01
	goto	00103$
	mov	a, #0x01
	clear	p
	goto	00104$
00103$:
	mov	a, #0x00
00104$:
;	pdk_uart.c: 117: }
	ret
;	pdk_uart.c: 119: void UART_putC(const char ch)
;	-----------------------------------------
;	 function UART_putC
;	-----------------------------------------
_UART_putC:
;	pdk_uart.c: 121: while (flag_tx_busy == SU_TRUE)
00101$:
	mov	a, _flag_tx_busy+0
	cneqsn	a, #0x01
	goto	00101$
00114$:
;	pdk_uart.c: 126: bits_left_in_tx = TX_NUM_OF_BITS;
	mov	a, #0x0a
	mov	_bits_left_in_tx+0, a
;	pdk_uart.c: 127: TIMER_ON;
	set1.io	__inten, #6
;	pdk_uart.c: 128: internal_tx_buffer = (ch << 1) | 0x200;
	clear	p
	mov	a, _UART_putC_PARM_1+0
	sl	a
	slc	p
	set1	p, #1
	mov	_internal_tx_buffer+0, a
	mov	a, p
	mov	_internal_tx_buffer+1, a
;	pdk_uart.c: 129: flag_tx_busy = SU_TRUE;
	mov	a, #0x01
	mov	_flag_tx_busy+0, a
;	pdk_uart.c: 130: }
	ret
;	pdk_uart.c: 132: void UART_print(char *str)
;	-----------------------------------------
;	 function UART_print
;	-----------------------------------------
_UART_print:
;	pdk_uart.c: 135: while (str[i] != '\0')
	clear	_UART_print_sloc0_1_0+0
	clear	_UART_print_sloc0_1_0+1
00101$:
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc0_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a, _UART_print_sloc0_1_0+1
	call	__gptrget
	cneqsn	a, #0x00
	goto	00104$
;	pdk_uart.c: 136: UART_putC(str[i++]);
	mov	a, _UART_print_PARM_1+0
	add	a, _UART_print_sloc0_1_0+0
	mov	p, a
	mov	a, _UART_print_PARM_1+1
	addc	a, _UART_print_sloc0_1_0+1
	inc	_UART_print_sloc0_1_0+0
	addc	_UART_print_sloc0_1_0+1
	call	__gptrget
	mov	_UART_putC_PARM_1+0, a
	call	_UART_putC
	goto	00101$
00104$:
;	pdk_uart.c: 137: }
	ret
;	pdk_uart.c: 139: void UART_printNum(int num)
;	-----------------------------------------
;	 function UART_printNum
;	-----------------------------------------
_UART_printNum:
;	pdk_uart.c: 142: if (num > 999)
	mov	a, #0xe7
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x03
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00108$
;	pdk_uart.c: 144: dis[0] = num / 1000 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0xe8
	mov	__divsint_PARM_2+0, a
	mov	a, #0x03
	mov	__divsint_PARM_2+1, a
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+0, a
;	pdk_uart.c: 145: dis[1] = (num / 100) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x64
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+1, a
;	pdk_uart.c: 146: dis[2] = (num / 10) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+2, a
;	pdk_uart.c: 147: dis[3] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+3, a
;	pdk_uart.c: 148: dis[4] = '\0';
	clear	_UART_printNum_dis_65536_53+4
	goto	00109$
00108$:
;	pdk_uart.c: 150: else if (num > 99)
	mov	a, #0x63
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00105$
;	pdk_uart.c: 152: dis[0] = num / 100 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x64
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+0, a
;	pdk_uart.c: 153: dis[1] = (num / 10) % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	mov	__modsint_PARM_1+0, a
	mov	a, p
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+1, a
;	pdk_uart.c: 154: dis[2] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+2, a
;	pdk_uart.c: 155: dis[3] = '\0';
	clear	_UART_printNum_dis_65536_53+3
	goto	00109$
00105$:
;	pdk_uart.c: 157: else if (num > 9)
	mov	a, #0x09
	sub	a, _UART_printNum_PARM_1+0
	mov	a, #0x00
	subc	a, _UART_printNum_PARM_1+1
	t0sn.io	f, ov
	xor	a, #0x80
	sl	a
	t1sn.io	f, c
	goto	00102$
;	pdk_uart.c: 159: dis[0] = num / 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__divsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__divsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__divsint_PARM_2+0, a
	clear	__divsint_PARM_2+1
	call	__divsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+0, a
;	pdk_uart.c: 160: dis[1] = num % 10 + 48;
	mov	a, _UART_printNum_PARM_1+0
	mov	__modsint_PARM_1+0, a
	mov	a, _UART_printNum_PARM_1+1
	mov	__modsint_PARM_1+1, a
	mov	a, #0x0a
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+1, a
;	pdk_uart.c: 161: dis[2] = '\0';
	clear	_UART_printNum_dis_65536_53+2
	goto	00109$
00102$:
;	pdk_uart.c: 165: dis[0] = num + 48;
	mov	a, _UART_printNum_PARM_1+0
	add	a, #0x30
	mov	_UART_printNum_dis_65536_53+0, a
;	pdk_uart.c: 166: dis[1] = '\0';
	clear	_UART_printNum_dis_65536_53+1
00109$:
;	pdk_uart.c: 168: UART_print(dis);
	mov	a, #(_UART_printNum_dis_65536_53 + 0)
	mov	_UART_print_PARM_1+0, a
	clear	_UART_print_PARM_1+1
	goto	_UART_print
;	pdk_uart.c: 169: }
	ret
;	pdk_uart.c: 172: void TIM2_interrupt(void)
;	-----------------------------------------
;	 function TIM2_interrupt
;	-----------------------------------------
_TIM2_interrupt:
;	pdk_uart.c: 181: if (flag_tx_busy == SU_TRUE)
	mov	a, _flag_tx_busy+0
	ceqsn	a, #0x01
	goto	00107$
;	pdk_uart.c: 183: if (internal_tx_buffer & 0x01)
	mov	a, _internal_tx_buffer+1
	mov	p, a
	mov	a, _internal_tx_buffer+0
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00102$
;	pdk_uart.c: 185: setb(UART_Px, UART_TX);
	set1.io	__pb, #7
	goto	00103$
00102$:
;	pdk_uart.c: 189: clrb(UART_Px, UART_TX);
	set0.io	__pb, #7
00103$:
;	pdk_uart.c: 191: internal_tx_buffer >>= 1;
	sr	_internal_tx_buffer+1
	src	_internal_tx_buffer+0
;	pdk_uart.c: 192: if (--bits_left_in_tx == 0)
	mov	a, _bits_left_in_tx+0
	sub	a, #0x01
	mov	_bits_left_in_tx+0, a
	ceqsn	a, #0x00
	goto	00107$
;	pdk_uart.c: 194: flag_tx_busy = SU_FALSE;
	clear	_flag_tx_busy+0
;	pdk_uart.c: 195: TIMER_OFF;
	set0.io	__inten, #6
;	pdk_uart.c: 196: EXTERNAL_ON;
	set1.io	__inten, #0
00107$:
;	pdk_uart.c: 201: if (flag_rx_off == SU_FALSE)
	mov	a, _flag_rx_off+0
	ceqsn	a, #0x00
	goto	00124$
;	pdk_uart.c: 203: if (flag_rx_waiting_for_stop_bit)
	mov	a, _TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
	cneqsn	a, #0x00
	goto	00120$
;	pdk_uart.c: 205: start_bit = 1;
	mov	a, #0x01
	mov	_start_bit+0, a
;	pdk_uart.c: 206: EXTERNAL_ON;
	set1.io	__inten, #0
;	pdk_uart.c: 207: flag_rx_waiting_for_stop_bit = SU_FALSE;
	clear	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0
;	pdk_uart.c: 208: flag_rx_ready = SU_FALSE;
	clear	_flag_rx_ready+0
;	pdk_uart.c: 209: inbuf[qin] = internal_rx_buffer;
	mov	a, #(_inbuf + 0)
	add	a, _qin+0
	mov	p, a
	mov	a, _TIM2_interrupt_internal_rx_buffer_65536_59+0
	idxm	p, a
;	pdk_uart.c: 210: if (++qin >= UART_IN_BUF_SIZE)
	mov	a, _qin+0
	add	a, #0x01
	mov	_qin+0, a
	ceqsn	a, #0x20
	nop
	t0sn.io	f, c
	goto	00124$
;	pdk_uart.c: 212: qin = 0; // overflow - reset inbuf-index
	clear	_qin+0
	goto	00124$
00120$:
;	pdk_uart.c: 217: if (flag_rx_ready == SU_FALSE)
	mov	a, _flag_rx_ready+0
	ceqsn	a, #0x00
	goto	00117$
;	pdk_uart.c: 219: if (start_bit == 0)
	mov	a, _start_bit+0
	ceqsn	a, #0x00
	goto	00124$
;	pdk_uart.c: 221: flag_rx_ready = SU_TRUE;
	mov	a, #0x01
	mov	_flag_rx_ready+0, a
;	pdk_uart.c: 222: internal_rx_buffer = 0;
	clear	_TIM2_interrupt_internal_rx_buffer_65536_59+0
;	pdk_uart.c: 223: bits_left_in_rx = RX_NUM_OF_BITS;
	mov	a, #0x08
	mov	_TIM2_interrupt_bits_left_in_rx_65536_59+0, a
;	pdk_uart.c: 224: rx_mask = 1;
	mov	a, #0x01
	mov	_TIM2_interrupt_rx_mask_65536_59+0, a
	goto	00124$
00117$:
;	pdk_uart.c: 230: if (UART_Px & (0x20))
	mov.io	a, __pb
	and	a, #0x20
	cneqsn	a, #0x00
	goto	00113$
;	pdk_uart.c: 232: internal_rx_buffer |= rx_mask;
	mov	a, _TIM2_interrupt_rx_mask_65536_59+0
	or	_TIM2_interrupt_internal_rx_buffer_65536_59+0, a
00113$:
;	pdk_uart.c: 234: rx_mask <<= 1;
	sl	_TIM2_interrupt_rx_mask_65536_59+0
;	pdk_uart.c: 235: if (--bits_left_in_rx == 0)
	dzsn	_TIM2_interrupt_bits_left_in_rx_65536_59+0
	goto	00124$
;	pdk_uart.c: 237: flag_rx_waiting_for_stop_bit = SU_TRUE;
	mov	a, #0x01
	mov	_TIM2_interrupt_flag_rx_waiting_for_stop_bit_65536_59+0, a
00124$:
;	pdk_uart.c: 242: }
	ret
;	pdk_uart.c: 245: void PB5_interrupt(void)
;	-----------------------------------------
;	 function PB5_interrupt
;	-----------------------------------------
_PB5_interrupt:
;	pdk_uart.c: 247: TM2CT = 9;
	mov	a, #0x09
	mov.io	__tm2ct, a
;	pdk_uart.c: 248: TIMER_OFF;
	set0.io	__inten, #6
;	pdk_uart.c: 249: EXTERNAL_OFF;
	set0.io	__inten, #0
;	pdk_uart.c: 250: start_bit = 0;
	clear	_start_bit+0
;	pdk_uart.c: 252: INTRQ &= ~INTRQ_TM2;
	set0.io	__intrq, #6
;	pdk_uart.c: 253: TIMER_ON;
	set1.io	__inten, #6
;	pdk_uart.c: 254: }
	ret
	.area CODE
	.area CONST
	.area CABS (ABS)
