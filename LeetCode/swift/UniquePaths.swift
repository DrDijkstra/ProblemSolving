class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result = 1
        let totalMoves = m + n - 2
        let movesDown = min(m - 1, n - 1)  // To minimize the calculations
        guard movesDown >= 1 else {
            return result
        }
        for i in 1...movesDown {
            result *= totalMoves - (movesDown - i)
            result /= i
        }

        return result
    }
}
