import Foundation


class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var numbers = nums
        numbers.sort()  // Sort the array
        
        var closestSum = Int.max / 2 // Initial value to track the closest sum
        
        for i in 0..<numbers.count - 2 {
            // Skip duplicates for the outer loop
            if i > 0 && numbers[i] == numbers[i - 1] {
                continue
            }
            
            var left = i + 1
            var right = numbers.count - 1
            
            while left < right {
                let currentSum = numbers[i] + numbers[left] + numbers[right]
                
                if abs(currentSum - target) < abs(closestSum - target) {
                    closestSum = currentSum  // Update the closest sum
                }
                
                if currentSum < target {
                    left += 1  // Move the left pointer to the right
                } else if currentSum > target {
                    right -= 1  // Move the right pointer to the left
                } else {
                    return currentSum  // Exact match found
                }
            }
        }
        
        return closestSum  // Return the closest sum
    }
}


var sol = Solution()

var numbers = [1,1,1,1]
var target = -100
print(sol.threeSumClosest(numbers, target))