class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        
        for i in 0..<9 {
            for j in 0..<9 {
                let num = board[i][j]
                if num == "." {
                    continue
                }
                let boxIndex = (i / 3) * 3 + (j / 3)
                if rows[i].contains(num) || cols[j].contains(num) || boxes[boxIndex].contains(num) {
                    return false
                }
                rows[i].insert(num)
                cols[j].insert(num)
                boxes[boxIndex].insert(num)
            }
        }
        return true
    }
}
