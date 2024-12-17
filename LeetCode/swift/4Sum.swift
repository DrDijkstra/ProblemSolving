class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        // If there are fewer than 4 elements, return an empty array
        if nums.count < 4 {
            return []
        }
        
        var nums = nums
        nums.sort()  // Sort the array to make the two-pointer approach work
        var result = [[Int]]()
        
        for i in 0..<nums.count - 3 {
            // Skip duplicates for the first element
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            for j in i + 1..<nums.count - 2 {
                // Skip duplicates for the second element
                if j > i + 1 && nums[j] == nums[j - 1] {
                    continue
                }
                
                var left = j + 1
                var right = nums.count - 1
                
                while left < right {
                    let total = nums[i] + nums[j] + nums[left] + nums[right]
                    
                    if total == target {
                        result.append([nums[i], nums[j], nums[left], nums[right]])
                        
                        // Skip duplicates for the third element
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        
                        // Skip duplicates for the fourth element
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        
                        left += 1
                        right -= 1
                    } else if total < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        
        return result
    }
}

// Test cases

let solution = Solution()

// Test case 1 (Single element array)
let nums1 = [0]
let target1 = 0
let result1 = solution.fourSum(nums1, target1)
print("Test case 1 result: \(result1)")  
// Expected Output: []

// Test case 2 (Two element array)
let nums2 = [0, 0]
let target2 = 0
let result2 = solution.fourSum(nums2, target2)
print("Test case 2 result: \(result2)")  
// Expected Output: []

// Test case 3 (Three element array)
let nums3 = [0, 0, 0]
let target3 = 0
let result3 = solution.fourSum(nums3, target3)
print("Test case 3 result: \(result3)")  
// Expected Output: []

// Test case 4 (Valid case)
let nums4 = [1, 0, -1, 0, -2, 2]
let target4 = 0
let result4 = solution.fourSum(nums4, target4)
print("Test case 4 result: \(result4)")  
// Expected Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
