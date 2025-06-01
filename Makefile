FILE=blink
all: $(FILE).hex

$(FILE).o: $(FILE).asm
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb $< -o $@

$(FILE).elf: $(FILE).o
	arm-none-eabi-ld -T nRF52833.ld $^ -o $@ -Map $*.map
	arm-none-eabi-size $@

$(FILE).hex: $(FILE).elf
	arm-none-eabi-objcopy -O ihex $< $@

clean:
	rm -f *.hex *.elf *.bin *.map *.o