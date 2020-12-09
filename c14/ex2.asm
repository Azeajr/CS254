#Write a program similar to divEg.asm from the chapter to evaluate a rational
#function:
#
#(3x+7)/(2x+8)
#
#Verify that the program works by using several initial values for x.
#Use x = 0 and x = 1 to start since this will make debugging easy.
#Try some other values, then check what happens when x = -4.

        .text
        .globl main

main:
        #(3x+7)/(2x+8)
        #x
        addi $8, $0, -4

        ori $9, $0, 3
        mult $9, $8
        mflo $9
        addi $9, $9, 7

        ori $10, $0, 2
        mult $10, $8
        mflo $10
        addi $10,$10, 8
        
        sll $0, $0, 0

        div $9, $10

        mflo $9
        mfhi $10

        #x=-4, I expected some type of div by zero error.  None occured. My 
        #guess is that it is up to the programmer to detect and handle division
        #by zero.




