/*
* pdk_lcdi2c.c
*
* Created: 12/21/2018 11:30:50 AM
*  Author: Van_BasTai
*/

#include "include.h"
#include "delay.h"
#include "pdk_i2c.h"
#include "pdk_lcdi2c.h"

uint8_t lcdReg = 0;

void LCDI2C_config(void)
{
	_delay_ms(100);
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
	
	LCDI2C_writeCommand(LCD_DISPLAYCONTROL | LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF);// Display control
	_delay_ms(1);
	LCDI2C_writeCommand(LCD_ENTRYMODESET | LCD_ENTRYLEFT);// Enter mode set
	_delay_ms(1);
	
	// clear LCD
	LCDI2C_writeCommand(LCD_CLEARDISPLAY);
	_delay_ms(1);
}

void LCDI2C_write8(uint8_t cmd)
{
	I2C_beginTransmission(LCDI2C_ADDRESS);
	I2C_write(cmd);
	I2C_endTransmission();	
	_delay_us(20);
}

void LCDI2C_writeCommand(uint8_t cmd)// cmd = 0, data = 1
{
	uint8_t HNib, LNib, temp;
	temp = lcdReg & 0x0F;
	
	temp &= ~LCDI2C_RS;
	
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

void LCDI2C_writeData(uint8_t data)// cmd = 0, data = 1
{
	uint8_t HNib, LNib, temp;
	temp = lcdReg & 0x0F;
	temp |= LCDI2C_RS;
	
	HNib = data & 0xF0;
	LNib = (data<<4) & 0xF0;
	
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

void LCDI2C_goTo(uint8_t y, uint8_t x)
{
	uint8_t ddram;
	if (y > 2)// row 3,4 of 20x4 LCD
		ddram = 0x40 * (y-3) + (x-1) + 0x14 + LCD_SETDDRAMADDR;// calculate ddram address
	else // row 1, 2
		ddram = 0x40 * (y-1) + (x-1) + LCD_SETDDRAMADDR; // calculate ddram address
	
	LCDI2C_writeCommand(ddram);
	_delay_us(100);
}

void LCDI2C_putC(uint8_t chr)
{
	LCDI2C_writeData(chr);
}
void LCDI2C_print(char* str)
{
  while (*str)// loop through entire string
  {
		LCDI2C_putC(*str);
		str++;
  }
}

void LCDI2C_blackLight(uint8_t stt)
{
	if (stt) lcdReg |= LCD_BACKLIGHT;
	else lcdReg &= ~LCD_BACKLIGHT;
	LCDI2C_write8(lcdReg);
}