/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/

#include "extern.h"
#include "include.h"
#include "pdk_i2c.h"

uint8_t rxBufferIndex;
uint8_t rxBufferLength;
uint8_t rxBuffer[8];

uint8_t txBufferIndex;
uint8_t txBufferLength;
uint8_t txBuffer[8];

uint16_t Point;

// send ack
void I2C_ack()
{
	I2C_delay();
	I2C_SDA = 0;
	I2C_delay();
	I2C_SCL = 1;
	I2C_delay();
	I2C_SCL = 0;
	I2C_delay();
}

//send nack
void I2C_Noack()
{
	I2C_delay();
	I2C_SDA = 1;
	I2C_delay();
	I2C_SCL = 1;
	I2C_delay();
	I2C_SCL = 0;
	I2C_delay();
}

// send start
void I2C_start()
{
	I2C_SCL = 1;
	I2C_SDA = 1;
	I2C_delay();
	I2C_SDA = 0;
	I2C_delay();
	I2C_SCL = 0;
	I2C_delay();
}

// send stop
void I2C_stop()
{
	I2C_SCL = 0;
	I2C_SDA = 0;
	I2C_delay();
	I2C_SCL = 1;
	I2C_delay();
	I2C_SDA = 1;
	I2C_delay();
}

// config I2C pin
void I2C_begin()
{
	$ I2C_SDA Out, Pull;
	$ I2C_SCL Out, Pull;
}

// send data
void I2C_write_t(uint8_t dat)
{
	uint8_t i = 0;
	while(i < 8)
	{
		sl dat;// shift left, get the highest bit
		swapc I2C_SDA;// swap with I2C_SDA

		I2C_delay();
		I2C_SCL = 1;
		I2C_delay();
		I2C_SCL = 0;
		i++;
	}
	$ I2C_SDA In, Pull;// set SDA input to receive data
	I2C_delay();
	I2C_SCL = 1;
	I2C_delay();
	I2C_SCL = 0;
	$ I2C_SDA Out, Pull;// set SDA output prepare for next time
}

// read data
void I2C_read_t(uint8_t ack)
{
	uint8_t dat = 0x00;
	$ I2C_SDA In, Pull;
	uint8_t i = 0;
	while (i < 8) // For loop read data 1 byte
	{
		I2C_delay();
		I2C_SCL = 1;
		sl dat;//shift left
		//dat = dat << 1;
		if (I2C_SDA)
			dat = dat | 0x01; // Keep bit data in dat

		I2C_delay();
		I2C_SCL = 0; // Clear I2C_SCL
		i++;
	}
	$ I2C_SDA Out, Pull;
	if (ack == 0)
		I2C_Noack();
	else
		I2C_ack();

	A = dat;
}

void I2C_beginTransmission(uint8_t addr)
{
	txBufferIndex = 0;
	txBufferLength = 0;

	// send start condittion
	I2C_start();

	//send slave address
	I2C_write_t((addr << 1) | I2C_WRITE_MODE);
}

// add data to txbuffer
void I2C_write(uint8_t data)
{
	Point = txBuffer + txBufferIndex;
	txBufferIndex++;
	*Point = data;
	txBufferLength = txBufferIndex;
}
/*
void I2C_write_Buffer(uint8_t *data, uint8_t len)
{
	uint8_t i = 0;
	while(i < len)
	{
		I2C_write(data[i]);
		i++;
	}
}
*/

void I2C_endTransmission(void)
{
	uint8_t i = 0;

	while (i < txBufferLength)
	{
		//send 1 byte data register address to read
		Point = txBuffer + i;
		I2C_write_t(*Point);
		i++;
	}

	//set stop condition
	I2C_stop();
}

void I2C_requestFrom(uint8_t addr, uint8_t len)
{
	uint8_t i = 0;
	rxBufferLength = len - 1;
	rxBufferIndex = 0;

	//start condittion - S
	I2C_start();

	//send slave address
	I2C_write_t((addr << 1) | I2C_READ_MODE);

	// receive len - 1 byte
	while(i < rxBufferLength)
	{
		Point = rxBuffer + i;
		I2C_read_t(BIT_ACK);
		*Point = A;
		i++;
	}
	Point = rxBuffer + rxBufferLength;
	rxBufferLength++;
	I2C_read_t(BIT_NACK);
	*Point = A;

	//set stop after ADDR is cleared
	I2C_stop();
}

// read data from rxBuffer
void I2C_read(void)
{
	uint8_t value = 0;
	// get each successive byte on each call
	if (rxBufferIndex < rxBufferLength)
	{
		Point = rxBuffer + rxBufferIndex;
		//value = rxBuffer[rxBufferIndex];
		rxBufferIndex++;
	}
	A = *Point;
}

