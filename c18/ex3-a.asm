        .text
        .globl main

main:   ori     $3, $0, 1
        # 20 <= temp <= 40 or 60 <= temp <= 80 or 90 <= temp <= 100
        # 
        ori     $8, $0, 61
        # 90 <= temp <= 100
        sltiu   $9, $8, 101
        beq     $9, $0, out
        sll     $0, $0, 0

        sltiu   $9, $8, 90
        beq     $9, $0, end
        sll     $0, $0, 0
        # 60 <= temp <= 80
        sltiu   $9, $8, 81
        beq     $9, $0, out
        sll     $0, $0, 0

        sltiu   $9, $8, 60
        beq     $9, $0, end
        sll     $0, $0, 0
        # 20 <= temp <= 40
        sltiu   $9, $8, 41
        beq     $9, $0, out
        sll     $0, $0, 0

        sltiu   $9, $8, 20
        beq     $9, $0, end
        sll     $0, $0, 0

out:    ori     $3, $0, 0
end:    sll     $0, $0, 0