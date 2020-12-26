        .text
        .globl  main

main:   lui     $1, 0x1000
        or      $2, $0, $0
        lw      $3, 0($1)
        sll     $0, $0, $0
        addiu   $1, $1, 4

        #minimum
        lw      $6, 0($1)
        sll     $0, $0, $0
        #maximum
        lw      $7, 0($1)
        sll     $0, $0, $0

loop:   sltu    $5, $2, $3
        beq     $5, $0, endLp
        sll     $0, $0, $0

        lw      $8, 0($1)
        sll     $0, $0, $0


        slt     $5, $8, $6
        bne     $5, $0, notMin
        sll     $0, $0, $0
        or      $6, $0, $8
notMin: sll     $0, $0, $0

        slt     $5, $7, $8
        bne     $5, $0, notMax
        sll     $0, $0, $0
        or      $7, $0, $8
notMax: sll     $0, $0, $0

        addiu   $1, $1, 4
        addiu   $2, $2, 1
        j       loop
        sll     $0, $0, $0
        
endLp:  sll     $0, $0, $0





        .data
size:   .word 8
array:  .word 23, -12, 45, -32, 52, -72, 8, 13