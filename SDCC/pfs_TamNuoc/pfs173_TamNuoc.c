
#define F_CPU 1000000
#include "include.h"
#include "delay.h"

typedef unsigned char byte;

typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;

// led pins definition
#define PIN_LED_1 7
#define PIN_LED_2 4
#define PIN_LED_3 6
#define PIN_LED_4 6

#define Px_LED_1 PA
#define Px_LED_2 PA
#define Px_LED_3 PB
#define Px_LED_4 PA

#define PxC_LED_1 PAC
#define PxC_LED_2 PAC
#define PxC_LED_3 PBC
#define PxC_LED_4 PAC

// mosfet MOTOR pins definition
#define PIN_MOTOR 0
#define Px_MOTOR PA
#define PxC_MOTOR PAC

// switcher 1 pin definition
#define PIN_SW_1 3
#define Px_SW_1 PB
#define PxC_SW_1 PBC
#define PxPH_SW_1 PBPH
#define PxDIER_SW_1 PBDIER

// switcher 2 pin definition
#define PIN_SW_2 2
#define Px_SW_2 PB
#define PxC_SW_2 PBC
#define PxPH_SW_2 PBPH
#define PxDIER_SW_2 PBDIER

// Analog pin definition
#define PIN_ADC 0
#define Px_ADC PB
#define PxC_ADC PBC
#define PxPH_ADC PBPH
#define PxDIER_ADC PBDIER

uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_1MHZ();		  // use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 3000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}
void GPIO_begin(void)
{
	// config LED pins
	setb(PxC_LED_1, PIN_LED_1);
	setb(PxC_LED_2, PIN_LED_2);
	setb(PxC_LED_3, PIN_LED_3);
	setb(PxC_LED_4, PIN_LED_4);

	setb(Px_LED_1, PIN_LED_1);
	setb(Px_LED_2, PIN_LED_2);
	setb(Px_LED_3, PIN_LED_3);
	setb(Px_LED_4, PIN_LED_4);

	// config Mosfet G pins
	setb(PxC_MOTOR, PIN_MOTOR);

	// config Switch 1 pins
	// setb(Px_SW_1, PIN_SW_1);	 // pullup on
	clrb(PxC_SW_1, PIN_SW_1);	 //
	setb(PxPH_SW_1, PIN_SW_1);	 // set BUTTON pin as input
	setb(PxDIER_SW_1, PIN_SW_1); //

	// config Switch 2 pins
	// setb(Px_SW_2, PIN_SW_2);	 // pullup on
	clrb(PxC_SW_2, PIN_SW_2);	 //
	setb(PxPH_SW_2, PIN_SW_2);	 // set BUTTON pin as input
	clrb(PxDIER_SW_2, PIN_SW_2); //

	// config ADC pin
	ADCRGC = ADCRG_ADC_REF_VDD;				  // ADC reference voltage is VDD
	ADCM = ADCM_CLK_SYSCLK_DIV16;			  // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
											  //
	clrb(PxC_ADC, PIN_ADC);					  // disable PA.0 GPIO output
	clrb(PxPH_ADC, PIN_ADC);				  // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
	clrb(PxDIER_ADC, PIN_ADC);				  // disable PA.0 GPIO input
	ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
											  // NOTE: a delay of 400usec is required after initialization, before first ADC conversion can start
}

uint8_t ADC_read()
{
	ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
	while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
		; // busy wait for ADC conversion to finish (we also could use the ADC interrupt...)

	return ADCR; // read the ADC value
}
void TIM3_begin()
{
	TM3C = TM3C_CLK_IHRC;							// Use IHRC -> 16 Mhz
	TM3S = TM3S_PRESCALE_NONE | TM3S_PRESCALE_DIV4; // No prescale, scale 64 ~> 0.25MHz
	TM3B = 62;										// Divide by 62 ~> 4000 Hz 0.25ms

	INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
}
uint8_t timer_cnt = 0, motor_val = 0;
uint8_t mode = 1;
uint16_t mode3 = 1;
uint8_t on_flag = 0;
uint8_t adc_val = 0;
uint8_t i = 0;
void main(void)
{
	TIM3_begin();
	GPIO_begin();
	// __stopsys();
	INTRQ = 0;
	sei(); // Enable global interrupts
	while (1)
	{

		if (inbit(Px_SW_1, PIN_SW_1) == 0)
		{
			while (inbit(Px_SW_1, PIN_SW_1) == 0)
				;
			on_flag = 0;
			_delay_ms(100);
		}

		_delay_ms(10);
		// read adc each 15.5s
		// adc_val = ADC_read();
		i = 0;
		while (on_flag == 0)
		{
			INTEN &= ~INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
			on_flag = 0;
			motor_val = 0;
			clrb(Px_MOTOR, PIN_MOTOR);
			setb(Px_LED_1, PIN_LED_1);
			setb(Px_LED_2, PIN_LED_2);
			setb(Px_LED_3, PIN_LED_3);
			setb(Px_LED_4, PIN_LED_4);
			for (; i < 8; i++)
			{
				daobit(Px_LED_4, PIN_LED_4);
				_delay_ms(50);
			}
			__stopsys(); // deep sleep
			if (inbit(Px_SW_1, PIN_SW_1) == 0)
			{
				_delay_ms(100);
				while (inbit(Px_SW_1, PIN_SW_1) == 0)
					;

				INTEN |= INTEN_TM3; // Enable TM2 interrupt, send out initial stop bits and autobaud char
				on_flag = 1;
				break;
			}
		}

		if (inbit(Px_SW_2, PIN_SW_2) == 0)
		{
			while (inbit(Px_SW_2, PIN_SW_2) == 0)
				;
			mode++;
			if (mode > 4)
			{
				mode = 1;
			}
			_delay_ms(100);
		}
		switch (mode)
		{
		case 1:
			motor_val = 100;
			setb(Px_LED_4, PIN_LED_4);
			clrb(Px_LED_1, PIN_LED_1);
			break;

		case 2:
			motor_val = 60;
			setb(Px_LED_1, PIN_LED_1);
			clrb(Px_LED_2, PIN_LED_2);
			break;

		case 3:
			setb(Px_LED_2, PIN_LED_2);
			clrb(Px_LED_3, PIN_LED_3);
			break;

		case 4:
			motor_val = 25;
			setb(Px_LED_3, PIN_LED_3);
			clrb(Px_LED_4, PIN_LED_4);
			break;

		default:
			break;
		}
	}
}

void interrupt(void) __interrupt(0)
{
	if (INTRQ & INTRQ_TM3)
	{
		timer_cnt++;
		if (timer_cnt >= 100)
		{
			timer_cnt = 0;
		}
		if (mode == 3)
		{
			if (mode3 == 1)
			{
				motor_val = 100;
			}
			else if (mode3 == 5000)
			{
				motor_val = 60;
			}
			else if (mode3 == 8000)
			{
				mode3 = 0;
			}
			mode3++;
		}
		if (timer_cnt < motor_val)
		{
			setb(Px_MOTOR, PIN_MOTOR);
		}
		else
		{
			clrb(Px_MOTOR, PIN_MOTOR);
		}

		INTRQ &= ~INTRQ_TM3;
	}
}
