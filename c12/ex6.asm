# Start out register $1 with any 32-bit pattern, such as 0x76543210.
# Now, put the reverse of that pattern into register $2, for the
# example,0x01234567.

        .text
        .globl main

main:
        # loading the register with a bit pattern
        ori     $1,$0,0x1234
        sll     $1,$1,16
        ori     $1,$1,0x5678

        # Swapping 0th and 7th order hex
        srl     $2,$1,28
        sll     $3,$1,28
        or      $4,$2,$3

        # Swapping 1st and 6th order hex
        sll     $2,$1,4
        srl     $2,$2,28
        sll     $2,$2,4

        srl     $3,$1,4
        sll     $3,$3,28
        srl     $3,$3,4

        or      $4,$4,$2
        or      $4,$4,$3

        # Swapping 2nd and 5th order hex
        sll     $2,$1,8
        srl     $2,$2,28
        sll     $2,$2,8

        srl     $3,$1,8
        sll     $3,$3,28
        srl     $3,$3,8

        or      $4,$4,$2
        or      $4,$4,$3

        # Swapping 3rd and 4th order hex
        sll     $2,$1,12
        srl     $2,$2,28
        sll     $2,$2,12

        srl     $3,$1,12
        sll     $3,$3,28
        srl     $3,$3,12

        or      $4,$4,$2
        or      $4,$4,$3