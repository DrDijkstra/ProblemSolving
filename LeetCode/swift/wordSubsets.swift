class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        // Function to compute character frequency
        func charFrequency(_ word: String) -> [Int] {
            var freq = [Int](repeating: 0, count: 26)
            for char in word {
                let index = Int(char.asciiValue! - Character("a").asciiValue!)
                freq[index] += 1
            }
            return freq
        }
        
        // Compute the "super frequency" for words2
        var maxFreq = [Int](repeating: 0, count: 26)
        for word in words2 {
            let freq = charFrequency(word)
            for i in 0..<26 {
                maxFreq[i] = max(maxFreq[i], freq[i])
            }
        }
        
        // Filter words1 based on the super frequency
        var result = [String]()
        for word in words1 {
            let freq = charFrequency(word)
            var isUniversal = true
            for i in 0..<26 {
                if freq[i] < maxFreq[i] {
                    isUniversal = false
                    break
                }
            }
            if isUniversal {
                result.append(word)
            }
        }
        
        return result
    }
}
