class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var maxGain = 0
        var peek = 0
        for i in 0..<gain.count {
            peek = peek + gain[i]
            maxGain = max (peek,maxGain)
        }
        return maxGain
    }
}