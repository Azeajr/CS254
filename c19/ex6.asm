# Write a program that computes the Euler phi function.

        .text
        .globl  main
main:
        lui     $1, 0x1000
        lw      $2, 0($1)


        #init1
        #phi
        or      $3, $0, $0
        #index
        ori     $4, $0, 1

        # While $4 is less than $2 the loop will continue. This outer loop runs 
        # throught the number from 1 through N checking if their gcd is 1
test1:  sltu    $5, $4, $2
        beq     $5, $0, endLp1
        sll     $0, $0, $0

        #init2
        or      $6, $0, $4
        or      $7, $0, $2
        # Inner loop is responsible for determining what the gcd is between $4 
        # and $2.
test2:  beq     $6, $7, endLp2
        sll     $0, $0, $0
        #if1
        sltu    $5, $7, $6
        beq     $5, $0, else1
        sll     $0, $0, $0
        sub     $6, $6, $7
        j       test2
        sll     $0, $0, $0
else1:
        sub     $7, $7, $6
        j       test2
        sll     $0, $0, $0

endLp2: sll     $0, $0, $0

        # Now that the inner loop has ended, this if statement will branch if 
        # the gcd is not 1.  This means that only relatively prime inputs 
        # increment $3.
        ori     $7, $0, 1
        #if2
        bne     $6, $7, else2
        sll     $0, $0, $0
        addiu   $3, $3, 1

else2:
        addiu   $4, $4, 1
        j       test1
        sll     $0, $0, $0

endLp1: sll     $0, $0, $0
        # The total number of relatively prime numbes between 1 and N now 
        # reside in $3.
        sw      $3, 4($1)
        sll     $0, $0, $0
        

        .data
N:      .word   21
phi:    .word   0