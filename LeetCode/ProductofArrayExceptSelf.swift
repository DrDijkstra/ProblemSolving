import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result:[Int] = []
        //print(nums)

        var multiplierArrFromBeginning:[Int] = nums
        var multiplierArrFromEnding:[Int] = nums
        var currResult = 1
        for (i,num) in nums.enumerated(){
            currResult = num * currResult
            multiplierArrFromBeginning[i] = currResult
        }

        //print(multiplierArrFromBeginning)
    currResult = 1
    for index in stride(from: nums.count - 1, to: -1, by: -1) {
        //print(index)
        currResult = currResult * multiplierArrFromEnding[index]
        multiplierArrFromEnding[index] = currResult
    }

    //print(multiplierArrFromEnding)
    
    currResult = 1

    for index in stride(from: nums.count - 1, to: -1 , by: -1) {
        //print( currResult, nums[index])
        currResult = currResult * nums[index]
        multiplierArrFromEnding[index] = currResult
    }
    

    result.append(multiplierArrFromEnding[1])
    for i in 1 ..< nums.count - 1{
        let res:Int = multiplierArrFromBeginning[i - 1] * multiplierArrFromEnding[i + 1]
        result.append( res)

    }
    result.append(multiplierArrFromBeginning[multiplierArrFromBeginning.count - 2])
    
    


        return result
    }
}


var arr = [-1,1,0,-3,3]
var sol = Solution()
print(sol.productExceptSelf(arr))
