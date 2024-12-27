class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var maxScore = 0
        var maxIPlusI = values[0] // Initial value for values[i] + i
    
        for j in 1..<values.count {
            // Calculate the score for the current pair
            maxScore = max(maxScore, maxIPlusI + values[j] - j)
            // Update maxIPlusI for the next iteration
            maxIPlusI = max(maxIPlusI, values[j] + j)
        }
    
        return maxScore
    }
}