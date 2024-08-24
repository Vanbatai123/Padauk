
#include "extern.h"
#include "include.h"
#include "pdk_lcd1602.h"

void LCD1602_writeCmd(uint8_t cmd)
{
	set0 LCD_RS;
	sl cmd; swapc LCD_D7; // shift left, get the highest bit and swap with LCD_D*
	sl cmd; swapc LCD_D6;
	sl cmd; swapc LCD_D5;
	sl cmd; swapc LCD_D4;

	// latch data
	set1 LCD_EN; //enable
	set0 LCD_EN; //disable

	sl cmd; swapc LCD_D7; // shift left, get the highest bit and swap with LCD_D*
	sl cmd; swapc LCD_D6;
	sl cmd; swapc LCD_D5;
	sl cmd; swapc LCD_D4;

	// latch data
	set1 LCD_EN; //enable
	set0 LCD_EN; //disable
}

void LCD1602_writedata(uint8_t dt)
{
	set1 LCD_RS;
	sl dt; swapc LCD_D7; // shift left, get the highest bit and swap with LCD_D*
	sl dt; swapc LCD_D6;
	sl dt; swapc LCD_D5;
	sl dt; swapc LCD_D4;

	// latch data
	set1 LCD_EN; //enable
	set0 LCD_EN; //disable

	sl dt; swapc LCD_D7; // shift left, get the highest bit and swap with LCD_D*
	sl dt; swapc LCD_D6;
	sl dt; swapc LCD_D5;
	sl dt; swapc LCD_D4;

	// latch data
	set1 LCD_EN; //enable
	set0 LCD_EN; //disable
}

void LCD1602_config(void)
{
	// IO config
	LCD_delay;
	$ LCD_EN Out, Pull;
	$ LCD_RS Out, Pull;
	$ LCD_D7 Out, Pull;
	$ LCD_D6 Out, Pull;
	$ LCD_D5 Out, Pull;
	$ LCD_D4 Out, Pull;

	//Function set
	LCD1602_writeCmd(0x20);
	LCD_delay;
	LCD1602_writeCmd(0x28);//4 bit mode, 2 line, 5x8 font
	LCD_delay;

	//Display control
	//LCD1602_writeCmd(0x0C);
	LCD1602_writeCmd(0x0E);// has cursor
	LCD_delay;

	//Entry mode set
	LCD1602_writeCmd(0x06);
	LCD_delay;
}

void LCD1602_home(void)
{
	LCD1602_writeCmd(0x02);
	LCD_delay;
}

void LCD1602_goTo(uint8_t y, uint8_t x)
{
	uint8_t ad;
	ad = (x-1) + 0x80;
	if(y == 2)
		ad += 64;

	LCD1602_writeCmd(ad);
	LCD_delay;
}


void LCD1602_putC(uint8_t chr)
{
	LCD1602_writedata(chr);
	LCD_delay;
}
/*
void LCD1602_print(uint8_t* str)
{
	WORD Point;
	Point = str;

	while(Point)
	{
		LCD1602_PutC(Point);
		Point++;
	}
}
*/

void LCD1602_printNum(uint16_t num)
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
		LCD1602_PutC(digit + 48);
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
		LCD1602_PutC(digit + 48);
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
		LCD1602_PutC(digit + 48);
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
		LCD1602_PutC(digit + 48);
		f = 1;
	}
	// check and print x
	LCD1602_PutC(num + 48);
}

void LCD1602_clear()
{
	LCD1602_writeCmd(0x01);
	LCD_delay;
	LCD_delay;
	LCD_delay;
}

