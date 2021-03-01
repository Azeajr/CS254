# Notice: assembly instructions can use decimal or hex to specify bit patterns. 
# In the below, 15 and 0xF result in the same bit pattern.

		.text
		.globl main

main:
		ori		$8, $0, 0xf
		ori		$9, $0, 0x7
		addu	$10, $8, $9

		ori		$8, $0, 15
		ori		$9, $0, 7
		addu	$10, $8, $9