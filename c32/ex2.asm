        .text
        .globl main
main:
        li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 5
        syscall

        move    $a0, $v0

        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        jal     pi

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        mov.d   $f12, $f0
        li      $v0, 3
        syscall

        jr      $ra

        .data
prompt: .asciiz "Enter the desired number of terms to calculate(N): "
