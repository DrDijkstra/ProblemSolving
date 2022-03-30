#include<bits/stdc++.h>
using namespace std;

#define ll long long


void rotate(vector<vector<int>>& matrix) {
    int rowSize = matrix.size();
    int colSize = matrix[0].size();

    int count = colSize;
    for(int i=0; i<rowSize  - i ; i++){
        cout<<"index: "<<i<<endl;
        for(int j = i; j < count - 1; j++){
            int temp = matrix[i][j];


            matrix[i][j] = matrix[colSize - 1 - j][i];//top left <- bottom left
            matrix[colSize - 1 - j][i] = matrix[rowSize - 1 - i][colSize - 1 - j] ;// bottom left <- bottom right
            matrix[rowSize - 1 - i][colSize - 1 - j] =  matrix[j][rowSize - 1 - i];// bottom right <- bottom left
            matrix[j][rowSize - 1 -i] = temp; // top right 
                      
         
            // cout<<"top left: "<<i<<" "<<j;
            //   cout<<" top right: "<<j<<" "<<rowSize - 1 - i<<endl;
              
            //  cout<<"bottom right: "<<rowSize - 1 - i<<" "<<colSize - 1 ;
            //   cout<<" bottom left: "<<colSize - 1 - j<<" "<< i;

              

            //   cout<<endl<<endl;
            //   for (int i = 0; i < rowSize; i++)
            //     {
            //         for (int j = 0; j < colSize; j++)
            //         {
            //             cout<<matrix[i][j]<<" ";
            //         }
            //         cout<<endl;
                    
            //     }
            
        }
        count--;
    }

    // cout<<endl;
    // for (int i = 0; i < rowSize; i++)
    // {
    //     for (int j = 0; j < matrix[0].size(); j++)
    //     {
    //         cout<<matrix[i][j]<<" ";
    //     }
    //     cout<<endl;
        
    // }
    
}
int main(){
    vector<vector<int>> arr = {
        {1,2,3,4, 6},
        {5,6,7,8, 6},
        {9 ,10,11,12, 6},
        {13,14,15,16, 6},
        {13,14,15,16, 6},
        };
    rotate(arr);
    return 0;
}


