#include<bits/stdc++.h>
using namespace std;

#define ll long long


string longestPalindrome(string s) {
    string res = "";
    int size = s.size();

    bool oddFlag = 1;
    bool evenFlag = 1;

    int left = 0;
    int right = 0;
    int startIndex = 0;
    int maxLength = 1;
    for(int i=0; i<size; i++){ 
        //for even lenth       
        int len = min(size - i - 1, i - 0 + 1);

        for(int radius = 1; radius <= len; radius++){
                int center = i + 1;
                right = floor(center) + radius - 1 ;
                left = center - radius ;
                if (s[left] != s[right]){
                    break;
                }else{
                    //cout<<2 * radius<<" max  "<<maxLength<<endl;
                    if ((2 * (radius)) > maxLength){
                         //cout<<2 * radius<<" max  2 "<<maxLength<<endl;
                        startIndex = left;
                        maxLength = 2 * radius ;
                        //cout<<
                    }
                }
                

        }
    }
    //cout<<"max length"<<maxLength<<endl;

    for(int i=1;i<size; i++){

        int len = min(size - i - 1, i - 0);
        //cout<<"center: "<<i<<" len: "<<len<<endl;
        for(int radius = 1; radius <= len; radius++){
                int center = i ;
                left = center - radius ;
                right = center + radius ;
                //cout<<"left: "<<left<<" right: "<<right<<endl;
                if (s[left] != s[right]){
                    break;
                }else{
                    //cout<<2 * radius + 1<<"  "<<maxLength<<endl;
                    if ((2 * radius + 1)>maxLength){
                        //cout<<"max   "<<left<<"  left";
                        startIndex = left;
                        maxLength = 2 * radius + 1;
                    }
                    
                }
                

        }
        //cout<<endl;

    }


    left = startIndex ;
    right = startIndex + maxLength ;
    for(int i = left;i < right; i++)
    {
        res += s[i];
    }








    return res;

}

int main(){
    string str = "aaa";
    cout<<longestPalindrome(str)<<endl;

    return 0;
}

// a a b b c c d d
// 0 1 2 3 4 5 6 7