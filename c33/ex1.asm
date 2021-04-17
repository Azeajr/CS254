        .text
        .globl main
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        jal newDate

        move    $a0, $v0

        jal printDate

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jal     $ra

