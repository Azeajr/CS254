# Write a program that asks the user for a string of digits that represent a 
# positive integer. Read in the string using service number 8, the "read 
# string" service. Now convert the string of digits into an integer.

        .text
        .globl  main

main:   li              $v0, 4
        la              $a0, prompt
        syscall

        li              $v0, 8
        la              $a0, buffer
        li              $a1, 16
        syscall

        move 	        $t0, $a0
        # Holds the first byte pointed to by $t0 and $a0(buffer)
        lb	        $t1, 0($t0)
        # Running sum that will contain the integer value of the string entered.
        or              $t2, $zero, $zero       
        #nop

loop:   beq		$t1, $zero, endLp
        nop
        # Checking if the character is a newline character, if so move on to 
        # next character.
        li              $t3, 0x0a
        beq		$t1, $t3, skip
        nop
        
        # By subtracting by 48(0x30) we shift the ascii character into the 
        # digits 0 through 9
        addiu           $t1, $t1, -0x30
        li              $t3, 10
        mult            $t2, $t3
        mflo            $t3
        addu            $t2, $t3, $t1


skip:   addu            $t0, $t0, 1
        lb              $t1, 0($t0)

        j               loop
        nop

endLp:  nop
        li              $v0, 1
        move            $a0, $t2
        syscall 


end:    li              $v0, 10
        syscall

        .data
prompt: .asciiz "Input a string containing only digits:\n"
buffer: .space  16