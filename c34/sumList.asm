        .text
        .globl sumList
sumList:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        sub     $sp, $sp, 4
        sw      $s1, ($sp)

        li      $s1, 0
        move    $s0, $a0

loopB:  beqz    $s0, endLPB
        lw      $a0, ($s0)
        add     $s1, $s1, $a0

        lw      $s0, 4($s0)
        j       loopB

endLPB: 

        la      $a0, prompt
        li      $v0, 4
        syscall

        move    $a0, $s1
        li      $v0, 1
        syscall

        la      $a0, nl
        li      $v0, 4
        syscall

        lw      $s1, ($sp)
        add     $sp, $sp, 4
        lw      $s0, ($sp)
        add     $sp, $sp, 4

        li      $v0, 0          # Return Code

        jr      $ra



        .data
prompt:  .asciiz "Sum: "
nl:.asciiz "\n"


