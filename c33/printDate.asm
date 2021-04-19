# Subroutine prints a date structure pointed to by address.
################################################################################
# void printDate(struct Date *)
# $a0 = argument
# $s0 is the base address of the structure.
# 0($s0) = day
# 4($s0) = month
# 8($s0) = year
###############################################################################
        .text
        .globl printDate

printDate:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        move    $s0, $a0

        la      $a0, newline
        li      $v0, 4
        syscall

        lw      $a0, 4($s0)
        li      $v0, 1
        syscall

        la      $a0, slash
        li      $v0, 4
        syscall

        lw      $a0, 0($s0)
        li      $v0, 1
        syscall

        la      $a0, slash
        li      $v0, 4
        syscall

        lw      $a0, 8($s0)
        li      $v0, 1
        syscall

        la      $a0, newline
        li      $v0, 4
        syscall

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jal     $ra

        .data
slash:  .asciiz "/"
newline:.asciiz "\n"