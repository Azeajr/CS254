        .text
        .globl square

square:
        # $a0  numbers of characters per side
        sub             $sp, $sp, 4
        sw              $ra, ($sp)

        sub             $sp, $sp, 4
        sw              $s0, ($sp)

        sub             $sp, $sp, 4
        sw              $s1, ($sp)

        move            $s0, $a0

        ble     $s0, 10, skipA
        li      $s0, 10
skipA:
        li      $s1, 0
loopA:  beq     $s1, $s0, endLpA
        move    $a0, $s0
        jal     starline

        add     $s1, $s1, 1
        j       loopA
endLpA:
        lw              $s1, ($sp)
        add             $sp, $sp, 4

        lw              $s0, ($sp)
        add             $sp, $sp, 4

        lw              $ra, ($sp)
        add             $sp, $sp, 4

        jr      $ra
        nop
