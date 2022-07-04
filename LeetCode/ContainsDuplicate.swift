class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {

        var res:Bool = false

        var dict: [Int:Int] = [:] 

        for num in nums{
            if dict[num] == nil{
                // dont repeating
                dict[num] = num
            }
            else{
                //repeating
                res = true
                break
            }
        }

        return res
        
    }
}



var arr:[Int] = [1,2,3,4]
var sol = Solution()
print(sol.containsDuplicate(arr))