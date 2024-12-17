class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()  // Sort the array

        for i in 0..<nums.count {
            // Skip duplicate elements for the first number of the triplet
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }

            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    
                    // Skip duplicate elements for the second number of the triplet
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    
                    // Skip duplicate elements for the third number of the triplet
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }
}

// Test case outside the Solution class
let sol = Solution()
let testResult = sol.threeSum([-1, 0, 1, 2, -1, -4]) 
print(testResult)  // Expected output: [[-1, -1, 2], [-1, 0, 1]]
