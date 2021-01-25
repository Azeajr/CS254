# String Reversal (stack-based)
        .text
        .globl main

main:
        li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, buffer
        syscall

########################################################
        # $t0 pointer to buffer array
        move    $t0, $a0

        # $t2 keeps count of how many characters get pushed
        li      $t2, 0

loop1:  lbu     $t1, ($t0)
        nop
        beqz    $t1, endLp1
        nop
        #skips pushing the newline character
        beq     $t1, 10, skip1
        nop
        # Push onto stack
        subu    $sp, $sp, 4   
        sw      $t1, ($sp)

        addu    $t2, $t2, 1

skip1:  addu    $t0, $t0, 1
        j       loop1

endLp1: nop
########################################################
        # $t0 has two uses here.  First it is the counter for the loop.  It 
        # also serves as the index for the buffer array.  buffer($t0) analagous 
        # to buffer[$t0] from C lang.
        li      $t0, 0

loop2:  beq     $t0, $t2, endLp2
        nop
        # Pop from stack
        lw      $t1, ($sp)
        addu    $sp, $sp, 4
        sb      $t1, buffer($t0)

        addu    $t0, $t0, 1
        j       loop2
endLp2: nop
########################################################
        li      $v0, 4
        la      $a0, buffer
        syscall


        li      $v0, 10
        syscall


        .data
prompt: .asciiz "Enter a string: "
buffer: .space  200