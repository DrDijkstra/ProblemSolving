

#include<bits/stdc++.h>
using namespace std;

#define ll long long


class Solution {
public:
    int addDigits(int num) {
        if ((num / 10) < 1){
            return num;
        }
        int res = 0;

        double numDouble = num;

        while((numDouble / 10) >= 1){
            int digit = (int)numDouble % 10;
            res += digit;
            numDouble = numDouble/ 10;


        }
        res += (int)numDouble % 10;
        return addDigits(res);
        
    }
};

int main(){

    Solution sol = Solution();

    cout<<sol.addDigits(38)<<endl;
    return 0;
}