# Write a program that evaluate the following for various values of u and v:
# 5u^2 - 12uv + 6v^2
# The values for u and v are prompted for in a loop. The user enters the values 
# and the value of the expression is printed out. If illegal characters are 
# entered for either u or v, print out an error message and continue.
# End the loop when the user enters "done" for the value of u.

# The multhree and readInt subroutine are both used to multiply three parameters and read integers in respectively


        .text
        .globl main

main:
loopU:  li      $v0, 4
        la      $a0, promptU
        syscall

        # Subroutine returns 1 if user enterd a valid integer, 0 if the input 
        # was not an integer and 2 if the user enterd "done".
        jal     readInt

        beq     $v1, 1, endLpU
        nop

        beq     $v1, 0, notConvU
        nop

        beq     $v1, 2, close
        nop

notConvU:
        li      $v0, 4
        la      $a0, error
        syscall
        j       loopU
        nop

endLpU: nop
        move    $s0, $v0

loopV:  li      $v0, 4
        la      $a0, promptV
        syscall

        jal     readInt

        beq     $v1, 1, endLpV
        nop

        beq     $v1, 0, notConvV
        nop

        # Even if done is entered at this point then it not interpreted as a
        # terminate signal.
        beq     $v1, 2, notConvV
        nop

notConvV:
        li      $v0, 4
        la      $a0, error
        syscall
        j       loopV
        nop

endLpV: nop
        move    $s1, $v0

        li          $a0, 5
        move        $a1, $s0
        move        $a2, $s1

        jal         multhree
        nop

        move        $s2, $v0

        li          $a0, -12
        move        $a1, $s0
        move        $a2, $s1

        jal         multhree
        nop

        addu        $s2, $s2, $v0

        li          $a0, 6
        move        $a1, $s1
        move        $a2, $s1

        jal         multhree
        nop

        addu        $s2, $s2, $v0

        li          $v0, 4
        la          $a0, answer
        syscall

        li          $v0, 1
        move        $a0, $s2
        syscall

        li          $v0, 4
        la          $a0, newline
        syscall

        j           main

close:  nop
        li          $v0, 10
        syscall

        .data
promptU:.asciiz "U or done to quit\n"
promptV:.asciiz "V\n"
answer: .asciiz "5u^2 - 12uv + 6v^2 = "
error:  .asciiz "Not an integer.\n"
newline:.asciiz "\n"

