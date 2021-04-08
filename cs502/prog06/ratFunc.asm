## CS 254 Program 6
##
## Compute (8x^2-3x+12) / (3x^2+2x-16)
##
## Programmer:  Antonio Zea
## Date:    04-07-2021
################################################################################
## $t0 = Base register holding address of the beginning of the data section
## $t1 = x
## $t2 = Accumulator for denominator
## $t3 = Accumulator for numerator
################################################################################
        .text
        .globl main

main:
        lui     $t0, 0x1000     # Base address to our data section
        lw      $t1, 0($t0)     # $t1 = x
                                # nop not needed since $t1 is not used in the 
                                # instruction following the load
        ori     $t2, $0, 3      # $t2 = 3
        mult    $t2, $t1        # Multiply $t2 by x
        mflo    $t2             # $t2 = 3x
        sll     $0, $0, 0       # nop needed in hardware implementations

        addi    $t2, $t2, 2     # $t2 = 3x +2
        mult    $t2, $t1        # Multiply $t2 by x
        mflo    $t2             # $t2 = 3x^2+2x
        

        addi    $t2, $t2, -16   # $t2 = 3x^2+2x-16

        beq     $t2,$0, zero    # Check if our future denominator is zero. If 
                                # so then branch to the zero symbolic address 
        sll     $0, $0, 0       # Branch delay slot, not exactly necessary in 
                                # this context since executing the next
                                # instruction doesnt affect the final outcome 
                                # of the subroutine when branching.

        sw      $0, 4($t0)      # Stores 0 in error since division by zero did 
                                # not occur.

        ori     $t3, $0, 8      # $t3 = 8
        mult    $t3, $t1        # Multiply $t3 by x
        mflo    $t3             # $t3 = 8x
        sll     $0, $0, 0

        addi    $t3, $t3, -3    # $t3 = 8x-3
        mult    $t3, $t1        # Multiply $t3 by x
        mflo    $t3             # $t3 = 8x^2-3x
        

        addi    $t3, $t3, 12    # $t3 = 8x^2-3x+12

        div     $t3, $t2        # Divide $t3 by $t2
        mflo    $t1             # Quotient
        mfhi    $t2             # Reminder
        
        sw      $t1, 8($t0)     # Store $t1 in ratio
        sw      $t2, 12($t0)    # Store $t2 in remain

        j       end             # Skip to end since denominator was not zero
        sll     $0, $0, 0       # Branch Delay Slot nop.  Not exactly necessary 
                                # since adding 1 to $t2 doesnt change anything 
                                # in context of the subroutine.

zero:   #addi    $t2, $t2, 1    # Adding 1 to $t2 means that $t2 = 1 since we 
        ori     $t2, $0, 1      # got here because $t2 equaled zero from the 
                                # branch.  Might be more clear to just load 1 
                                # here using ori.
        sw      $t2, 4($t0)     # Store 1 in error

end:    sll     $0, $0, 0

        .data
x:      .word   -2              # Error should be set to 1 when 
                                # x=2 or x=-2 and 2/3
                                # since those are the zeros of the denominator.
                                # The rational number is not possible in this 
                                # implementation, we would need floating point
                                # numbers.
                                # Became curious while testing x as to what 
                                # values got me negative quotients.  Graphed it 
                                # on desmos and saw that -1, -2 and 1 should 
                                # result in negative quotients.  Tested them to 
                                # aleviate any anxiety over errors. x=0 also
                                # results in a negative value but our program 
                                # is not designed to reflect that.
error:  .word   0
ratio:  .word   0
remain: .word   0