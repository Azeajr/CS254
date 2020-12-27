        .text
        .globl main
main:   lui     $1, 0x1000
        lw      $3, 0($1)
        sll     $0, $0, $0

        ori     $2, $0, 4
        mult    $3, $2
        mflo    $2
        # Pointing at the end of array
        addu    $2, $2, $1
        # Pointing at the beginning of array
        addiu   $1, $1, 4

        # Dividing the number of elements in half gives us the number of loops 
        # necessary to swap both sides of the array.
        ori     $4, $0, 2
        div     $3, $4
        mflo    $3
        # Counter
        or      $4, $0, $0

loop:   sltu    $5, $4, $3
        beq     $5, $0, endLp
        sll     $0, $0, $0
        # Loads front and rear values
        lw      $5, 0($1)
        lw      $6, 0($2)
        sll     $0, $0, $0
        # Stores front at the rear and rear goes to front
        sw      $5, 0($2)
        sw      $6, 0($1)
        # Adjust the front and rear pointers
        addiu   $1, $1, 4
        addiu   $2, $2, -4

        addiu   $4, $4, 1
        j       loop        

endLp:  sll     $0, $0, $0



        .data
size :  .word   7                     # number of elements
        .word   1, 2, 3, 4, 5, 6, 7