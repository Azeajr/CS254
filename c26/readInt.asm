# Write a subroutine that prompts the user for an integer. The subroutine reads 
# the string the user enters as a string (using trap handler service 8). Then, 
# if the string forms a proper integer, it is converted to two's complement 
# form and returned in register $v0.

# If the input was converted, set register $v1 to one. If the input was not 
# converted, set register $v1 to zero, and set $v0 to zero. If the user enters 
# "done", set register $v1 to two, and set $v0 to zero.

        .text
        .globl  readInt

readInt:
        li      $v0, 4
        la      $a0, prompt
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 10
        syscall
        
        move    $t0, $a0
        li      $t4, 0

loopA:  lb      $t1, ($t0)
        nop
        
        beqz    $t1, endLpA
        nop

        beq     $t1, 10, skip
        nop

        sge     $t2, $t1, 48
        sle     $t3, $t1, 57
        bne     $t2, $t3, notInt
        nop

        mul     $t4, $t4, 10

        subu    $t1, $t1, 48
        addu    $t4, $t4, $t1

skip:   addu    $t0, $t0, 1
        j       loopA
endLpA: nop

        li      $v1, 1
        move    $v0, $t4
        jr      $ra
        nop

notInt:
        la      $t2, termStr

loopB:  lb      $t3, ($t2)
        nop

        beqz    $t3, done
        nop

        bne     $t1, $t3, intFail
        nop

        addu    $t0, $t0, 1
        lb      $t1, ($t0)
        addu    $t2, $t2, 1

        j       loopB
        
done: nop

        li      $v1, 2
        li      $v0, 0

        jr      $ra
        nop

intFail:
        nop
        li      $v0, 0
        li      $v1, 0

        jr      $ra
        nop

        .data
prompt: .asciiz "Enter an integer: "
termStr:.asciiz "done"
buffer: .space  10