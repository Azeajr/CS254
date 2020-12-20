# Write a program that computes the greatest common divisor (GCD) of two 
# integers. The two integers and the GCD will be in memory.

        .text
        .globl  main

main:   #init
        lui     $1, 0x1000
        lw      $2, 0($1)
        lw      $3, 4($1)
        sll     $0, $0, $0
        sll     $0, $0, $0
        # Loop ends when $2 == $3, at which point either register will contain 
        # the gcd of $2 and $3.
test:   beq     $2, $3, endLp
        sll     $0, $0, $0

        # if $2 > $3 $2 = $2 - $3
        sltu    $4, $3, $2
        beq     $4, $0, else
        sll     $0, $0, $0

        sub     $2, $2, $3
        j       test
        sll     $0, $0, $0
        # else $3 > $2 $3 = $3 - $2
else:   sub     $3, $3, $2
        j       test
        sll     $0, $0, $0

endLp:  sll     $0, $0, $0
        # if the loop has finished either register $2 and $3 contain the gcd
        sw      $2, 8($1)

        .data
N:      .word   36
M:      .word   27
GCD:    .word   0