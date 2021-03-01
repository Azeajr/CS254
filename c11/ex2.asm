# Complete the program as described in the comments. The goal is to create a 
# 16-bit negative nine in register $11 and then to add the positive and 
# negative together. Do you end up with a 16-bit zero?

		.text
		.globl	main

main:
		ori		$11,$0,0x0001
		ori		$10,$0,0x0009
		xori	$12,$10,0xFFFF
		addu	$11,$12,$11		## $11 should hold two's compliment -9
		addu	$12,$11,$10		##Final answerd ends up being
								##0x10000 which is an overflow
								##that is equivalent to a
								##16bit zero but since its a
								##32bit result we see a 0x10000