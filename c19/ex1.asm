# Write a program that stores the number 0 in the first four bytes of the .data 
# section, then stores the number 1 in the next four bytes, then stores the 
# number 2 in the four bytes after that and so on. Do this for numbers 0 
# through 24.

        .text
        .globl main

main:   lui     $5, 0x1000
        #ori     $7, $0, 4
        

init:   ori     $8, $0, 0

test:   sltiu   $9, $8, 24
        beq     $9, $0, endLp
        sll     $0, $0, 0

        sw      $8, 0($5)
        sll     $0, $0, $0

        addiu   $5, $5, 4   
        
        addiu   $8, $8, 1
        j       test
        sll     $0, $0, $0

endLp:  sll     $0, $0, 0

        .data
array:  .space 100