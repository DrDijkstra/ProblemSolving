#include<bits/stdc++.h>
using namespace std;

#define ll long long

string intToRoman(int num) {

        unordered_map<int, string> myMap;
        unordered_map<int,string>::iterator it;

     
          myMap.insert({1,"I"});
          myMap.insert({4,"IV"});
          myMap.insert({5,"V"});
          myMap.insert({9,"IX"});
          myMap.insert({10,"X"});
          myMap.insert({40,"XL"});
          myMap.insert({50,"L"});
          myMap.insert({90,"XC"});
          myMap.insert({100,"C"});
          myMap.insert({400,"CD"});
          myMap.insert({500,"D"});
          myMap.insert({900,"CM"});
          myMap.insert({1000,"M"});
    

    int romanFrac[] = {1,4,5,9,10,40,50,90,100,400,500,900,1000};


    string roman = "";

    for (int i=12; i >= 0; i--){

            if (num == 0){
                break;
            }
        
            double dividend = (double)num / romanFrac[i];

           
            if (dividend >= 1){
                int len = (int)dividend;
                num = num % romanFrac[i];

                for (int j = 0; j<len; j++ ){
                    // cout<<"j "<<j<<" "<<"    "<<romanFrac[i]<<endl;
                    it = myMap.find(romanFrac[i]);
                   
                    if (it != myMap.end()){
                       

                    string str = it->second;
                    roman  = roman + str;

                    }
                    
                }


            }  


           
        }
        

    return roman;



        
    }

int main(){
    int num;
    cin >> num;
    

    cout<< intToRoman( num);

    return 0;
}