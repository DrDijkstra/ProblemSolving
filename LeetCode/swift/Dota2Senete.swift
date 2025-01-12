class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        var radiantQueue = [Int]()
        var direQueue = [Int]()
        let n = senate.count
        
        // Populate the queues with indices of 'R' and 'D'
        for (i, char) in senate.enumerated() {
            if char == "R" {
                radiantQueue.append(i)
            } else {
                direQueue.append(i)
            }
        }
        
        // Simulate the banning process
        while !radiantQueue.isEmpty && !direQueue.isEmpty {
            let radiantIndex = radiantQueue.removeFirst()
            let direIndex = direQueue.removeFirst()
            
            // The one with the smaller index bans the other and returns to the queue
            if radiantIndex < direIndex {
                radiantQueue.append(radiantIndex + n)
            } else {
                direQueue.append(direIndex + n)
            }
        }
        
        // Determine the winner
        return radiantQueue.isEmpty ? "Dire" : "Radiant"
    }
}
