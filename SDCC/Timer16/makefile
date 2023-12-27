all:
	sdcc  -mpdk15 -c pdk_uart.c 
	sdcc  -mpdk15 timer16.c pdk_uart.rel
	./srec_cat.exe -Disable_Sequence_Warnings  timer16.ihx -Intel -Output_Block_Size=16  -o timer16.hex -Intel
build:
	./easypdkprog.exe -n PFS173 write timer16.ihx --noverify
	./easypdkprog.exe start
probe:
	./easypdkprog.exe probe
run:
	./easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel