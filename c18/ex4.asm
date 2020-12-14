# Write a program that computes the median of three values in memory. After it
# has been found, store the median in memory.



        .text
        .globl main

main:
        # Starting address of data
        lui     $10, 0x1000
        # Loading all three values to registers 11 through 13.
        lw      $11, 0($10)
        sll     $0, $0, $0

        lw      $12, 4($10)
        sll     $0, $0, $0

        lw      $13, 8($10)
        sll     $0, $0, $0

        # Checking to see if $11 is largest or smallest value.
        sltu    $14, $11, $12
        sltu    $15, $11, $13
        # If 14 and 15 are the same then 11 is the largest or smallest value
        # If not then 11 must be the median.
        beq     $14, $15, D
        sll     $0, $0, $0
        j       eleven
        sll     $0, $0, $0

        # If 14 is a zero then 11 is the largest else 11 is the smallest.
D:      beq     $14, $0, E
        sll     $0, $0, $0
        # At this point 11 is the smallest.  If 12 is less than 13, then 12 is
        # the middle number otherwise 13 is.
        sltu    $14, $12, $13
        beq     $14, $0, thirteen
        sll     $0, $0, $0
        j       twelve
        sll     $0, $0, $0

        # At this point 11 is the largest.  If 12 is less than 13, then 13 is
        # the middle number otherwise 12 is.
E:      sltu    $14, $12, $13
        beq     $14, $0, twelve
        sll     $0, $0, $0
        j       thirteen
        sll     $0, $0, $0

eleven: sw      $11, 12($10)
        j       end
        sll     $0, $0, $0

twelve: sw      $12, 12($10)
        j       end
        sll     $0, $0, $0
thirteen:
        sw      $13, 12,($10)

        # Loop to catch the end of program "gracefully"
end:
        j       end
        sll     $0, $0, $0

        .data
A:      .word 23
B:      .word 98
C:      .word 17