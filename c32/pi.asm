#################################################################
# $a0 = N
#################################################################
# $f0 = numerator       0($fp)
# $f2 = denominator     8($fp)
# $f4 = term            16($fp)
# $f6 = sum             24($fp)
#################################################################
# $f0 = Return value
#################################################################
        .text
        .globl pi

pi:
        #sub     $sp, $sp, 8
        #s.d     $f0, ($sp)
        sub     $sp, $sp, 8
        s.d     $f2, ($sp)
        #sub     $sp, $sp, 8
        #s.d     $f12, ($sp)
        sub     $sp, $sp, 4
        sw      $fp, ($sp)

        sub     $fp, $sp, 32
        move    $sp, $fp

        li.d    $f0, 1.0
        s.d     $f0, 0($fp)
        s.d     $f0, 8($fp)
        li.d    $f0, 0.0
        s.d     $f0, 24($fp)

loop:   beqz    $a0, endLp

        l.d     $f0, 0($fp)     # numerator
        l.d     $f2, 8($fp)     # denominator
        div.d   $f0, $f0, $f2   # term
        #s.d     $f0, 16($fp)
        l.d     $f2, 24($fp)    # sum
        add.d   $f2, $f2, $f0   # sum = sum + term
        s.d     $f2, 24($fp)    # store sum

        l.d     $f0, 0($fp)     # numerator
        neg.d   $f0, $f0        # change sign of numerator
        s.d     $f0, 0($fp)     # store numerator

        li.d    $f2, 2.0
        l.d     $f0, 8($fp)     # denominator
        add.d   $f0, $f0, $f2   # denominator = denominator + 2
        s.d     $f0, 8($fp)     # store denominator


        sub     $a0, $a0, 1
        j       loop
endLp:
        li.d    $f2, 4.0
        l.d     $f0, 24($fp)
        mul.d   $f0, $f0, $f2

        add     $sp, $fp, 32

        lw      $fp, ($sp)
        add     $sp, $sp, 4

        #l.d     $f12, ($sp)
        #add     $sp, $sp, 8

        l.d     $f2, ($sp)
        add     $sp, $sp, 8

        #l.d     $f0, ($sp)
        #add     $sp, $sp, 8

        jr      $ra
