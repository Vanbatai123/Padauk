all:
	sdcc  -mpdk15 -c delay.c
	sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 -c pdk_i2c.c
	sdcc  -mpdk15 pfs173_i2c.c pdk_uart.rel pdk_i2c.rel delay.rel
	.\srec_cat.exe -Disable_Sequence_Warnings  pfs173_i2c.ihx -Intel -Output_Block_Size=16  -o pfs173_i2c.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 write pfs173_i2c.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pfs173_i2c.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel