class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count {
            return s
        }

        // Create an array to store the rows as strings
        var rows = [String](repeating: "", count: numRows)
        var currentRow = 0
        var goingDown = false

        // Traverse the string and fill the rows in a zigzag manner
        for char in s {
            rows[currentRow] += String(char)
            
            // If we're at the top or bottom row, change the direction
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown = !goingDown
            }
            
            // Move the currentRow up or down depending on the direction
            currentRow += goingDown ? 1 : -1
        }

        // Concatenate all the rows to get the result
        return rows.joined()
    }
}

// Test case outside the Solution class
let sol = Solution()
let testResult = sol.convert("PAYPALISHIRING", 3) // Expected output: "PAHNAPLSIIGYIR"
print(testResult)
