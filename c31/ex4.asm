# @file ex4.asm
# @author Antonio Zea
# @brief Write a program that has a color number declared in the data section 
# and that writes out the amount of each color expressed as a decimal fraction. 
# Put each color number in 32 bits, with the high order byte set to zeros:
#
#           .data
# color:    .word  0x00FF0000     # pure red, (1.0, 0.0, 0.0)
# For extra fun, write a program that prompts the user for a color number and 
# then writes out the fraction of each component.
#################################################################
# $t0 returned value from readColorNum subroutine
# $t1 holds different parts of the returned value
# $f0 holds the float version $t1
# $f1 holds the float of the divisor

#################################################################
        .text
        .globl main
        # r: 0(fp)
        # g: 4(fp)
        # b: 8(fp)
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 12    # Setting frame pointer for variables r, g,
                                # and b.
        move    $sp, $fp

        jal     readColorNum    # Subroutine in charge of asking user for 
                                # string representing a color number and
                                # converting that to a bit pattern that is 
                                # returned on $v0.
        move    $t0, $v0
        li      $t1, 0xFF       # Bit mask to get the first 8 bits into $t1.    
                                # This will stored in the variable b to 
                                # represent what proportion of 255 is present 
                                # for the color blue.
        and     $t1, $t1, $t0
        sw      $t1, 8($fp)     # b = $t1

        li      $t1, 0xFF
        sll     $t1, $t1, 8     # Bit mask for bits 8 through 15.
        and     $t1, $t1, $t0
        srl     $t1, $t1, 8     # Shifted back so that low order bits actually 
                                # contian the number I am looking for.
        sw      $t1, 4($fp)     # g = $t1

        li      $t1, 0xFF
        sll     $t1, $t1, 16    # Bit mask for bits 16 through 23.
        and     $t1, $t1, $t0
        srl     $t1, $t1, 16
        sw      $t1, 0($fp)     # r = $t1


        l.s     $f0, 8($fp)     # Load $f0 with bit pattern from the variable b
        cvt.s.w $f0, $f0        # Convert the integer in $f0 to a float.
        li.s    $f1, 255.0      # Setting up our divisor.
        div.s   $f0, $f0, $f1   # Quotient representing proportion of blue in
                                # color number is now in $f0
        s.s     $f0, 8($fp)     

        l.s     $f0, 4($fp)
        cvt.s.w $f0, $f0
        li.s    $f1, 255.0
        div.s   $f0, $f0, $f1   # Quotient representing proportion of green in
                                # color number is now in $f0
        s.s     $f0, 4($fp)     
        
        l.s     $f0, 0($fp)
        cvt.s.w $f0, $f0
        li.s    $f1, 255.0
        div.s   $f0, $f0, $f1   # Quotient representing proportion of red in
                                # color number is now in $f0
        s.s     $f0, 0($fp)

        li      $v0, 4          # Start printing out result in proportional 
                                # format
        la      $a0, prompt1
        syscall

        li      $v0, 4
        la      $a0, open
        syscall

        li      $v0, 2
        l.s     $f12, 0($fp)    # float representing proportion of red
        syscall

        li      $v0, 4
        la      $a0, comma
        syscall

        li      $v0, 2
        l.s     $f12, 4($fp)    # float representing proportion of green
        syscall

        li      $v0, 4
        la      $a0, comma
        syscall

        li      $v0, 2
        l.s     $f12, 8($fp)    # float representing proportion of blue
        syscall

        li      $v0, 4
        la      $a0, close
        syscall

        add     $sp, $fp, 12    # Reseting the stack pointer since we are done 
                                # with the variables.

        lw      $fp, ($sp)      # Resetting the frame pointer and popping it 
                                # from the stack
        add     $sp, $sp, 4

        lw      $ra, ($sp)      # Resetting the return address and popping it 
                                # from the stack
        add     $sp, $sp, 4

        jr      $ra             # Return control to the caller(OS?)
        
        .data
prompt1:.asciiz "Your color number in proportional format is\n"
open:   .asciiz "("
comma:  .asciiz ", "
close:  .asciiz ")"