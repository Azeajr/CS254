        .text
        .globl  strDifHighli

        # $a0   buffer1
        # $a1   buffer2
        # $a2   buffer3
        # void type subroutine
strDifHighli:
        sub             $sp, $sp, 4
        sw              $ra, ($sp)

        sub             $sp, $sp, 4
        sw              $s0, ($sp)

        sub             $sp, $sp, 4
        sw              $s1, ($sp)

        sub             $sp, $sp, 4
        sw              $s2, ($sp)



        move            $s0, $a0
        move            $s1, $a1
        move            $s2, $a2

loopB:  move            $a0, $s0
        move            $a1, $s1

        jal             strDiffInd
        bltz            $v0, endLpB

        li              $t0, 0
loopC:  beq             $t0, $v0, endLpC
        li              $t1, 0x20
        sb		$t1, ($s2)
        

        add             $s0, $s0, 1
        add             $s1, $s1, 1
        add             $s2, $s2, 1

        add             $t0, $t0, 1
        j               loopC

endLpC:
        li              $t1, 0x2a
        sb		$t1, ($s2)
        
        add             $s0, $s0, 1
        add             $s1, $s1, 1
        add             $s2, $s2, 1


        j               loopB
endLpB:


        lw              $s2, ($sp)
        add             $sp, $sp, 4

        lw              $s1, ($sp)
        add             $sp, $sp, 4

        lw              $s0, ($sp)
        add             $sp, $sp, 4

        lw              $ra, ($sp)
        add             $sp, $sp, 4

        jr              $ra
        nop




