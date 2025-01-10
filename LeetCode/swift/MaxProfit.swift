class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 } // No profit if less than 2 prices
        
        var minPrice = Int.max
        var maxProfit = 0
        
        for price in prices {
            // Update the minimum price
            if price < minPrice {
                minPrice = price
            }
            
            // Calculate the potential profit and update the max profit
            let profit = price - minPrice
            if profit > maxProfit {
                maxProfit = profit
            }
        }
        
        return maxProfit
    }
}
