## CS 254 Program 5
##
## Compute (25xy - 10x - 6y + 28)/7
##
## Programmer:  Antonio Zea
## Date:    03-26-2021
################################################################################
## $10 = Base register holding the address of the beginning of the data section
## $11 = x
## $12 = y 
## $12 = Coefficients after I am done using y variable
## $13 = accumulator
################################################################################
        .text
        .globl main

main:

        lui     $10, 0x1000
        lw      $11, 0($10)     # x
        lw      $12, 4($10)     # y

        ori     $13, $0, 25
        mult    $11, $13        # 25x
        mflo    $13             # $13 = 25x
        addi    $13, $13, -6    # $13 = 25x - 6
        sll     $0, $0, 0       # I belive this nop is necessary when writing
                                # MIPS assembly in actual hardware.  SPIM does
                                # not reproduce this effect none the less I opt 
                                # to write as though it is in hardware.
        mult    $12, $13        # y(25x - 6)
        mflo    $13             # $13 = 25xy - 6y

        
        ori     $12, $0, 10     # $12 longer needs to store y since I am done 
                                # with that variable
        sll     $0, $0, 0
        mult    $12, $11        # 10x
        mflo    $12             # $11 = 10x
        sub     $13, $13, $12   # $13 = 25xy - 10x - 6y

        ori     $12, $0, 28
        add     $13, $13, $12   # $13 = 25xy - 10x - 6y + 28
        
        ori     $12, $0, 7
        divu    $13, $12        # (25xy - 10x - 6y + 28) / 7

        mflo    $13             # $13 = quotient
        sw      $13, 8($10)     # answer = quotient

        mfhi    $13             # $13 = remainder
        sw      $13, 12($10)    # remainder = remainder

        .data
x:          .word   1
y:          .word   1
answer:     .word   0
remainder:  .word   0