#include<bits/stdc++.h>
using namespace std;

#define ll long long


string checkIfPalindrome(string num){


    int n = num.length();
    for (int i=0, j = n-1; i<n, j>=0; i++,j--){
        if (num [i] != num[j]){
            return "false";
        }
        
    }
    return "true";
}


int main(){
    ll num;
    

    string str;
    cin>> num;
    str = std::to_string(num);
    cout <<checkIfPalindrome(str);
    return 0;
}