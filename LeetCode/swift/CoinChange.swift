class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        
        var dp = [Int](repeating: Int.max, count: amount + 1)
        dp[0] = 0
        
        for coin in coins {
            if amount >= coin{
                for i in coin...amount {
                    if dp[i - coin] != Int.max {
                        dp[i] = min(dp[i], dp[i - coin] + 1)
                    }
                }
            }
        }
        
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
