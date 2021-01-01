# Write a program that repeatedly asks the user for a scale F or a C 
# (for "Fahrenheit" or "Celsius") on one line followed by an integer 
# temperature on the next line. It then converts the given temperature to the 
# other scale.

        .text
        .globl  main

main:   li              $v0, 4
        la              $a0, scale
        syscall
        # I found that capturing the newline character was usefull.  It is not 
        # necessary though since I am only using the first byte.
        li              $v0, 8
        la              $a0, buffer
        li              $a1, 3
        syscall

        lb		$t1, 0($a0)
        nop
        
        li              $t0, 0x51
        beq             $t1, $t0, end
        nop

        li              $t0, 0x43
        beq             $t1, $t0, celsius
        nop

        li              $t0, 0x46
        beq             $t1, $t0, fahrenheit
        nop

celsius:
        li              $v0, 4
        la              $a0, temp
        syscall

        li              $v0, 5
        syscall

        move            $t1, $v0

        li              $t0, 18
        multu           $t0, $t1
        mflo            $t1
        nop

        li              $t0, 10
        divu            $t1, $t0

        mflo            $t1
        addiu           $t1, $t1, 32

        li              $v0, 4
        la              $a0, fah
        syscall
        
        li              $v0, 1
        move            $a0, $t1
        syscall

        li              $v0, 4
        la              $a0, dot
        syscall
        
        
        li              $v0, 1
        mfhi            $a0
        syscall

        li              $v0, 4
        la              $a0, F
        syscall

        j               main
        nop

fahrenheit:
        li              $v0, 4
        la              $a0, temp
        syscall

        li              $v0, 5
        syscall

        move            $t1, $v0

        addiu           $t1, $t1, -32

        li              $t0, 50
        mult            $t1, $t0
        mflo            $t1

        li              $t0, 9
        divu            $t1, $t0
        mflo            $t1

        li              $t0, 10
        divu            $t1, $t0
        mflo            $t1


        li              $v0, 4
        la              $a0, cel
        syscall
        
        li              $v0, 1
        move            $a0, $t1
        syscall

        li              $v0, 4
        la              $a0, dot
        syscall
        
        
        li              $v0, 1
        mfhi            $a0
        syscall

        li              $v0, 4
        la              $a0, C
        syscall

        j               main
        nop

end:    li      $v0, 10
        syscall

        .data
scale:  .asciiz "Enter Scale            : "
temp:   .asciiz "Enter Temperature      : "
cel:    .asciiz "Celsius Temperature    : "
fah:    .asciiz "Fahrenheit Temperature : "
buffer: .space  3
dot:    .asciiz  "."
F:      .asciiz "F\n"
C:      .asciiz "C\n"