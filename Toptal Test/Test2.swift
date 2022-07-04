import Foundation

public func solution(_ X : Int, _ B : inout [Int], _ Z : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)

    let totalObserabableCount = B.count

    if Z > B.count{
        return -1
    }

    var totalDownloaded :Int = 0
    var obserbableDownloaded:Double = 0
    for (i,b) in B.enumerated(){
        totalDownloaded += b
        if i > totalObserabableCount - 1 - Z{
            //print("i ", i, b)
            obserbableDownloaded += Double(b)
        }
    }

    if totalDownloaded >= X{
        return 0
    }

    let remainingDownloaded:Double = Double (X - totalDownloaded)
    //print(obserbableDownloaded)
    let averageLastMonitoredSpeed:Double = obserbableDownloaded / Double(Z);
    let timeNeededForRemainingDownlaoded = remainingDownloaded/averageLastMonitoredSpeed; 
    //var roundedTime = round(timeNeededForRemainingDownlaoded)
    let roundedTime = Int(ceil(timeNeededForRemainingDownlaoded))

    return roundedTime
}

var X = 100
var B:[Int] = [10,6,6,8]
var Z:Int = 2

print(solution(X, &B, Z))

