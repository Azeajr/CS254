# Write a program that computes three sums:
#
# 1 + 2 + 3 + 4 + ... + 99 + 100
#
# 1 + 3 + 5 + 7 + ... + 97 + 99
#
# 2 + 4 + 6 + 8 + ... + 98 + 100
# Use a register (say $8) for the sum of evens, a register (say $9) for the sum
# of odds, and another (say $10) for the sum of all numbers.
# Do this with one counting loop. The loop body contains logic to add the count
# to the proper sums.

        .text
        .globl main

main:
        #evens
        or      $8, $0, $0
        #odds
        or      $9, $0, $0
        #all
        or      $10, $0, $0
        # stores 2 for multiplication
        ori     $13, $0, 2

        #$11 is our index
        #$12 holds whether test returned true(1) or false(1)
init:   or      $11, $0, $0
        or      $12, $0, $0
        
        
test:   sltiu   $12, $11, 101
        beq     $12, $0, endLP
        sll     $0, $0, 0

        # $14 is used to determine whether $11 is even or odd
        # 0 in $14 means $11 is even while a 1 in $14 means $11 is odd
        divu    $11,$13
        mfhi    $14
        
        # $14 not equal to 0 means it is odd so do not add it $8
        bne     $14, $0, odd
        sll     $0, $0, 0
        addu    $8, $8, $11
        
        # $14 equal to 0 means it is even so do not add it $9
odd:    beq     $14, $0, even
        sll     $0, $0, 0
        addu    $9, $9, $11

        # always add it to $10 to calculate total
even:   addu    $10, $10, $11

        addiu   $11, $11, 1
        j       test

endLP:  sll     $0, $0, 0