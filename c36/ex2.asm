        .globl   main
        .text
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        li      $t0, 0
        la      $t1, jTabl
        lw      $t2, ($t1)

loop:   beq     $t0, 5, endLp
        lw      $t2, ($t1)
        jalr    $t2
        add     $t1, $t1, 4


        add     $t0, $t0, 1
        j       loop
endLp:

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
jTabl:      .word sub1                  # Jump Table
            .word sub2
            .word sub3
            .word sub4
            .word sub5

        .text          
sub1:   li      $v0,4
        la      $a0,mess1
        syscall
        jr      $ra
        .data
mess1:  .asciiz "This "

        .text
sub2:   li      $v0,4
        la      $a0,mess2
        syscall
        jr      $ra
        .data
mess2:  .asciiz "is\n"

        .text
sub3:   li      $v0,4
        la      $a0,mess3
        syscall
        jr      $ra
        .data
mess3:  .asciiz "practice\n"

        .text
sub4:   li      $v0,4
        la      $a0,mess4
        syscall
        jr      $ra
        .data
mess4:  .asciiz "with\n"

        .text
sub5:   li      $v0,4
        la      $a0,mess5
        syscall
        jr      $ra
        .data
mess5:  .asciiz "practice\n"