## poly.asm
##
## evaluate  5x^2 -12x + 97 
##
        .text
        .globl main

main:
        lui     $10, 0x1000
        lw      $11, 0($10)

        ori     $12, $0, 97

        ori     $13, $0, 12
        mult	$11, $13
        mflo	$13
        subu    $12, $12, $13

        mult    $11, $11
        mflo    $11
        ori     $13,$0,5
        mult    $11, $13
        mflo    $13
        addu    $12, $12, $13

        sw      $12, 4($10)
        


        .data
x:      .word   17
poly:    .word   0