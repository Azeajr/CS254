# String length
# Wrote this so that it would check if a newline character existed and skip it.
# Would have been much easier to run to null and then subtract count by 2
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
        li      $t2, 0
        lb      $t3, 0($t0)
        li      $t1, 10


loop:   beqz    $t3, endLp
        nop

        beq     $t3, $t1, skip
        nop
        addu    $t2, $t2, 1

skip:   addu    $t0, $t0, 1
        lb      $t3, 0($t0)

        j       loop
        nop

endLp:  nop

        li      $v0, 4
        la      $a0, response
        syscall

        li      $v0, 1
        move    $a0, $t2
        syscall

        li      $v0, 4
        la      $a0, newline
        syscall

end:    li              $v0, 10
        syscall

            .data
prompt:     .asciiz "Input a string:"
buffer:     .space 100
response:   .asciiz "String Length:"
newline:    .asciiz "\n"  
