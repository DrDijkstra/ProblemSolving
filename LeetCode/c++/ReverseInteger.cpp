#include<bits/stdc++.h>
using namespace std;

#define ll long long



 int reverse(int x) {

     if( x == INT_MIN){
         return 0;
     }
    int num  = x;
    bool negativeFlag = false;
    if (num < 0)
    {
        negativeFlag = true;
        num = -num ;
    }
 
    int prev_rev_num = 0, rev_num = 0;


    while (num != 0)
    {

        int curr_digit = num % 10;
 
        // cout << INT_MAX - rev_num;
        int temp = 2147483647;
        double res = (double)2147483647/rev_num;
       

        if (res < 10){
            return 0;
        }
        rev_num = (rev_num * 10) + curr_digit;

 
        // checking if the reverse overflowed or not.
        // The values of (rev_num - curr_digit)/10 and
        // prev_rev_num must be same if there was no
        // problem.
        if ((rev_num - curr_digit) /
               10 != prev_rev_num)
        {
    
            return 0;
        }
 
        prev_rev_num = rev_num;
        num = num / 10;
    }
 
    return  (negativeFlag == true) ?  -rev_num : rev_num;

    }

int main(){

    int x;
    cin>>x;
    cout<< reverse(x);
    return 0;
}