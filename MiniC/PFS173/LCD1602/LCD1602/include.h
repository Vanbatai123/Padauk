/*
 * include.h
 * Created: 2023/11/29
 * Author: taivb
*/

#define inbit0(reg) 	(reg&0x01)
#define inbit1(reg) 	(reg&0x02)
#define inbit2(reg) 	(reg&0x04)
#define inbit3(reg) 	(reg&0x08)
#define inbit4(reg) 	(reg&0x10)
#define inbit5(reg) 	(reg&0x20)
#define inbit6(reg) 	(reg&0x40)
#define inbit7(reg) 	(reg&0x80)

#define uint8_t		int
#define uint16_t	WORD
#define uint24_t	EWORD
#define uint32_t	DWORD

// Delay
#define _delay_ms(x) .delay x*System_Clock/1000
#define _delay_us(x) .delay x*System_Clock/1000000
