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
        beqz    $v0, equal
        nop

        li      $v0, 4
        la      $a0, prompt2
        syscall

        j       endProg
        nop

equal:  nop
        li      $v0, 4
        la      $a0, prompt1
        syscall

endProg:nop
        li      $v0, 10
        syscall

        


        .data
prompt1:.asciiz "The strings are character-by-character identical.\n"
prompt2:.asciiz "The strings are NOT character-by-character identical.\n"
str1:   .space  100
str2:   .space  100
        