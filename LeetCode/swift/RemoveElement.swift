import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let arryCount = nums.count
        for i in stride(from: arryCount - 1, through: 0, by: -1) {
            if nums[i] == val {
                //print("indexToRemove: \(i)")
                nums.remove(at: i)
            }
        }
        return nums.count
    }
}

var sol = Solution()
var nums = [3,2,2,3]
var val = 3
print("adsfasdf")
print(sol.removeElement(&nums, val))