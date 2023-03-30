
#include<bits/stdc++.h>
using namespace std;

#define ll long long


class Solution {
public:
    int uniquePaths(int m, int n) {
        ll mMax = max(m,n);
        ll nMin = min(m,n);

        ll res = 1;

        ll div = 1;


        bool arr[101];
        memset(arr, false, sizeof(arr));

        for (int i = (m+n - 2); i >= mMax; i--){
            res *= i;
            div = 1;
            for (int j = nMin - 1; j >= 1; j--){
                if (arr[j] == false){
                    if (res % j == 0){
                        res /= j;
                        arr[j]  = true;
                }else{
                    div *= j;
                }
                }
            }
        }


        int result = res;


        return result;


    }
};


int main(){

    Solution sol = Solution();

    cout<<sol.uniquePaths(17,17)<<endl;
    return 0;
}