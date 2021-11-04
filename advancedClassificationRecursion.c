#include "NumClass.h"
#include <math.h>
#define True 1
#define False 0

int numOfDigits(int);

int isArmstrongREC(int, int, int);

int numOfDigits(int n) // a private func to calc num of digits for a number
{
    if (n == 0)
    {
        return 1;
    }
    return (int)log10(n)+1; // it returns the number of digits of the number
}

int isArmstrong(int num)
    {
        return isArmstrongREC(num, num, numOfDigits(num));
    }

int isArmstrongREC(int num, int sum, int nOfDig)
    {
        if (sum == 0 && num == 0) // we checked all nums and the num became zero
            return True;
        if (sum < 0 || num == 0) // we passed the value of the num or didn't reach it
            return False;
        int power = num % 10; // take the last digit of the number
        power = (int)pow(power, nOfDig);
        sum -= power; // 
        num /= 10; // get rid of the last digit of the number
        return isArmstrongREC(num, sum, nOfDig); // recursive call
    }

int isPalindrome(int num)
{
    int nOfDig = numOfDigits(num);
    if (nOfDig == 0 || nOfDig == 1) // trivial / stop condition
    {
        return True;
    }
    if ((num%10) != ((int)(num/pow(10, nOfDig-1)))) // the first and last number is not the same
    {
        return False;
    }
    int strip = (int)(num % (int)pow(10, nOfDig-1)); // the num without first number
    strip = (int)(strip/10); // the num without last number
    return isPalindrome(strip); // the recursive call
}