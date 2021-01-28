# Vowel Removal (stack-based)
        .text
        .globl main

main:   li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, buffer
        syscall
        # $t0 points to the front of the string
        # $t1 points to the end of the string
        move    $t0, $a0
        move    $t1, $t0
        # This loop gets $t1 to point to the end of the string
loop1:  lbu     $t2, ($t1)
        nop
        beqz    $t2, endLp1
        nop


        addu    $t1, $t1, 1
        j       loop1
endLp1: nop

        # Pushes characters onto the stack from the string starting at the end 
        # and moving backward
loop2:  lbu     $t2, ($t1)
        # Omit pushing AEIOUaeiou in the stack as well as the newline character
        beq     $t2, 65, skip
        nop
        beq     $t2, 69, skip
        nop
        beq     $t2, 73, skip
        nop
        beq     $t2, 79, skip
        nop
        beq     $t2, 85, skip
        nop
        beq     $t2, 97, skip
        nop
        beq     $t2, 101, skip
        nop
        beq     $t2, 105, skip
        nop
        beq     $t2, 111, skip
        nop
        beq     $t2, 117, skip
        nop
        beq     $t2, 10, skip
        nop


        subu    $sp, $sp, 4
        sw      $t2, ($sp)


skip:   nop
        # Decided on this setup of the loop so that the very first character 
        # gets processed otherwise I had to have $t0 point the right before the
        # begining of buffer
        beq     $t0, $t1, endLp2
        nop
        subu    $t1, $t1, 1
        j       loop2
endLp2: nop

        # Pops characters from the stack and writes them to buffer.
loop3:  lw      $t2, ($sp)
        addu    $sp, $sp, 4
        sb      $t2, ($t0)
        addu    $t0, $t0, 1

        beqz    $t2, endLp3
        nop

        j       loop3
endLp3: nop

        li      $v0, 4
        la      $a0, buffer
        syscall


        li      $v0, 10
        syscall

        .data
prompt: .asciiz "Enter a string: "
buffer: .space  200