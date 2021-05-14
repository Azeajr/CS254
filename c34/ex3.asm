        .text
        .globl main
main:
        sub      $sp, $sp, 4
        sw       $ra, ($sp)

        la      $a0, headP
        jal     sumList

        la      $a0, headP
        jal     printList

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
headP:
elmnt01:    .word   1
            .word   elmnt02

elmnt02:    .word   2
            .word   elmnt03

elmnt03:    .word   3
            .word   elmnt05

headC:
elmnt04:    .word   4
            .word   elmnt06

elmnt05:    .word   5
            .word   elmnt07

elmnt06:    .word   6
            .word   elmnt08

elmnt07:    .word   7
            .word   elmnt11

elmnt08:    .word   8
            .word   elmnt09

elmnt09:    .word   9
            .word   elmnt10

elmnt10:    .word   10
            .word   elmnt12

elmnt11:    .word   11
            .word   elmnt13

elmnt12:    .word   12
            .word   elmnt14

elmnt13:    .word   13
            .word   elmnt17

elmnt14:    .word   14
            .word   elmnt15

elmnt15:    .word   15
            .word   elmnt16

elmnt16:    .word   16
            .word   elmnt18

elmnt17:    .word   17
            .word   elmnt19

elmnt18:    .word   18
            .word   elmnt20

elmnt19:    .word   19
            .word   elmnt23

elmnt20:    .word   20
            .word   elmnt21

elmnt21:    .word   21
            .word   elmnt22

elmnt22:    .word   22
            .word   elmnt24

elmnt23:    .word   23
            .word   0

elmnt24:    .word   24
            .word   elmnt25

elmnt25:    .word   25
            .word   0