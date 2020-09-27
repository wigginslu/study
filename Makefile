

all:
	arm-linux-gcc -c -o pointer_test.o pointer_test.c 
	
	arm-linux-gcc -c -o start.o start.S 
	
	arm-linux-ld -Ttext 0 start.o pointer_test.o  -o pointer_test.elf
	
	arm-linux-objcopy -O binary -S pointer_test.elf pointer_test.bin
	
	arm-linux-objdump -D pointer_test.elf > pointer_test.dis
clean:
	rm *.bin *.o *.elf *.dis
