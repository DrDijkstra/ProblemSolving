
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        // Base case: If the list is empty or has only one node, return the head as is.
        if head == nil || head?.next == nil {
            return head
        }
        
        // Create a dummy node to help with edge cases, especially when swapping the head node
        let dummy = ListNode()
        dummy.next = head
        var current = dummy
        
        while current.next != nil && current.next?.next != nil {
            let first = current.next
            let second = current.next?.next
            
            // Swapping the nodes
            first?.next = second?.next
            second?.next = first
            current.next = second
            
            // Move to the next pair
            current = first!
        }
        
        return dummy.next
    }
}
