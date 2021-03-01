##  CS 254      Program 3   Spring2021
##
##  Compute 23*x
##
##  Programmer: Antonio Zea Jr
##  Date: 2021-02-28
##############################################################
##  Register Table
##  Reg         Use
##  $7:         x
##  $10:        Accumulator & Final Result
##############################################################
        .text
        .globl main
main:
        # First draft used 3 registers
        # Second draft uses 2 registers. Used Horner's Method to compute answer.
        ori     $7, $0, 100     # Loads $7 with a 100. This is our x.

        sll     $10, $7, 2      # Shifts $7 bitwise left by 2 and stores result 
                                # in $10. This is equivalent to multiplying $7 
                                # by 4.

        addu    $10, $10, $7    # Adds $7 to $10. This adds x back to 4x.

        sll     $10, $10, 1     # Shifts $10 bitwise left by 1 and stores 
                                # result back into $10. This multiplies 4x+x by 
                                # 2. So $10 holds 8x+2x.
                                
        addu    $10, $10, $7    # Adds $7 to $10. This adds x back to 8x+2x.

        sll     $10, $10, 1     # Shifts $10 bitwise left by 1 and stores 
                                # result back into $10. This multiplies 8x+2x+x 
                                # by 2. So $10 holds 16x+4x+2x.

        addu    $10, $10, $7    # Adds $7 to $10. This adds x back to 
                                # 16x+4x+2x. So $10 holds 16x+4x+2x+x which 
                                # equals 23x.








