

#################################################################
# $f12 = x
#################################################################
# $f3 = term
# $f4 = sum
#################################################################

        .text
        .globl  exp

exp:
        sub     $sp, $sp, 4
        s.s     $f1, ($sp)
        sub     $sp, $sp, 4
        s.s     $f2, ($sp)
        sub     $sp, $sp, 4
        s.s     $f3, ($sp)
        sub     $sp, $sp, 4
        s.s     $f4, ($sp)

        li.s    $f1, 1.0e-4     # Accuracy of Taylor Series approximation
        li.s    $f0, 1.0        # loop counter/divisor
        li.s    $f2, 1.0        # constant 1.0
        li.s    $f3, 1.0        # term
        li.s    $f4, 1.0        # sum
        

loopA:  c.lt.s  $f3, $f1

        bc1t    endLpA

        mul.s   $f3, $f3, $f12
        div.s   $f3, $f3, $f0

        add.s   $f4, $f4, $f3

        add.s   $f0, $f0, $f2
        j       loopA
endLpA:
        mov.s   $f0, $f4

        add     $sp, $sp, 4
        l.s     $f4, ($sp)
        add     $sp, $sp, 4
        l.s     $f3, ($sp)
        add     $sp, $sp, 4
        l.s     $f2, ($sp)
        add     $sp, $sp, 4
        l.s     $f1, ($sp)

        jr      $ra




