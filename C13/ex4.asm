#Let register $8 be x and register $9 be y. Write a program to evaluate:
# 3x - 5y
#Leave the result in register $10. Inspect the register after running the
#program to check that the program works. Run the program several times,
#initialize x and y to different values for each run.


        .text
        .globl main

main:
        ori     $8,$0,25
        ori     $9,$0,104

        #3 * $8 - 5 * $9
        #3x-5y
        sll     $10,$8,1
        addu    $8,$10,$8
        sll     $10,$9,2
        addu    $9,$10,$9
        subu    $10,$8,$9
        # Issue will be when overflow occurs.
        # If y is big enough it can cause arithmetic
        # overflow with a small enough negative.