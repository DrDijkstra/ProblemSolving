class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var indexDict: [Int : Int] = [:]

        for (index,number) in numbers.enumerated() {
            let complement = target - number
            //print(complement, indexDict[complement])
            if let complementIndex = indexDict[complement] {
                return [complementIndex + 1, index + 1]
            }
            indexDict[number] = index
            //print(indexDict)
        }
        return []
    }
}