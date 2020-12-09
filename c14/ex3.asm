#Write a program that multiplies the contents of two registers which you have
#initialized using an immediate operand with the ori instruction. Determine
#(by inspection) the number of significant bits in each of the following
#numbers, represented in two's complement. Use the program to form their product
#and then determine the number of significant bits in it.

        .text
        .globl main

main:
        #0x00001000 13-sigfig
        #product
        #0x01000000 25-sigfig
        ori $8, $0, 0x00001000	
        mult $8, $8
        
        #0x00000fff 12-sigfig
        #product
        #0x00ffe001 24-sigfig
        ori $8, $0, 0x00000FFF	
        mult $8, $8

        #0x00000fff 12-sigfig
        #0x0000ffff 16-sigfig
        #product
        #0x0ffef001 28-sigfig
        ori $8, $0, 0x00000FFF
        ori $9, $0, 0x0000FFFF
        mult $8, $9

        #0x00008000 16-sigfig
        #0x0000ffff 16-sigfig
        #product
        #0x08000000 28-sigfig
        ori $8, $0, 0x00008000
        ori $9, $0, 0x00001000
        mult $8, $9