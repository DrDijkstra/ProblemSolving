class Solution {
    func minimumDiameterAfterMerge(_ edges1: [[Int]], _ edges2: [[Int]]) -> Int {      
        // Helper to build adjacency list from edges
        func buildGraph(_ edges: [[Int]]) -> [Int: [Int]] {
            var graph = [Int: [Int]]()
            for edge in edges {
                graph[edge[0], default: []].append(edge[1])
                graph[edge[1], default: []].append(edge[0])
            }
            return graph
        }
        
        // Helper to compute the diameter of a graph using BFS
        func calculateDiameter(_ graph: [Int: [Int]]) -> Int {
            func bfs(_ start: Int) -> (Int, Int) {
                var queue: [(Int, Int)] = [(start, 0)]
                var visited = Set<Int>()
                visited.insert(start)
                var farthestNode = (start, 0)
                
                while !queue.isEmpty {
                    let (node, dist) = queue.removeFirst()
                    farthestNode = (node, dist)
                    for neighbor in graph[node, default: []] {
                        if !visited.contains(neighbor) {
                            visited.insert(neighbor)
                            queue.append((neighbor, dist + 1))
                        }
                    }
                }
                return farthestNode
            }
            
            if let arbitraryNode = graph.keys.first {
                let farthestFromStart = bfs(arbitraryNode).0
                let diameter = bfs(farthestFromStart).1
                return diameter
            }
            return 0
            
        }
        
        // Build adjacency lists for the two graphs
        let graph1 = buildGraph(edges1)
        let graph2 = buildGraph(edges2)
        
        // Compute initial diameters
        let diameter1 = calculateDiameter(graph1)
        let diameter2 = calculateDiameter(graph2)
        
        // Simulate all possible merges
        var minDiameter = Int.max
        let newDiameter = max(diameter1, diameter2) + 1
        minDiameter = min(minDiameter, newDiameter)
        // for node1 in graph1.keys {
        //     for node2 in graph2.keys {
        //         let newDiameter = max(diameter1, diameter2) + 1
        //         minDiameter = min(minDiameter, newDiameter)
        //     }
        // }
        
        return minDiameter
    }
}


let sol = Solution()
print(sol.minimumDiameterAfterMerge([[0,1]],[[0,1]]))