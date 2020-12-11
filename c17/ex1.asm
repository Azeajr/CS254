# Write a program that computes the sum:
# 1 + 2 + 3 + 4 + 5 + ...
        .text
        .globl main

main:
        or      $8, $0, $0
        ori     $9, $0, 1

top:    add	$8, $8, $9		# $8 = $8 + $9
        j   top
        sll     $0, $0, 0