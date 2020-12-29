# Evaluate the following polynomial using Horner's method:
# ax3 + bx2 + cx + d
# Use the pseudoinstruction lw to get the coefficients from memory, and sw to 
# write the result back to memory.
# This does not result in shorter code but it was much easier to write because 
# I did not need to worry about the location of data.  Instead I used symbolic 
# address which made writing the code


        .text
        .globl  main

main:
        lw		$t0, x		# 
        lw		$t1, a		# 
        nop

        mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
        lw		$t2, bb		#2
        mflo	$t1					# copy Lo to $t2
        add		$t1, $t1, $t2		# $t0 = $t1 + $t2

        mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
        lw		$t2, c		#2
        mflo	$t1					# copy Lo to $t2
        add		$t1, $t1, $t2

        mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
        lw		$t2, d		#2
        mflo	$t1					# copy Lo to $t2
        add		$t1, $t1, $t2

        sw		$t1, result		# 
        
        .data
x:      .word       7
a:      .word       -3
bb:     .word       3
c:      .word       9
d:      .word       -24
result: .word       0