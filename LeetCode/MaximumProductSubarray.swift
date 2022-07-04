import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = 0

        var maxProductNumTillNth:Int = 1
        
        var minProductNumTillNth:Int = 1
        var resultMax = -1001
        for num in nums{



            let tempMin = maxProductNumTillNth
            
            maxProductNumTillNth = max(num, temp)
            minProductNumTillNth = min(num, temp)


            resultMax = max(resultMax, maxProductNumTillNth)
            
        }

        return resultMax
        
    }
}


var arr :[Int] = [-2,3,-4]
var sol = Solution()
print(sol.maxProduct(arr))