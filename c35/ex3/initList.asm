        .text
        .globl initList

initList:
        # $a0 --- # of nodes to create and initialize
        # $v0 --- pointer to the head of the linked list

        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 12
        move    $sp, $fp
# 0($fp) -> Head pointer
# 4($fp) -> # of nodes
# 8($fp) -> current node pointer

        sw      $a0, 4($fp)     # number of nodes

        la      $a0, promptA
        li      $v0, 4
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 200
        syscall

        li      $t0, 0
        lb      $t1, ($a0)
loopB:  beqz    $t1, endLpB
        beq     $t1, 10, skipB
        add     $t0, $t0, 1
skipB:  add     $a0, $a0, 1

        lb      $t1, ($a0)
        j       loopB
endLpB: 


        add     $t0, $t0, 5 # 4 bytes for next node pointer and 1 byte for null 
                            # termination
        move    $a0, $t0
        li      $v0, 9
        syscall

        move    $s0, $v0

        la      $t0, buffer
        add     $t1, $s0, 4
        lb      $t2, ($t0)

loopC:  beqz    $t2, endLpC
        beq     $t2, 10, skipC
        sb      $t2, ($t1)
        add     $t1, $t1, 1
skipC:  add     $t0, $t0, 1
        
        lb      $t2, ($t0)

        j       loopC
endLpC: sb      $t2, ($t1)      # store the null byte to terminate the string 
                                # inside the node

        sw      $s0, 0($fp)     # Pointer to head
        sw      $s0, 8($fp)

        lw      $t0, 4($fp)
        sub     $t0, $t0, 1
        sw      $t0, 4($fp)     # Marks the completion of the head node


loopD:  beqz    $s0, endLpD
        la      $a0, promptA
        li      $v0, 4
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 200
        syscall

        li      $t0, 0
        lb      $t1, ($a0)
loopBD: beqz    $t1, endLpBD
        beq     $t1, 10, skipBD
        add     $t0, $t0, 1
skipBD: add     $a0, $a0, 1
        lb      $t1, ($a0)
        j       loopBD
endLpBD: 


        add     $t0, $t0, 5 # 4 bytes for next node pointer and 1 byte for null 
                            # termination
        move    $a0, $t0
        li      $v0, 9
        syscall

        move    $s0, $v0

        la      $t0, buffer
        add     $t1, $s0, 4
        lb      $t2, ($t0)

loopCD: beqz    $t2, endLpCD
        beq     $t2, 10, skipCD
        sb      $t2, ($t1)
        add     $t1, $t1, 1
skipCD: add     $t0, $t0, 1
        lb      $t2, ($t0)

        j       loopCD
endLpCD:sb      $t2, ($t1)

        lw      $t0, 8($fp)
        sw      $s0, 0($t0)

        sw      $s0, 8($fp)

        lw      $t0, 4($fp)
        sub     $t0, $t0, 1
        sw      $t0, 4($fp)

        move    $s0, $t0

        j       loopD
endLpD:

        lw      $s0, 8($fp)
        sw      $0,  0($s0)

        lw      $v0, 0($fp)

        add     $sp, $fp, 12

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jr      $ra


        .data
buffer: .space  200
promptA:.asciiz "Enter a string: "