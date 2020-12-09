        .text
        .globl main
main:
        
        
        lui     $10, 0x1000
        lw      $11, 0($10)     # x
        lw		$12, 4($10)		# y

        ori     $13, $0, 17
        mult    $11, $13
        mflo    $13
        addi    $13, $13, -6
        mult    $12, $13
        mflo    $13

        
        ori     $12, $0, 12
        mult	$12, $11			# $13 * $11 = Hi and Lo registers
        mflo	$11
        sub     $13, $13, $11
        add     $13, $13, $12
        
        sw      $13,8($10)


        .data
x:      .word   17
y:      .word   25
answer: .word   0