all:
	sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 pdk_Led_Ty_Gia.c pdk_uart.rel
	.\srec_cat.exe -Disable_Sequence_Warnings  pdk_Led_Ty_Gia.ihx -Intel -Output_Block_Size=16  -o pdk_Led_Ty_Gia.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 write pdk_Led_Ty_Gia.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pdk_Led_Ty_Gia.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel