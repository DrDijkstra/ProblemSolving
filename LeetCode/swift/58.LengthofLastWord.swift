class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var currentWord = ""
        let totalLength = s.count
        var isLastCharacterSpace = false
        let lastIndex = s.index(s.startIndex, offsetBy: totalLength - 1)
        
        if String(s[lastIndex]) == " " {
            isLastCharacterSpace = true
        }
        
        for i in stride(from: totalLength - 1, through: 0, by: -1) {
            let currentIndex = s.index(s.startIndex, offsetBy: i)
            let currentCharacter = String(s[currentIndex])
            
            if currentCharacter != " " {
                currentWord += currentCharacter
                isLastCharacterSpace = false
            } else {
                if !isLastCharacterSpace {
                    break
                }
            }
        }
        return currentWord.count
    }
}


var sol = Solution()
var s = "Hello World  "
print(sol.lengthOfLastWord(s))