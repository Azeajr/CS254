        .text
        .globl  main

main:
        lui     $1, 0x1000
        lbu     $2, 0($1)
        sll     $0, $0, $0

loop:   beq     $2, $0, endLp
        sll     $0, $0, $0

        addiu   $2, $2, 0x20
        sb      $2, 0($1)
        #sll     $0, $0, $0
        addiu   $1, $1, 1
        lbu     $2, 0($1)
        #sll     $0, $0, $0

        j       loop
        sll     $0, $0, $0

endLp:  sll     $0, $0, $0

        .data
string: .asciiz     "ABCDEFG"