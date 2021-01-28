# String Concatenation


        .text
        .globl main

main:   li          $v0, 4
        la          $a0, prompt1
        syscall

        li          $v0, 8
        la          $a0, buffer1
        li          $a1, 100
        syscall

        move        $t1, $a0
        lb          $t3, 0($t1)

        li          $t4, 10

        la          $t0, buffer3

        # Loop copies the contents of buffer1 to buffer3.  buffer1 is assumed 
        # to be null terminated.  There is also a newline character that needs 
        # to be ignored as well.
loop1:  beqz        $t3, endLp1
        nop

        # Skips a newline character if present
        beq         $t3, $t4, skip1
        nop

        sb          $t3, 0($t0)
        addu        $t0, $t0, 1
        nop

skip1:  addu        $t1, $t1, 1
        lb          $t3, 0($t1)

        j           loop1
        nop
endLp1: nop


        li          $v0, 4
        la          $a0, prompt2
        syscall

        li          $v0, 8
        la          $a0, buffer2
        li          $a1, 100
        syscall

        move        $t1, $a0
        lb          $t3, 0($t1)
        nop

        # Picks up where first loop left off. Loop copies contents of buffer2 to buffer3.
loop2:  beqz        $t3, endLp2
        nop

        # Skips a newline character if present
        beq         $t3, $t4, skip2
        nop

        sb          $t3, 0($t0)
        addu        $t0, $t0, 1
        nop


skip2:  addu        $t1, $t1, 1
        lb          $t3, 0($t1)

        j           loop2
        nop

endLp2: nop

        li          $v0, 4
        la          $a0, buffer3
        syscall

end:    li          $v0, 10
        syscall


            .data
prompt1:    .asciiz "Enter 1st string:"
prompt2:    .asciiz "Enter 2nd string:"
buffer1:    .space  100
buffer2:    .space  100
buffer3:    .space  200