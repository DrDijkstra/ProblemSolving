class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        // Helper function to collect leaf nodes
        func getLeafNodes(_ root: TreeNode?) -> [Int] {
            var leaves = [Int]()
            func dfs(_ node: TreeNode?) {
                guard let node = node else { return }
                if node.left == nil && node.right == nil {
                    // If it's a leaf node, add its value
                    leaves.append(node.val)
                } else {
                    // Recursively visit left and right children
                    dfs(node.left)
                    dfs(node.right)
                }
            }
            dfs(root)
            return leaves
        }
        
        // Get leaf sequences for both trees
        let leaves1 = getLeafNodes(root1)
        let leaves2 = getLeafNodes(root2)
        
        // Compare the two leaf sequences
        return leaves1 == leaves2
    }
}
