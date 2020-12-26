# Would like to make a version where I only write when necessary

        .text
        .globl  main

main:   lui     $1, 0x1000
        or      $2, $0, $1
        lb      $3, 0($1)
        lb      $4, 0($2)
        # ascii space bit pattern
        ori     $5, $0, 0x20
        sll     $0, $0, $0

loop1:  beq     $3, $0, endLp1
        sll     $0, $0, $0

loop2:  bne     $4, $5, endLp2
        sll     $0, $0, $0
        addiu   $2, $2, 1
        lb      $4, 0($2)
        sll     $0, $0, $0

        j       loop2
        sll     $0, $0, $0

endLp2: sll     $0, $0, $0

        sb      $4, 0($1)
        sll     $0, $0, $0
        addiu   $1, $1, 1
        addiu   $2, $2, 1
        lb      $3, 0($1)
        sll     $0, $0, $0
        lb      $4, 0($2)
        sll     $0, $0, $0
        j       loop1

endLp1: sll     $0, $0, $0

        .data
string: .asciiz "Is  this a dagger    which I see before me?"