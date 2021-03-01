# Replace 0x??? with some immediate operand. Run the program by pushing F10 to 
# single step. Check the register display after each step. Find the bit pattern 
# to use in the third instruction that will return $10 to its original pattern.
		.text
		.globl 	main
		
main:
		ori		$10,$0,0x2BAD
		xori	$10,$10,0xF3C5
		xori	$10,$10,0xF3C5