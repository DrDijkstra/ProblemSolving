/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftHeight = dfs(node.left)
            let rightHeight = dfs(node.right)
            
            // Update the diameter if the path through the current node is larger
            diameter = max(diameter, leftHeight + rightHeight)
            
            // Return the height of the tree rooted at this node
            return max(leftHeight, rightHeight) + 1
        }
        
        _ = dfs(root)
        return diameter
    }
}
