
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummyHead = ListNode(0)
        var current = dummyHead
        var carry = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10 // Update carry for next iteration
            current.next = ListNode(sum % 10) // Store the current digit
            current = current.next!
            
            // Move to the next node in the list if available
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return dummyHead.next
    }
}