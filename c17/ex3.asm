# Write a program that computes the sum:
# 1 + 2 + 3 + 4 + 5 + ... + 98 + 99 + 100

        .text
        .globl main

main:
        or      $8, $0, $0
        ori     $9, $0, 1
        ori     $10, $0, 101




top:    beq	$9, $10, exit	# if $t0 == $t1 then target
        sll     $0, $0, 0

        add     $8, $8, $9
        addi    $9, $9, 1

        j top
        sll     $0, $0, 0

exit:   j	exit		# jump to exit
        sll     $0, $0, 0