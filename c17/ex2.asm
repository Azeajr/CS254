# Write a program that adds $8 to itself inside a non-ending loop.
# Initialize $8 before the loop is entered. Use the add instruction so that when
# overflow is detected the program ends with a trap.
# Now change the add instruction to addu. Now when overflow occurs, nothing
# happens. Run the program and observe the difference.

# As expected the add call overflows and causes a trap.
# What I did not expect was that when we used addu instead the register would
# get zeroed out after the overflow since there is no trap that stops the
# program



        .text
        .globl main

main:
        ori     $8, $0, 1

top:    
        #add     $8, $8, $8
        add    $8, $8, $8
        j top
        sll     $0, $0, 0
