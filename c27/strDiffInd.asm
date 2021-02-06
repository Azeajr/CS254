        .text
        .globl  strDiffInd

# $a0   first string
# $a1   second string
# $v0   index of first difference if one exists otherwise returns -1


strDiffInd:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        nop
        
        move    $s0, $a0

loopA:  lb      $t0, ($a0)
        lb      $t1, ($a1)
        nop

        

        bne     $t0, $t1, notEqual
        nop

        beqz    $t0, endLpA

        add     $a0, $a0, 1
        add     $a1, $a1, 1

        j       loopA

endLpA: nop

        li      $v0, -1

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jr      $ra
        nop

notEqual:
        nop
        sub     $v0, $a0, $s0

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jr      $ra
        nop
