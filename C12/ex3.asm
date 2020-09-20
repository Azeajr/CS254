# Start out a program with the instruction that puts a single one-bit into
# register one:
#
# ori   $1,$0,0x01
#
# Now, by using only shift instructions and register to register logic
# instructions, put the pattern 0xFFFFFFFF into register $1. Don't use another
# ori after the first. You will need to use more registers than $1. See how few
# instructions you can do this in. My program has 11 instructions.

        .text
        .globl main

main:
        ori $1,$0,0x01
        sll $2,$1,1
        or  $1,$1,$2
        sll $2,$1,2
        or  $1,$1,$2
        sll $2,$1,4
        or  $1,$1,$2
        sll $2,$1,8
        or  $1,$1,$2
        sll $2,$1,16
        or  $1,$1,$2
