# Write a program that searches for perfect numbers. It has an outer loop that 
# counts upward from two to some limit. Each number is tested to see if it is a 
# perfect number. If it is a perfect number it is stored at a memory location. 
# Store perfect numbers at successive full-word memory locations.

        .text
        .globl main
# $5 will hold the base address of the data section
main:   lui     $5, 0x1000
# $8 holds the counter for the outer loop.  It also acts as the number that we
# are currently testing.
        #init1
        ori     $8, $0, 2

# The outer loop's test case.  This will branch when $8 hold a number that is
# greater than or equal to 10000.  It will jump to the endLp label which 
# basically is the end of the program.
#
# I use $9 as temporary register. This made sense to me since it only gets used 
# after I have just put something in it.  It does not matter what the register 
# was holding before that moment.
test1:  sltiu   $9, $8, 10000
        beq     $9, $0, endLp1
        sll     $0, $0, 0

        #init2
        ori     $10, $0, 1
        or      $4, $0, $0
# Inner loop responsible for checking if integers from 1 to $8 are factors of 
# $8. If $10 is a factor of $8 then it is added to a running total at $4.  If 
# at the end of this loop, the sum at $4 equals $8 then we have found a perfect 
# number.

# Inner loop runs until $10 is greater than or equal to $8.
test2:  sltu    $9, $10, $8
        beq     $9, $0, endLp2
        sll     $0, $0, 0

        div     $8, $10
        mfhi    $9
        # This will branch to notFactor if $9 is not 0 therefore $10 was not a 
        # factor and should not be added to the running sum.
        bne     $9, $0, notFactor
        sll     $0, $0, 0

        addu    $4, $4, $10

notFactor:

        addiu   $10, $10, 1
        j       test2
        sll     $0, $0, $0

endLp2: sll     $0, $0, 0
        # This where we check if the sum at $4 ended up equaling $8.  If they 
        # are not equal then a branch is initated to skip the store step.
        bne     $4, $8, notPerfect
        sll     $0, $0, $0

        sw      $8, 0($5)
        addiu   $5, $5, 4


notPerfect:
        sll     $0, $0, $0
        addiu   $8, $8, 1
        j       test1
        sll     $0, $0, $0

endLp1:  sll     $0, $0, 0



        .data
array:  .space 100