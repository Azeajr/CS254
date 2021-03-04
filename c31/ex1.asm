# Write a program that computes the value of the following arithmetic 
# expression for values of x and y entered by the user:
#
# 5.4xy - 12.3y + 18.23x - 8.23

        .text
        .globl main
        
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        # x:    0($fp)
        # y:    4($fp)
        sub     $fp, $sp, 8
        move    $sp, $fp
        
        la      $a0, prompt1
        li      $v0, 4
        syscall

        li      $v0, 6
        syscall
        s.s     $f0, 0($fp)     # Store float at x

        la      $a0, prompt2
        li      $v0, 4
        syscall

        li      $v0, 6
        syscall
        s.s     $f0, 4($fp)     # Store float at y


        li.s    $f0, 5.4
        l.s     $f1, 0($fp)
        mul.s  $f0, $f1, $f0    # $f0 = 5.4x

        l.s     $f1, 4($fp)
        mul.s  $f12, $f1, $f0   # $f12 = 5.4xy

        li.s    $f0, -12.3
        l.s     $f1, 4($fp)
        mul.s  $f0, $f1, $f0    # $f0 = -12.3y

        add.s   $f12, $f12, $f0 # $f12 = 5.4xy - 12.3y
        
        li.s    $f0, 18.23
        l.s     $f1, 0($fp)
        mul.s  $f0, $f1, $f0    # $f0 = 18.23x

        add.s   $f12, $f12, $f0 # $f12 = 5.4xy - 12.3y + 18.23x

        li.s      $f0, -8.23
        add.s   $f12, $f12, $f0 # $f12 = 5.4xy - 12.3y + 18.23x - 8.23

        la      $a0, prompt3
        li      $v0, 4
        syscall

        li      $v0, 2
        syscall

        add     $sp, $fp, 8

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
prompt1:.asciiz "Enter a float\nx: "
prompt2:.asciiz "Enter a float\ny: "
prompt3:.asciiz "Result: "