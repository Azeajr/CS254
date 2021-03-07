# Write the program so that the size and the values in the array may be easily 
# changed. Initialize a sum to zero and then loop n times. Each execution of 
# the loop, with loop counter j, does the following:
# sum = sum*x + a[j]

        .text
        .globl main

main:
        la      $a0, prompt1
        li      $v0, 4
        syscall

        li      $v0, 6
        syscall                 # x = $f0

        la      $t0, n
        lw      $t0, ($t0)
        la      $t1, a
        li.s    $f2, 1.0        # Accumulator sum

loop1:  beqz    $t0, endLp1
        l.s     $f1, ($t1)      # a[j]
        mul.s   $f2, $f2, $f0   # sum = sum * x
        add.s   $f2, $f2, $f1   # sum = sum + a[j]

        add     $t1, $t1, 4
        
        sub     $t0, $t0, 1

        j       loop1

endLp1: nop

        la      $a0, prompt2
        li      $v0, 4
        syscall

        mov.s   $f12, $f2
        li      $v0, 2
        syscall

        jr      $ra

        .data
prompt1:.asciiz "Enter x(float): "
prompt2:.asciiz "Result: "
n:      .word   5
a:      .float  4.3, -12.4, 6.8, -0.45, 3.6