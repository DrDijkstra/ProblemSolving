#include<bits/stdc++.h>
using namespace std;

#define ll long long

struct RowInfo
{
    int index;
    int value;
};

bool compare( RowInfo row1, RowInfo row2){
	if(row1.value == row2.value)
		return row1.index < row2.index;
	else {
        return row1.value < row2.value;
    }
}


vector<int> kWeakestRows(vector<vector<int>>& mat, int k) {
     vector<int> res;
     int colSize = mat.size();
     RowInfo rowInfo[colSize];
     for(int i=0;i<colSize;i++){
        int value = 0;
        int rowSize = mat[i].size();
        for (int j = 0; j < rowSize; j++)
        {
            if (mat[i][j]){
                value++;
            }
        }
        rowInfo[i].value = value;
        rowInfo[i].index = i;
     }

    //  for(int i=0; i<colSize; i++){
    //      cout<<i<<" "<<rowInfo[i].value<<endl;
       
    //     //res.push_back(rowInfo[i].index);
    //     //cout<<res[i]<<endl;
    // }

    sort(rowInfo,rowInfo+colSize, compare);

    for(int i=0; i<k; i++){
       
        res.push_back(rowInfo[i].index);
        cout<<res[i]<<endl;
    }
    return res;
    
}

int main(){
    vector<vector<int>> mat =  {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0},
    {1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0},
    {1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0},
    {1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0},
    {1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
    {1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},
    {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0}};
    
    vector<int> res = kWeakestRows(mat, 7);

    return 0;
}