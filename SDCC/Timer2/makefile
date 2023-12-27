all:
	sdcc  -mpdk15 timer2.c
	# sdcc  -mpdk15 timer2.c
	# ./srec_cat.exe -Disable_Sequence_Warnings  timer2.ihx -Intel -Output_Block_Size=16  -o timer2.hex -Intel
build:
	./easypdkprog.exe -n PFS173 write timer2.ihx --noverify
	./easypdkprog.exe start
probe:
	./easypdkprog.exe probe
run:
	./easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel