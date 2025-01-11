class Solution {
    var res = [Int]()

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: numCourses)
        var visited = Array(repeating: 0, count: numCourses)

        for course in prerequisites {
            graph[course[0]].append(course[1])
        }

        for i in 0..<numCourses {
            if dfs(graph, &visited, i) {
                return [Int]()
            }
        }

        return res
    }

    func dfs(_ graph: [[Int]], _ visited: inout [Int], _ cur: Int) -> Bool {
        if visited[cur] == 2 {
            return false
        }

        if visited[cur] == 1 {
            return true
        }

        visited[cur] = 1

        for course in graph[cur] {
            if dfs(graph, &visited, course) {
                return true
            }
        }

        res.append(cur)
        visited[cur] = 2

        return false
    }
}