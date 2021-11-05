# include <stdio.h>
# include "NumClass.h"
# define True 1

int swap(int, int);

int swap(int a, int b) // for a > b case
{
    int temp = a;
    a = b;
    b = temp;
    return 0;
}

int main()
{
    int first, second, i;
    scanf("%d %d", &first, &second);
    if (first > second)
    {
        swap(first, second);
    }
    printf("The Armstrong numbers are:");
    for (i = first; i < second+1; i++)
    {
        if (isArmstrong(i) == True)
        {
           printf(" %d", i);
        }
    }
    printf("\nThe Palindromes are:");
    for (i = first; i < second+1; i++)
    {
        if (isPalindrome(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Prime numbers are:");
    for (i = first; i < second+1; i++)
    {
        if (isPrime(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Strong numbers are:");
        for (i = first; i < second+1; i++)
    {
        if (isStrong(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\n");
    return 0;
}