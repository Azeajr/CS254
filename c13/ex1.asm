#Write a program that adds up the following integers:
#
# 456
#-229
# 325
#-552
#Leave the answer in register $8.

        .text
        .globl main

main:
        ori     $8,$0,456
        addiu   $8,$8,-229
        addiu   $8,$8,325
        addiu   $8,$8,-552