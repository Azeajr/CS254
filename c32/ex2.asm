# Various infinite series for pi have been discovered. The first such series was
#
# pi = 4( 1 - 1/3 + 1/5 - 1/7 + 1/9 - . . .)
#
# Write a SPIM program that writes out the sum of the first 1000, 2000, 3000,
# ... , 10000 terms of the series.
################################################################################
# pi.asm subroutine
# Arguments
# $a0 = N
# Return Value
# $f0 = Double float point
###############################################################################
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

        mov.d   $f12, $f0       # Move the double result to $f12 for printing
        li      $v0, 3
        syscall

        jr      $ra

        .data
prompt: .asciiz "Enter the desired number of terms to calculate(N): "
