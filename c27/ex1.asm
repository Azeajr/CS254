        .text
        .globl main

main:   sub     $sp, $sp, 4
        sw      $ra, ($sp)      

        la      $a0, str1
        li      $a1, 100

        jal     readStr
        nop

        sw      $ra, ($sp)
        sub     $sp, $sp, 4
#####################################        
        sub     $sp, $sp, 4
        sw      $ra, ($sp)      

        la      $a0, str2
        li      $a1, 100

        jal     readStr
        nop

        sw      $ra, ($sp)
        sub     $sp, $sp, 4
#####################################
        sub     $sp, $sp, 4
        sw      $ra, ($sp)      

        la      $a0, str1
        la      $a1, str2

        jal     strCmp
        nop

        sw      $ra, ($sp)
        sub     $sp, $sp, 4
#####################################
        move    $s0, $v0

        beqz    $s0, equal


        .data
str1:   .space  100
str2:   .space  100
        