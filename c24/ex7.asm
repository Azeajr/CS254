# Write a program that processes an array by applying an averaging filter to
# it. An averaging filter works like this: create a new array where each
# element at index J is the average of the three elements from the old array at
# indexes J-1, J, and J+1
        .text
        .globl  main

        # $t0 index limit
main:   la      $t0, size
        lw      $t0,0($t0)

        # first and last element is filled in before and after the loop
        subu    $t0, $t0, 2

        la      $t1, array
        la      $t2, result

        # Copies the first value to the result array
        lw      $t3, 0($t1)
        addu    $t1, $t1, 4
        sw      $t3, 0($t2)
        addu    $t2, $t2, 4

        li      $t4, 0

loop:   beq     $t4, $t0, endLp
        nop
        # J-1
        lw      $t3, -4($t1)
        nop
        #Accumumlator
        addu    $t5, $zero, $t3
        # J
        lw      $t3, 0($t1)
        nop
        addu    $t5, $t5, $t3
        # J+1
        lw      $t3, 4($t1)
        nop
        addu    $t5, $t5, $t3
        
        li      $t3, 3
        # Used div instead of divu due to the check for divide by zero error
        # that does not include a nop
        # divu    $t5, $t5, $t3
        div     $t5, $t3
        mflo    $t5

        sw      $t5, 0($t2)

        addu    $t1, $t1, 4
        addu    $t2, $t2, 4


        addu    $t4, $t4, 1
        j       loop
endLp:  nop
        # Copies the last value to the result array
        lw      $t3, 0($t1)
        nop
        sw      $t3, 0($t2)
####################################################
        addu    $t0, $t0, 2
        li      $t1, 0

        la      $t2, array
        #Prints the first array values with spaces between
loop2:  beq     $t1, $t0, endLp2
        nop

        lw      $a0, 0($t2)
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, space
        syscall

        addu    $t2, $t2, 4
        addu    $t1, $t1, 1

        j       loop2

endLp2: nop
        li      $v0, 4
        la      $a0, newline
        syscall
####################################################
        li      $t1, 0
        la      $t2, result
        #Prints the result array values with spaces between
loop3:  beq     $t1, $t0, endLp3
        nop

        lw      $a0, 0($t2)
        li      $v0, 1
        syscall

        li      $v0, 4
        la      $a0, space
        syscall

        addu    $t2, $t2, 4
        addu    $t1, $t1, 1

        j       loop3

endLp3: nop
####################################################

        li      $v0, 10
        syscall

        .data
size:   .word   12
space:  .asciiz " "
newline:.asciiz "\n"
array:  .word   50, 53, 52, 49, 48, 51, 99, 45, 53, 47, 47, 50
result: .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0