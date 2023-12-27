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

#define DL    _delay_us(2);


#define DS1307_SEC          0x00 //Giay
#define DS1307_MIN          0x01 //Phut
#define DS1307_HOUR         0x02 //Gio
#define DS1307_DAY          0x03 //Thu
#define DS1307_DATE         0x04 //Ngay
#define DS1307_MONTH        0x05 //Thang
#define DS1307_YEAR         0x06 //Nam


// I2C direction
#define I2C_READ	1
#define I2C_WRITE	0

#define ACK	1
#define NACK	0

void I2C_start();
void I2C_stop();
uint8_t I2C_write_t(uint8_t dat);
uint8_t I2C_read_t(uint8_t ack);

void I2C_beginTransmission(uint8_t addr);
void I2C_write2(uint8_t data);
void I2C_writeBuffer(uint8_t *data, uint8_t len);
void I2C_endTransmission(void);
void I2C_requestFrom(uint8_t addr, uint8_t len);
int8_t I2C_read(void);
void I2C_endTransmission2(void);

void I2C_Ack(void);
void I2C_NoAck(void);

#endif