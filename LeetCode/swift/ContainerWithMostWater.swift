import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left < right {
            // Calculate the area
            let width = right - left
            let minHeight = min(height[left], height[right])
            let area = width * minHeight
            
            // Update maxArea if current area is larger
            maxArea = max(maxArea, area)
            
            // Move the pointer pointing to the shorter line inward
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}

// Example usage:
let solution = Solution()

let height1 = [1,8,6,2,5,4,8,3,7]
let result1 = solution.maxArea(height1)
print(result1)  // Output: 49

let height2 = [1,1]
let result2 = solution.maxArea(height2)
print(result2)  // Output: 1
