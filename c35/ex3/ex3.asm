        .text
        .globl main

main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        move    $a0, $v0
        jal initList

        move    $a0, $v0
        jal printList


        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
prompt1:.asciiz "Enter the number of nodes to\ncreate and initialize: "