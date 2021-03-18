        .text
        .globl main

main:
        ori     $9,  $0,  17    # Load $9 with 17
        ori     $10, $0,  34    # Load $10 with 34
        addu    $10, $10, $9    # Add 17 and 34 and put result in $10
        ori     $9,  $0,  2     # Load $9 with 2
        divu    $10, $9         # Divided 51 by 2
        mflo    $10             # Load the quotient into $10