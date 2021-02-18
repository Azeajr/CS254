        .text
        .globl  main

main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 0

        move    $sp, $fp

        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        move    $s0, $v0

        li      $v0, 4
        la      $a0, prompt2
        syscall

        li      $v0, 1
        move    $a0, $s0
        syscall

        li      $v0, 4
        la      $a0, prompt3
        syscall


        move    $a0, $s0
        jal Triangle

        move    $a0, $v0
        li      $v0, 1
        syscall


        add     $sp, $fp, 0
        # Pop the frame pointer from the stack
        lw      $fp, ($sp)
        add     $sp, $sp, 4
        # Pop the return address from the stack
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
prompt1:.asciiz "Enter a N: "
prompt2:.asciiz "\nTriangle( "
prompt3:.asciiz " ) = "
