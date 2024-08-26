/*
 * LCDI2C.c
 * Created: 2024/08/24
 * Author: taivb
*/

#include "extern.h"
#include "include.h"
#include "pdk_lcdi2c.h"

void FPPA0(void)
{
	.ADJUST_IC SYSCLK=IHRC/2 // SYSCLK=IHRC/4

	// Insert Initial Code

	LCDI2C_config();
	LCDI2C_blackLight(1);
	LCDI2C_clear();
	WORD CCC = 123;

	while(1)
	{
		LCDI2C_home();
		LCDI2C_putC('V');
		LCDI2C_putC('a');
		LCDI2C_putC('n');
		LCDI2C_putC(' ');
		LCDI2C_putC('B');
		LCDI2C_putC('a');
		LCDI2C_putC('s');
		LCDI2C_putC('T');
		LCDI2C_putC('a');
		LCDI2C_putC('i');

		LCDI2C_goTo(2, 1);
		LCDI2C_printNum(CCC);
		CCC += 1;
		_delay_ms(1000);
	}
}

