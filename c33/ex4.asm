        .text
        .globl main
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        sub     $sp, $sp, 4
        sw      $s1, ($sp)

        sub     $sp, $sp, 4     # Store the current frame pointer
        sw      $fp, ($sp)

        sub     $fp, $sp, 20
        move    $sp, $fp
        
        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 0($fp)     # 0($fp) = R

        li      $v0, 4
        la      $a0, prompt2
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 4($fp)     # 4($fp) = C

        lw      $s0, 0($fp)

        mul     $s0, $s0, $v0
        mul     $s0, $s0, 4

        move    $a0, $s0
        li      $v0, 9
        syscall

        sw      $v0, 8($fp)     # 8($fp) = pointer to beginning of 2d array

        li      $s0, 0
        sw      $s0, 12($fp)    # 12($fp) = r
        sw      $s0, 16($fp)    # 16($fp) = c


loop1:  lw      $s0, 0($fp)
        lw      $s1, 12($fp)
        #sub     $s0, $s0, $s1
        #li      $s1, 1
        beq     $s0, $s1, endLp1


loop2:  lw      $s0, 4($fp)
        lw      $s1, 16($fp)
        #sub     $s0, $s0, $s1
        beq     $s0, $s1, endLp2

        # p+r*C+c
        
        lw      $s0, 12($fp)    # r
        lw      $s1, 4($fp)     # C
        mul     $s0, $s0, $s1   # $s0 = r*C
        lw      $s1, 16($fp)    # c
        add     $s0, $s0, $s1   # $s0 = r*C + c
        mul     $s0, $s0, 4     # Word allign address
        lw      $s1, 8($fp)     # p
        add     $s0, $s0, $s1   # $s0 = p + r*C + c
        lw      $s1, 12($fp)
        add     $s1, $s1, 1
        sw      $s1, ($s0)

        lw      $s0, 16($fp)
        add     $s0, $s0, 1
        sw      $s0, 16($fp)
        j       loop2
endLp2:
        li      $s0, 0
        sw      $s0, 16($fp)



        lw      $s0, 12($fp)
        add     $s0, $s0, 1
        sw      $s0, 12($fp)
        j       loop1
endLp1:

        add     $sp, $fp, 20

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $s1, ($sp)
        add     $sp, $sp, 4

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra


        .data
prompt1:.asciiz "Size of image\nEnter numbers of Rows: "
prompt2:.asciiz "Enter number of Columns: "