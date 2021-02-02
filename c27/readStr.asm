        .text
        .globl  readStr


# $a0 pointer to buffer
# $a1 buffer length

readStr:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        move    $s0, $a0

        li      $v0, 4
        la      $a0, promptA
        syscall

        li      $v0, 8
        move    $a0, $s0
        syscall


        .data
promptA:.asciiz "Enter a string: "