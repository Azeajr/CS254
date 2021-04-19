# Consider the following structure:
# struct{
#     int day;
#     int month;
#     int year;
# }
# Write a program that allocates memory for such a structure and fills it in 
# with values such as 9/7/2003.
#
# Write out the values in the structure.
################################################################################
# (struct Date *)newDate(void)
# $v0 = return value
# void printDate(struct Date *)
# $a0 = argument
###############################################################################
        .text
        .globl main
main:
        sub     $sp, $sp, 4
        sw      $ra, ($sp)

        jal newDate

        move    $a0, $v0

        jal printDate

        lw      $ra, ($sp)
        add     $sp, $sp, 4

        jal     $ra

