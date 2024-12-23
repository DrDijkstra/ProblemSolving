class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        // 32-bit signed integer range
        let INT_MAX = 2147483647
        let INT_MIN = -2147483648
        
        // যদি divisor 0 হয়
        if divisor == 0 {
            fatalError("Division by zero is not allowed")
        }
        
        // যদি dividend INT_MIN এবং divisor -1 হয়, তাহলে overflow হবে
        if dividend == INT_MIN && divisor == -1 {
            return INT_MAX
        }
        
        // determine the sign of the result
        let negative = (dividend < 0) != (divisor < 0)
        
        // convert to positive to avoid overflow issues
        var dividend = abs(dividend)
        var divisor = abs(divisor)
        var result = 0
        
        // perform division using subtraction
        while dividend >= divisor {
            var tempDivisor = divisor
            var multiple = 1
            // Exponential subtraction for efficiency
            while dividend >= (tempDivisor << 1) {
                tempDivisor <<= 1
                multiple <<= 1
            }
            dividend -= tempDivisor
            result += multiple
        }
        
        // apply the sign to the result
        return negative ? -result : result
    }
}
