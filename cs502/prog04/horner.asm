## CS 254 Program 4
##
## Compute 7x^4+2x^3+10x^2-3x+17 using Horner's Method
##
## Programmer:  Antonio Zea
## Date:    03-18-2021
##############################################################
## $9 = x
## $10 = accumulator
##############################################################

        .text
        .globl main

main:
        addiu   $9, $zero, 2    # x
        addiu   $10, $zero, 7   # First coefficient
        mult    $10, $9         # Multiply $10 times $9
        mflo    $10             # Loads $10 with the contents of the LO register
                                # $10 = 7x
        sll     $zero, $zero, 0 # I think nop is necessary because if you try 
                                # to read a value from HI or LO, you must wait 
                                # two instructions before performing any 
                                # operation that writes to HI or LO. Otherwise, 
                                # the reads will produce garbage.
                                # This is not necessary in SPIM but necessary
                                # in hardware implementations.
#(Kjell, http://programmedlessons.org/AssemblyTutorial/Chapter-14/ass14_05.html)
#(Chen, https://devblogs.microsoft.com/oldnewthing/20180404-00/?p=98435)

        addiu   $10, $10, 2     # $10 = 7x+2
        mult    $10, $9
        mflo    $10             # $10 = 7x^2+2x
        sll     $zero, $zero, 0 # nop

        addiu   $10, $10, 10    # $10 = 7x^2+2x+10
        mult    $10, $9
        mflo    $10             # $10 = 7x^3+2x^2+10x
        sll     $zero, $zero, 0 # nop

        addiu   $10, $10, -3    # $10 = 7x^3+2x^2+10x-3
        mult    $10, $9
        mflo    $10             # $10 = 7x^4+2x^3+10x^2-3x

        addiu   $10, $10, 17    # $10 = 7x^4+2x^3+10x^2-3x+17
