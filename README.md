# micro:bit v2 ASM Stuff  
I was bored, and tired of makecode  
so i did this :D  

## Running  
blink.asm is the code to display a happy face  
It can be built with the `make` command  
It will generate `blink.hex` which you can flash to a micro:bit v2  

## Info Sources  
[Nordic Semiconductors - nRF52833 Product Specification (GPIO Section)](https://docs.nordicsemi.com/bundle/ps_nrf52833/page/gpio.html#topic)  
[micro:bit developer](https://tech.microbit.org/hardware/schematic/#v2-pinmap)  
** **  
The Makefile and Linker Script are from [this repo](https://github.com/cpmpercussion/microbit-v2-baremetal/)  
Which was also where i got the idea to do this from