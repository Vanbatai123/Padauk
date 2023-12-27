all:
	sdcc  -mpdk15 -c delay.c
	sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 -c pdk_i2c.c
	sdcc  -mpdk15 -c pdk_24c.c
	sdcc  -mpdk15 pdk_24Cxx_PROG.c pdk_uart.rel pdk_i2c.rel delay.rel pdk_24c.rel
	.\srec_cat.exe -Disable_Sequence_Warnings  pdk_24Cxx_PROG.ihx -Intel -Output_Block_Size=16  -o pdk_24Cxx_PROG.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 write pdk_24Cxx_PROG.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pdk_24Cxx_PROG.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel