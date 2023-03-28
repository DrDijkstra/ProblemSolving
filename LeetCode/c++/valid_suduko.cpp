#include<bits/stdc++.h>
using namespace std;

#define ll long long


    




#define PRINT_VECTOR(vec) do {\
    for (int i = 0; i < vec.size(); i++) {\
        std::cout << vec[i] << " ";\
    }\
    std::cout << std::endl;\
} while(0)



class Solution {
private:
    unordered_map<int, bool> valid_column;
    unordered_map<int, bool> valid_row;
    unordered_map<string, bool> valid_3x3;


public:

    vector<char> getColumnElementForIndex(int row, int column, vector<vector<char>>& board){
         vector<char> res;
         int columnHeight = board.size();
        for(int i = 0; i < columnHeight; i++ ){
              for(int j = column; j <= column; j++){
                 
                  if (board[i][j] >= '0' && board[i][j] <= '9'){
                      res.push_back(board[i][j]);
                  }
              }
        }
        return res;

    }

    vector<char> getRowElmentForIndex(int row, int column, vector<vector<char>>& board){
         vector<char> res;
           int rowHeight = board.size();
        for(int i = row; i <= row; i++ ){
              for(int j = 0; j < rowHeight; j++){
                  if (board[i][j] >= '0' && board[i][j] <= '9'){
                      res.push_back(board[i][j]);

                  }
              }
        }
        return res;
    }

    vector<char> get3X3ForIndex(int row, int column, vector<vector<char>>& board){
        vector<char> res;

        int startRowIndex = row ;
        int startColumnIndex = column ;

    

        for(int i = startRowIndex; i < startRowIndex + 3; i++ ){
         

              for(int j = startColumnIndex; j < startColumnIndex + 3; j++){
                  if (board[i][j] >= '0' && board[i][j] <= '9'){
                      res.push_back(board[i][j]);  
                  }
              }
        }
        return res;
    }

    bool isColumnValidForIndex(int row, int column, vector<vector<char>>& board) {

        if (valid_column.count(column)){
            return valid_column[column];
        }
        

        vector<char> _columnElements  = getColumnElementForIndex(row, column, board);
        int columnCount = _columnElements.size();



        unordered_map<char, bool> columnMap;
        for (int i = 0; i < columnCount; i++ ){
            if (columnMap.count(_columnElements[i])){
                valid_column[column] = false;
                return false;
            }
            columnMap[_columnElements[i]] = true;
        }

        valid_column[column]  = true;
        return true;


    }

    bool isRowValidForIndex(int row, int column,vector<vector<char>>& board) {

       if (valid_row.count(row)){
           
            return valid_row[row];
        }
        
        vector<char> _rowElements = getRowElmentForIndex(row, column, board);
        int rowCount = _rowElements.size();

        unordered_map<char, bool> rowMap;

      

        for (int i = 0; i < rowCount; i++ ){
            //cout<<_rowElements[i]<<endl;
            if (rowMap.count(_rowElements[i])){
                valid_row[row] = false;
                return false;
            }
            rowMap[_rowElements[i]] = true;
        }

        valid_row[row]  = true;
        return true;


    }

    bool is3x3ValidForIndex(int row, int column,vector<vector<char>>& board) {
       
        row /= 3;
        column /=  3;


        row *= 3;
        column *= 3;
        

        string rowColumn = "row"+ std::to_string(row)+"column"+std::to_string(column);

    

        if (valid_3x3.count(rowColumn)){
          
            return valid_3x3[rowColumn];
        }
        
        vector<char> _3x3Elements = get3X3ForIndex(row, column, board);
        int _3x3Count = _3x3Elements.size();



        unordered_map<char, bool> _3x3Map;
        for (int i = 0; i < _3x3Count; i++ ){
            if (_3x3Map.count(_3x3Elements[i])){
                //cout<<'_3x3Elements '<<_3x3Elements[i]<<endl;
                 valid_3x3[rowColumn] = false;
                return false;
            }
            _3x3Map[_3x3Elements[i]] = true;
        }

        valid_3x3[rowColumn] = true;
        return true;


    }


    



    bool isValidSudoku(vector<vector<char>>& board) {

        int rowCount = board.size(), columnCount = board.size();

        for (int i = 0; i < rowCount; i++){
            for(int j = 0; j < columnCount; j++){
                if  (board[i][j] >= '0' && board[i][j] <= '9'){

                  

                    //if(!(isColumnValidForIndex(i,j,board)))

                    if(!(isColumnValidForIndex(i,j, board) &&
                        (isRowValidForIndex(i,j,board)) &&
                        (is3x3ValidForIndex(i,j,board)))){
                        return false;
                    }
                }
               

              
            }
           
        }
        return true;
    }
};


int main(){

    Solution solution = Solution();


   std::vector<std::vector<char>> board ={  {'.' , '.', '4' , '.', '.', '.', '6' , '3' , '.'},
                                            {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                                            {'5', '.', '.', '.', '.', '.', '.', '9', '.'},
                                            {'.', '.', '.', '5', '6', '.', '.', '.', '.'},
                                            {'4', '.', '3', '.', '.', '.', '.', '.', '1'},
                                            {'.', '.', '.', '7', '.', '.', '.', '.', '.'},
                                            {'.', '.', '.', '5', '.', '.', '.', '.', '.'},
                                            {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                                            {'.', '.', '.', '.', '.', '.', '.', '.', '.'}};



    cout<<solution.isValidSudoku(board)<<endl;

    return 0;
}