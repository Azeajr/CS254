# Recursive subroutine to calulate triangle number for a given N.
        .text
        .globl  Triangle

Triangle:
        # Subroutine Prologue
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        # Initialize frame pointer
        # $fp = $sp - space_for_variables
        sub     $fp, $sp, 0
        # Initialize stack pointer so that it points to $fp
        move    $sp, $fp
        # Store argumment in saved register
        move    $s0, $a0
        # Base case for recursion
        bgt     $a0, 1, recurse
        li      $v0, 1
        j       Epilogue

        # Recursion case (N-1)
recurse:
        sub     $a0, $a0, 1
        jal     Triangle
        # N + Triangle(N-1)
        add     $v0, $s0, $v0

        # Subroutine epilogue
Epilogue:
        add     $sp, $fp, 0

        lw      $s0, ($sp)
        add     $sp, $sp, 4
        lw      $fp, ($sp)
        add     $sp, $sp, 4
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra
