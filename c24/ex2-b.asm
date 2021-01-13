# String reversal using pointers

        .text
        .globl main

main:   li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 100
        syscall

        move    $t0, $a0
        move    $t1, $a0

        lb      $t2, 0($t1)
        nop


loop:   beqz    $t2, endLp
        nop

        addu    $t1, $t1, 1
        lb      $t2, 0($t1)

        j       loop
        nop

endLp:  nop

        subu    $t1, $t1, 2
        subu    $t2, $t1, $t0


loop2:  blt    $t2, 0, endLp2
        nop
        
        lb      $t3, 0($t0)
        lb      $t4, 0($t1)

        sb	$t3, 0($t1)
        sb      $t4, 0($t0)

        addu    $t0, $t0, 1
        subu    $t1, $t1, 1

        subu    $t2, $t1, $t0

        j       loop2

endLp2: nop


        li      $v0, 4
        la      $a0, response
        syscall

        li      $v0, 4
        la      $a0, buffer
        syscall

end:    li              $v0, 10
        syscall

            .data
prompt:     .asciiz "Input a string:"
buffer:     .space 100
response:   .asciiz "Reversed String:"