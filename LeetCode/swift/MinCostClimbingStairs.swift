class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = cost
        let n = cost.count
        
        for i in 2..<n {
            dp[i] += min(dp[i - 1], dp[i - 2])
        }
        
        return min(dp[n - 1], dp[n - 2])
    }
}
