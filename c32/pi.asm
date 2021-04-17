#################################################################
# Arguments
# $a0 = N 
#################################################################
# 0($fp) = numerator       
# 8($fp) = denominator     
# 16($fp) = sum             
#################################################################
# Return values
# $f0 = Return value
#################################################################
        .text
        .globl pi

pi:
        sub     $sp, $sp, 8     # Store any bitpatterns currently in $f2. $f2 is
        s.d     $f2, ($sp)      # going to be used as a double float so 8 bytes 
                                # are needed.

        sub     $sp, $sp, 4     # Store the current frame pointer
        sw      $fp, ($sp)

        sub     $fp, $sp, 24    # Make enough space for 3 double variables
        move    $sp, $fp

        li.d    $f0, 1.0
        s.d     $f0, 0($fp)     # numerator = 1.0
        s.d     $f0, 8($fp)     # denominator = 1.0
        li.d    $f0, 0.0
        s.d     $f0, 16($fp)    # sum = 0.0

loop:   beqz    $a0, endLp

        l.d     $f0, 0($fp)     # numerator
        l.d     $f2, 8($fp)     # denominator
        div.d   $f0, $f0, $f2   # $f0 = term

        l.d     $f2, 16($fp)    # sum
        add.d   $f2, $f2, $f0   # sum = sum + term
        s.d     $f2, 16($fp)    # store sum

        l.d     $f0, 0($fp)     # numerator
        neg.d   $f0, $f0        # change sign of numerator
        s.d     $f0, 0($fp)     # store numerator

        li.d    $f2, 2.0
        l.d     $f0, 8($fp)     # denominator
        add.d   $f0, $f0, $f2   # denominator = denominator + 2
        s.d     $f0, 8($fp)     # store denominator


        sub     $a0, $a0, 1
        j       loop
endLp:
        li.d    $f2, 4.0
        l.d     $f0, 16($fp)    # $f0 = sum
        mul.d   $f0, $f0, $f2   # $f0 = 4 * sum

        add     $sp, $fp, 24    # Restore stack pointer since variables are no 
                                # longer needed.

        lw      $fp, ($sp)      # Restore the old frame pointer
        add     $sp, $sp, 4

        l.d     $f2, ($sp)      # Restore the old value of $f2
        add     $sp, $sp, 8

        jr      $ra             # Return to the calling subroutine
