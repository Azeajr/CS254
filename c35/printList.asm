        .text
        .globl printList
printList:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        move    $s0, $a0

loopA:  beqz    $s0, endLPA
        lw      $a0, ($s0)
        li      $v0, 1
        syscall

        la      $a0, space
        li      $v0, 4
        syscall

        lw      $s0, 4($s0)
        j       loopA

endLPA: la      $a0, newline
        li      $v0, 4
        syscall

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        li      $v0, 0          # Return Code

        jr      $ra

        .data
space:  .asciiz " "
newline:.asciiz "\n"


