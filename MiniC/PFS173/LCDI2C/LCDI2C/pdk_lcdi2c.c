/*
 * pdk_lcdi2c.c
 * Created: 2024/08/24
 * Author: taivb
*/

#include "extern.h"
#include "include.h"
#include "pdk_lcdi2c.h"
#include "pdk_i2c.h"

uint8_t lcdReg = 0;

void LCDI2C_config()
{
	_delay_ms(300);
	lcdReg = 0;
	I2C_begin();

	LCDI2C_write8(0x00);
	_delay_ms(1);
	LCDI2C_write8(0x04);
	_delay_ms(1);
	LCDI2C_write8(0x00);
	_delay_ms(1);
	LCDI2C_write8(0x04);
	_delay_ms(1);
	LCDI2C_write8(0x00);
	_delay_ms(1);
	LCDI2C_write8(0x04);
	_delay_ms(1);
	LCDI2C_write8(0x00);
	_delay_ms(1);

	LCDI2C_write8(0x20);// function set// 4 bit mode, 2 line, 5x8 font
	_delay_ms(1);
	LCDI2C_write8(0x24);
	_delay_ms(1);
	LCDI2C_write8(0x20);
	_delay_ms(1);

	LCDI2C_write(I2C_CMD, LCD_DISPLAYCONTROL | LCD_DISPLAYON | LCD_CURSORON | LCD_BLINKOFF);// Display control
	_delay_ms(1);
	LCDI2C_write(I2C_CMD, LCD_ENTRYMODESET | LCD_ENTRYLEFT);// Enter mode set
	_delay_ms(1);
}

void LCDI2C_write8(uint8_t cmd)
{
	I2C_beginTransmission(LCDI2C_ADDRESS);
	I2C_write(cmd);
	I2C_endTransmission();
	_delay_us(50);
}

void LCDI2C_write(uint8_t cd, uint8_t cmd)// cmd = 0, data = 1
{
	uint8_t HNib, LNib, temp;
	temp = lcdReg & 0x0F;
	if (cd == I2C_DATA) temp |= LCDI2C_RS;
	else temp &= ~LCDI2C_RS;

	HNib = cmd & 0xF0;
	LNib = (cmd<<4) & 0xF0;

	lcdReg = HNib | temp;
	LCDI2C_write8(lcdReg);
	lcdReg |= LCDI2C_EN;
	LCDI2C_write8(lcdReg);
	lcdReg &= ~LCDI2C_EN;
	LCDI2C_write8(lcdReg);

	lcdReg = LNib | temp;
	LCDI2C_write8(lcdReg);
	lcdReg |= LCDI2C_EN;
	LCDI2C_write8(lcdReg);
	lcdReg &= ~LCDI2C_EN;
	LCDI2C_write8(lcdReg);
}

void LCDI2C_wait()
{
	_delay_ms(1);
}
void LCDI2C_home()
{
	LCDI2C_write(I2C_CMD, LCD_RETURNHOME);
	_delay_ms(2);
}

void LCDI2C_goTo(uint8_t y,uint8_t x)
{

	uint8_t ad;
	ad = (x-1) + 0x80;
	if(y == 2)
		ad += 64;

	LCDI2C_write(I2C_CMD, ad);
	LCD_delay;
}

void LCDI2C_putC(uint8_t chr)
{
	LCDI2C_write(I2C_DATA, chr);
	_delay_ms(1);
}
/*void LCDI2C_print(char* str)
{
	uint8_t i;
	for (i = 0; str[i] != 0; i++)
	LCDI2C_putC(str[i]);
}
*/

void LCDI2C_printNum(uint16_t num)
{
	uint8_t digit = 0;
	uint8_t f = 0;

	// check and print x0000
	while(num>=10000)
	{
		num -= 10000;
		digit += 1;
	}
	if(f != 0 || digit != 0)
	{
		LCDI2C_PutC(digit + 48);
		f = 1;
	}
	// check and print x000
	digit = 0;
	while(num>=1000)
	{
		num -= 1000;
		digit += 1;
	}
	if(f != 0 || digit != 0)
	{
		LCDI2C_PutC(digit + 48);
		f = 1;
	}
	// check and print x00
	digit = 0;
	while(num>=100)
	{
		num -= 100;
		digit += 1;
	}
	if(f != 0 || digit != 0)
	{
		LCDI2C_PutC(digit + 48);
		f = 1;
	}
	// check and print x0
	digit = 0;
	while(num>=10)
	{
		num -= 10;
		digit += 1;
	}
	if(f != 0 || digit != 0)
	{
		LCDI2C_PutC(digit + 48);
		f = 1;
	}
	// check and print x
	LCDI2C_PutC(num + 48);
}


void LCDI2C_clear()
{
	LCDI2C_write(I2C_CMD, LCD_CLEARDISPLAY);
	_delay_ms(1);
}
void LCDI2C_blackLight(uint8_t stt)
{
	if (stt) lcdReg |= LCD_BACKLIGHT;
	else lcdReg &= ~LCD_BACKLIGHT;
	LCDI2C_write(I2C_CMD, lcdReg);
}
