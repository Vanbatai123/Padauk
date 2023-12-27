
// program test GPIO

#ifndef F_CPU
#define F_CPU 8000000
#endif

#include "include.h"
/*
void interrupt(void) __interrupt(0)
{
  if( INTRQ & INTRQ_TM2 )                       //TM2 interrupt request?
  {
    INTRQ &= ~INTRQ_TM2;                        //mark TM2 interrupt request processed
    if( txdata )                                //txdata contains bits to send?
    {
      if( txdata&1 )                            //check bit (1/0) for sending
        __set1( PA, 7 );                        //send 1 on PA7
      else
        __set0( PA, 7 );                        //send 0 on PA7
      txdata >>= 1;                             //shift txdata 
    }
  }
}
*/
unsigned char _sdcc_external_startup(void)
{
  EASY_PDK_INIT_SYSCLOCK_8MHZ();        //use 8MHz sysclock
  EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
  return 0;                             //perform normal initialization
}

void main(void)
{

  setb(PBC, 4);
  while (1)
  {
    setb(PB, 4);
    _delay_ms(1000);
    clrb(PB, 4);
    _delay_ms(1000);
  }
}