# Write a program that asks the user for integers N and K and writes out the 
# odds of winning such a lottery. This calcualates the number of possible 
# combinations between a K and a N.  N choose K

        .text
        .globl  main

main:   li              $v0, 4
        la              $a0, promptK
        syscall

        li              $v0, 5
        syscall
        # $t0 is K
        move            $t0, $v0

        li              $v0, 4
        la              $a0, promptN
        syscall

        li              $v0, 5
        syscall
        # $t1 is N
        move            $t1, $v0

        # $t4 is the accumulator for the numerator
        li              $t4, 1
        # $t5 is the accumulator for the numerator
        li              $t5, 1

        
loop:   beq             $t0, $zero, endLp
        nop

        mul             $t4, $t4, $t1
        subu            $t1, $t1, 1
        nop

        mul             $t5, $t5, $t0
        subu            $t0, $t0, 1
        nop

        j               loop
        nop

endLp:  nop



        li              $v0, 1
        # Pseudoinstruction gets translated to 
        # bne $t5, $zero, 4           ; 57: divu $a0, $t4, $t5 
        # break                    
        # divu $t4, $t5            
        # mflo $a0
        # Issue is that the break gets run even when $t5 is not zero.  A nop is # necessary but assembler does not insert it.
        divu            $a0, $t4, $t5
        syscall


end:    li          $v0, 10
        syscall


        .data
promptN:.asciiz "Enter number of successfull outcomes N: "
promptK:.asciiz "Enter total number of possible outcomes K: "
newline:.asciiz "\n"