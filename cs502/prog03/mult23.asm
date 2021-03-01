##  CS 254      Program 3   Spring2021
##
##  Compute 23*x
##
##  Programmer: Antonio Zea Jr
##  Date: 2021-02-28
##############################################################
        .text
        .globl main
main:
        # First draft using 3 registers
        ori     $7, $0, 100
        sll     $10, $7, 4
        
        sll     $8, $7, 2
        addu    $10, $10, $8

        sll     $8, $7, 1
        addu    $10, $10, $8

        addu    $10, $10, $7
        # Second draft using 2 registers. Used Horner's Method to compute answer.
        ori     $7, $0, 100
        sll     $10, $7, 2
        addu    $10, $10, $7

        sll     $10, $10, 1
        addu    $10, $10, $7

        sll     $10, $10, 1
        addu    $10, $10, $7








