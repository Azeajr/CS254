## CS 254 Program 7
##
## Compute change due given a number of cents.
##
## Programmer:  Antonio Zea
## Date:    04-15-2021
################################################################################
## $t0 = Number of cents
## $a0 = Quotient from dividing by 25, 10 and 5
################################################################################
        .text
        .globl main
main:
        li      $v0, 4          # Syscall number for print String
        la      $a0, prompt     # Pointer to the begining of the prompt string
        syscall

        li      $v0, 5          # Syscall number for read integer
        syscall                 

        blt     $v0, $zero, negative    # Check if the value entered by the user
                                        # is negative or not.  If it is less 
                                        # than zero then branch to the location 
                                        # labeled as negative.
        
        j       positive        # Otherwise the value enterd must be postive so 
                                # jump to the location labeled as positve.

negative:  
        li      $v0, 4          # Syscall number for print string
        la      $a0, error      # Pointer to the string for the error prompt.
        syscall

        j       end             # Jump to the end of the program due to user 
                                # entering a negative value.

positive:
        move    $t0, $v0        # $t0 = $v0
        li      $v0, 4          # Print the label for quarters
        la      $a0, quarters
        syscall

        li      $v0, 1          # Setup $v0 so that syscall will print integer 
                                # stored in $a0.
        div     $a0, $t0, 25    # Calculates how many quarters there are in the 
                                # number of cents currently in $t0.
        
        syscall                 # Will print the quotient next to the quarter's 
                                # label.

        mfhi    $t0             # Remainder contains how many cents are left 
                                # after the quarters' values are removed.

        li      $v0, 4          # Prints a newline character so that the labels 
                                # start at a new line.
        la      $a0, newline
        syscall

        la      $a0, dimes      # Prints the dimes label on a new line.  Do not 
                                # have to set $vo since it still contains the 
                                # correct syscall number.
        syscall

        li      $v0, 1          # Calculates and prints the number of dimes.
        div     $a0, $t0, 10
        syscall

        mfhi    $t0             # Remainder contains how many cents are left 
                                # after the dimes' values are removed.

        li      $v0, 4          # Prints a newline character so that the labels 
                                # start at a new line.
        la      $a0, newline
        syscall

        la      $a0, nickels    # Prints the nickels label on a new line.  Do 
                                # not have to set $vo since it still contains 
                                # the correct syscall number.
        syscall

        li      $v0, 1          # Calculates and prints the number of nickels.
        div     $a0, $t0, 5
        syscall

        mfhi    $t0             # Remainder contains how many cents are left 
                                # after the nickels' values are removed.

        li      $v0, 4          # Prints a newline character so that the labels 
                                # start at a new line.
        la      $a0, newline
        syscall

        la      $a0, pennies    # Prints the pennies label on a new line.  Do 
                                # not have to set $vo since it still contains 
                                # the correct syscall number.
        syscall

        li      $v0, 1          # Nothing to calculate since what is left from 
                                # the previous calculation are just the 
                                # pennies. Prints the number of pennies.
        move    $a0, $t0
        syscall

end:    li      $v0, 10         # Syscall number for the exit service.
        syscall

        .data
prompt:     .asciiz "Enter number of cents: "
error:      .asciiz "Amount entered can not be negative."
newline:    .asciiz "\n"
quarters:   .asciiz "Number of quarters : "
dimes:      .asciiz "Number of dimes    : "
nickels:    .asciiz "Number of nickles  : "
pennies:    .asciiz "Number of pennies  : "