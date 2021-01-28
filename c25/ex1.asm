# Arithmetic Evaluation (stack-based)
# Write a program to evaluate 3ab - 2bc - 5a + 20ac - 16
# Prompt the user for the values a, b, and c. Try to use a small number of 
# registers. Use the stack to hold intermediate values. Write the final value 
# to the monitor.

        .text
        .globl main


main:


        li      $v0, 4
        la      $a0, promptA
        syscall

        li      $v0, 5
        syscall

        la      $t0, A
        sw		$v0, 0($t0)
######################################

        li      $v0, 4
        la      $a0, promptB
        syscall

        li      $v0, 5
        syscall
        la      $t0, B
        sw		$v0, 0($t0)
######################################

        li      $v0, 4
        la      $a0, promptC
        syscall

        li      $v0, 5
        syscall
        la      $t0, C
        sw		$v0, 0($t0)
######################################

        li      $t0, -16

        subu    $sp, $sp, 4
        sw      $t0, ($sp)
######################################

        la      $t1, A
        lw      $t1, ($t1)
        li      $t0, 20
        mul     $t0, $t0, $t1

        la      $t1, C
        lw      $t1, ($t1)
        nop
        mul     $t0, $t0, $t1

        subu    $sp, $sp, 4
        sw      $t0, ($sp)
######################################

        la      $t1, A
        lw      $t1, ($t1)
        li      $t0, -5
        mul     $t0, $t0, $t1

        subu    $sp, $sp, 4
        sw      $t0, ($sp)
######################################

        la      $t1, B
        lw      $t1, ($t1)
        li      $t0, -2
        mul     $t0, $t0, $t1

        la      $t1, C
        lw      $t1, ($t1)
        nop
        mul     $t0, $t0, $t1

        subu    $sp, $sp, 4
        sw      $t0, ($sp)

######################################

        la      $t1, A
        lw      $t1, ($t1)
        li      $t0, 3
        mul     $t0, $t0, $t1
        
        la      $t1, B
        lw      $t1, ($t1)
        nop
        mul     $t0, $t0, $t1

######################################

        lw      $t1, ($sp)
        addu    $sp, $sp, 4
        add     $t0, $t0, $t1

        lw      $t1, ($sp)
        addu    $sp, $sp, 4
        add     $t0, $t0, $t1

        lw      $t1, ($sp)
        addu    $sp, $sp, 4
        add     $t0, $t0, $t1

        lw      $t1, ($sp)
        addu    $sp, $sp, 4
        add     $t0, $t0, $t1

######################################

        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 10
        syscall


        .data
promptA:.asciiz "Enter A: "
promptB:.asciiz "Enter B: "
promptC:.asciiz "Enter C: "
A:      .word   0
B:      .word   0
C:      .word   0
