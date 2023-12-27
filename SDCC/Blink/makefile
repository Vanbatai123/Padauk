all:
	sdcc  -mpdk15 -c gpio.c
	sdcc  -mpdk15 gpio.c
	.\srec_cat.exe -Disable_Sequence_Warnings  gpio.ihx -Intel -Output_Block_Size=16  -o gpio.hex -Intel
build:
	.\easypdkprog.exe -n PFS173 --noverify write gpio.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel