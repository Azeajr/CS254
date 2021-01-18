# Linear Search


        .text
        .globl main

main:

loopMain:   li      $v0, 4
            la      $a0, prompt
            syscall

            li      $v0, 5
            syscall

            # $t0 will store the target number
            move    $t0, $v0
            li      $t1, 0

            # Load the size of the array
            la      $t2, size
            lw      $t2, 0($t2)
            nop
            la      $t3, array

            # Loop will cycle until $t1 equals size
loop:       beq     $t1, $t2, endLp
            nop

            lw      $t4, 0($t3)
            nop

            # Checks if the loaded integer is equal to our target
            beq     $t0, $t4, found
            nop

            addu    $t3, $t3, 4
            addu    $t1, $t1, 1

            j       loop

endLp:      nop

notFound:   li      $v0, 4
            la      $a0, prompt3
            syscall

            j       loopMain
            nop


found:      li      $v0, 4
            la      $a0, prompt2
            syscall

            move    $a0, $t1
            li      $v0, 1
            syscall

            li      $v0, 4
            la      $a0, newline
            syscall            

endLpMain:  nop

            li      $v0, 10
            syscall

        .data
prompt: .asciiz "Enter a number to search for:"
prompt2:.asciiz "The number was found at index: "
prompt3:.asciiz "The number was not found.\n"
size:   .word   12
array:  .word   50, 12, 52, -78, 03, 12, 99, 32, 53, 77, 47, 00