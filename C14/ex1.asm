#Write a program to evaluate a polynomial, similar to newMult.asm from the
#chapter. Evaluate the polynomial:
#
#3x2 + 5x - 12
#
#Pick a register to contain x and initialize it to an integer value
#(positive or negative) at the beginning of the program. Assume that x is small
#enough so that all results remain in the lo result register. Evaluate the
#polynomial and leave its value in a register.
#
#Verify that the program works by using several initial values for x. Use x = 0
#and x = 1 to start since this will make debugging easy.
#Optional: write the program following the hardware rule that two or more
#instructions must follow a mflo instruction before another mult instruction.
#Try to put useful instructions in the two slots that follow the mflo. Otherwise
#put no-op instructions, sll $0,$0,0, in the two slots.



        .text
        .globl main

main:
        #x
        ori $8, $0, 4
        #x^2
        mult $8, $8
        mflo $9
        #3x^2
        ori $10, $0, 3
        sll $0,$0,0
        mult $9, $10
        mflo $9

        #5
        ori $10, $0, 5
        sll $0, $0, 0
        #5x
        mult $10, $8
        mflo $10

        add $9, $9, $10

        addi $9,$9,-12