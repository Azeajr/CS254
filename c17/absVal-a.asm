## absVal.asm
##
## Calculate the absolute value of A

        .text
        .globl main

main: 
# Get A
        lui     $10,0x1000      #  Initialize the
                                #  base register
        lw      $8,0($10)       #  Load A
      
        sll     $0, $0, 0       #  no-op

# Is A Negative?
        srl     $9, $8, 31

        beq     $9, $0, done
        sll     $0, $0, 0       #  no-op

        subu    $8, $0, $8
        # Store -A
        sw      $8, 0($10)

done:   sll     $0, $0, 0       #  no-op

        .data
A:      .word 15