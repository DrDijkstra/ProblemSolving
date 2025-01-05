class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count {
            return false
        }
        var frequency1 = [Character: Int]()
        for char in word1 {
            frequency1[char, default: 0] += 1
        }
        let f1Map = frequency1.map{$0.value}


        // Count character frequencies for word2
        var frequency2 = [Character: Int]()
        for char in word2 {
            frequency2[char, default: 0] += 1
        }
        let f2Map = frequency2.map{$0.value}

        return Set(word1.sorted()) == Set(word2.sorted()) 
        ? (f1Map.sorted() == f2Map.sorted() ? true : false) 
        : false
    }
}