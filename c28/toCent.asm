#   int toCent( int x ){
#     int v;        // v:   0($fp)
#     v =  x - 32;
#     v =  5*v
#     v =  v/9;
#     return v;
#   }
        .text
        .globl toCent
toCent:

        sub         $sp, $sp, 4
        sw          $ra, ($sp)
        sub         $sp, $sp, 4
        sw          $fp, ($sp)
        
        sub         $fp, $sp, 4
        move        $sp, $fp

        sub         $a0, $a0, 32
        sw          $a0, 0($fp)

        lw          $a0, 0($fp)
        
        mul         $a0, $a0, 5
        sw          $a0, 0($sp)

        lw          $a0, 0($fp)
        li          $v0, 9
        div         $a0, $v0
        mflo        $a0
        sw          $a0, 0($fp)




        lw          $v0, 0($fp)

        add         $sp, $fp, 4

        lw          $fp, ($sp)
        add         $sp, $sp, 4
        lw          $ra, ($sp)
        add         $sp, $sp, 4
        jr          $ra