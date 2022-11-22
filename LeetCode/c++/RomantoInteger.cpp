#include<bits/stdc++.h>
using namespace std;

#define ll long long

int romanToInt(string s) {
    int n = s.length();
    int num = 0;

    for (int i=0; i<n; i++){
        
        if (s[i] == 'M'){
            num += 1000;

        }else if (s[i] == 'D'){
            num += 500;

        }else if (s[i] == 'C'){
                 int nextIndex = i+1;

                if (nextIndex <= n- 1){
                    if (s[nextIndex] == 'M' ){
                    num += 900;
                    i++;
                }
                else if (s[nextIndex] == 'D'){

                    num += 400;
                    i++;
                }
                else{
                    num += 100;
                }
            }else{
                num += 100;
            }

        }else if (s[i] == 'L'){

            num += 50;
        }else if (s[i] == 'X'){
            int nextIndex = i+1;

                if (nextIndex <= n- 1){
                    if (s[nextIndex] == 'C' ){
                    num += 90;
                    i++;
                }
                else if (s[nextIndex] == 'L'){

                    num += 40;
                    i++;
                }
                else{
                    num += 10;
                }
            }else{
                num += 10;
            }
            


           

        }else if (s[i] == 'V'){
            num += 5;

        }else if(s[i] == 'I'){
                int nextIndex = i+1;

                if (nextIndex <= n- 1){
                    if (s[nextIndex] == 'X' ){
                    num += 9;
                    i++;
                }
                else if (s[nextIndex] == 'V'){

                    num += 4;
                    i++;
                }
                else{
                    num += 1;
                }
            }else{
                num += 1;
            }
           

        }
       
        

    }
    return num;
}

int main()
{
    string str;
    cin>>str;
    cout<<romanToInt( str);
    return 0;
}