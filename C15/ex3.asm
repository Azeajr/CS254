        .text
        .globl main

main:
        lui     $10, 0x1000
        lw		$11, 0($10)
        ori     $12, $0, 6

        mult	$11, $12
        mflo	$12
        addi	$12, $12, -3
        
        mult    $11,$12
        mflo    $12
        addi	$12, $12, 7

        mult    $11,$12
        mflo    $12
        addi	$12, $12, 2
        
        sw		$12, 4($10)
        
        


        .data
x:      .word   1
answer: .word   0