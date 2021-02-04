        .text
        .globl  strDifHighli

# $a0   first string
# $a1   second string
# $v0   

strDifHighli:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)
        nop

        jal     strDiffInd
        nop