		.text
		.globl	main

main:
		ori		$11,$0,0x0001
		ori		$10,$0,0x0009
		xori	$12,$10,0xFFFF
		addu	$11,$12,$11
		addu	$12,$11,$10		##Final answerd ends up being
								##10000 which is an overflow
								##that is equivalent to a
								##16bit zero