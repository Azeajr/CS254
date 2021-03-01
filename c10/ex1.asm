## Program to add two plus three

# Modify the program so that it puts a 1 in register $1, a 2 in register $2, a 
# 3 in register $3, and so on up to register $12 (or higher if you wish). Run 
# the program by pushing F10 to single step. Check the register display after 
# each step.

# Notice that in the QtSpim display the machine instructions of this program 
# are loaded into memory starting at address 0x400000, the beginning of the 
# text segment of memory.

		.text
		.globl	main
		
main:
		ori		$1,$0,0x1
		ori		$2,$0,0x2
		ori		$3,$0,0x3
		ori		$4,$0,0x4
		ori		$5,$0,0x5
		ori		$6,$0,0x6
		ori		$7,$0,0x7
		ori		$8,$0,0x8
		ori		$9,$0,0x9
		ori		$10,$0,0xA
		ori		$11,$0,0xB
		ori		$12,$0,0xC
		
		addu	$10,$8,$9