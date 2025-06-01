# micro:bit v2 ASM Stuff  
I was bored, and tired of makecode  
so i did this :D  
  
If your reading the code, the comments may not be 100% accurate  
because im to lazy to update them  

## Running  
blink.asm is the code to display a happy face  
It can be built with the `make` command  
It will generate `blink.hex` which you can flash to a micro:bit v2  
  
If you want blink2 (Same thing but eyes are now 2x2 instead of 1x1)  
It can be built with `make FILE=blink2` Generating `blink2.hex`  

## Info Sources  
[Nordic Semiconductors - nRF52833 Product Specification (GPIO Section)](https://docs.nordicsemi.com/bundle/ps_nrf52833/page/gpio.html#topic)  
[micro:bit developer](https://tech.microbit.org/hardware/schematic/#v2-pinmap)  
** **  
The Makefile (With some modification) and Linker Script are from [this repo](https://github.com/cpmpercussion/microbit-v2-baremetal/)  
Which was also where i got the idea to do this from  
  
## About writing the code  
Because of how the LEDs in the micro:bit are wired  
I had to do something called LED Multiplexing  
Where you quickly loop through rows and columns  
Creating the illusion of a still image