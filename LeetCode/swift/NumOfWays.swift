class Solution {
    func numWays(_ words: [String], _ target: String) -> Int {
        let MOD = 1_000_000_007
        let m = target.count
        let n = words[0].count

        // Precompute character frequencies for each column
        var charCount = Array(repeating: [Character: Int](), count: n)
        for word in words {
            for (index, char) in word.enumerated() {
                charCount[index][char, default: 0] += 1
            }
        }
        
        // Convert target to Array for easier indexing
        let targetArray = Array(target)
        
        // DP array to store ways to form target[0...j]
        var dp = Array(repeating: 0, count: m + 1)
        dp[0] = 1 // Base case: 1 way to form empty target
        
        // Update dp using character frequencies
        for i in 0..<n { // For each column
            for j in stride(from: m - 1, through: 0, by: -1) {
                let targetChar = targetArray[j]
                if let freq = charCount[i][targetChar] {
                    dp[j + 1] = (dp[j + 1] + dp[j] * freq) % MOD
                }
            }
        }
        
        return dp[m]
    }
}
