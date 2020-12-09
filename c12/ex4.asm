# Put the bit pattern 0x55555555 in register $1. (Do this with three
# instructions.)
# Now shift the pattern left one position into register $2 (leave $1 unchanged).
# Put the the bit-wise OR of $1 and $2 into register $3. Put the the bit-wise
# AND of $1 and $2 into register $4. Put the the bit-wise XOR of $1 and $2 into
# register $5.
#
# Examine the results.

        .text
        .globl main
main:
        ori $1,$0,0x5555
        sll $1,$1,16
        ori $1,$1,0x5555

        sll $2,$1,1
        or  $3,$1,$2
        and $4,$1,$2
        xor $5,$1,$2
