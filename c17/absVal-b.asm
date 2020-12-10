## absVal.asm
##
## Calculate the absolute value of A

        .text
        .globl main

main: 
# Get A
        lui     $10,0x1000     #  Initialize the
                               #  base register
        lw      $8,0($10)    #  Load A
      
        sll     $0,$0,0        #  no-op

# Is A Negative?
        srl     $9, $8, 31

        ori     $11, $0, 1
        beq     $9, $11, equal
        sll     $0,$0,0        #  no-op
        #positive
        j cont
        sll     $0,$0,0        #  no-op

equal:  #negative
        addi    $11, $0, -1
        mult    $8, $11
        mflo    $8


cont:
        # Store -A
        sw      $8, 0($10)

done:   

        .data
A:      .word 15