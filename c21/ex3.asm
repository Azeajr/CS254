        .text
        .globl  main

main:
        la		$t3, string1		# 
        la		$t2, string2		# 
        lb		$t0, 0($t2)		# 
        lb		$t1, 0($t3)		# 
        nop

loop:   beq		$t0, $zero, endLp	# if $t0 == $zero then target
        nop

        sltu            $t4, $t0, $t1
        beq             $t4, $zero, reverse
        nop

        sub             $t4, $t1, $t0
        li              $t5, 0x20
        beq             $t4, $t5, equal
        nop
        j		equalIf
        nop
        

reverse:
        sub             $t4, $t0, $t1
        li              $t5, 0x20
        beq             $t4, $t5, equal
        nop


equalIf:
        bne		$t0, $t1, notEqual	# if $t0 != $t1 then endLp
        nop

equal:  addiu   $t2, $t2, 1
        addiu   $t3, $t3, 1

        lb		$t0, 0($t2)		# 
        lb		$t1, 0($t3)		# 
        #nop

        j		loop				# jump to loop
        nop

endLp:  bne		$t0, $t1, notEqual	# if $t0 != $t1 then notEqual
        nop
        ori     $t4, $zero, 1
        sw		$t4, result		    # 


notEqual:
        nop

            .data
result:     .word     0
string1:    .asciiz   "puffin"
string2:    .asciiz   "puFfins"