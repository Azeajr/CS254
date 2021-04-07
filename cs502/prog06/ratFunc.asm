## CS 254 Program 6
##
## Compute (8x^2-3x+12) / (3x^2+2x-16)
##
## Programmer:  Antonio Zea
## Date:    04-07-2021
################################################################################
## 
################################################################################
        .text
        .globl main

main:
        lui     $t0, 0x1000
        lw      $t1, 0($t0)
        ori     $t2, $0, 3
        mult    $t2, $t1
        mflo    $t2
        sll     $0, $0, 0

        addi    $t2, $t2, 2
        mult    $t2, $t1
        mflo    $t2
        

        addi    $t2, $t2, -16

        beq     $t2,$0, zero
        sll     $0, $0, 0

        ori     $t3, $0, 8
        mult    $t3, $t1
        mflo    $t3
        sll     $0, $0, 0

        addi    $t3, $t3, -3
        mult    $t3, $t1
        mflo    $t3
        

        addi    $t3, $t3, 12

        div     $t3, $t2
        mflo    $t1
        mfhi    $t2
        
        sw      $t1, 8($t0)
        sw      $t2, 12($t0)

        j       end
        sll     $0, $0, 0

zero:   addi    $t2, $t2, 1
        sw      $t2, 4($t0)

end:    sll     $0, $0, 0

        .data
x:      .word   1
error:  .word   0
ratio:  .word   0
remain: .word   0