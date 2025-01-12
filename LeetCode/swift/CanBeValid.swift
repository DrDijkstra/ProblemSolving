class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        // If the string length is odd, it's impossible to balance
        if s.count % 2 != 0 {
            return false
        }
        
        var minOpen = 0 // Minimum open count
        var maxOpen = 0 // Maximum open count
        let n = s.count
        let sArray = Array(s)
        let lockedArray = Array(locked)
        
        for i in 0..<n {
            if lockedArray[i] == "1" {
                // Fixed character
                if sArray[i] == "(" {
                    minOpen += 1
                    maxOpen += 1
                } else {
                    minOpen -= 1
                    maxOpen -= 1
                }
            } else {
                // Unlocked character, can act as '(' or ')'
                minOpen -= 1 // Treat it as ')'
                maxOpen += 1 // Treat it as '('
            }
            
            // minOpen cannot be negative
            minOpen = max(minOpen, 0)
            
            // If maxOpen < 0, we have more ')' than '('
            if maxOpen < 0 {
                return false
            }
        }
        
        // By the end, minOpen must be 0
        return minOpen == 0
    }
}
