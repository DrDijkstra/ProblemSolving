class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        // Edge case: If the list is empty or has only one node, return nil.
        if head == nil || head?.next == nil {
            return nil
        }
        
        var slow = head
        var fast = head
        var prev: ListNode? = nil
        
        // Move fast two steps and slow one step until fast reaches the end
        while fast != nil && fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // Remove the middle node
        prev?.next = slow?.next
        
        return head
    }
}
