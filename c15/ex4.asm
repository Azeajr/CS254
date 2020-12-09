        .text
        .globl main

main:
        lui     $10, 0x1000
        lw      $11, 0($10)     # x
        lw      $12, 4($10)     # a
        sll     $0, $0, 0

        mult    $11,$12
        lw      $12, 8($10)     # b
        mflo    $13
        add     $13, $13, $12

        mult    $11,$13
        lw      $12, 12($10)    # c
        mflo    $13
        add     $13, $13, $12

        mult    $11,$13
        lw      $12, 16($10)    # c
        mflo    $13
        add     $13, $13, $12

        sw      $13, 20($10)

        .data
x:      .word   1
a:      .word   -3
b:      .word   3
c:      .word   9
d:      .word   -24
y:      .word   0
