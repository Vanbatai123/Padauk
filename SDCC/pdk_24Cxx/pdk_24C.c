/*
 * pdk_24C.h
 * Created: 2021/06/17
 * Author: taivb
*/

#include "include.h"
#include "pdk_i2c.h"
#include "pdk_24C.h"
#include "delay.h"

#define EEPROM_BUFF_LEN 30 /* Arduino Wire Buffer is 32 bytes, 2 are used for address */

void AT24C_write(uint16_t address, uint8_t data)
{
    if ((address >= MEM_BYTE) | (AT24C_read(address) == data))
    {
        return; // thoát ngay
    }

#if MEMSIZE <= 2
    I2C_beginTransmission(MEMADDR);
    I2C_write(address); //địa chỉ 8 bit
#elif MEMSIZE <= 16

    I2C_beginTransmission(MEMADDR | ((address >> 8) & 0x07));
    I2C_write(address & 0xFF);
#elif MEMSIZE <= 256
    I2C_beginTransmission(MEMADDR);
    I2C_write(address >> 8);
    I2C_write(address & 0xFF);
#endif

    I2C_write(data);
    I2C_endTransmission();
    _delay_ms(5);
}

uint8_t AT24C_read(uint16_t address)
{

    if (address >= MEM_BYTE)
    {
        return 0; // thoát ngay
    }

    uint8_t data = 0;
#if MEMSIZE <= 2

    I2C_beginTransmission(MEMADDR);
    I2C_write(address);
    I2C_endTransmission();
    I2C_requestFrom(MEMADDR, 1);

#elif MEMSIZE <= 16
    I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
    I2C_write(address & 0xFF);
    I2C_endTransmission();
    I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), 1);
#elif MEMSIZE <= 256
    I2C_beginTransmission(MEMADDR);
    I2C_write(address >> 8);
    I2C_write(address & 0xFF);
    I2C_endTransmission();
    I2C_requestFrom(MEMADDR, 1);
#endif
    if (I2C_available())
    {
        data = I2C_read();
        return data;
    }
    return -1;
}

/* Constructor for serialEEPROM class */

void AT24C_erase(void)
{
    for (uint16_t i = 0; i < MEM_BYTE; i++)
    {
        if ((AT24C_read(i) != 0xFF))
        {
            AT24C_write(i, 0xFF);
        }
    }
}

void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len)
{
    // Memory protection, don't write beyond memory limits
    if ((address + len) >= MEM_BYTE)
    {
        len = (MEM_BYTE - address);
    }

    for (uint8_t i = 0; i < len; i++)
    {
        AT24C_write(address + i, src[i]);
    }
}

void AT24C_readBuf(uint16_t address, uint8_t *dest, int len)
{
    uint8_t data = 0;

    /* Read protection, don't read beyond memory limits */
    if ((address + len) >= MEM_BYTE)
    {
        len = (MEM_BYTE - address);
    }

#if MEMSIZE <= 2
    I2C_beginTransmission(MEMADDR);
    I2C_write(address);
    I2C_endTransmission();
    I2C_requestFrom(MEMADDR, len);
#elif MEMSIZE <= 16
    I2C_beginTransmission((MEMADDR | ((address >> 8) & 0x07)));
    I2C_write(address & 0xFF);
    I2C_endTransmission();
    I2C_requestFrom((MEMADDR | ((address >> 8) & 0x07)), len);
#elif MEMSIZE <= 256
    I2C_beginTransmission(MEMADDR);
    I2C_write(address >> 8);
    I2C_write(address & 0xFF);
    I2C_endTransmission();
    I2C_requestFrom(MEMADDR, len);
#endif
    while (I2C_available())
    {
        *dest++ = I2C_read();
    }
}