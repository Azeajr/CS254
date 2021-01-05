# Write a program that asks the user for an integer and then computes the 
# square root of that integer. Use only integer arithmetic. The integer square 
# root of N is the positive integer X who's square is exactly N, or who's 
# square is less than N but as close to N as possible.

        .text
        .globl main

main:   li              $v0, 4
        la              $a0, prompt
        syscall

        li              $v0, 5
        syscall

        # nop not necessary since this will branch to end the program
        beq             $v0, $zero, end

        move            $s0, $v0
        # I set this to 0 instead of 1 with the intent to transfer this to an 
        # implementation that can do fixed point square roots.
        li              $t1, 0

loop:   mul             $t0, $t1, $t1
        sltu            $t2, $t0, $s0
        beq             $t2, $zero, endLp
        nop

        add             $t1, $t1, 1
        j               loop
        nop

endLp:  
        # If the the number found is exactly the square root then we do not 
        # have to jump back to the previous integer the loop was testing.
        beq             $t0, $s0, printRoot
        nop
        
        subu            $t1, $t1, 1


printRoot:
        move            $a0, $t1
        li              $v0, 1
        syscall

        li              $v0, 4
        la              $a0, newline
        syscall

        j               main

end:    li		$v0, 10
        syscall


        .data
prompt: .asciiz "Enter an integer: "
newline:.asciiz "\n"
