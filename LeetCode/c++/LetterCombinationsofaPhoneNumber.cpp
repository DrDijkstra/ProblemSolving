#include<bits/stdc++.h>
using namespace std;

#define ll long long

vector<string> letterCombinations(string digits) {
    std::unordered_map<char,vector<string>> mymap = {
        {'2', {"a", "b", "c"}},
        {'3', {"d", "e", "f"}},
        {'4', {"g", "h", "i"}},
        {'5', {"j", "k", "l"}},
        {'6', {"m", "n", "o"}},
        {'7', {"p", "q", "r", "s"}},
        {'8', {"t", "u", "v"}},
        {'9', {"w", "x", "y", "z"}},

    };

    int count = digits.size();
    int i = 0, j= 1,k=2,l=3;
    vector<string> res;
    if(count == 1){
            res = mymap[digits[i]];
        }
    if(count == 2){
                
                int len1 =  mymap[digits[i]].size();
                int len2 =  mymap[digits[j]].size();
                for(int index1 = 0 ; index1 < len1; index1++){
                    for (int index2 = 0; index2 < len2; index2++)
                    {
                        string temp = mymap[digits[i]][index1] + mymap[digits[j]][index2];
                        res.push_back(temp);
                    }
                    
                }
                
            }
    if (count == 3){
                    int len1 =  mymap[digits[i]].size();
                    int len2 =  mymap[digits[j]].size();
                    int len3 =  mymap[digits[k]].size();
                    for(int index1 = 0 ; index1 < len1; index1++){
                        for (int index2 = 0; index2 < len2; index2++)
                        {
                            for (int index3 = 0; index3 < len3; index3++)
                            {
                                string temp = mymap[digits[i]][index1] + mymap[digits[j]][index2] +mymap[digits[k]][index3] ;
                                res.push_back(temp);
                            }
                        }
                        
                    }
                }
    if(count == 4){
                        int len1 =  mymap[digits[i]].size();
                        int len2 =  mymap[digits[j]].size();
                        int len3 =  mymap[digits[k]].size();
                        int len4 =  mymap[digits[l]].size();
                        for(int index1 = 0 ; index1 < len1; index1++){
                            for (int index2 = 0; index2 < len2; index2++)
                            {
                                for (int index3 = 0; index3 < len3; index3++)
                                {
                                    for (int index4 = 0; index4 < len4; index4++)
                                    {
                                        string temp = mymap[digits[i]][index1] + mymap[digits[j]][index2] + mymap[digits[k]][index3]  + mymap[digits[l]][index4] ;
                                        res.push_back(temp);
                                    }
                                }
                            }
                            
                        }
                    }


    

    int size = res.size();
    for (int i = 0; i < size; i++)
    {
        cout<<res[i]<<endl;
        /* code */
    }
    

    return res;
    

}

int main(){
    string input = "5678";
    vector<string> res = letterCombinations(input);
    return 0;
}