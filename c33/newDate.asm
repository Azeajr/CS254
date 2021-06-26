# Subroutine 
################################################################################
# (void *) newDate(void)
# $a0 = argument
# $s0 is the base address of the structure.
# 0($s0) = day
# 4($s0) = month
# 8($s0) = year
###############################################################################
        .text
        .globl newDate
newDate:
        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        li      $v0, 9
        li      $a0, 12
        syscall

        move    $s0, $v0

        li      $v0, 4
        la      $a0, month
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 4($s0)

        li      $v0, 4
        la      $a0, day
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 0($s0)

        li      $v0, 4
        la      $a0, year
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 8($s0)

        move    $v0, $s0

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jal     $ra




        .data
month:  .asciiz "\nMonth: "
day:    .asciiz "\nDay: "
year:   .asciiz "\nYear: "