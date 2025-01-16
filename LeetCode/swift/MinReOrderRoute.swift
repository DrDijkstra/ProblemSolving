class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        // Build an adjacency list that includes directions of the roads
        var adjacencyList = [Int: [(Int, Bool)]]() // Bool indicates road direction: true = original
        
        for connection in connections {
            let from = connection[0], to = connection[1]
            adjacencyList[from, default: []].append((to, true))  // Original direction
            adjacencyList[to, default: []].append((from, false)) // Reverse direction
        }
        
        var visited = Set<Int>()
        var reorderCount = 0
        
        func dfs(_ city: Int) {
            visited.insert(city)
            for (neighbor, isOriginal) in adjacencyList[city] ?? [] {
                if !visited.contains(neighbor) {
                    if isOriginal {
                        reorderCount += 1 // Count road reorientation
                    }
                    dfs(neighbor)
                }
            }
        }
        
        dfs(0) // Start traversal from city 0
        return reorderCount
    }
}
