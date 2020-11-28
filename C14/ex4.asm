#Write a program that determines the value of the following expression:
#
#(x*y)/z
#
#Use x = 1600000 (=0x186A00), y = 80000 (=0x13880), and z = 400000 (=61A80).
#Initialize three registers to these values. Since the immediate operand of the
#ori instruction is only 16 bits wide, use shift instructions to move bits into
#the correct locations of the registers.
#
#Choose wisely the order of multiply and divide operations so that the
#significant bits always remain in the lo result register.

        .text
        .globl main

main:
        #Decided to divide the largest operand first since this would minimize
        #the size of the resulting numbers
        ori $8, $0, 0x186A
        sll $8, $8, 8
        ori $9, $0, 0x61A8
        sll $9, $9, 4
        div $8, $9
        mflo $8
        ori $9, $0,0x1388
        sll $9, $9, 4
        mult $8, $9
        mflo $8
        

