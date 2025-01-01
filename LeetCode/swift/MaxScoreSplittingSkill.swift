class Solution {
    func maxScore(_ s: String) -> Int {
        let chars = Array(s)
        var leftZeros = 0
        var rightOnes = chars.reduce(0) { $0 + ($1 == "1" ? 1 : 0) }
        var maxScore = Int.min
        
        // Iterate through split points (except the last character)
        for i in 0..<chars.count - 1 {
            if chars[i] == "0" {
                leftZeros += 1
            } else {
                rightOnes -= 1
            }
            maxScore = max(maxScore, leftZeros + rightOnes)
        }
        
        return maxScore
    }
}
