#include<bits/stdc++.h>
using namespace std;

#define ll long long

    bool isValid(string s) {
        int len = s.size();
        vector<char> vec;
        bool isValid = true;
        string str2 = s;
        char lastElement = s[0];
         vec.push_back(s[0]);

        int vecSize = 1;

        for(int i=1; i<len;i++){
           // cout<<i<<endl;

            if (s[i] == '{'){
                vec.push_back('{');
                vecSize += 1;
            }
             else if (s[i] == '['){
                vec.push_back('[');
                 vecSize += 1;
            }
            else  if (s[i] == '('){
                vec.push_back('(');
                 vecSize += 1;
            }
            else if (s[i] == '}'  ){
                if (lastElement == '{'){
                     vec.pop_back();
                      vecSize -= 1;
                }
                else {
                  vec.push_back('}');
                   vecSize += 1;
                }   
            }
            else  if (s[i] == ']'){
                 if (lastElement == '['){
                     vec.pop_back();
                      vecSize -= 1;
                }
                else {
                    vec.push_back(']');
                     vecSize += 1;
                }
                
            }
            else  if (s[i] == ')'){
                if (lastElement == '('){
                    vec.pop_back();
                     vecSize -= 1;
                }
                else {
                    vec.push_back(')');
                     vecSize += 1;
                }
                
            }
            if( vecSize == 0){
                lastElement = '\0';
            }
            else{
                lastElement = vec.at(vecSize - 1);

            }
            
        }




        if(vecSize == 0){
            return true;
        }
        else{
            return false;
        }
    }

int main(){
    string s;
    cin>>s;
    if (isValid(s)){
        cout<<"true"<<endl;
    }
    else{
        cout<<"false"<<endl;
    }
    
    return 0;
}