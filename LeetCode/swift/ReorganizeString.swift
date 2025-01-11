class Solution {
    func reorganizeString(_ s: String) -> String {
        var frequencyMap = [Character: Int]()
        
        // Step 1: Count the frequency of each character
        for char in s {
            frequencyMap[char, default: 0] += 1
        }
        
        // Step 2: Sort characters by their frequencies in descending order
        let sortedChars = frequencyMap.sorted { $0.value > $1.value }
        
        // Step 3: Check if rearrangement is possible
        if sortedChars.first!.value > (s.count + 1) / 2 {
            return "" // Impossible to rearrange
        }
        
        var result = Array(repeating: Character(" "), count: s.count)
        var index = 0
        
        // Step 4: Place characters alternately in the result array
        for (char, freq) in sortedChars {
            for _ in 0..<freq {
                result[index] = char
                index += 2
                if index >= s.count {
                    index = 1 // Start placing at odd positions after reaching the end
                }
            }
        }
        
        return String(result)
    }
}