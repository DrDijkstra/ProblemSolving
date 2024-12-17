class Solution {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        // Create an array to store the frequency of each character
        var freq = Array(repeating: 0, count: 26)
        
        // Count the frequency of each character in the string
        for ch in s {
            freq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        var result = ""
        var currentCharIndex = 25  // Start from the largest character
        
        while currentCharIndex >= 0 {
            // Skip if the current character is not available
            if freq[currentCharIndex] == 0 {
                currentCharIndex -= 1
                continue
            }
            
            // Determine how many characters to add
            let use = min(freq[currentCharIndex], repeatLimit)
            result.append(String(repeating: Character(UnicodeScalar(currentCharIndex + 97)!), count: use))
            freq[currentCharIndex] -= use
            
            // If there are still remaining characters, add a smaller character
            if freq[currentCharIndex] > 0 {
                var smallerCharIndex = currentCharIndex - 1
                while smallerCharIndex >= 0 && freq[smallerCharIndex] == 0 {
                    smallerCharIndex -= 1
                }
                
                // If a smaller character is found, add it
                if smallerCharIndex >= 0 {
                    result.append(Character(UnicodeScalar(smallerCharIndex + 97)!))
                    freq[smallerCharIndex] -= 1
                } else {
                    break
                }
            }
        }
        
        return result
    }
}

let sol = Solution()
let inputString = "cczazcc"
let repeatLimit = 3
let ans = sol.repeatLimitedString(inputString, repeatLimit)
print(ans)