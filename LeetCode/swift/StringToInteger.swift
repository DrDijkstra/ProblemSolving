class Solution {
    func myAtoi(_ s: String) -> Int {
        var index = 0
        let n = s.count
        var result = 0
        var sign = 1

        // Skip leading whitespaces
        while index < n && s[s.index(s.startIndex, offsetBy: index)] == " " {
            index += 1
        }

        // Check if there's a sign
        if index < n {
            let char = s[s.index(s.startIndex, offsetBy: index)]
            if char == "-" {
                sign = -1
                index += 1
            } else if char == "+" {
                index += 1
            }
        }

        // Convert digits
        while index < n {
            let char = s[s.index(s.startIndex, offsetBy: index)]
            guard let digit = char.wholeNumberValue else {
                break // Stop if a non-digit character is found
            }

            // Check for overflow
            if result > Int32.max / 10 || (result == Int32.max / 10 && digit > Int32.max % 10) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }

            result = result * 10 + digit
            index += 1
        }

        return result * sign
    }

    // Test function to run test cases
    func testMyAtoi() {
        // Test case 1: Normal positive number
        print(myAtoi("42")) // Expected output: 42

        // Test case 2: Negative number with leading spaces
        print(myAtoi(" -042")) // Expected output: -42

        // Test case 3: Number with invalid characters after digits
        print(myAtoi("1337c0d3")) // Expected output: 1337

        // Test case 4: Single digit
        print(myAtoi("0-1")) // Expected output: 0

        // Test case 5: Invalid input with letters at the start
        print(myAtoi("words and 987")) // Expected output: 0

        // Test case 6: Leading spaces and valid number
        print(myAtoi("   -42")) // Expected output: -42

        // Test case 7: Overflow positive case
        print(myAtoi("2147483648")) // Expected output: 2147483647 (overflow)

        // Test case 8: Underflow negative case
        print(myAtoi("-2147483649")) // Expected output: -2147483648 (underflow)
    }
}

// Instantiate the solution object and run the test function
let sol = Solution()
sol.testMyAtoi()
