        .text
        .globl main

main:
        li          $a0, 8
        jal         square

        li          $a0, 6
        jal         triangle

        li          $v0, 10
        syscall

