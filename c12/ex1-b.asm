# Put the following bit pattern into register $1 :
# DEADBEEF
# Do this one letter at a time, using ori to load each letter (each nibble) 
# into a register, then shifting it into position. You will need to use ori, 
# or, and sll instructions. Look at the contents of register $1 as you push F10 
# to single step the program.

		.text
		.globl main
main:
		ori		$1,$0,0xD
		sll		$1,$1,4

		ori		$1,$1,0xE
		sll		$1,$1,4

		ori		$1,$1,0xA
		sll		$1,$1,4

		ori		$1,$1,0xD
		sll		$1,$1,4

		ori		$1,$1,0xB
		sll		$1,$1,4

		ori		$1,$1,0xE
		sll		$1,$1,4

		ori		$1,$1,0xE
		sll		$1,$1,4

		ori		$1,$1,0xF
