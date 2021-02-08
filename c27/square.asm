        .text
        .globl square

square:
        # $a0  numbers of characters per side
        ble     $a0, 10, skipA
        li      $a0, 10
skipA:
       
        la      $t2, bufferA
        li      $t3, 0xa
        sb      $t3, ($t2)
        add     $t2, $t2, 1

        li      $t0, 0
loopA:  beq     $t0, $a0, endLpA
        li      $t1, 0
loopB:  beq     $t1, $a0, endLpB
        li      $t3, 0x2a
        sb      $t3, ($t2)
        add     $t2, $t2, 1


        add     $t1, $t1, 1
        j       loopB
endLpB:

        li      $t3, 0xa
        sb      $t3, ($t2)
        add     $t2, $t2, 1



        add     $t0, $t0, 1
        j       loopA
endLpA:
        sb      $zero, ($t2)
        add     $t2, $t2, 1

        li      $v0, 4
        la      $a0, bufferA
        syscall

        jr      $ra
        nop

        .data
bufferA:  .space 144