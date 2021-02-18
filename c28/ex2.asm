# Write a program that computes the value of triangle numbers using a recursive 
# subroutine.
        .text
        .globl  main

main:
        # Main Prologue
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)
        # Initialize frame pointer
        # $fp = $sp - space_for_variables
        sub     $fp, $sp, 0
        # Initialize stack pointer so that it points to $fp
        move    $sp, $fp


        li      $v0, 4
        la      $a0, prompt1
        syscall

        li      $v0, 5
        syscall

        move    $s0, $v0

        li      $v0, 4
        la      $a0, prompt2
        syscall

        li      $v0, 1
        move    $a0, $s0
        syscall

        li      $v0, 4
        la      $a0, prompt3
        syscall

        # Call subroutine with user integer as input
        move    $a0, $s0
        jal Triangle
        # Print the returned valued
        move    $a0, $v0
        li      $v0, 1
        syscall

        # Main Epilogue
        # Reset the stack pointer to the state tjat main found it in
        add     $sp, $fp, 0
        # Pop the frame pointer from the stack
        lw      $fp, ($sp)
        add     $sp, $sp, 4
        # Pop the return address from the stack
        lw      $ra, ($sp)
        add     $sp, $sp, 4
        # Return control to caller
        jr      $ra

        .data
prompt1:.asciiz "Enter a N: "
prompt2:.asciiz "\nTriangle( "
prompt3:.asciiz " ) = "
