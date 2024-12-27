class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // Step 1: Find the largest index i such that nums[i] < nums[i + 1]
        var i = nums.count - 2
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        // Step 2: If such index i exists, find the largest index j such that nums[j] > nums[i]
        if i >= 0 {
            var j = nums.count - 1
            while nums[j] <= nums[i] {
                j -= 1
            }
            // Step 3: Swap nums[i] and nums[j]
            nums.swapAt(i, j)
        }
        
        // Step 4: Reverse the subarray nums[i + 1...]
        nums[(i + 1)...].reverse()  // Corrected line
    }
}
