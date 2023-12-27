all:
	make clean
	sdcc  -mpdk15 -c pdk_uart.c
	sdcc  -mpdk15 main.c pdk_uart.rel
	./srec_cat.exe -Disable_Sequence_Warnings  main.ihx -Intel -Output_Block_Size=16  -o main.hex -Intel
build:
	#./easypdkprog.exe -n PFS173 write main.ihx
	./easypdkprog.exe -n PFS173 --noverify write main.ihx
	./easypdkprog.exe start
probe:
	./easypdkprog.exe probe
run:
	./easypdkprog.exe start
clean:
	rm -rf *.ihx
	rm -rf *.hex
	rm -rf *.rel