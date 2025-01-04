class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var zeroCount = 0
        var maxLength = 0
        
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            // Shrink the window if more than one zero exists
            while zeroCount > 1 {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            // Calculate the max length excluding one zero
            maxLength = max(maxLength, right - left)
        }
        
        return maxLength
    }
}
