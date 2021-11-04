#include "NumClass.h"
#include <math.h>
#define True 1
#define False 0

int numOfDigits(int);

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
    int sum = 0;
    int dig = numOfDigits(num);
    for (int curr = num; curr > 0; curr/=10) 
    {
        int power = curr % 10; // take the last digit of the number
        power = (int)pow(power, dig); // take it value,powered by num of digits value
        sum += power; // add it to the sum
    }
    if (sum == num)
    {
        return True;
    }
    return False;
}

int isPalindrome(int num)
{
    int dig = numOfDigits(num);
    for (int i = dig; i > 0; i--) 
    {
        int strip = (int)(num % (int)pow(10, i-1)); // the num without first number
        strip = (int)(strip/10); // the num without last number
        if ((num%10) != ((int)(num/pow(10, dig-1))))
        {
            return False;
        }
    }
    return True;
}