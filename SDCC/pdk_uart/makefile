all:
	sdcc  -mpdk15 -c delay.c
	sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 pfs173_uart.c pdk_uart.rel delay.rel
	.\srec_cat.exe -Disable_Sequence_Warnings  pfs173_uart.ihx -Intel -Output_Block_Size=16  -o pfs173_uart.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 --noverify write 2.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pfs173_uart.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel