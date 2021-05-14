## linked.asm
        .text
        .globl main
main:
        la      $s0, head

loop:   beqz    $s0, done
        lw      $a0, ($s0)
        li      $v0, 1
        syscall

        la      $a0, sep
        li      $v0, 4
        syscall

        lw      $s0, 4($s0)
        b       loop

done:   la      $a0, linef
        li      $v0, 4
        syscall

        la      $a0, endmess
        li      $v0, 4
        syscall

        li      $v0, 10
        syscall

        .data
head:
elmnt01:    .word   1
            .word   elmnt02

elmnt07:    .word   13
            .word   elmnt08

elmnt08:    .word   17
            .word   elmnt09

elmnt05:    .word   7
            .word   elmnt06

elmnt02:    .word   2
            .word   elmnt03

elmnt03:    .word   3
            .word   elmnt04

elmnt09:    .word   19
            .word   elmnt10

elmnt04:    .word   5
            .word   elmnt05

elmnt06:    .word   11
            .word   elmnt07

elmnt10:    .word   23
            .word   0

sep:        .asciiz " "
linef:      .asciiz "\n"
endmess:    .asciiz "done\n"
