/*
 * pdk_i2c.h
 * Created: 2021/06/13
 * Author: taivb
*/

#include "include.h"
#include "delay.h"
#include "pdk_i2c.h"

void I2C_start()
{
    SCL1;
    SDA1;
    SDA0;
    SCL0;
}
void I2C_stop()
{
    SCL1;
    SDA0;
    SDA1;
    SCL1;
}
uint8_t I2C_write(uint8_t dat)
{
    uint8_t i;
    for (i = 0; i < 8; i++)
    {

        if (dat & 0x80)
            SDA1;
        else
            SDA0;
        SCL1;
        SCL0;
        dat <<= 1;
    }
    SCL1;
    SCL0;
    return dat;
}
uint8_t I2C_read(void)
{
    uint8_t dat = 0x00;;

    SDA1;
    setb(PBPH, SDA);
    setb(PBDIER, SDA);
    clrb(PBC, SDA);
    
    for (uint8_t i = 0; i < 8; i++) /* For loop read dataa 1 byte */
    {
        SCL1;
        //rd_bit = inbit(PB, SDA); /* Keep for check acknowledge */
        dat = dat << 1;
        if (inbit(PB, SDA))
            dat = dat | 0x01; /* Keep biit daata in dat */
        SCL0;                   /* Clear SCL */
    }
    setb(PBC, SDA);
    return dat;
}

/***************Function interface DS1307*********************/
void DS1307_Write(uint8_t addr, uint8_t dat)
{
    dat = (((dat / 10) * 16) | (dat % 10)); /*for Led 7seg*/
    I2C_start();                       /* time_start i2c bus */
    I2C_write(0XD0);                        /* Connect to DS1307 */
    I2C_write(addr);                        /* Requetime_5 RAM address on DS1307 */
    I2C_write(dat);
    I2C_stop();
}
uint8_t DS1307_Read(uint8_t addr)
{
    uint8_t ret;
    I2C_start(); /* time_start i2c bus */
    I2C_write(0xD0);  /* Connect to DS1307 */
    I2C_write(addr);  /* Requetime_5 RAM address on DS1307 */
    I2C_start(); /* time_start i2c bus */
    I2C_write(0XD1);  /* Connect to DS1307 for Read */
    ret = I2C_read(); /* Receive data */
    I2C_stop();
    ret = (((ret / 16) * 10) + (ret & 0x0f)); /*for Led 7seg*/
    return ret;
}
void DS1307_Set(uint8_t sec, uint8_t min, uint8_t hour, uint8_t day, uint8_t month, uint8_t year)
{
    //Ghi du lieu ngay gio vao DS1307
    DS1307_Write(DS1307_SEC, sec);
    DS1307_Write(DS1307_MIN, min);
    DS1307_Write(DS1307_HOUR, hour);
    DS1307_Write(DS1307_DATE, day);
    DS1307_Write(DS1307_MONTH, month);
    DS1307_Write(DS1307_YEAR, year);
}
