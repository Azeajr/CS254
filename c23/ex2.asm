        .text
        .globl main
main:   li              $v0, 4
        la              $a0, prompt
        syscall

        li              $v0, 5
        syscall

        beq             $v0, $zero, end
        
        
        move            $s0, $v0
        li              $t1, 0

loop:   mul             $t0, $t1, $t1

        sltu            $t2, $t0, $s0
        beq             $t2, $zero, endLp
        nop

        add             $t1, $t1, 1
        j               loop
        nop

endLp:  

        beq             $t0, $s0, printRoot
        nop
        subu            $t1, $t1, 1


printRoot:
        move            $a0, $t1
        li              $v0, 1
        syscall

        li              $v0, 4
        la              $a0, newline
        syscall

        j               main

end:    li		$v0, 10
        syscall


        .data
prompt: .asciiz "Enter an integer: "
newline:.asciiz "\n"
