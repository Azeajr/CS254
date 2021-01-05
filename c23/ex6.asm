        .text
        .globl  main

main:   li          $v0, 4
        la          $a0, promptK
        syscall

        li          $v0, 5
        syscall
        # $t0 is K
        move        $t0, $v0

        li          $v0, 4
        la          $a0, promptN
        syscall

        li          $v0, 5
        syscall
        # $t1 is N
        move        $t1, $v0

        # $t4 is the accumulator for the numerator
        move        $t4, $t1
        # $t5 is the accumulator for the numerator
        move        $t5, $t0
        
        
        


        li          $t2, 1

loop:   sltu        $t3, $t2, $t0
        beq         $t3, $zero, endLp
        nop

        



        subu        $t1, $t1, 1
        addu        $t2, $t2, 1
        j           loop

endLp:








end:    li          $v0, 10
        syscall


        .data
promptN:.asciiz "Enter number of successfull outcomes N: "
promptK:.asciiz "Enter total number of possible outcomes K: "
newline:.asciiz "\n"