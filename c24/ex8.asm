# Perform selection sort on an array in memory.
# I choose to write the indexes and positions in the array as address instead 
# of index numbers.

        .text
        .globl main

main:   #$t0 index
        #$t1 N
        #$t2 position
        #$t3 minimum
        
        #index
        la      $t0, array

        la      $t1, size
        lw      $t1, 0($t1)
        mul     $t1, $t1, 4
        # N
        addu    $t1, $t1, $t0
        # N-1
        subu    $t4, $t1, 4
        #for(index = 0; index < N-1; index++) 
loop1:  beq     $t0, $t4, endLp1
        nop
        #min = index
        move    $t3, $t0

        #position = index+1
        addu    $t2, $t0, 4
        #for(position = index+1; position < N; position++)
loop2:  beq     $t2, $t1, endLp2
        nop

        lw      $t5, 0($t2)
        lw      $t6, 0($t3)
        nop
        #if(arr[position] < arr[minimum])
        bge     $t5, $t6, newMin
        nop
        #min = position
        move    $t3, $t2

newMin: addu    $t2, $t2, 4
        j       loop2

endLp2: nop
        #Swap arr[min] and arr[index]
        lw      $t7, 0($t3)
        lw      $t8, 0($t0)
        sw      $t7, 0($t0)
        sw      $t8, 0($t3)

        addu    $t0, $t0, 4
        j       loop1

endLp1: nop
#######################################
#Print array
        la      $t0, array

pntLp:  beq     $t0, $t1, endPnt
        nop

        li      $v0, 1
        lw      $a0, 0($t0)
        nop
        syscall

        li      $v0, 4
        la      $a0, space
        syscall


        addu    $t0, $t0, 4
        j       pntLp

endPnt: nop

        li      $v0, 10
        syscall

        .data
size:   .word   20
array:  .word   99, 23, 45, 82, 09, 34, 71, 64, 88, 42, 12, 87, 33, 36, 83, 18, 17, 04, 52, 46
space:  .asciiz " "