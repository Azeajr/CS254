# Zeno's Series
# Write a program that computes the sum of the first n terms of this series:
#
# 1/2 + 1/4 + 1/8 + 1/16 + ... + 1/2^n
# Unlike the previous series, this one converges. For large n the sum is very 
# close to one. Ask the user for a number of terms to sum, compute the sum and 
# print it out.
#
# As above, there are several ways that this program could be written. Try to 
# find a sensible way to do it.
        .text
        .globl main
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 0
        move    $sp, $fp

        la      $a0, prompt1
        li      $v0, 4
        syscall

        li      $v0, 5
        syscall

        move    $t0, $v0
        li.s    $f0, 2.0            # Denominator
        li.s    $f1, 1.0            # Sometimes acts as numerator and sometimes 
                                    # acts as the increment to be added to 
                                    # denominator.
        li.s    $f12, 0.0           # Accumulator for result

loop1:  beqz    $t0, endlp1

        div.s   $f1, $f1, $f0       # Creates and stores fraction by dividing 
                                    # the numerator($f1) which should be a 1.0 
                                    # and the current denominator($f0)
        add.s   $f12, $f12, $f1     # Current fraction is added to the running 
                                    # sum($f12).
        li.s    $f1, 2.0            # Used for doubling denominator
        mul.s   $f0, $f0, $f1       # Denominator is doubled.

        li.s    $f1, 1.0            # Reset $f1 so that it contains a 1.0 for 
                                    # the next calculation

        subu    $t0,  $t0, 1
        j       loop1
endlp1: nop
        la      $a0, prompt2
        li      $v0, 4
        syscall

        li      $v0, 2
        syscall

        add     $sp, $fp, 0

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra


        .data
prompt1:.asciiz "Enter an N: "
prompt2:.asciiz "Zeno Series Result: "