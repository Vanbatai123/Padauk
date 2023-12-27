all:
	#sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 pfs173_uart_TIM.c #pdk_uart.rel
	.\srec_cat.exe -Disable_Sequence_Warnings  pfs173_uart_TIM.ihx -Intel -Output_Block_Size=16  -o pfs173_uart_TIM.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 write pfs173_uart_TIM.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pfs173_uart_TIM.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel