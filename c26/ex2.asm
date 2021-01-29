# Uses the subroutine readInt in a program that computes the sum of a list of 
# integers that the user enters. The user signals the end of input by typing 
# "done".

        .text
        .globl  main

main:   
        li      $s0, 0
loop2:  jal     readInt
        nop

        beq     $v1, 1, conv
        nop

        beq     $v1, 0, notConv
        nop

        beq     $v1, 2, endLp2
        nop

conv:   j       loop2
        addu    $s0, $s0, $v0

notConv:li      $v0, 4
        la      $a0, error
        syscall
        j       loop2
        nop

endLp2: nop

        li      $v0, 4
        la      $a0, promp1
        syscall

        li      $v0, 1
        move    $a0, $s0
        syscall

        li      $v0, 10
        syscall

        .data
error:  .asciiz "Not an integer.\n"
promp1: .asciiz "The sum is: "
