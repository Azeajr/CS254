        .text
        .globl  Triangle

Triangle:

        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        sub     $fp, $sp, 0
        move    $sp, $fp



        move    $s0, $a0

        bgt     $a0, 1, recurse
        li      $v0, 1
        j       Epilogue

        



recurse:
        sub     $a0, $a0, 1
        jal     Triangle

        add     $v0, $v0, $s0

Epilogue:
        add     $sp, $fp, 0

        lw      $s0, ($sp)
        add     $sp, $sp, 4
        lw      $fp, ($sp)
        add     $sp, $sp, 4
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra
