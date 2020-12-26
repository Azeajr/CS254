        .text
        .globl  main

main:   lui     $1, 0x1000
        lbu     $2, 0($1)

        sltiu   $3, $2, 123
        beq     $3, $0, notLower
        sll     $0, $0, $0

        sltiu   $3, $2, 97
        bne     $3, $0, notLower
        sll     $0, $0, $0

        addiu   $2, $2, -0x20
        sb      $2, 0($1)
        
notLower:
        sll     $0, $0, $0
        addiu   $1, $1, 1
        lbu     $2, 0($1)
        sll     $0, $0, $0

loop:   beq     $2, $0, endLp
        sll     $0, $0, $0

        lbu     $3, -1($1)
        sll     $0, $0, $0

        # branch if $3 is a not a space
        ori     $4, $0, 0x20
        bne     $3, $4, noChange

        sltiu   $3, $2, 123
        beq     $3, $0, noChange
        sll     $0, $0, $0

        sltiu   $3, $2, 97
        bne     $3, $0, noChange
        sll     $0, $0, $0

        addiu   $2, $2, -0x20
        sb      $2, 0($1)
        sll     $0, $0, $0

noChange:
        sll     $0, $0, $0

        addiu   $1, $1, 1
        lbu     $2, 0($1)
        sll     $0, $0, $0
        j       loop
        sll     $0, $0, $0



endLp:  sll     $0, $0, $0



        .data
string: .asciiz "in a  hole in the   ground there lived a hobbit"