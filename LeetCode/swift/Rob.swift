class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        if nums.count == 1 { return nums[0] }
        
        var prev2 = 0
        var prev1 = 0
        
        for num in nums {
            let current = max(prev1, prev2 + num)
            prev2 = prev1
            prev1 = current
        }
        
        return prev1
    }
}
