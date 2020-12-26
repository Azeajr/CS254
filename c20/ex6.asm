        .text
        .globl  main

main:   lui     $1, 0x1000
        lw      $2, 0($1)

        addiu   $1, $1, 4

        or      $3, $0, $0
        or      $4, $0, $0
        or      $5, $0, $0


loop:   sltu    $6, $3, $2
        beq     $6, $0, endLp
        sll     $0, $0, $0


        lw      $6, 0($1)
        sll     $0, $0, $0
        addu    $4, $4, $6

        lw      $6, 4($1)
        sll     $0, $0, $0
        addu    $5, $5, $6


        addiu   $1, $1, 8
        addiu   $3, $3, 1
        j       loop
endLp:
        div     $4, $2
        mflo    $4


        div     $5, $2
        mflo    $5




        .data
pairs:  .word 5                  # number of pairs
        .word 60, 90             # first pair: height, weight
        .word 65, 105
        .word 72, 256
        .word 68, 270
        .word 62, 115