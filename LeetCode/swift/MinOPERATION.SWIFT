class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let n = boxes.count
        let boxesArray = Array(boxes) // Convert the string to an array for easier indexing
        var result = Array(repeating: 0, count: n)
        
        var ballsToLeft = 0
        var operationsFromLeft = 0
        
        // Left-to-right pass
        for i in 0..<n {
            result[i] += operationsFromLeft
            if boxesArray[i] == "1" {
                ballsToLeft += 1
            }
            operationsFromLeft += ballsToLeft
        }
        
        var ballsToRight = 0
        var operationsFromRight = 0
        
        // Right-to-left pass
        for i in stride(from: n - 1, through: 0, by: -1) {
            result[i] += operationsFromRight
            if boxesArray[i] == "1" {
                ballsToRight += 1
            }
            operationsFromRight += ballsToRight
        }
        
        return result
    }
}
