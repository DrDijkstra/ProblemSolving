class Solution {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        // Build adjacency list for the tree
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        
        // Visited set to avoid revisiting nodes
        var visited = Set<Int>()
        
        // Result to store the count of divisible components
        var result = 0
        
        // DFS function
        func dfs(_ node: Int) -> Int {
            visited.insert(node)
            var total = values[node]
            
            for neighbor in graph[node] ?? [] {
                if !visited.contains(neighbor) {
                    total += dfs(neighbor)
                }
            }
            
            // If the sum is divisible by k, increment result and return 0
            if total % k == 0 {
                result += 1
                return 0
            }
            
            // Otherwise, return the sum to propagate up
            return total
        }
        
        // Start DFS from node 0 (assuming it's the root)
        dfs(0)
        
        return result
    }
}
