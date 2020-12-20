# Write a program that determines if an integer is prime. An integer is prime 
# if it cannot be divided by any positive integer other than one and itself. 
# The integer N to be tested will be in memory. Set the location isprime to 1 
# if N is prime, 0 otherwise.
#
# I am not sure I have adhered to the principles of structured programming.


        .text
        .globl main

main:   lui     $5, 0x1000
        lw      $6, 0($5)

        #init
        
        ori     $9, $0, 2
        div     $6 $9
        mfhi    $7
        # Checking if $6 is even or not. That is why I used mfhi here.
        beq     $7, $0, notprime
        sll     $0, $0, $0
        # Now that we know that $6 is not even then $7 will represent the 
        # stopping point of the loop.  Usually I think sqrt would find a better 
        # stopping point than dividing by 2.
        mflo    $7
        
        ori     $8, $0, 3


test:   sltu    $9, $8, $7
        beq     $9, $0, endLp
        sll     $0, $0, 0
        # Check if the $6 is divisible by $8. If $9 is eqaul to $0 then $6 is 
        # not prime.
        div     $6, $8
        mfhi    $9
        beq     $9, $0, notprime
        sll     $0, $0, $0



        addiu   $8, $8, 2
        j       test
        sll     $0, $0, $0

endLp:  sll     $0, $0, $0
        # If we are at this point in the code then the loop has finished 
        # without find a value that divides $6 so it must be prime.
        ori     $6, $0, 1
        sw      $6, 4($5)
        sll     $0, $0, $0

notprime:
        # If a $8 ever divides $6 then the branch leads here and the value at 
        # isprime is not changed from it's default of 0.
        sll     $0, $0, $0




            .data
N:          .word   1033
isprime:    .word   0