all:
	sdcc  -mpdk15 pfs173_ex_interrupt.c
	.\srec_cat.exe -Disable_Sequence_Warnings  pfs173_ex_interrupt.ihx -Intel -Output_Block_Size=16  -o pfs173_ex_interrupt.hex -Intel
build:
	#.\easypdkprog.exe -n PFS173 write pfs173_ex_interrupt.ihx
	.\easypdkprog.exe -n PFS173 --noverify write pfs173_ex_interrupt.ihx
	.\easypdkprog.exe start
probe:
	.\easypdkprog.exe probe
run:
	.\easypdkprog.exe start
clean:
	rm *.ihx
	rm *.hex
	rm *.rel