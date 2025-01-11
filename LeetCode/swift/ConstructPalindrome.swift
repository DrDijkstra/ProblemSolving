class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        // Edge case: if k is greater than the string length, it's impossible
        if k > s.count { 
            return false
        }

        // Count the frequency of each character
        var charCount = [Int](repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            charCount[index] += 1
        }

        // Count the number of characters with odd frequencies
        var oddCount = 0
        for count in charCount {
            if count % 2 != 0 {
                oddCount += 1
            }
        }

        // Check if we can form k palindromes
        return oddCount <= k
    }
}
