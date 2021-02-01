        .text
        .globl main

main:
        li      $s0, 0
loop1:  
        li      $v0, 4
        la      $a0, promptU
        syscall

        jal     readInt

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




        .data
promptU:.asciiz "Enter U:\n"
promptV:.asciiz "Enter V:\n"
error:  .asciiz "Not an integer.\n"

