/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/


#ifndef PDK_I2C_H
#define PDK_I2C_H

#define I2C_SDA         3
#define I2C_SCL         2
#define I2C_PxC     PBC
#define I2C_Px      PB
#define I2C_PxDIER  PBDIER
#define I2C_PxPH    PBPH

#define SCL1    I2C_Px |= (1<<I2C_SCL)
#define SDA1    I2C_Px |= (1<<I2C_SDA)
#define SCL0    I2C_Px &= ~(1<<I2C_SCL)
#define SDA0    I2C_Px &= ~(1<<I2C_SDA)



// I2C direction
#define I2C_READ	1
#define I2C_WRITE	0

#define ACK	    1
#define NACK	0

void I2C_begin(void);
void I2C_start();
void I2C_stop();
uint8_t I2C_write_t(uint8_t dat);
uint8_t I2C_read_t(uint8_t ack);

void I2C_beginTransmission(uint8_t addr);
void I2C_write(uint8_t data);
void I2C_writeBuffer(uint8_t *data, uint8_t len);
void I2C_endTransmission(void);
void I2C_requestFrom(uint8_t addr, uint8_t len);
int8_t I2C_read(void);
char I2C_available(void);

void I2C_Ack(void);
void I2C_NoAck(void);

#endif