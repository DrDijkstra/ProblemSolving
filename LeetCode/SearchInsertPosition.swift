class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let total = nums.count;
        var startingIndex = 0;
        var lastIndex = total - 1;
        var searhIndex = 0
        for _ in 0...total{
            searhIndex = (startingIndex + lastIndex)/2
            if nums[searhIndex] == target{
                return searhIndex
            }else if(startingIndex == lastIndex) || (startingIndex > lastIndex){
                break
            }else if(  target > nums[searhIndex]){
                startingIndex = searhIndex 
            }else if( target < nums[searhIndex]){
                if searhIndex > 0{
                    lastIndex = searhIndex - 1;
                }
                
            }
        }



        if (target < nums[startingIndex] ){

            return startingIndex
        }
        else if ( target < nums[lastIndex]){
            return lastIndex
        }
        else if (target > nums[lastIndex]){

            return lastIndex + 1
        } 


        return lastIndex


        
        
    }


}



// let sol = Solution()
// var inputArr:[Int] = [1,2,3]

// print(sol.searchInsert([11,20,30,49,55,65], 50))