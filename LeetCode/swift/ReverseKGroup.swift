class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // Base case: If there are fewer than k nodes, return the head as is.
        var current = head
        var count = 0
        while current != nil {
            count += 1
            current = current?.next
        }
        
        // If there are fewer than k nodes, no reversal is needed.
        if count < k {
            return head
        }
        
        // Reverse the first k nodes
        var prev: ListNode? = nil
        var curr = head
        var next: ListNode?
        var i = 0
        
        // Reverse k nodes
        while i < k {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
            i += 1
        }
        
        // Now curr is the (k+1)th node, recursively reverse the remaining list
        if next != nil {
            head?.next = reverseKGroup(next, k)
        }
        
        // prev is the new head of the reversed sublist
        return prev
    }
}
