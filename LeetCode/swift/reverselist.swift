class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head

        while curr != nil {
            let next = curr?.next // Save the next node
            curr?.next = prev     // Reverse the current node's pointer
            prev = curr           // Move prev one step forward
            curr = next           // Move curr one step forward
        }

        return prev
    }
}