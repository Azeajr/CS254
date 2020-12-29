# Add two arrays pair wise and store the sum in a third array.
#
# $t0 counter for loop
# $t1 limit for loop
# $t2 address of values in array1
# $t3 address of values in array2
# $t4 address of values in result

# $t5 value from array1
# $t6 value from array2
# $t7 value from result
        .text
        .globl  main

main:
        or              $t0, $zero, $zero   # index
        lw		$t1, size		    # loop limit
        la		$t2, array1		    # 
        la		$t3, array2		    # 
        la		$t4, result		    # 
        
        

loop:   sltu            $t8, $t0, $t1
        beq		$t8, $zero, endLp   # if $t8 ==zerot1 then endLp
        


        lw		$t5, 0($t2)		# 
        lw		$t6, 0($t3)		#
        addiu           $t2, $t2, 4
        addiu           $t3, $t3, 4
        addu            $t7, $t6, $t5
        sw		$t7, 0($t4)		#
        addiu           $t4, $t4, 4

        addiu           $t0, $t0, 1
        j		loop				# jump to loop
        
        
endLp:  nop


        .data
size:   .word       7
array1: .word     -30, -23, 56, -43, 72, -18, 71
array2: .word      45,  23, 21, -23, -82,  0, 69
result: .word       0,   0,  0,   0,   0,  0,  0
