        .text
        .globl initList

initList:
        # $a0 --- # of nodes to create and initialize
        # $v0 --- pointer to the head of the linked list

        sub     $sp, $sp, 4
        sw      $s0, ($sp)

        sub     $sp, $sp, 4
        sw      $s1, ($sp)

        sub     $sp, $sp, 4
        sw      $s2, ($sp)

        sub     $sp, $sp, 4
        sw      $s3, ($sp)

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

        li      $s1, 0
        lb      $s2, ($a0)
loopB:  beqz    $s2, endLpB
        beq     $s2, 10, skipB
        add     $s1, $s1, 1
skipB:  add     $a0, $a0, 1

        lb      $s2, ($a0)
        j       loopB
endLpB: 


        add     $s1, $s1, 5 # 4 bytes for next node pointer and 1 byte for null 
                            # termination
        move    $a0, $s1
        li      $v0, 9
        syscall

        move    $s0, $v0

        la      $s1, buffer
        add     $s2, $s0, 4
        lb      $s3, ($s1)

loopC:  beqz    $s3, endLpC
        beq     $s3, 10, skipC
        sb      $s3, ($s2)
        add     $s2, $s2, 1
skipC:  add     $s1, $s1, 1
        
        lb      $s3, ($s1)

        j       loopC
endLpC: sb      $s3, ($s2)      # store the null byte to terminate the string 
                                # inside the node

        sw      $s0, 0($fp)     # Pointer to head
        sw      $s0, 8($fp)

        lw      $s1, 4($fp)
        sub     $s1, $s1, 1
        sw      $s1, 4($fp)     # Marks the completion of the head node


loopD:  beqz    $s0, endLpD
        la      $a0, promptA
        li      $v0, 4
        syscall

        li      $v0, 8
        la      $a0, buffer
        li      $a1, 200
        syscall

        li      $s1, 0
        lb      $s2, ($a0)
loopBD: beqz    $s2, endLpBD
        beq     $s2, 10, skipBD
        add     $s1, $s1, 1
skipBD: add     $a0, $a0, 1
        lb      $s2, ($a0)
        j       loopBD
endLpBD: 


        add     $s1, $s1, 5 # 4 bytes for next node pointer and 1 byte for null 
                            # termination
        move    $a0, $s1
        li      $v0, 9
        syscall

        move    $s0, $v0

        la      $s1, buffer
        add     $s2, $s0, 4
        lb      $s3, ($s1)

loopCD: beqz    $s3, endLpCD
        beq     $s3, 10, skipCD
        sb      $s3, ($s2)
        add     $s2, $s2, 1
skipCD: add     $s1, $s1, 1
        lb      $s3, ($s1)

        j       loopCD
endLpCD:sb      $s3, ($s2)

        lw      $s1, 8($fp)
        sw      $s0, 0($s1)

        sw      $s0, 8($fp)

        lw      $s1, 4($fp)
        sub     $s1, $s1, 1
        sw      $s1, 4($fp)

        move    $s0, $s1

        j       loopD
endLpD:

        lw      $s0, 8($fp)
        sw      $0,  0($s0)

        lw      $v0, 0($fp)

        add     $sp, $fp, 12

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $s3, ($sp)
        add     $sp, $sp, 4

        lw      $s2, ($sp)
        add     $sp, $sp, 4

        lw      $s1, ($sp)
        add     $sp, $sp, 4

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jr      $ra


        .data
buffer: .space  200
promptA:.asciiz "Enter a string: "