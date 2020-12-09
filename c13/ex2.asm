#Initialize the sum in register $8 to zero. Then add 409610 to $8 sixteen times.
#You don't know how to loop, yet, so do this by making 16 copies of the same
#instruction. The value 409610 is 0x1000.
#
#Next initialize register $9 to 409610. Shift $9 left by the correct number of
#positions so that registers $8 and $9 contain the same bit pattern.
#
#Finally, initialize aregister $10 to 409610. Add $10 to itself the correct
#number of times so that it contains the same bit pattern as the other two
#registers.

        .text
        .globl main

main:
        # Adding 4096 sixteen times aka 4096 * 16
        or      $8,$0,$0
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000

        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000

        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000

        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000
        addiu   $8,$8,0x1000

        # Starting with 4096
        ori     $9,$0,0x1000
        sll     $9,$9,4
        