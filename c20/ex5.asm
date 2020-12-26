        .text
        .globl  main

main:   lui     $1, 0x1000
        lw      $2, 0($1)
        or      $3, $0, $0

        sltiu   $6, $2, 2
        bne     $6, $0, increasing
        sll     $0, $0, $0

        addiu   $1, $1, 4
        addiu   $2, $2, -1




loop:   sltu    $6, $3, $2
        beq     $6, $0, endLp
        sll     $0, $0, $0

        lw      $4, 0($1)
        lw      $5, 4($1)
        sll     $0, $0, $0

        # The fact that I have this jump here that jumps out of the loop makes 
        # this nonstructured programing.
        sltu    $6, $4, $5
        beq     $6, $0, notincreasing
        sll     $0, $0, $0


        addiu   $1, $1, 4
        addiu   $3, $3, 1
        j       loop
        sll     $0, $0, $0

endLp:
        j       increasing
        sll     $0, $0, $0


increasing:
        ori     $10, $0, 1
        j       finish
        sll     $0, $0, $0

notincreasing:
        or      $10, $0, $0
        j       finish
        sll     $0, $0, $0

finish:


        .data
size:   .word 10
array:  .word 2, 4, 7, 12, 34, 36, 42, 48, 57, 78