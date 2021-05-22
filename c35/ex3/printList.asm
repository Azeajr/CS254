# 0($s0) pointer to next node(String)
# 4($s0) pointer to beginning of the string

        .text
        .globl printList
printList:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        move    $s0, $a0

loopA:  beqz    $s0, endLpA
        add     $a0, $s0, 4
        li      $v0, 4
        syscall

         la      $a0, newline
        li      $v0, 4
        syscall

        lw      $s0, 0($s0)
        j       loopA

endLpA: la      $a0, newline
        li      $v0, 4
        syscall

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        li      $v0, 0          # Return Code

        jr      $ra

        .data
#space:  .asciiz " "
newline:.asciiz "\n"