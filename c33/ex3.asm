        .text
        .globl main
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        sub     $sp, $sp, 4
        sw      $s1, ($sp)
        sub     $sp, $sp, 4
        sw      $s2, ($sp)

        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        la      $s1, size
        sw      $v0, ($s1)     # Number of dates

        move    $s0, $v0
        la      $s1, dates

loop1:  beqz    $s0, endLp1

        jal     newDate
        sw      $v0, ($s1)


        add     $s1, $s1, 4
        sub     $s0, $s0, 1
        j       loop1
endLp1:

        la      $s1, size
        lw      $s0, ($s1)
        la      $s1, dates

loop2:  beqz    $s0, endLp2

        
        lw      $a0, ($s1)
        jal     printDate


        add     $s1, $s1, 4
        sub     $s0, $s0, 1
        j       loop2
endLp2:

        lw      $s2, ($sp)
        add     $sp, $sp, 4

        lw      $s1, ($sp)
        add     $sp, $sp, 4

        lw      $s0, ($sp)
        add     $sp, $sp, 4

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
size:   .word   0
dates:  .space  100
prompt1:.asciiz "Enter how many dates: "
