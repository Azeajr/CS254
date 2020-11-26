## handMadeNeg.asm
## 
## Program to demonstrate two's complement negative
##
## The program adds +146 to -82, leaving the result in $10

        .text
        .globl main

main:
        ori     $7, $0, 146        # put +146 into $7
        #ori     $8, $0, 82        # put 82 into $8
        #nor     $8, $8, $0        # reflect the bits for 82
        #ori     $9, $0, 1        # add 1: 
        #addu    $8, $8, $9        # $8 now contains -82 in two's comp
        #addu    $10, $7, $8        # (+146) + (-82)
        addiu   $10, $7, -82
## End of file