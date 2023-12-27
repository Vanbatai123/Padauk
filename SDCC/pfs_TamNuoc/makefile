all:
	sdcc  -mpdk15 pfs173_TamNuoc.c
	./srec_cat.exe -Disable_Sequence_Warnings  pfs173_TamNuoc.ihx -Intel -Output_Block_Size=16  -o pfs173_TamNuoc.hex -Intel
	./easypdkprog.exe -n PFS173 --noverify write pfs173_TamNuoc.ihx
build:
	#./easypdkprog.exe -n PFS173 write pfs173_TamNuoc.ihx
	./easypdkprog.exe -n PFS173 --noverify write pfs173_TamNuoc.ihx
	./easypdkprog.exe start
flash:
	./easypdkprog.exe -n PFS173 --noverify write pfs173_TamNuoc.ihx
probe:
	./easypdkprog.exe probe
run:
	./easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel