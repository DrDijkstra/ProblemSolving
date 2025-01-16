class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let xor1 = nums1.reduce(0, ^) // XOR of all elements in nums1
        let xor2 = nums2.reduce(0, ^) // XOR of all elements in nums2
        
        // Result depends on the lengths of nums1 and nums2
        let result = (nums2.count % 2 == 0 ? 0 : xor1) ^ (nums1.count % 2 == 0 ? 0 : xor2)
        
        return result
    }
}
