        .text
        .globl starline

starline:
        # $a0 number of * to print in line
        ble             $a0, 10, skipC
        li              $a0, 10
skipC:  li              $t0, 0
        la              $t1, buffer
        li              $t2, 0x2a
loopC:  beq             $t0, $a0, endLpC
        sb              $t2, ($t1)
        add             $t1, $t1, 1


        add             $t0, $t0, 1
        j               loopC
endLpC:
        li              $t2, 0xa
        sb              $t2, ($t1)
        add             $t1, $t1, 1
        
        sb              $zero, ($t1)

        li              $v0, 4
        la              $a0, buffer
        syscall

        jr              $ra
        nop

        .data
buffer: .space  12
