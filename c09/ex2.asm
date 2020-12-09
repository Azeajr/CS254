		.text
		.globl main

main:
		ori		$8,$0,0x2
		ori		$9,$0,0x3
		
		addu	$10,$8,$9
		
		# Reverse the first two statements. Does this have any effect on the result in register $10?
		# No, it does not change the resulting register.
		# Reverse the last two statements. Does this have any effect on the result?
		# Yes, the answer stored at $10 is whichever register has a value other than zero. So in my case I get a 3 stored in $10.  After the sum is computed register $8 gets a 2 stored.
		# Start with the original program. Reverse the order of the last two registers in the last statement. Does this have any effect on the result?
		# As expected, the result is the same.
