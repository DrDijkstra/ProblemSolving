class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // Create a memoization table
        var memo = [String: Bool]()
        
        // Helper function for recursive matching with memoization
        func dp(_ i: Int, _ j: Int) -> Bool {
            // If we've already solved this subproblem, return the result
            let key = "\(i)-\(j)"
            if let result = memo[key] {
                return result
            }
            
            // If we have reached the end of the pattern
            if j == p.count {
                return i == s.count
            }
            
            // If the next character in the pattern is not '*', check character match
            let firstMatch = i < s.count && (s[s.index(s.startIndex, offsetBy: i)] == p[p.index(p.startIndex, offsetBy: j)] || p[p.index(p.startIndex, offsetBy: j)] == ".")
            
            var result = false
            
            if j + 1 < p.count && p[p.index(p.startIndex, offsetBy: j + 1)] == "*" {
                // Case 1: Zero occurrence of the preceding character
                result = dp(i, j + 2) || (firstMatch && dp(i + 1, j))
            } else if firstMatch {
                // Case 2: Regular match
                result = dp(i + 1, j + 1)
            }
            
            // Store the result in the memoization table
            memo[key] = result
            return result
        }
        
        return dp(0, 0)
    }
}


let sol = Solution()
let s = "aa"
let p = "a*"

print(sol.isMatch(s,p))