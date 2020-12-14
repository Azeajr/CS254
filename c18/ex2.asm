# With an ori instruction, initialize $8 to a bit pattern that represents a
# positive integer. Now the program determines how many significant bits are
# in the pattern.
        .text
        .globl main

main:
        ori     $7, $0, 0x0000
        sll     $7, $7, 16
        ori     $7, $7, 0x0000
        ori     $6, $0, 1


init:   ori     $8, $0, 0

test:   sltiu   $9, $8, 32
        beq     $9, $0, endLp
        sll     $0, $0, 0

        sll     $10, $7, $8

        srl     $10, $10, 31

        beq     $10, $6, endLp
        sll     $0, $0, 0



        addiu   $8, $8, 1
        j       test

endLp:  sll     $0, $0, 0
        ori     $9, $0, 32
        sub     $8, $9, $8