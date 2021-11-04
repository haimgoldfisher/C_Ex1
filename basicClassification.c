#include "NumClass.h"
#include <math.h>
#define True 1
#define False 0

int factorial(int);

int isPrime(int num)
{
    if (num == 1) // in this task, 1 is prime
    {
        return True;
    }
    
    int i = 2;
    while (i <= sqrt(num))
    {
        if (num % i == 0)
        {
            return False;
        }
        i++;
    }
    return True;
}

int factorial(int num) // a private recursive function to calc factorial numbers
{
    if (num == 0) // 0! = 1
    {
        return 1;
    }   
    return(num*factorial(num-1));
}

int isStrong(int num)
{
    int curr = num; // since we want to save the value of the input
    int sum = 0;
    while(curr>0)
    {
        int fact = curr % 10; // take the last digit of the number
        fact = factorial(fact); // take it factorial value
        sum += fact; // add it to the sum
        curr /= 10; // move to the next digit
    }
        if (sum == num){
            return True;
        }
        return False;
}