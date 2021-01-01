# Write a program that repeatedly prompts the user for the number of miles 
# traveled and the gallons of gasoline consumed, and then prints out the miles 
# per gallon. Use integer math. Exit when the user enters 0 for the number of 
# miles.
# This time use fixed-point arithmetic.

        .text
        .globl  main

main:   li              $v0, 4
        la              $a0, miles
        syscall

        li              $v0, 5
        syscall

        # Checking if the user has entered a zero to end the program.
        beq             $v0, $0, end
        #nop

        # Multiply by 100 so that more significant digits will end up in the LO 
        # register
        li              $s1, 100
        mult            $v0, $s1
        mflo            $s0

        li              $v0, 4
        la              $a0, gallons
        syscall

        li              $v0, 5
        syscall

        li              $v0, 4
        la              $a0, mpg
        syscall

        div             $s0, $v0
        mflo            $s0
        
        # Divide by 100 so that LO holds the whole number part while the HI holds the decimal part up to the hundredths place.
        div             $s0, $s1
        mflo            $a0

        li              $v0, 1
        syscall

        li              $v0, 4
        la              $a0, dot
        syscall
        
        
        li      $v0, 1
        mfhi    $a0
        syscall

        li      $v0, 4
        la      $a0, newline
        syscall


        # This was the simplest way to write the loop.  Not sure if using a 
        # symbolic address like "loop" would be clearer.
        j       main
        #nop

end:    li      $v0, 10
        syscall

        .data
miles:  .asciiz "Enter the number of miles: "
gallons:.asciiz "Enter the number of gallons: "
mpg:    .asciiz "Miles per gallon: "
dot:    .asciiz "."
newline:.asciiz "\n"
