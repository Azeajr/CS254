# A temperature in $8 is allowed to be within either of two ranges:
# 20 <= temp <= 40 and 60 <= temp <= 80.
# Write a program that sets a flag (register $3) to 1 if the temperature is
# in an allowed range and to 0 if the temperature is not in an allowed range.



        .text
        .globl main

main:   ori     $3, $0, 1
        # 20 <= temp <= 40 or 60 <= temp <= 80
        ori     $8, $0, 38
        
        sltiu   $9, $8, 81
        beq     $9, $0, out
        sll     $0, $0, 0

        sltiu   $9, $8, 60
        beq     $9, $0, end
        sll     $0, $0, 0

        sltiu   $9, $8, 41
        beq     $9, $0, out
        sll     $0, $0, 0

        sltiu   $9, $8, 20
        beq     $9, $0, end
        sll     $0, $0, 0

out:    ori     $3, $0, 0
end:    sll     $0, $0, 0