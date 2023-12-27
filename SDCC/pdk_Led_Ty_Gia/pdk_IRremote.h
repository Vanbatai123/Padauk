/*
 * PDKs207_IRremote.h	
 * Created: 2021/12/19
 * Author: TaiVB
 * Note: it is not the origin library,
 * see Header folder for origin version.
*/

#ifndef PDK_IR_H
#define PDK_IR_H

#define IR_DDR					DDRD.BYTE
#define IR_PIN					PIND.BYTE
#define IR_PIN_IN				3

#define RAWBUF 					70
// IR detector output is active low
#define MARK  					0
#define SPACE 					1

#define _GAP 						8000 // Minimum map between transmissions
#define USECPERTICK 		50
#define GAP_TICKS 			(_GAP/USECPERTICK)

// receiver states
#define STATE_IDLE     	2
#define STATE_MARK     	3
#define STATE_SPACE    	4
#define STATE_STOP     	5

#define NEC_BITS 				32

#define ERR 						0
#define DECODED 				1

#define NEC 						1


// Decoded value for NEC when a repeat code is received
#define REPEAT 					0xffffffff


// Pulse parms are *50-100 for the Mark and *50+100 for the space
// First MARK is the one after the long gap
// pulse parameters in usec
#define NEC_HDR_MARK			9000
#define NEC_HDR_SPACE			4500
#define NEC_BIT_MARK			560
#define NEC_ONE_SPACE			1600
#define NEC_ZERO_SPACE		560
#define NEC_RPT_SPACE			2250

#define MARK_EXCESS 			100

#define TOLERANCE 				25  // percent tolerance in measurements
#define LTOL 							(1.0 - TOLERANCE/100.) 
#define UTOL 							(1.0 + TOLERANCE/100.) 

#define TICKS_LOW(us) 		(int) (((us)*LTOL/USECPERTICK))
#define TICKS_HIGH(us) 		(int) (((us)*UTOL/USECPERTICK + 1))

uint8_t IR_decodeNEC(uint32_t *value);
uint8_t IR_decode(uint32_t *value);
void IR_config(void);
void IR_resume(void);
void TIM3_interrupt(void);
#endif