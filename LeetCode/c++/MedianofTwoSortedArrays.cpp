#include<bits/stdc++.h>
using namespace std;

#define ll long long


double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
    multimap<int, int> mergedArray;
    multimap<int, int>::iterator itr;
    int size = nums1.size();
    int mergedArrIndex = 0;
    for(int i =0 ; i<size; i++){
        mergedArray.insert(std::pair<int,int>(nums1[i],mergedArrIndex));
        mergedArrIndex++;
    }
    size = nums2.size();
    for(int i = 0; i<size; i++){
        mergedArray.insert(std::pair<int,int>(nums2[i],mergedArrIndex));
        mergedArrIndex++;
    }
    //cout<<mergedArray.size()<<endl;

    int median = mergedArrIndex/2;
     double result;

    int index = 0;
    for (itr = mergedArray.begin(); itr != mergedArray.end(); itr++) {

        if (index == median){
            if (mergedArrIndex % 2 == 0){
                //odd
                multimap<int, int>::iterator itr1;
                itr1 = itr;
                multimap<int, int>::iterator itr2;
                itr2 = --itr;
               

                result = (double)(itr1->first + itr2->first)/2.0;
                //cout<<result<<endl;
            }
            else{
                multimap<int, int>::iterator itr1;
                itr1 = itr;
               

                
                result = itr1->first ;
            }

        }
           
                
             index++;
    }

   

    

    return result;

}

int main(){
    vector<int> nums1 = {2,2,4,4};
    vector<int> nums2 = {2,2,4,4};
    cout<<findMedianSortedArrays(nums1, nums2);




    return 0;
}