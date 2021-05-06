## CS 254 Program 9
##
## Write a program that prompts the user for a temperature in Celsius. Read it 
## in as a floating point value using a trap handler service. Then convert and 
## write out that temperature in Fahrenheit. Use single precision floating 
## point instructions for the conversion.
##
## Programmer:  Antonio Zea
## Date:    05-05-2021
################################################################################
## $f0 = accumulator 
## $f1 = holds immediate values necessary for multiplication and addition
## $f12 = Destination register to print float trap handler service
################################################################################
        .text
        .globl main

main:
        li      $v0, 4          # Ask user to input temp in Celcius
        la      $a0, prompt1
        syscall

        li      $v0, 6          # Input is read in as a floating point value 
                                # into $f0
        syscall

        li.s    $f1, 1.8        # $f1 = (9/5)
        mul.s   $f0, $f0, $f1   # $f0 = C * (9/5)

        li.s    $f1, 32.0
        add.s   $f0, $f0, $f1   # $f0 = C * (9/5) + 32

        mov.s   $f12, $f0       # $f12 = $f0
                                # print float service needs the float to be in 
                                # $f12 to print it

        li      $v0, 4          # prompt for Fahrenheit
        la      $a0, prompt2
        syscall

        li      $v0, 2          # Call the print float service
        syscall

        li      $v0, 10         # Exit gracefully
        syscall

        .data
prompt1:.asciiz "Enter Celsius: "
prompt2:.asciiz "Fahrenheit: "