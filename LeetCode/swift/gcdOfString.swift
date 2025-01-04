class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        // Helper function to calculate the GCD of two numbers
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        
        // Check if str1 + str2 is equal to str2 + str1
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        // Find the GCD of the lengths of str1 and str2
        let gcdLength = gcd(str1.count, str2.count)
        
        // Return the substring from 0 to gcdLength
        return String(str1.prefix(gcdLength))
    }
}
