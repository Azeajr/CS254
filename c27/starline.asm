        .text
        .globl starline

starline:
        # $a0 number of * to print in line
        sub             $sp, $sp, 4
        sw              $s0, ($sp)

        sub             $sp, $sp, 4
        sw              $s1, ($sp)

        sub             $sp, $sp, 4
        sw              $s2, ($sp)

        sub             $sp, $sp, 4
        sw              $s3, ($sp)

        move            $s0, $a0

        ble             $s0, 10, skipC
        li              $s0, 10
skipC:  li              $s1, 0
        la              $s2, bufferA
        li              $s3, 0x2a
loopC:  beq             $s1, $s0, endLpC
        sb              $s3, ($s2)
        add             $s2, $s2, 1


        add             $s1, $s1, 1
        j               loopC
endLpC:
        li              $s3, 0xa
        sb              $s3, ($s2)
        add             $s2, $s2, 1
        
        sb              $zero, ($s2)

        li              $v0, 4
        la              $a0, bufferA
        syscall

        lw              $s3, ($sp)
        add             $sp, $sp, 4

        lw              $s2, ($sp)
        add             $sp, $sp, 4

        lw              $s1, ($sp)
        add             $sp, $sp, 4

        lw              $s0, ($sp)
        add             $sp, $sp, 4

        jr              $ra
        nop

        .data
bufferA:.space  12
