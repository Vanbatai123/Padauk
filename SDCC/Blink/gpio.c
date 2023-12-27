
// program test GPIO

#ifndef F_CPU
#define F_CPU 8000000
#endif

#include "include.h"

unsigned char _sdcc_external_startup(void)
{
  EASY_PDK_INIT_SYSCLOCK_8MHZ();        //use 8MHz sysclock
  EASY_PDK_CALIBRATE_IHRC(F_CPU, 4000); //tune SYSCLK to 8MHz @ 4.000V
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