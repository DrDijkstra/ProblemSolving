import Foundation


// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ S : inout String, _ B : inout [String]) -> [String] {
    // write your code in Swift 4.2.1 (Linux)
    let totalAmount = Double(S)!
     var ratio:[Double] = []


     var totalRatio:Double = 0

     for ind in B{
        var value:Double = 0
        value = Double(ind)!
        totalRatio += value

        ratio.append(value)
     } 

     var resStr: [String] = []

     var disTotalElement:Double = 0.0 

     for val in ratio{
        //print("hello")
        let element = val * totalAmount / totalRatio
        disTotalElement += element
        let elementStr = String(format: "%.2f", ceil(element*100)/100)
        resStr.append(elementStr)

     }





     //print(disTotalElement, totalAmount)



     return resStr


}


var s = "300.03"
var b = ["100", "200", "300"]

print(solution(&s, &b))