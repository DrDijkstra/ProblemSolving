class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
    var maxChunks = 0
    var runningMax = 0

    for index in 0..<arr.count {
        runningMax = max(runningMax, arr[index])
        if runningMax == index {
            maxChunks += 1
        }
    }

    return maxChunks
}

}