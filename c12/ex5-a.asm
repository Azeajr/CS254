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
# You will also need shift instructions.
#
# B. Somewhat Harder program: Use only and, or, and shift instructions.
        .text
        .globl main
main:
        ori     $1,$0,0xFACE
        #Masks
        ori     $2,$0,0xF000
        ori     $3,$0,0x0F00
        ori     $4,$0,0x00F0
        ori     $5,$0,0x000F
        
        and     $2,$2,$1
        and     $3,$3,$1
        and     $4,$4,$1
        and     $5,$5,$1

        srl     $2,$2,8
        sll     $4,$4,8

        or      $1,$2,$3
        or      $1,$1,$4
        or      $1,$1,$5


