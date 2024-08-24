/*
 * pdk_uart.h
 * Created: 2024/08/24
 * Author: taivb
 */

Baud_Rate => 19200;

UART_Out BIT PA.7;
UART_In BIT PA.6;

/*
	UART_Delay => (System_Clock / FPPA_Duty) / Baud_Rate;

	if System_Clock = 8,000.000 Hz
	FPPA_Duty  = /16
	so FPPA_Clock  = System_Clock / FPPA_Duty = 500.000 Hz

	if Baud_Rate  = 19200
	so UART_Delay  = 500.000 / 19200 = 26.0416...
	so match, 26 cycles send one bit. < 0.5%

	if Baud_Rate  = 38400
	so UART_Delay  = 500.000 / 38400 = 13.02083...
	so match, 13 cycles send one bit. < 0.5%

	if Baud_Rate  = 56000
?	so UART_Delay  = 500.000 / 56000 = 8.9285...  < 1.0%

	if Baud_Rate  = 57600
X	so UART_Delay  = 500.000 / 57600 = 8.6805...  : fail
*/

FPPA_Duty => _SYS(INC.FPPA_NUM);	// Single FPPA = 1, Mult FPPA = 2 or 4/8/...
.errnz 		FPPA_Duty > 2			// Only for 1 /2 FPPA, not for more FPPAs

UART_Delay => ((System_Clock / FPPA_Duty) + (Baud_Rate / 2)) / Baud_Rate;
// + (Baud_Rate/2) : to round up or down

Test_V0 => System_Clock / 1000 * 995;
Test_V1 => UART_Delay *Baud_Rate *FPPA_Duty;
Test_V2 => System_Clock / 1000 * 1005;

#if (Test_V1 < Test_V0) || (Test_V1 > Test_V2)
	.echo % Test_V0 <= % Test_V1 <= % Test_V2
	.error Baud_Rate do not match to System Clock
#endif

void UART_Send(uint8_t UART_Data_Out);
void UART_Receive(void);
void UART_begin(void);