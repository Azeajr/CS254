# Translate the following subroutine from C to MIPS
# Focused on the use of frame linkage to setup variables in the run-time stack
#
#   int toCent( int x ){
#     int v;        // v:   0($fp)
#     v =  x - 32;
#     v =  5*v
#     v =  v/9;
#     return v;
#   }
        .text
        .globl toCent
toCent:
        # Subroutine Prologue
        # Push $ra and $fp onto stack
        # Pushing $ra is not strictly necessary here since I do not call 
        # another subroutine nor do I use this subroutine recursively.
        sub         $sp, $sp, 4
        sw          $ra, ($sp)
        sub         $sp, $sp, 4
        sw          $fp, ($sp)
        
        # Initialize frame pointer
        # Made enough space for one variable
        sub         $fp, $sp, 4
        move        $sp, $fp
        # x - 32
        sub         $a0, $a0, 32
        # v = x - 32
        sw          $a0, 0($fp)

        lw          $a0, 0($fp)
        # 5 * v
        mul         $a0, $a0, 5
        # v = 5 * v
        sw          $a0, 0($sp)

        lw          $a0, 0($fp)
        # v / 9
        div         $a0, $a0, 9
        # v = v / 9
        sw          $a0, 0($fp)



        # Subroutine Epilogue
        # return v
        lw          $v0, 0($fp)
        # Reset the stack pointer to the state the subroutine found it in
        add         $sp, $fp, 4

        # Pop the frame pointer from the stack
        lw          $fp, ($sp)
        add         $sp, $sp, 4
        # Pop the return address from the stack
        lw          $ra, ($sp)
        add         $sp, $sp, 4

        # Return control to caller
        jr          $ra