/*
 * lcd1602.h
 * Created: 2018/11/29
 * Author: taivb
*/

#define LCD_EN      PB.0
#define LCD_RS      PB.1

#define LCD_CMD     0
#define LCD_DATA    1

#define LCD_D4      PB.3
#define LCD_D5      PA.3
#define LCD_D6      PA.4
#define LCD_D7      PA.0

#define LCD_delay   .delay 8000

void LCD1602_writeCmd(uint8_t cmd);
void LCD1602_writeData(uint8_t data);
void LCD1602_config(void);
void LCD1602_home(void);
void LCD1602_goTo(uint8_t y, uint8_t x);
void LCD1602_putC(uint8_t chr);
//void LCD1602_Print(uint8_t* str);
void LCD1602_printNum(uint16_t num);
void LCD1602_clear(void);

