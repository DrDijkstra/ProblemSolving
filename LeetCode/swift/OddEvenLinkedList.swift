/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        // Edge case: If the list is empty or has only one node, return it as is.
        guard let head = head, let next = head.next else {
            return head
        }

        var odd:ListNode? = head          // Pointer for the odd-indexed nodes
        var even:ListNode? = next         // Pointer for the even-indexed nodes
        let evenHead = even     // To reconnect even nodes at the end of the odd nodes

        while even != nil && even?.next != nil {
            odd?.next = even?.next    // Link current odd node to the next odd node
            odd = odd?.next         // Move odd pointer to the next odd node

            even?.next = odd?.next    // Link current even node to the next even node
            even = even?.next        // Move even pointer to the next even node
        }

        odd?.next = evenHead         // Connect the end of odd nodes to the start of even nodes
        return head                 // Return the rearranged list
    }
}
