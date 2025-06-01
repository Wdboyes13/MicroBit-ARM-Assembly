.syntax unified
.cpu cortex-m4
.thumb
.global _start

.section .vectors
.word __stack
.word _start

.text
.thumb_func
_start:

    // Init: Set column and row pins as outputs
    ldr r0, =0x50000518       // DIRSET
    ldr r1, =((1 << 22) | (1 << 28) | (1 << 31) | (1 << 11) | (1 << 30) | (1 << 21) | (1 << 24) | (1 << 19)) // COL1, COL 2, COL 3, COL5, ROW1, ROW4, ROW5
    str r1, [r0]

    ldr r0, =0x50000818       // DIRSET
    ldr r1, =((1 << 5)) // COL 4
    str r1, [r0]

loop:
   loop:
    // -- RESET COL'S --
    ldr r0, =0x50000508
    ldr r1, =((1 << 28) | (1 << 30) | (1 << 31) | (1 << 11))
    str r1, [r0]

    ldr r0, =0x50000808
    ldr r1, =(1 << 5)
    str r1, [r0]

    // --- ROW 1 ---
    // Drive COL1 + COL5 +  COL2 + COL4 LOW
    ldr r0, =0x5000050C
    ldr r1, =((1 << 28) | (1 << 30) | (1 << 11))
    str r1, [r0]
    ldr r0, =0x5000080C
    ldr r1, =(1 << 5)
    str r1, [r0]

    // Drive ROW1 HIGH
    ldr r0, =0x50000508
    ldr r1, =(1 << 21)
    str r1, [r0]

    bl delay

    // Turn off ROW1
    ldr r0, =0x5000050C
    ldr r1, =(1 << 21)
    str r1, [r0]

    // -- ROW 2 --

    ldr r0, =0x5000050C
    ldr r1, =((1 << 28) | (1 << 30))
    str r1, [r0]

    // Drive ROW2 HIGH
    ldr r0, =0x50000508
    ldr r1, =(1 << 22)
    str r1, [r0]

    bl delay

    // Reset columns
    ldr r0, =0x50000508
    ldr r1, =((1 << 28) | (1 << 30) | (1 << 11))
    str r1, [r0]

    ldr r0, =0x50000808
    ldr r1, =(1 << 5)
    str r1, [r0]

    // Turn off ROW2
    ldr r0, =0x5000050C
    ldr r1, =(1 << 22)
    str r1, [r0]

    // --- ROW 4 ---
    // Drive COL1 + COL5 LOW again
    ldr r0, =0x5000050C
    ldr r1, =((1 << 28) | (1 << 30))
    str r1, [r0]

    // Drive ROW4 HIGH
    ldr r0, =0x50000508
    ldr r1, =(1 << 24)
    str r1, [r0]

    bl delay

    // Turn off ROW4
    ldr r0, =0x5000050C
    ldr r1, =(1 << 24)
    str r1, [r0]


    // --- ROW 5 ---
    // Drive COL3 + COL2 LOW
    ldr r0, =0x5000050C
    ldr r1, =((1 << 31) | (1 << 11))
    str r1, [r0]

    // Drive COL4 LOW
    ldr r0, =0x5000080C
    ldr r1, =(1 << 5)
    str r1, [r0]


    // Set COL1 + COL5 HIGH again (so they're not accidentally still LOW)
    ldr r0, =0x50000508
    ldr r1, =((1 << 28) | (1 << 30))
    str r1, [r0]

    // Drive ROW5 HIGH
    ldr r0, =0x50000508
    ldr r1, =(1 << 19)
    str r1, [r0]

    bl delay

    // Turn off ROW5
    ldr r0, =0x5000050C
    ldr r1, =(1 << 19)
    str r1, [r0]

    b loop

delay:
    mov r2, #0
    mov r3, #0x2000
dloop:
    subs r3, r3, #1
    bne dloop
    bx lr