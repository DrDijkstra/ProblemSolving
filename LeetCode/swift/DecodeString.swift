class Solution {
    func decodeString(_ s: String) -> String {
    var stack: [(String, Int)] = [] // Stack to store (currentString, repeatCount)
    var currentString = ""
    var currentNum = 0

    for char in s {
        if char.isNumber {
            // Accumulate the number
            currentNum = currentNum * 10 + char.wholeNumberValue!
        } else if char == "[" {
            // Push the current string and number to the stack and reset them
            stack.append((currentString, currentNum))
            currentString = ""
            currentNum = 0
        } else if char == "]" {
            // Pop from the stack and decode the string
            let (previousString, repeatCount) = stack.removeLast()
            currentString = previousString + String(repeating: currentString, count: repeatCount)
        } else {
            // Append characters to the current string
            currentString.append(char)
        }
    }

    return currentString
    }
}
