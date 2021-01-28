# String Reversal using second buffer

        .text
        .globl main

main:   li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, inBuff
        li      $a1, 100
        syscall

        move    $t0, $a0

        lb      $t2, 0($t0)
        nop


loop:   beqz    $t2, endLp
        nop

        addu    $t0, $t0, 1
        lb      $t2, 0($t0)

        j       loop
        nop

endLp:  nop

        subu    $t0, $t0, 2
        move    $t1, $a0
        subu    $t1, 1
        la      $t2, outBuff


loop2:  beq     $t0, $t1, endLp2
        nop
        
        lb      $t3, 0($t0)
        nop
        sb      $t3, 0($t2)


        subu    $t0, $t0, 1
        addu    $t2, $t2, 1

        j       loop2

endLp2: nop


        li      $v0, 4
        la      $a0, response
        syscall

        li      $v0, 4
        la      $a0, outBuff
        syscall

end:    li              $v0, 10
        syscall

                .data
prompt:         .asciiz "Input a string:"
inBuff:         .space 100
outBuff:        .space 100
response:       .asciiz "Reversed String:"