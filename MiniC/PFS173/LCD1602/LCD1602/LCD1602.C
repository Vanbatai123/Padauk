/*
 * LCD1602.c
 * Created: 2023/11/29
 * Author: taivb
*/

#include "extern.h"
#include "include.h"
#include "pdk_lcd1602.h"

void FPPA0(void)
{
	.ADJUST_IC SYSCLK=IHRC/2 // SYSCLK=IHRC/4

	// Insert Initial Code

	LCD1602_config();
	LCD1602_clear();
	WORD CCC = 123;

	while(1)
	{
		LCD1602_goTo(1,1);
		LCD1602_putC('V');
		LCD1602_putC('a');
		LCD1602_putC('n');
		LCD1602_putC(' ');
		LCD1602_putC('B');
		LCD1602_putC('a');
		LCD1602_putC('s');
		LCD1602_putC('T');
		LCD1602_putC('a');
		LCD1602_putC('i');

		LCD1602_goTo(2, 1);
		LCD1602_printNum(CCC);
		CCC += 1;
		_delay_ms(1000);
	}
}

