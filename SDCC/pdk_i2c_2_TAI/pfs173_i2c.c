/*
 * pfs173_uart.c
 * Created: 2021/06/12
 * Author: taivb
*/

#define F_CPU 8000000
#include "include.h"
#include "delay.h"
#include "pdk_uart.h"
#include "pdk_i2c.h"

/* Địa chỉ của DS1307 */
#define DS1307  0x68
/* Số uint8_t dữ liệu sẽ đọc từ DS1307 */
#define NumberOfFields  7
uint8_t i = 0;
uint8_t aaa = 0;
uint8_t second, minute, hour, day2, wday, month;
uint16_t year;

uint8_t _sdcc_external_startup(void)
{
	EASY_PDK_INIT_SYSCLOCK_8MHZ();		  //use 8MHz sysclock
	EASY_PDK_CALIBRATE_IHRC(F_CPU, 5000); //tune SYSCLK to 8MHz @ 4.000V
	return 0;							  //perform normal initialization
}

/* Chuyển từ format BCD (Binary-Coded Decimal) sang Decimal */
uint8_t bcd2dec(uint8_t num)
{
	return ((num / 16 * 10) + (num % 16));
}
/* Chuyển từ Decimal sang BCD */
uint8_t dec2bcd(uint8_t num)
{
	return ((num / 10 * 16) + (num % 10));
}
void readDS1307()
{
	I2C_beginTransmission(DS1307);
	I2C_write2(0x00);
	I2C_endTransmission();
	I2C_requestFrom(DS1307, NumberOfFields);
	second = bcd2dec(I2C_read() & 0x7f);
	minute = bcd2dec(I2C_read());
	hour = bcd2dec(I2C_read() & 0x3f); // chế độ 24h.
	wday = bcd2dec(I2C_read());
	day2 = bcd2dec(I2C_read());
	month = bcd2dec(I2C_read());
	year = bcd2dec(I2C_read());
	year += 2000;
}

void digitalClockDisplay()
{
	// digital clock display of the time
	UART_printNum(hour);
	UART_print("-");
	UART_printNum(minute);
	UART_print("-");
	UART_printNum(second);
	UART_print("-");
	UART_printNum(day2);
	UART_print("-");
	UART_printNum(month);
	UART_print("-");
	UART_printNum(year);
	UART_print("\r");
}

/* cài đặt thời gian cho DS1307 */
void setTime(uint8_t hr, uint8_t min, uint8_t sec, uint8_t wd, uint8_t d, uint8_t mth, uint8_t yr)
{
	I2C_beginTransmission(DS1307);
	I2C_write2(0x00); // đặt lại pointer
	I2C_write2(dec2bcd(sec));
	I2C_write2(dec2bcd(min));
	I2C_write2(dec2bcd(hr));
	I2C_write2(dec2bcd(wd)); // day2 of week: Sunday2 = 1, Saturday2 = 7
	I2C_write2(dec2bcd(d));
	I2C_write2(dec2bcd(mth));
	I2C_write2(dec2bcd(yr));
	I2C_endTransmission();
}

int main(void)
{
	UART_IO_config();
	UART_begin();
	INTRQ = 0;
	sei();
	UART_rx_off();
	UART_print("\rOK\r");

	PBC |= (1 << SDA);
	PBC |= (1 << SCL);

	setTime(12, 30, 45, 1, 8, 2, 15); // 12:30:45 CN 08-02-2015

	while (1)
	{
		/* Đọc dữ liệu của DS1307 */
		readDS1307();

		/* Hiển thị thời gian ra Serial monitor */
		digitalClockDisplay();

		_delay_ms(900);
		_delay_ms(900);
		_delay_ms(900);
	}
}

// interrupt vector
void interrupt(void) __interrupt(0)
{
	//timer2 interrupt
	if (INTRQ & INTRQ_TM2)
	{
		INTRQ &= ~INTRQ_TM2; // Mark TM2 interrupt request processed
		TIM2_interrupt();
	}
	//external PB5 interrupt
	if (INTRQ & INTRQ_PB5)
	{
		INTRQ &= ~INTRQ_PB5; // Mark TM2 interrupt request processed
		PB5_interrupt();
	}
}
