class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // Helper function to find the first occurrence of the target
        func findFirst() -> Int {
            var left = 0, right = nums.count - 1
            var result = -1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    result = mid
                    right = mid - 1 // Continue searching on the left side
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return result
        }
        
        // Helper function to find the last occurrence of the target
        func findLast() -> Int {
            var left = 0, right = nums.count - 1
            var result = -1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    result = mid
                    left = mid + 1 // Continue searching on the right side
                } else if nums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            return result
        }
        
        // Find the first and last positions
        let first = findFirst()
        let last = findLast()
        return [first, last]
    }
}
