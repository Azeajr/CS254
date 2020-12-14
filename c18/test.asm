        .text
        .globl main

main:
        #addiu           $8, $0, -25
        #addi            $9, $0, -25

        #testing for question #8 on the practice quiz
        #btw..... I was correct
        addiu           $3, $0, -1
        slti            $5, $3, 17