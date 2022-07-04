import Foundation


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxNumTillNth:Int = -1001
        var resultMax = -1001
        for num in nums{

            let temp = maxNumTillNth + num
            
            maxNumTillNth = max(num, temp)

            resultMax = max(resultMax, maxNumTillNth)
            
        }



        return resultMax 
    }
}

var arr: [Int] = [-2,1,-3,4,-1,2,1,-5,4]
var sol = Solution()
print(sol.maxSubArray(arr))