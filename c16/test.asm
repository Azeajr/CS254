# Running some tests to better understand the endianness of the emulator.

        .text
        .globl main
main:
        lui     $5, 0x1000
        lh      $8, 0($5)
        sll     $0, $0, 0
        sll     $0, $0, 0


        .data
        .byte 0x80
        .byte 0x00