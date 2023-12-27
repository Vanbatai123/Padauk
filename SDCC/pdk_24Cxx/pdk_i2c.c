/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/

#include "include.h"
#include "pdk_i2c.h"
#include "delay.h"

uint8_t rxBufferIndex;
uint8_t rxBufferLength;
uint8_t rxBuffer[16];

uint8_t txBufferIndex;
uint8_t txBufferLength;
uint8_t txBuffer[16];

void I2C_Ack()
{
    _delay_us(4);
    SDA0;
    _delay_us(4);
    SCL1;
    _delay_us(4);
    SCL0;
    _delay_us(4);
}

void I2C_NoAck()
{
    _delay_us(4);
    SDA1;
    _delay_us(4);
    SCL1;
    _delay_us(4);
    SCL0;
    _delay_us(4);
}

void I2C_start()
{
    SCL1;
    SDA1;
    _delay_us(4);
    SDA0;
    _delay_us(4);
    SCL0;
    _delay_us(4);
}
void I2C_stop()
{
    SCL0;
    SDA0;
    _delay_us(4);
    SCL1;
    _delay_us(4);
    SDA1;
    _delay_us(4);
}
uint8_t I2C_write_t(uint8_t dat)
{
    for (uint8_t i = 0; i < 8; i++)
    {

        if (dat & 0x80)
            SDA1;
        else
            SDA0;

        _delay_us(4);
        SCL1;
        _delay_us(4);
        SCL0;
        dat <<= 1;
    }
    _delay_us(4);
    SCL1;
    _delay_us(4);
    SCL0;
    setb(I2C_PxC, I2C_SDA);
    return dat;
}

uint8_t I2C_read_t(uint8_t ack)
{
    uint8_t dat = 0x00;

    //SDA0;
    clrb(I2C_PxC, I2C_SDA);
    setb(I2C_PxPH, I2C_SDA);
    setb(I2C_PxDIER, I2C_SDA);

    for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
    {
        _delay_us(4);
        SCL1;
        dat = dat << 1;
        if (inbit(I2C_Px, I2C_SDA))
            dat = dat | 0x01; /* Keep biit daata in dat */

        _delay_us(4);
        SCL0; /* Clear SCL */
    }
    setb(I2C_PxC, I2C_SDA);
    if (ack == 0)
        I2C_NoAck();
    else
        I2C_Ack();

    return dat;
}

void I2C_beginTransmission(uint8_t addr)
{
    txBufferIndex = 0;
    txBufferLength = 0;

    // send start condittion
    I2C_start();

    //send slave address
    I2C_write_t((addr << 1) | I2C_WRITE);
}

void I2C_write(uint8_t data)
{
    txBuffer[txBufferIndex++] = data;
    txBufferLength = txBufferIndex;
}

void I2C_writeBuffer(uint8_t *data, uint8_t len)
{
    uint8_t i = 0;
    for (; i < len; ++i)
    {
        I2C_write(data[i]);
    }
}

void I2C_endTransmission(void)
{
    uint8_t i;

    for (i = 0; i < txBufferLength; ++i)
    {
        //send 1 byte data register address to read
        I2C_write_t(txBuffer[i]);
    }

    //set stop condition
    I2C_stop();
}

void I2C_requestFrom(uint8_t addr, uint8_t len)
{
    uint8_t i;
    rxBufferLength = len;
    rxBufferIndex = 0;

    //start condittion - S
    I2C_start();

    //send slave address
    I2C_write_t((addr << 1) | I2C_READ);

    // receive len - 1 byte
    for (i = 0; i < rxBufferLength - 1; i++)
    {
        rxBuffer[i] = I2C_read_t(ACK);
    }

    rxBuffer[rxBufferLength - 1] = I2C_read_t(NACK);

    //set stop after ADDR is cleared
    I2C_stop();
}

int8_t I2C_read(void)
{
    int8_t value = 5;
    // get each successive byte on each call
    if (rxBufferIndex < rxBufferLength)
    {
        value = rxBuffer[rxBufferIndex];
        ++rxBufferIndex;
    }
    return value;
}
char I2C_available(void)
{
    return rxBufferLength - rxBufferIndex;
}
void I2C_begin(void)
{
    I2C_PxC |= (1 << I2C_SDA);
    I2C_PxC |= (1 << I2C_SCL);
}
