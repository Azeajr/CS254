        .text
        .globl  strCmp
# $a0   pointer to first character array
# $a1   pointer to second character array
# $v0   return < 0 if the first character that does not match has a lower value 
# in first than in second
#       return 0 if the contents of both strings are equal
#       return > 0 if the first character that does not match has a greater 
# value in ptr1 than in ptr2
strCmp:

loopA:  lw      $t0, ($a0)
        lw      $t1, ($a1)
        nop

        bne     $t0, $t1, notEqual
        nop

        beqz    $t0, endLpA

        add     $a0, $a0, 4
        add     $a0, $a0, 4

        j       loopA

endLpA: nop

        li      $v0, 0
        jr      $ra
        nop

notEqual:
        nop
        sub     $v0, $t0, $t1

        jr      $ra
        nop
