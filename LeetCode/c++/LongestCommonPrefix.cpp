#include<bits/stdc++.h>
using namespace std;

#define ll long long


string longestCommonPrefix(vector<string>& strs) {
        int size = strs.size();
        int singleStringSize  ;
        if (size > 0){
            singleStringSize = strs[0].size();
        }
        string resultStr = "";
        

        bool breakFlag = 0;
        for(int i=0; i<singleStringSize; i++ ){
            bool flag = 1;
            for(int j=1; j<size; j++){               
                int currentStringSize = strs[j].size();
                if (i < currentStringSize){   
                    if (strs[0][i] != strs[j][i]){
                       flag = 0;
                       break;
                    }
                }
                else{
                    breakFlag = 1;
                }
            }
            if (breakFlag || flag == 0){
                break;
            }else if(flag){
                resultStr += strs[0][i];
            }
        }
       
       
        return resultStr;
    }



int main(){
    vector<string> strArr = {"sanjay", "san", "sa"};
    cout<<longestCommonPrefix(strArr);

    return 0;
}