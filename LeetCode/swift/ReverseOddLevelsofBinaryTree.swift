class Solution {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        var queue: [TreeNode] = [root]
        var level = 0
        
        while !queue.isEmpty {
            let count = queue.count
            var currentLevelNodes: [TreeNode] = []
            
            // Traverse the current level and collect nodes
            for _ in 0..<count {
                let node = queue.removeFirst()
                currentLevelNodes.append(node)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            // Reverse values of nodes at odd levels
            if level % 2 == 1 {
                let reversedValues = Array(currentLevelNodes.map { $0.val }.reversed())
                for (index, node) in currentLevelNodes.enumerated() {
                    node.val = reversedValues[index]
                }
            }
            
            level += 1
        }
        
        return root
    }
}
