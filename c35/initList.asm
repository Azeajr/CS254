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

        li      $v0, 9
        li      $a0, 8
        syscall
        move    $s0, $v0

        sw      $s0, 0($fp)     # Pointer to head
        sw      $s0, 8($fp)

        lw      $t0, 4($fp)
        sw      $t0, 0($s0)

        sub     $t0, $t0, 1
        sw      $t0, 4($fp)

loopA:  beqz    $s0, endLpA

        li      $v0, 9
        li      $a0, 8
        syscall

        lw      $s0, 8($fp)     # Load the pointer to the current node
        sw      $v0, 4($s0)     # Store the pointer to the new node in the 
        sw      $v0, 8($fp)
                                # previous(current)

        lw      $t0, 4($fp)
        sw      $t0, 0($s0)

        sub     $t0, $t0, 1
        sw      $t0, 4($fp)
        move    $s0, $t0
        j       loopA
endLpA:

        lw      $s0, 8($fp)
        sw      $0, 4($s0)
        lw      $t0, 4($fp)
        sw      $t0, 0($s0)
        lw      $v0, 0($fp)

        add     $sp, $fp, 12

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        jr      $ra






        

