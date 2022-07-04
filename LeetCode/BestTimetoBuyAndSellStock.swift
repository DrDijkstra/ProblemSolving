class Solution {

    func maxProfit(_ prices: [Int]) -> Int {
    
    var profit:Int = 0

    var minPrice:Int = prices[0]

    for price in prices{
        minPrice = min(minPrice, price)
        profit = max(profit, price - minPrice)
    }

    return profit;
        
    }
}


var arr = [7,1,5,3,6,4]
var sol = Solution()
print(sol.maxProfit(arr))