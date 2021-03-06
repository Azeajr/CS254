# @file realColorNum.asm
# @author Antonio Zea
# @brief Subroutine asks the user for a string representing a hex number with a 
# maximum of 24 significant bits.
# If input is in the wrong format or its value too large (eg. 0xA2123456) then 
# 0xFF000000 is return to sybomlize a bad color number.
#################################################################
#       $s0 pointer to user string
#       $s1 pointer to prefix string
#       $s2 holds byte pointed at by $s0
#       $s3 holds byte pointed at by $s1
#
#       $s2 numerical value of ascii pattern after it has been adjusted
#       $s3 Accumulator of final value
#################################################################
        .text
        .globl  readColorNum

readColorNum:

        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)
        sub     $sp, $sp, 4
        sw      $s0, ($sp)
        sub     $sp, $sp, 4
        sw      $s1, ($sp)
        sub     $sp, $sp, 4
        sw      $s2, ($sp)
        sub     $sp, $sp, 4
        sw      $s3, ($sp)

        sub     $fp, $sp, 0
        move    $sp, $fp

        la      $a0, promptA    # Ask user for color number
        li      $v0, 4
        syscall

        li      $v0, 8          # Read string containing color number.
        la      $a0, buffer
        li      $a1, 11
        syscall

        move    $s0, $a0        # $s0 will contain the address pointer to 
                                # user's string
        la      $s1, prefix     # $s1 will contain the pointer to hex prefix
                                # This be used to check that the user's string 
                                # starts with 0x.

loopA:  lb      $s2, ($s0)      # Loads $s2  with the character bit pattern 
                                # located at $s0
        lb      $s3, ($s1)      # Loads $s3  with the character bit pattern 
                                # located at $s1
        
        beqz    $s3, endLpA             # If $s3 has reached the null then
                                        # user's string starts with the hex 
                                        # prefix "0x". In this case proceed to 
                                        # process rest of string
        bne     $s2, $s3, notValid      # If $s2 does not equal $s3 then the 
                                        # user did not start the color number 
                                        # with the hex prefix. 0xFF000000 will 
                                        # be returned.

        addi    $s0, $s0, 1             # Move the pointers to the next byte
        addi    $s1, $s1, 1

        j       loopA
endLpA: nop
        li      $s3, 0                  # Accumulator for the final bit pattern 
                                        # that will represent the user's color 
                                        # number

loopB:  lb      $s2, ($s0)
        beqz    $s2, endLpB

        bne     $s2, 10, skip           # If the byte in $s2 represents a 
                                        # newline then skip processing it.
                                        # Increment the pointer $s0 and then
                                        # jump to the top of the loop.
        addi    $s0, $s0, 1

        j       loopB

skip:   sll     $s3, $s3, 4             # This shift is used to move parts of 
                                        # $s3 that have alread been set by a 
                                        # previous loop iteration.

        blt     $s2, 48, notValid       # Determines if $s2 is a numeral or not.
        bgt     $s2, 57, notNum
number: subu    $s2, $s2, 48            # Subtract by 48 to get the numeral to 
                                        # actually eqaul it's intended
                                        # numerical value
        or      $s3, $s2, $s3           # Unite the old value of $s3 with the 
                                        # contents of $s2.  Because of sll 
                                        # earlier this will have the affect of 
                                        # building our bit pattern up.

        addi    $s0, $s0, 1

        j       loopB

notNum: blt     $s2, 65, notValid       # Determine if $s2 is an uppercase 
                                        # letter or not.
        bgt     $s2, 70, notCap
upper:  subu    $s2, $s2, 55
        or      $s3, $s2, $s3

        addi    $s0, $s0, 1

        j       loopB

notCap: blt     $s2, 97, notValid       # Determine if $s2 is an lowercase 
                                        # letter or not.
        bgt     $s2, 102, notValid
lower:  subu    $s2, $s2, 87
        or      $s3, $s2, $s3

        addi    $s0, $s0, 1

        j       loopB

endLpB:                                 # Control has reached this point then 
                                        # the user string is done being
                                        # processed.
        srl     $s2, $s3, 24            # Checks if high order 8 bits have been 
                                        # set or not.  If they have been set 
                                        # then the color number is invalid.
        bne     $s2, $zero, notValid

        move    $v0, $s3                # Move our result to $v0 to be returned

        add     $sp, $fp, 0             # Not necessary but is my habit when 
                                        # writing subroutines.

        lw      $s3, ($sp)              # Restoring and popping saved registers 
                                        # from stack.
        add     $sp, $sp, 4             
        lw      $s2, ($sp)
        add     $sp, $sp, 4
        lw      $s1, ($sp)
        add     $sp, $sp, 4
        lw      $s0, ($sp)
        add     $sp, $sp, 4

        lw      $fp, ($sp)
        add     $sp, $sp, 4
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

notValid:                       # Returns a color number that is intended to be 
                                # interpreted as an error.
        li      $v0, 0xFF000000

        add     $sp, $fp, 0

        add     $sp, $sp, 4             
        lw      $s2, ($sp)
        add     $sp, $sp, 4
        lw      $s1, ($sp)
        add     $sp, $sp, 4
        lw      $s0, ($sp)
        add     $sp, $sp, 4

        lw      $fp, ($sp)
        add     $sp, $sp, 4
        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra

        .data
buffer: .space  11
promptA: .asciiz "Enter a color number in hex(24-bit max):"
prefix: .asciiz "0x"

#0x12ef23fa