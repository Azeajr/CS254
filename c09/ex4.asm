# Create a program that computes 5+5+5. Do this by modifying (yet again) the 
# chapter's program. You will need to use two addu instructions.


		.text
		.globl main

main:
		ori		$8,$0,0x5
		ori		$9,$0,0x5
		addu	$8,$8,$9
		addu	$8,$8,$9