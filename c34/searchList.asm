        .text
        .globl searchList
searchList:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

loopB:  beqz    $a0, notFound
        lw      $s0, ($a0)
        beq     $s0, $a1, found

        lw      $a0, 4($a0)
        j       loopB

notFound:
        lw      $s0, ($sp)
        add     $sp, $sp, 4

        li      $v0, 0
        jr      $ra

found:
        lw      $s0, ($sp)
        add     $sp, $sp, 4

        li      $v0, 1
        jr      $ra


