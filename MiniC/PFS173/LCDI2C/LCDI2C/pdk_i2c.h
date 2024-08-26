/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/


#ifndef PDK_I2C_H
#define PDK_I2C_H

#define I2C_SDA             PB.1
#define I2C_SCL             PB.0

// I2C direction
#define I2C_READ_MODE       0x01
#define I2C_WRITE_MODE      0x00

#define BIT_ACK             0x01
#define BIT_NACK            0x00

// delay 4us
#define I2C_delay()         .delay 32

void I2C_start(void);
void I2C_stop(void);

void I2C_begin();
void I2C_beginTransmission(uint8_t addr);
void I2C_write(uint8_t data);
void I2C_writeBuffer(uint8_t *data, uint8_t len);
void I2C_endTransmission(void);
void I2C_requestFrom(uint8_t addr, uint8_t len);
void I2C_read(void);

void I2C_Ack(void);
void I2C_NoAck(void);

#endif

