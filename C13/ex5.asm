#Let register $8 be x. Write a program that computes 13x. Leave the result in
#register $10. Initialize x to 1 for debugging. Then try some other positive
#values.
#
#Extend your program so that it also computes -13x and leaves the result in
#register $11 (This will take one additional instruction.) Now initialize x to
#-1. Look at your result for 13x. Is it correct?
        .text
        .globl main

main:
        ori     $8,$0,1
        nor     $8,$0,$8
        addiu   $8,$8,1


        sll     $10,$8,4
        subu    $10,$10,$8
        subu    $10,$10,$8
        subu    $10,$10,$8

        sll     $11,$8,4
        subu    $11,$11,$8
        subu    $11,$11,$8
        subu    $11,$11,$8
        nor     $11,$0,$11
        addiu   $11,$11,1