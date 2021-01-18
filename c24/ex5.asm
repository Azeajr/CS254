# Compute the dot product of two vectors.
        .text
        .globl main

main:   li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 5
        syscall

        # Sets the size of the vectors to 10 if $v0 is larger than 10
        bleu    $v0, 10, max
        nop
        li      $v0, 10

max:    la      $t0, length
        sw      $v0, 0($t0)
#############################################
        move    $t0, $v0
        li      $t1, 0
        la      $t2, vectorA

        li      $v0, 4
        la      $a0, promptA
        syscall

        # Asks the user for the values in the vector until the vector is filled
loop1:  beq     $t1, $t0, endLp1
        nop

        li      $v0, 4
        la      $a0, promptV
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 0($t2)
        addu    $t2, $t2, 4
        

        addu    $t1, $t1, 1
        j       loop1

endLp1: nop
#############################################
        li      $t1, 0
        la      $t2, vectorB

        li      $v0, 4
        la      $a0, promptB
        syscall

        # Asks the user for the values in the vector until the vector is filled
loop2:  beq     $t1, $t0, endLp2
        nop

        li      $v0, 4
        la      $a0, promptV
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 0($t2)
        addu    $t2, $t2, 4
        

        addu    $t1, $t1, 1
        j       loop2

endLp2: nop
#############################################

        #I wrote this part as if I was given an array in memory and needed to
        #compute dot product from those values.  It would probably be more
        # efficient to load the first vector into memory and compute the dot
        # product as the second vector gets entered.
        la      $t0, length
        lb      $t0, 0($t0)

        li      $t1, 0
        la      $t2, vectorA
        la      $t3, vectorB
        #accumulator for dot product
        li      $t6, 0

loop3:  beq     $t1, $t0, endLp3
        nop

        lw      $t4, 0($t2)
        lw      $t5, 0($t3)
        nop

        # Multiplies corresponding values and then adds the product to the 
        # accumulator.
        mul     $t7, $t5, $t4
        addu    $t6, $t6, $t7

        # Increment the pointers to the next vector values
        addu    $t2, $t2, 4
        addu    $t3, $t3, 4

        # Increment the loop counter
        addu    $t1, $t1, 1
        j       loop3

endLp3: nop

        li      $v0, 4
        la      $a0, promptD
        syscall

        li      $v0, 1
        move    $a0, $t6
        syscall

        li      $v0, 10
        syscall

        .data
prompt:     .asciiz     "Enter length of vectors:"
promptA:    .asciiz     "----First vector----\n"
promptB:    .asciiz     "----Second vector----\n"
promptV:    .asciiz     "Enter value:"
promptD:    .asciiz     "Dot product:"

length:     .word       0
vectorA:    .space      40
vectorB:    .space      40