class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        // Check if the sum of derived is even
        let sum = derived.reduce(0, +)
        return sum % 2 == 0
    }
}
