class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph = [String: [String: Double]]()
        
        // Build the graph
        for i in 0..<equations.count {
            let a = equations[i][0]
            let b = equations[i][1]
            let value = values[i]
            
            graph[a, default: [:]][b] = value
            graph[b, default: [:]][a] = 1.0 / value
        }
        
        // DFS function to find the result of a query
        func dfs(_ start: String, _ end: String, _ visited: inout Set<String>) -> Double? {
            if let directValue = graph[start]?[end] {
                return directValue
            }
            
            visited.insert(start)
            
            guard let neighbors = graph[start] else { return nil }
            
            for (neighbor, weight) in neighbors {
                if visited.contains(neighbor) { continue }
                
                if let result = dfs(neighbor, end, &visited) {
                    return weight * result
                }
            }
            
            return nil
        }
        
        // Process each query
        var results = [Double]()
        for query in queries {
            let a = query[0]
            let b = query[1]
            
            if !graph.keys.contains(a) || !graph.keys.contains(b) {
                results.append(-1.0)
            } else {
                var visited = Set<String>()
                if let result = dfs(a, b, &visited) {
                    results.append(result)
                } else {
                    results.append(-1.0)
                }
            }
        }
        
        return results
    }
}


