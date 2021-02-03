# Subroutine reads a string from Std input to a buffer located at $a0 with 
# length $a1

        .text
        .globl  readStr


# $a0 pointer to buffer
# $a1 buffer length

readStr:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        # Not necessary
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        move    $s0, $a0

        li      $v0, 4
        la      $a0, promptA
        syscall

        li      $v0, 8
        move    $a0, $s0
        syscall

        lw      $s0, ($sp)
        add     $sp, $sp, 4
        
        lw      $ra, ($sp)
        add     $sp, $sp, 4
        
        jr      $ra
        nop

        .data
promptA:.asciiz "Enter a string: "