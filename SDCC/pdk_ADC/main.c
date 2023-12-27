/*
 * pfs173_uart.c
 * Created: 2021/06/09
 * Author: taivb
 */

#define F_CPU 8000000
#include "delay.h"
#include "include.h"
#include "PDK_uart.h"

uint16_t txdata;
uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  // use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); // tune SYSCLK to 8MHz @ 4.000V
	return 0;							  // perform normal initialization
}

int main(void)
{
	// Initialize hardware
	UART_begin(); // Initialize UART engine

	INTRQ = 0;
	sei(); // Enable global interrupts
		   // setup ADC
#ifdef ADCRGC
	ADCRGC = ADCRG_ADC_REF_VDD; // ADC reference voltage is VDD
#endif
	ADCM = ADCM_CLK_SYSCLK_DIV16;				   // SYSCLK 8MHZ/16 -> 500 kHz ADC clock
	ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD16_BANDGAP; // enable ADC and use channel 16 (internal bandgap voltage 1.2V)
												   // NOTE: a delay of 400usec is required after initialization, before first ADC conversion can start

	// UART_print has a huge footprint (big CODE + big RAM). Do not use it in your projects unless you have to.
	UART_print("Measuring VDD (VBandGap): ");

	ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
	while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
		;				   // busy wait for ADC conversion to finish (we also could use the ADC interrupt...)
	uint8_t adcval = ADCR; // read the ADC value

	// We measured the internal bandgap voltage which should be 1.2V. This means: 1.2V/adcval = VDD/255 -> VDD = (1.2V*255)/adcval
	uint32_t vdd = (1200UL * 255) / adcval;
	// UART_print("%lu mV\n", vdd);
	UART_printNum(vdd);
	UART_print(" mV\n");


	// setup and switch to other ADC channel
	PBC &= ~(1 << 0);						   // disable PA.0 GPIO output
	PBPH &= ~(1 << 0);						   // disable pull up on PA.0, NOTE: also disable PxPL if available (e.g. on port B)
	PBDIER &= ~(1 << 0);					   // disable PA.0 GPIO input
	ADCC = ADCC_ADC_ENABLE | ADCC_CH_AD0_PB0; // enable ADC and use channel 10 (PA.0)
											   // NOTE: a delay of 400usec is required after initialization, before first ADC conversion can start
	UART_print("Start ADC on PA.0\n");
	while (1)
	{
		ADCC |= ADCC_ADC_CONV_START; // start ADC conversion
		while (!(ADCC & ADCC_ADC_CONV_COMPLETE))
			; // busy wait for ADC conversion to finish (we also could use the ADC interrupt...)

		uint8_t adcval = ADCR; // read the ADC value
		UART_print("PA.0 : ");
		UART_printNum(adcval);
		UART_print("\n");
		_delay_ms(50);

	}
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
	// timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed

		TIM2_interrupt();
	}
}
