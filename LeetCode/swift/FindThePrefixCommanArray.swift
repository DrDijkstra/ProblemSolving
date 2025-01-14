class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var seenA = Set<Int>()
        var seenB = Set<Int>()
        var commonCount = 0
        var result = [Int]()
        
        for i in 0..<A.count {
            if seenB.contains(A[i]) {
                commonCount += 1
            }
            seenA.insert(A[i])
            
            if seenA.contains(B[i]) {
                commonCount += 1
            }
            seenB.insert(B[i])
            
            result.append(commonCount)
        }
        
        return result
    }
}
