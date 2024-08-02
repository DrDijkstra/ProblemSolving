class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var carry = 0
        var number = digits[digits.count - 1] + 1
        var digitNum: [Int] = digits
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            number += carry
            carry = 0
            if number >= 10 {
                carry = 1
            }
            digitNum[i] = number % 10
            if i != 0 {
                number = 0
                number += digitNum[i - 1]
            }
            
        }
        if carry == 1 {
            digitNum.insert(1, at: 0)
        }
        
        return digitNum   
    }
}

let sol = Solution()
let digits: [Int] = [9,9,9]
print(sol.plusOne(digits))