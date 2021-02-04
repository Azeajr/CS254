        .text
        .globl main

main:
        li          $v0, 4
        la          $a0, prompt1
        syscall

        li          $v0, 8
        la          $a0, buffer
        li          $a1, 3
        syscall

        lb          $a0, ($a0)
        beq         $a0, 0x53,  sqr

        beq         $a0, 0x54, tri

        j           main


sqr:    li          $v0, 4
        la          $a0, prompt2
        syscall

        li          $v0, 5
        syscall

        move        $a0, $v0

        jal         square
        j           end

tri:    li          $v0, 4
        la          $a0, prompt2
        syscall

        li          $v0, 5
        syscall

        move        $a0, $v0

        jal         triangle

end:    li          $v0, 10
        syscall

        .data
prompt1:.asciiz "Choose (S)quare or (T)riangle: "
prompt2:.asciiz "Enter size: "
buffer: .space  3

