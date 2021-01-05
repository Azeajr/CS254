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
        beq         $t1, $zero, no
        nop

        li          $t2, 3

loop:   sltu        $t3, $t2, $t1
        beq         $t3, $zero, yes
        nop

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