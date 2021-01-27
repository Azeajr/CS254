# Write a subroutine that takes three arguments, A, X, and Y. It then computes # A*X*Y and returns it.
# Use the subroutine to evaluate the following for various values of u and v:
# 5u^2 - 12uv + 6v^2


# Subroutine that calculates the product of three arguments $a0, $a1, $a2
# Value is stored in $v0 where the caller expects to find the returned value
        .text
        .globl multhree

multhree:
        mul     $v0, $a0, $a1
        nop
        mul     $v0, $v0, $a2

        jr      $ra
        nop