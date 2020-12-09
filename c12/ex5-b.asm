# Put the bit pattern 0x0000FACE into register $1. This is just an example
# pattern; assume that $1 can start out with any pattern at all in the low
# 16 bits (but assume that the high 16 bits are all zero).
# Now, using only register-to-register logic and shift instructions, rearrange
# the bit pattern so that register $2 gets the bit pattern 0x0000CAFE.
# Write this program so that after the low 16 bits of $1 have been set up with
# any bit pattern, no matter what bit pattern it is, the nibbles in $2 are the
# same rearrangement of the nibbles of $1 shown with the example pattern. For
# example, if $1 starts out with 0x00003210 it will end up with the pattern
# 0x00001230
#
# A. Moderately Easy program: do this using ori instructions to create masks,
# then use and and or instructions to mask in and mask out the various nibbles.
# You will also need rotate instructions.
#
# B. Somewhat Harder program: Use only and, or, and rotate instructions.
        .text
        .globl main
main:
        ori     $1,$0,0xFACE

        srl     $2,$1,12
        sll     $2,$2,4

        sll     $3,$1,20
        srl     $3,$3,28
        sll     $3,$3,8

        srl     $4,$1,4
        sll     $4,$4,28
        srl     $4,$4,16

        sll     $5,$1,28
        srl     $5,$5,28

        or      $1,$2,$3
        or      $1,$1,$4
        or      $1,$1,$5