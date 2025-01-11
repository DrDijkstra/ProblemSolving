class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        
        var grid = grid
        var islandCount = 0
        
        // Define directions for DFS: right, left, down, up
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        // Helper function to perform DFS
        func dfs(_ row: Int, _ col: Int) {
            // If out of bounds or cell is water, return
            if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count || grid[row][col] == "0" {
                return
            }
            
            // Mark the current cell as visited
            grid[row][col] = "0"
            
            // Explore the four directions
            for direction in directions {
                let newRow = row + direction.0
                let newCol = col + direction.1
                dfs(newRow, newCol)
            }
        }
        
        // Iterate over all cells in the grid
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" { // Found an island
                    islandCount += 1
                    dfs(row, col) // Mark all connected land as visited
                }
            }
        }
        
        return islandCount
    }
}
