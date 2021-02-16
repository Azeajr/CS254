# Translate the following program from C to MIPS
# Focused on the use of frame linkage to setup variables in the run-time stack
#
#   main(){
#     int f;        // f:   0($fp)
#     int c;        // c:   4($fp)
#  
#     f = 50;
#     c = toCent( f );
#  
#     print( "f=", f, "c=", c );
#   }

        .text
        .globl main

main:
        # Main Prologue
        # Push $ra and $fp onto stack.
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        # Initialize frame pointer
        # $fp = $sp - space_for_variables
        sub     $fp, $sp, 8
        # Initialize stack pointer so that it points to $fp
        move    $sp, $fp

        # f = 50
        li      $t0, 50
        sw      $t0, 0($fp)

        # toCent(f)
        lw      $a0, 0($fp)
        jal     toCent
        
        # c = toCent(f)
        sw      $v0, 4($fp)

        # Prints the value of temp in fahrenheit
        li      $v0, 4
        la      $a0, promptF
        syscall

        li      $v0, 1
        lw      $a0, 0($fp)
        syscall

        # Prints the value of temp in celsius
        li      $v0, 4
        la      $a0, promptC
        syscall

        li      $v0, 1
        lw      $a0, 4($fp)
        syscall


        # Reset the stack pointer to the state tjat main found it in
        add     $sp, $fp, 8

        # Pop the frame pointer from the stack
        lw      $fp, ($sp)
        add     $sp, $sp, 4
        # Pop the return address from the stack
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        # Return control to caller
        jr      $ra


        .data
promptF:.asciiz "\nf= "
promptC:.asciiz "\tc= "