        .text
        .globl  readInt

readInt:
        li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 10
        
        move    $t0, $a0

loop1:  lb      $t1, ($t0)
        nop
        beqz    $t1, endLp1
        nop

        sge     $t2, $t1, 48
        sle     $t3, $t1, 57
        bne     $t2, $t3, notInt
        nop


        j       loop1
endLp1: nop


notInt: li      $v0, 0
        li      $v1, 0




        .data
prompt: .asciiz "Enter an integer: "
buffer: .space  10