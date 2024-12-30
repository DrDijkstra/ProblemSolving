class Solution {
    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        let mod = 1_000_000_007
        var dp = [Int](repeating: 0, count: high + 1)
        dp[0] = 1  // Base case: 1 way to form an empty string
        
        for length in 1...high {
            if length >= zero {
                dp[length] = (dp[length] + dp[length - zero]) % mod
            }
            if length >= one {
                dp[length] = (dp[length] + dp[length - one]) % mod
            }
        }
        
        var result = 0
        for length in low...high {
            result = (result + dp[length]) % mod
        }
        
        return result
    }
}
