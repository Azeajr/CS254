# Write a program that asks the user for a positive integer. The program then 
# tests if the integer is prime and writes out its result.

        .text
        .globl main

main:
        li          $v0, 4
        la          $a0, prompt
        syscall

        li          $v0, 5
        syscall

        move        $t0, $v0
        remu        $t1, $t0, 2
        # tried remu but it gets translated into instructions that include a 
        # branch without a nop after it.  break gets run because it is in the 
        # branch delay slot which I do not think is the intended behavior.
        #
        # li          $t2, 2
        # div         $t0, $t2
        # mfhi        $t1
        
        # Checks if $t0 is even or not.
        beq         $t1, $zero, no
        nop
        # Sets the limit of the loop to $t0 div 2.
        mflo        $t1

        # Loop starts checking at 3
        li          $t2, 3
loop:   sltu        $t3, $t2, $t1
        # if the loops finishes from here than the number is prime
        beq         $t3, $zero, yes
        nop
        # this chunk is similar to a break statement combined with an if to 
        # check if the number divides $t0.  If it does then it will break out 
        # of the loop. I know this does not adhere to the principles of
        # structured programming.
        remu        $t3, $t0, $t2
        beq         $t3, $zero, no
        nop

        addu        $t2, $t2, 2
        j           loop
        nop


yes:    li          $v0, 4
        la          $a0, isPrime
        syscall
        j           end

no:     li          $v0, 4
        la          $a0, notPrime
        syscall

end:
        li          $v0, 10
        syscall

        .data
prompt:     .asciiz "Enter an integer: "
isPrime:    .asciiz "This number is prime.\n"
notPrime:   .asciiz "This number is not prime.\n"