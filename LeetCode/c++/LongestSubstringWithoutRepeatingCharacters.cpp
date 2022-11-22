#include<bits/stdc++.h>
using namespace std;

#define ll long long

// template<typename K, typename V>
// void print_map(std::unordered_map<K, V> const &m)
// {
//     cout<<"sanjay"<<endl;
//     for (auto const &pair: m) {
//         std::cout << "{" << pair.first << ": " << pair.second << "}\n";
//     }
// }


void printMap(unordered_map<char,int> um){
    unordered_map<char,int>::iterator itr;
    for(itr = um.begin(); itr != um.end(); itr++){
        cout<<itr->first<<" "<<itr->second<<endl;
    }
    //cout<<endl;
}

int lengthOfLongestSubstring(string s) {
    int size = s.size();
    int left = 0, right = 0;
    int subStringLen = 0;


    unordered_map<char,int> substr;
    unordered_map<char,int>::iterator itr;

  
    for(int i=0;i<size; i++){
        auto res = substr.find(s[right]);
        if(res != substr.end()){
            //repeated
            //shifted left pointer to rightPointer + 1
            //cout<<res->second + 1<<" "<<left <<endl;
            

            left = max(left, res->second + 1);
            
            res->second = right;
        }
        substr.insert(std::pair<char,int>(s[right],right));
        //print_map(subStr);
        printMap(substr);
      
        subStringLen = max(subStringLen, right - left + 1);
       //cout<<"string: "<<s<<"  character : "<<s[right]<<"   substring lentgh: "<<subStringLen<<"    right: "<<right<<"   left: "<<left<<endl<<endl<<endl;
        right++;
    }
    return subStringLen;
}


int main(){
    string str = "abba";
    int n = lengthOfLongestSubstring(str);
    cout<<n<<endl;
    return 0;
}