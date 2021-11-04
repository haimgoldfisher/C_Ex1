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
    int cut = num;
    int res = 0;
    int curr = 0;
    for (int i = dig-1; i >= 0; i--) 
    {
        curr = cut % 10;
        res += curr * (int)pow(10, i);
        cut /= 10;
    }
    if (sum == num)
    {
        return True;
    }
    return False;
}