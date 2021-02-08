        .text
        .globl triangle

triangle:
        # $a0  numbers of characters per side
        ble     $a0, 10, skipB
        li      $a0, 10
skipB:
       
        la      $t2, bufferB
        li      $t3, 0xa
        sb      $t3, ($t2)
        add     $t2, $t2, 1

        li      $t0, 0
loopC:  beq     $t0, $a0, endLpC
        li      $t1, 0
loopD:  beq     $t1, $t0, endLpD
        li      $t3, 0x2a
        sb      $t3, ($t2)
        add     $t2, $t2, 1


        add     $t1, $t1, 1
        j       loopD
endLpD:

        li      $t3, 0xa
        sb      $t3, ($t2)
        add     $t2, $t2, 1



        add     $t0, $t0, 1
        j       loopC
endLpC:
        sb      $zero, ($t2)
        add     $t2, $t2, 1

        li      $v0, 4
        la      $a0, bufferB
        syscall
        jr      $ra
        nop

        .data
bufferB:  .space 144