class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let lastDay = days.last!
        var dp = Array(repeating: 0, count: lastDay + 1)
        var travelDays = Set(days)
        
        for day in 1...lastDay {
            if !travelDays.contains(day) {
                dp[day] = dp[day - 1]
            } else {
                dp[day] = min(
                    dp[max(0, day - 1)] + costs[0],
                    dp[max(0, day - 7)] + costs[1],
                    dp[max(0, day - 30)] + costs[2]
                )
            }
        }
        
        return dp[lastDay]
    }
}
