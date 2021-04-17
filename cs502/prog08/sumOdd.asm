## CS 254 Program 8
##
## Compute the sum of the first N odd integers
##
## Programmer:  Antonio Zea
## Date:    04-16-2021
################################################################################
## $v0 = N, the number of odd numbers to sum 
## $t0 = The odd number that we are adding to the running sum
## $t1 = Running sum of all the odd numbers
################################################################################
        .text
        .globl main

main:
        li      $v0, 4          # Ask user to input how many odd numbers to sum
        la      $a0, prompt1
        syscall

        li      $v0, 5          # Read user input as integer.
        syscall

        li      $t0, 1          # This is the first odd number that will be 
                                # added to $t1.

        or      $t1, $zero, $zero       # Sets $t1 to zero just in case.  Not 
                                        # necessary in spim but if this was 
                                        # being run in hardware then you do not 
                                        # necessarily know the state of $t1 as 
                                        # this subroutine takes control.

        bltz    $v0, negative   # Checks if the value entered by the user is 
                                # negative or not.  I run this check here 
                                # because $t1 has just recently been set to 
                                # zero. So if I branch to the negative label 
                                # the subroutine can proceed as normal print 
                                # zero as the result.

loop:   beqz    $v0, endLp      # Branch ends the loop when $v0 reaches zero.

        add     $t1, $t1, $t0   # Adds the odd number in $t0 to the running sum 
                                # in $t1.
        add     $t0, $t0, 2     # Adds two to the current odd number to 
                                # calculate the next odd number.

        sub     $v0, $v0, 1     # Decriment $v0 to signify the completion of 
                                # one cycle.
        j       loop            # Jumps back to the top of the loop for next 
                                # iteration.

endLp:
        li      $v0, 4          # Print result prompt
        la      $a0, prompt2
        syscall
negative:                       # Branch checking for negative numbers lands 
                                # here if the input was negative.

        li      $v0, 1          # Print the sum stored in $t1
        move    $a0, $t1
        syscall

        li      $v0, 10         # Exit gracefully.
        syscall

        .data
prompt1:        .asciiz "How many odd nymbers: "
prompt2:        .asciiz "The sum: "