all:
	sdcc  -mpdk13 -c delay.c
	sdcc  -mpdk13 pms150_ws2812.c  delay.rel --iram-size 60
	./srec_cat.exe -Disable_Sequence_Warnings  pms150_ws2812.ihx -Intel -Output_Block_Size=16  -o pms150_ws2812.hex -Intel
build:
	#./easypdkprog.exe -n PFS173 write pms150_ws2812.ihx
	./easypdkprog.exe -n PFS173 --noverify write pms150_ws2812.ihx
	./easypdkprog.exe start
probe:
	./easypdkprog.exe probe
run:
	./easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel