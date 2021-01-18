# Write a program that writes the pattern to the simulated terminal.
        .text
        .globl main

main:       la      $t0, buffer
            li      $t1, 0  # i
            li      $t2, 12 # k
# Outer most loop.  Basically controlls which row is being written.
loopRow:    beq     $t1, $t2, endRowLp
            nop
######################################
            li      $t3, 0  # j
            subu    $t4, $t2, $t1
# First inner loop controls how much padding is created on the left of the
# stars.
leftblank:  beq     $t3, $t4, endLeft
            nop

            li      $t5, 32
            sb      $t5, 0($t0)
            addu    $t0, $t0, 1

            addu    $t3, $t3, 1
            j       leftblank
endLeft:    nop
######################################
            li      $t3, 0  # j
            li      $t4, 2
            mul     $t4, $t1, $t4
            addu    $t4, $t4, 1
# Second inner loop controls how many stars are created on a given main loop.
midstar:  beq     $t3, $t4, endMid
            nop

            li      $t5, 42
            sb      $t5, 0($t0)
            addu    $t0, $t0, 1

            addu    $t3, $t3, 1
            j       midstar
endMid:    nop
######################################
# Do not actually need this loop
            li      $t3, 0  # j
            subu    $t4, $t2, $t1
# Third and last inner loop controls how much padding is created on the right 
# of the stars.
rightblank: beq     $t3, $t4, endRight
            nop

            li      $t5, 32
            sb      $t5, 0($t0)
            addu    $t0, $t0, 1

            addu    $t3, $t3, 1
            j       rightblank
endRight:   nop
######################################
            # Before the loop finishes a newline is added to the buffer.
            li      $t5, 10
            sb      $t5, 0($t0)
            addu    $t0, $t0, 1

            addu    $t1, $t1, 1
            j       loopRow

endRowLp:   nop

            li      $v0, 4
            la      $a0, buffer
            syscall

            li      $v0, 10
            syscall

        .data
buffer: .space 100