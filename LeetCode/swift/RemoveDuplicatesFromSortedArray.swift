class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // যদি অ্যারের দৈর্ঘ্য ১ বা কম হয়, সরাসরি return করি
        if nums.count <= 1 {
            return nums.count
        }
        
        // Slow pointer (unique element track করার জন্য)
        var uniqueIndex = 0
        
        // Fast pointer (array traverse করার জন্য)
        for currentIndex in 1..<nums.count {
            if nums[currentIndex] != nums[uniqueIndex] {
                uniqueIndex += 1
                nums[uniqueIndex] = nums[currentIndex]
            }
        }
        
        // uniqueIndex + 1 হল ইউনিক এলিমেন্টের সংখ্যা
        return uniqueIndex + 1
    }
}
