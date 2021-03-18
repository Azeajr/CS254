        .text
        .globl main

main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        la      $a0, prompt1
        li      $v0, 4
        syscall

        li      $v0, 6
        syscall

        mov.s   $f12, $f0
        li      $a0, 10

        jal     exp

        la      $a0, prompt2
        li      $v0, 4
        syscall

        mov.s   $f12, $f0
        li      $v0, 2
        syscall

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
prompt1:.asciiz "Enter x-->"
prompt2:.asciiz "exp(x) -->"
