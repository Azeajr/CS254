

#   main(){
#     int f;        // f:   0($fp)
#     int c;        // c:   4($fp)
#  
#     f = 50;
#     c = toCent( f );
#  
#     print( "f=", f, "c=", c );
#   }

        .text
        .globl main

main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 8
        move    $sp, $fp

        li      $t0, 50
        sw      $t0, 0($fp)

        lw      $a0, 0($fp)
        jal     toCent

        sw      $v0, 4($fp)

        li      $v0, 4
        la      $a0, promptF
        syscall

        li      $v0, 1
        lw      $a0, 0($fp)
        syscall


        li      $v0, 4
        la      $a0, promptC
        syscall

        li      $v0, 1
        lw      $a0, 4($fp)
        syscall

        add     $sp, $fp, 8

        lw      $fp, ($sp)
        add     $sp, $sp, 4
        lw      $ra, ($sp)
        add     $sp, $sp, 4
        jr      $ra


        .data
promptF:.asciiz "\nf= "
promptC:.asciiz "\tc= "