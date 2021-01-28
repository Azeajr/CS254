# Write a subroutine that takes three arguments, A, X, and Y. It then computes # A*X*Y and returns it.
# Use the subroutine to evaluate the following for various values of u and v:
# 5u^2 - 12uv + 6v^2

        .text
        .globl main

main:

        # Ask user for U
loop1:  li          $v0, 4
        la          $a0, prompt1
        syscall

        li          $v0, 5
        syscall
        move        $s0, $v0
        # Ask user for V
        li          $v0, 4
        la          $a0, prompt2
        syscall

        li          $v0, 5
        syscall
        move        $s1, $v0

        # If U and V are equal then $t0 is set to 1
        # If U and $zero are equal then $t1 is set 1
        #seq         $t0, $s0, $s1
        #seq         $t1, $s0, $zero
        #beq         $t0, $t1, endLp1
        # Lastly if $t0 and $t1 are equal then U and V are both zero

        # A more succinct solution was to multiply U and V and check if the 
        # product is equal to zero
        mul         $t0, $s0, $s1
        beq         $t0, $zero, endLp1
        nop

        li          $a0, 5
        move        $a1, $s0
        move        $a2, $s1

        jal         multhree
        nop

        move        $s3, $v0

        li          $a0, -12
        move        $a1, $s0
        move        $a2, $s1

        jal         multhree
        nop

        addu        $s3, $s3, $v0

        li          $a0, 6
        move        $a1, $s1
        move        $a2, $s1

        jal         multhree
        nop

        addu        $s3, $s3, $v0

        li          $v0, 1
        move        $a0, $s3
        syscall

        li          $v0, 4
        la          $a0, newline
        syscall

        j           loop1

endLp1: nop

        li          $v0, 10
        syscall

        .data
prompt1:.asciiz "Enter a value for U: "
prompt2:.asciiz "Enter a value for V: "
newline:.asciiz "\n"