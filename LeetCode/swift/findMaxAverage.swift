class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // Calculate the sum of the first k elements
        var windowSum = nums[0..<k].reduce(0, +)
        var maxSum = windowSum
        
        // Slide the window across the array
        for i in k..<nums.count {
            windowSum += nums[i] - nums[i - k]
            maxSum = max(maxSum, windowSum)
        }
        
        // Return the maximum average
        return Double(maxSum) / Double(k)
    }
}
