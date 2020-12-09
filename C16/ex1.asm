# Write a program that adds the values up, computes the average, and stores the
# result in a memory location. Is the average correct?
#
# Yes, the average is correct.  There are two easily-made errors in this
# program.  I belive them to be, using lb intead of lbu since we are dealing
# with unsigned values and the second is not including a nop after lbu to allow
# time for the register to be laoded.
        .text
        .globl main

main:

        lui     $8, 0x1000
        lbu     $10, 0($8)
        
        lbu     $9, 1($8)
        sll     $0, $0, 0
        addu    $10, $10, $9
        
        lbu     $9, 2($8)
        sll     $0, $0, 0
        addu    $10, $10, $9

        lbu     $9, 3($8)
        sll     $0, $0, 0
        addu    $10, $10, $9

        lbu     $9, 4($8)
        sll     $0, $0, 0
        addu    $10, $10, $9

        ori     $9, $0, 5
        divu    $10, $9

        mflo    $9
        mfhi    $10


        .data
        .byte 12
        .byte 97
        .byte 133
        .byte 82
        .byte 236