##  CS 254      Program 2   Spring2021
##
##  Compute a + b + c + d
##
##  Programmer: Antonio Zea Jr
##  Date: 2021-02-17
##############################################################
        .text
        .globl main

main:
        
        ori     $t0, $zero, 25      # Loads register $8 with a bitpattern 
                                    # interpreted as 25.  This is done by 
                                    # or-ing 0 with 25 bitwise.

        ori     $t2, $zero, 12      # Loads register $10 with a 12

        addu    $t2, $t2, $t0       # Adds the contents of $10 and $8 using 
                                    # binary addition with overflow ignored. In 
                                    # this case, 12 is added to 25 and the sum 
                                    # is stored in $10

        ori     $t0, $zero, 7       # Loads register $8 with a 7

        addu    $t2, $t2, $t0       # Adds 7 to the running sum in $10

        ori     $t0, $zero, 11      # Loads register $8 with an 11

        addu    $t2, $t2, $t0       # Adds 11 to the running sum in $10
                                    # $10 holds a bit pattern that can be 
                                    # interpreted as 55

        ori     $v0, $zero, 10      # Gracefully exits main process
                                    # ?: It was interesting that this worked 
                                    # given that exception handler had not been 
                                    # loaded. It was my origignal understanding 
                                    # that syscall were handled by exception 
                                    # handler.
                                    #
                                    # ?: I currently think that syscall is not 
                                    # necessarilly processsed by excpetion 
                                    # handler.  Instead, exception handler 
                                    # literally processes interrupts/exceptions.
                                    # I am sure my understanding will change 
                                    # with time in the course.
        syscall
