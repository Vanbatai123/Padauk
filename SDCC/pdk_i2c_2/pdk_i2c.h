/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/


#ifndef PDK_I2C_H
#define PDK_I2C_H

#define SCL    7
#define SDA    6

#define SCL1    PB |= (1<<SCL)
#define SDA1    PB |= (1<<SDA)
#define SCL0    PB &= ~(1<<SCL)
#define SDA0    PB &= ~(1<<SDA)


#define DS1307_SEC          0x00 //Giay
#define DS1307_MIN          0x01 //Phut
#define DS1307_HOUR         0x02 //Gio
#define DS1307_DAY          0x03 //Thu
#define DS1307_DATE         0x04 //Ngay
#define DS1307_MONTH        0x05 //Thang
#define DS1307_YEAR         0x06 //Nam



void I2C_start();
void I2C_stop();
uint8_t I2C_write(uint8_t dat);
uint8_t I2C_read(void);
void DS1307_Write(uint8_t addr, uint8_t dat);
uint8_t DS1307_Read(uint8_t addr);
void DS1307_Set(uint8_t sec, uint8_t min, uint8_t hour, uint8_t day, uint8_t month, uint8_t year);

#endif