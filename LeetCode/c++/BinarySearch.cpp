#include<bits/stdc++.h>
using namespace std;

#define ll long long

class Solution {
public:


    int bSearch(int l, int r, vector<int>& arr, int searchNum) {
        

      if (l > r) {
        return -1;
        }



        int mid = (l+r)/2;
        if (arr[mid] == searchNum){
            return mid;
        }

        if(searchNum > arr[mid]){
             return bSearch( mid + 1 ,  r, arr,  searchNum);
        }else{
             return bSearch( l,  mid -1,  arr,  searchNum); 
        }
        
    }
    int search(vector<int>& nums, int target) {
        return bSearch(0, nums.size() - 1,nums, target );

        
    }

    


};


int main(){
    Solution sol = Solution();
    vector<int> nums{-1,};
    cout<<sol.search(nums,9)<<endl;

    return 0;
}

