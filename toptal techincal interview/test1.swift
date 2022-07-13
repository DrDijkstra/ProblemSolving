import Foundation

func getChange(M: Double, P:Double) -> [Int]{
    var resArr:[Double] = [0,0,0,0,0,0]

    var remainingBal = M - P

    var coins:[Double] = [1, 5, 10, 25, 50, 100]
    var coinCount = coins.count - 1

    var remainingBalInPenny = remainingBal * 100

    print(remainingBalInPenny)

    for _ in  0 ..< coins.count{
        //print("hello",remainingBalInPenny, coins[coinCount])
        if (remainingBalInPenny / coins[coinCount]) > 0{
            var usedCoin = Int(remainingBalInPenny / coins[coinCount])
            resArr[coinCount] = Double(Int(remainingBalInPenny / coins[coinCount]))

            //print(resArr[coinCount] * Double(usedCoin))
            //print("usedCoins",usedCoin, resArr)
            remainingBalInPenny -= coins[coinCount] * Double(usedCoin)
            //print(remainingBalInPenny)
        }
        coinCount -= 1
    }

    var outPut:[Int] = []

    for value  in resArr{
        outPut.append(Int(value))
    }

   // outPut.reverse()



    return outPut
}


var M:Double = 3.14
var p:Double = 0.99

print(getChange(M:M,P:p))



