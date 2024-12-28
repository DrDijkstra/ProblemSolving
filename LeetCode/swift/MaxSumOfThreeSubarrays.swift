class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var sum = [Int](repeating: 0, count: n + 1)
        
        // Step 1: Calculate prefix sums
        for i in 0..<n {
            sum[i + 1] = sum[i] + nums[i]
        }
        
        // Step 2: Store the best indices for one subarray and two subarrays
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: n - k, count: n)
        
        // Calculate left array (best subarray index on the left side)
        var best = 0
        for i in k - 1..<n {
            if sum[i + 1] - sum[i + 1 - k] > sum[best + k] - sum[best] {
                best = i + 1 - k
            }
            left[i] = best
        }
        
        // Calculate right array (best subarray index on the right side)
        best = n - k
        for i in stride(from: n - k - 1, through: 0, by: -1) {
            if sum[i + k] - sum[i] >= sum[best + k] - sum[best] {
                best = i
            }
            right[i] = best
        }
        
        // Step 3: Find the best three subarrays
        var result = [-1, -1, -1]
        var maxSum = 0
        
        for i in k..<n - 2 * k + 1 {
            let l = left[i - 1]
            let r = right[i + k]
            let total = (sum[l + k] - sum[l]) + (sum[i + k] - sum[i]) + (sum[r + k] - sum[r])
            
            if total > maxSum {
                maxSum = total
                result = [l, i, r]
            }
        }
        
        return result
    }
}
