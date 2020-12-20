# Write a program that determines if an integer stored in memory is a perfect 
# number. Set a location in memory to 1 if the number is perfect, to 0 if not.


        .text
        .globl main

main:   or      $4, $0, $0
        lui     $5, 0x1000
        lw      $6, 0($5)
        sll     $0, $0, $0


init:   ori     $8, $0, 1



test:   sltu    $9, $8, $6
        beq     $9, $0, endLp
        sll     $0, $0, 0
        
        div     $6, $8
        mfhi    $9

        bne     $9, $0, notFactor
        sll     $0, $0, $0

        addu     $4, $4, $8

notFactor:

        addiu   $8, $8, 1
        j       test
        sll     $0, $0, $0

endLp:  sll     $0, $0, 0
        bne     $4, $6, notperfect

        ori     $9, $0, 1
        sw      $9, 4($5)


notperfect:
        sll     $0, $0, $0



            .data
N:          .word       8128
isperfect:  .word       0