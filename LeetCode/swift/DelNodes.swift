class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        // Result to store the forest
        var forest = [TreeNode?]()
        // Convert the to_delete array to a set for faster lookups
        let toDeleteSet = Set(to_delete)

        // Helper function to process the tree
        func dfs(_ node: TreeNode?, _ isRoot: Bool) -> TreeNode? {
            guard let node = node else { return nil }

            // Check if the current node should be deleted
            let isDeleted = toDeleteSet.contains(node.val)

            // If the node is a root and not deleted, add it to the forest
            if isRoot && !isDeleted {
                forest.append(node)
            }

            // Recursively process left and right children
            node.left = dfs(node.left, isDeleted)
            node.right = dfs(node.right, isDeleted)

            // Return nil if the node is deleted, otherwise return the node
            return isDeleted ? nil : node
        }

        // Start DFS with the root node
        dfs(root, true)

        return forest
    }
}
