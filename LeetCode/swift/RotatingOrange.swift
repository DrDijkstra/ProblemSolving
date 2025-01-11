class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var queue = [(Int, Int)]()
        var freshOranges = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    freshOranges += 1
                } else if grid[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        
        if freshOranges == 0 { return 0 }
        
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var minutes = 0
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (i, j) = queue.removeFirst()
                for (dx, dy) in directions {
                    let (ni, nj) = (i + dx, j + dy)
                    if ni >= 0, ni < grid.count, nj >= 0, nj < grid[0].count, grid[ni][nj] == 1 {
                        grid[ni][nj] = 2
                        freshOranges -= 1
                        queue.append((ni, nj))
                    }
                }
            }
            minutes += 1
        }
        
        return freshOranges == 0 ? minutes - 1 : -1
    }
}
