# evaluate 3x^2 + 5x - 12
        .text
        .globl main
main:
        lui     $10, 0x1000
        lw      $11, 0($10)

        ori     $12, $0, 12

        ori     $13, $0, 5
        mult    $11, $13
        mflo    $13
        subu    $12, $13, $12

        sll     $0, $0, 0
        mult    $11, $11
        mflo    $11
        ori     $13, $0, 3
        sll     $0, $0, 0
        mult    $11,$13
        mflo    $11
        addu    $12, $11, $12

        sw      $12, 4($10)










        .data
x:      .word   25
poly:   .word   0