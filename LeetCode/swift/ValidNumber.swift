class Solution {
    func isNumber(_ s: String) -> Bool {
        var index = 0
        let n = s.count
        let chars = Array(s)
        
        // Step 1: Skip leading whitespaces
        while index < n && chars[index] == " " {
            index += 1
        }
        
        // Step 2: Handle optional sign (+ or -)
        var isNegative = false
        if index < n && (chars[index] == "+" || chars[index] == "-") {
            isNegative = (chars[index] == "-")
            index += 1
        }
        
        // Step 3: Parse the digits before the decimal point
        var hasDigitBeforeDot = false
        while index < n && chars[index].isNumber {
            hasDigitBeforeDot = true
            index += 1
        }
        
        // Step 4: Handle the decimal point if present
        var hasDot = false
        if index < n && chars[index] == "." {
            hasDot = true
            index += 1
        }
        
        // Step 5: Parse the digits after the decimal point (if any)
        var hasDigitAfterDot = false
        while index < n && chars[index].isNumber {
            hasDigitAfterDot = true
            index += 1
        }
        
        // Step 6: Handle the exponent part (e or E), if present
        var hasExponent = false
        if index < n && (chars[index] == "e" || chars[index] == "E") {
            hasExponent = true
            index += 1
            
            // Step 7: Exponent must be followed by optional sign and at least one digit
            if index < n && (chars[index] == "+" || chars[index] == "-") {
                index += 1
            }
            
            // Exponent must have at least one digit
            var hasDigitInExponent = false
            while index < n && chars[index].isNumber {
                hasDigitInExponent = true
                index += 1
            }
            
            // If no digits are found in the exponent, it's invalid
            if !hasDigitInExponent {
                return false
            }
        }
        
        // Step 8: Check if we've processed all characters
        // If index reaches the end and we have valid digits or an exponent, it's valid
        return (hasDigitBeforeDot || hasDigitAfterDot) && (index == n)
    }
}

// Test case outside the Solution class
let sol = Solution()
let testResult1 = sol.isNumber("0") // Expected output: true
print(testResult1)

let testResult2 = sol.isNumber("e") // Expected output: false
print(testResult2)

let testResult3 = sol.isNumber(".") // Expected output: false
print(testResult3)

let testResult4 = sol.isNumber("3e+7") // Expected output: true
print(testResult4)

let testResult5 = sol.isNumber("-123.456e789") // Expected output: true
print(testResult5)

let testResult6 = sol.isNumber("95a54e53") // Expected output: false
print(testResult6)
