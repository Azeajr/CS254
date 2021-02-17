/**
 * @file Factorial.c
 * @author Antonio Zea
 * @brief Factorial program designed to make a table of input values and their 
 * output factorial.  Programs real purpose is to highlight overflow and its 
 * effect on how bitpatterns are interpreted by the program.
 * 
 * Signed integers in C have a range from -2,147,483,648 to 2,147,483,647 on my 
 * current machine. That is enought to hold the value of 12!(479,001,600) but 
 * cannot hold 13!(6,227,020,800).Same is true for values higher than 13!.  
 * 
 * What is also interesting is what happens at 34!.  
 * If 33! printed -2147483648(10000000 00000000 00000000 00000000) assumeing 
 * that signed int are 32 bit in length then multiplying by 34 in this case 
 * will cause an overflow that will leave the result with all zeros.  That 
 * seals the deal for every value that follows.
 * @version 0.1
 * @date 2021-01-24
 * 
 * @copyright Copyright (c) 2021
 * 
 */
#include <stdio.h>

int main(int argc, char const *argv[])
{
    const int N = 50;
    int cumProd = 1;

    printf("N\tN!\n--\t---------\n");
    printf("%3d\t%3d\n", 0, 1);

    for(int i = 1; i <= N; i++){
        cumProd *= i;
        printf("%3d\t%3d\n", i, cumProd);
    }

    return 0;
}
