import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {

        var maxProductNumTillNth:Int = nums[0]
        
        var minProductNumTillNth:Int = nums[0]
        var resultMax = nums[0]
        for i in 1 ..< nums.count{



            let currMin = minProductNumTillNth
            let currMax = maxProductNumTillNth

            //print("sanjay",i,currMin, currMax)
            
            maxProductNumTillNth = max(nums[i], max(nums[i] * currMax, nums[i] * currMin))
            minProductNumTillNth = min(nums[i], min(nums[i] * currMin, nums[i] * currMax))


            resultMax = max(resultMax, maxProductNumTillNth)
            
        }

        return resultMax
        
    }
}


var arr :[Int] = [-1,-2,-9,-6]
var sol = Solution()
print(sol.maxProduct(arr))