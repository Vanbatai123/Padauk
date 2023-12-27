/*
 * pdk_24C.c
 * Created: 2021/06/17
 * Author: taivb
*/

#ifndef PDK_24C_H
#define PDK_24C_H

#define MEMSIZE 8 // AT24C08
#define MEMADDR 0x50
#define MEM_BYTE MEMSIZE * 128

void AT24C_write(uint16_t address, uint8_t data);

uint8_t AT24C_read(uint16_t address);

void AT24C_erase(void);

void AT24C_writeBuf(uint16_t address, uint8_t *src, uint8_t len);

void AT24C_writeBuf2(uint16_t address, uint8_t *src, uint8_t len);

void AT24C_readBuf(uint16_t address, uint8_t *dest, int len);

#endif