class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var results = [[Int]]()
        
        func backtrack(_ combination: inout [Int], _ start: Int, _ remaining: Int) {
            // Base case: if the combination has k numbers and remaining sum is 0
            if combination.count == k && remaining == 0 {
                results.append(combination)
                return
            }
            
            // Base case: if the combination exceeds k numbers, the remaining sum is negative,
            // or if start exceeds 9
            if combination.count > k || remaining < 0 || start > 9 {
                return
            }
            
            // Try numbers from start to 9
            for i in start...9 {
                combination.append(i)
                backtrack(&combination, i + 1, remaining - i)
                combination.removeLast()
            }
        }
        
        var currentCombination = [Int]()
        backtrack(&currentCombination, 1, n)
        
        return results
    }
}
