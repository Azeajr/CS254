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

        sub     $fp, $sp, 8
        move    $sp, $fp

        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        sw      $v0, 0($fp)     # Number of dates

        move    $s0, $v0
        mul     $a0, $s0, 12
        li      $v0, 9
        syscall

        sw      $v0, 4($fp)     # Address to beginning of array of structs


        lw      $s0, 0($fp)
        lw      $s1, 4($fp)
loop1:  beqz    $s0, endLp1

        move    $a0, $s1
        jal     initDate

        add     $s1, $s1, 12
        sub     $s0, $s0, 1
        j       loop1
endLp1:

        lw      $s0, 0($fp)
        lw      $s1, 4($fp)
loop2:  beqz    $s0, endLp2

        move    $a0, $s1
        jal     printDate

        add     $s1, $s1, 12
        sub     $s0, $s0, 1
        j       loop2
endLp2:

        add     $sp, $fp, 8

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
prompt1:.asciiz "Enter how many dates: "
