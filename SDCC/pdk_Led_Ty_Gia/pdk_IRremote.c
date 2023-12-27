/*
 * stm8s207_IRremote.h
 * Created: 2021/12/19
 * Author: TaiVB
*/

#include "include.h"
#include "pdk_IRremote.h"

uint16_t timer = 0;
uint8_t rawlen = 0;
uint8_t rcvstate = STATE_IDLE;
uint16_t rawbuf[RAWBUF]; // raw data

uint8_t MATCH(uint16_t measured, uint16_t desired)
{
  return measured >= TICKS_LOW(desired) && measured <= TICKS_HIGH(desired);
}
uint8_t MATCH_MARK(uint16_t measured_ticks, uint16_t desired_us) { return MATCH(measured_ticks, (desired_us + MARK_EXCESS)); }
uint8_t MATCH_SPACE(uint16_t measured_ticks, uint16_t desired_us) { return MATCH(measured_ticks, (desired_us - MARK_EXCESS)); }


void IR_resume(void)
{
  rcvstate = STATE_IDLE;
  rawlen = 0;
}
// NECs have a repeat only 4 items long
uint8_t IR_decodeNEC(uint32_t *value)
{
	uint8_t i;
  uint32_t data = 0;
  uint8_t offset = 1; // Skip first space
	
	// ????????????
	if(rawbuf[0] < 1000)//50ms
  {
    return ERR;
  }
  // Initial mark
  if (!MATCH_MARK(rawbuf[offset], NEC_HDR_MARK))
  {
    return ERR;
  }
  offset++;
  // Check for repeat
  if (rawlen == 4 &&
      MATCH_SPACE(rawbuf[offset], NEC_RPT_SPACE) &&
      MATCH_MARK(rawbuf[offset + 1], NEC_BIT_MARK))
  {
    *value = REPEAT;
    return DECODED;
  }
  if (rawlen < 2 * NEC_BITS + 4)
  {
    return ERR;
  }
  // Initial space
  if (!MATCH_SPACE(rawbuf[offset], NEC_HDR_SPACE))
  {
    return ERR;
  }
  offset++;
  for (i = 0; i < NEC_BITS; i++)
  {
    if (!MATCH_MARK(rawbuf[offset], NEC_BIT_MARK))
    {
      return ERR;
    }
    offset++;
    if (MATCH_SPACE(rawbuf[offset], NEC_ONE_SPACE))
    {
      data = (data << 1) | 1;
    }
    else if (MATCH_SPACE(rawbuf[offset], NEC_ZERO_SPACE))
    {
      data <<= 1;
    }
    else
    {
      return ERR;
    }
    offset++;
  }
  // Success
  *value = data;
  return DECODED;
}
// Decodes the received IR message
// Returns 0 if no data ready, 1 if data ready.
// Results of decoding are stored in results
uint8_t IR_decode(uint32_t *value)
{	
  if (rcvstate != STATE_STOP)
  {
    return ERR;
  }
  if (IR_decodeNEC(value))
  {
    return DECODED;
  }

  // Throw away and start over
  IR_resume();
  return ERR;
}

void IR_config(void)
{
	//TIM4_begin(3, 100);

	//pinMode(IR_DDR, IR_PIN_IN, IN_U);
	// input-Pin as input
	setb(PBDIER, 4);
	setb(PBPH, 4);
}

void TIM3_interrupt()
{
  uint8_t irdata;
	
	//irdata = inbit(IR_PIN, IR_PIN_IN);
	irdata = inbit(PB, 4);


  timer++; // One more 50us tick
  if (rawlen >= RAWBUF)
  {
    // Buffer overflow
    rcvstate = STATE_STOP;
  }
  switch (rcvstate)
  {
  case STATE_IDLE: // In the middle of a gap
    if (irdata == MARK)//0
    {
      if (timer < GAP_TICKS)//100 ~ 5000us
      {
        // Not big enough to be a gap.
        timer = 0;
      }
      else
      {
        // gap just ended, record duration and start recording transmission
        rawlen = 0;
        rawbuf[rawlen++] = timer;
        timer = 0;
        rcvstate = STATE_MARK;
      }
    }
    break;
  case STATE_MARK: // timing MARK
    if (irdata == SPACE)
    { // MARK ended, record time
      rawbuf[rawlen++] = timer;
      timer = 0;
      rcvstate = STATE_SPACE;
    }
    break;
  case STATE_SPACE: // timing SPACE
    if (irdata == MARK)
    { // SPACE just ended, record it
      rawbuf[rawlen++] = timer;
      timer = 0;
      rcvstate = STATE_MARK;
    }
    else
    { // SPACE
      if (timer > GAP_TICKS)
      {
        // big SPACE, indicates gap between codes
        // Mark current code as ready for processing
        // Switch to STOP
        // Don't reset timer; keep counting space width
        rcvstate = STATE_STOP;
      }
    }
    break;
  case STATE_STOP: // waiting, measuring gap
    if (irdata == MARK)
    { // reset gap timer
      timer = 0;
    }
    break;
  }
}