# Write a program that computes terms of the Fibonacci series, defined as:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# My first attempt at this program without using the professors specifications.
# Turns out that this is not as efficient as the standard method.


        .text
        .globl main

main:
        or      $6, $0, $0
        ori     $7, $0, 101

        ori     $8, $0, 1
        or      $9, $8, $0


top:    
        beq     $6, $7, exit
        sll     $0, $0, 0

        addu     $9, $9, $8
        or      $10, $0, $9
        or      $9, $0, $8
        or      $8, $0, $10

        addi    $6, $6, 1

        j top
        sll     $0, $0, 0
        
exit:
        j	exit		# jump to exit
        sll     $0, $0, 0