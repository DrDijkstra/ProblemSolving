class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        
        var index = 2 // Start from the third element
       
        for i in 2..<nums.count {
            if nums[i] != nums[index - 2] {
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}
