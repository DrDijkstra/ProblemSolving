import Foundation

public func solution(_ X : Int) -> String {
    // write your code in Swift 4.2.1 (Linux)

    let oneWeek = 7 * 24 * 60 * 60;
    let oneDay = 24 * 3600;
    let oneHour = 3600;
    let oneMin = 60
    let oneSec = 1



    let dict = [ "1w": oneWeek,
                 "2d": oneDay,
                "3h": oneHour,
                 "4m": oneMin,
                "5s": oneSec]

    var min = X
    //print(dict)


    let sortedKey = dict.keys.sorted()

    //print(sortedKey)

    var resultStr = ""

    var flagCount = 0
    while(min != 0){
        //print("miniute", min)
        
        var res:Double = 0.0
        for key in sortedKey{

            //print("key", key)
            res = Double(min) / Double(dict[key]!)

           // print("res", res, key)

            if res < 1{
                continue
            }
            else{
                flagCount += 1
                min = min % dict[key]!

                if flagCount == 2 && min != 0{
                    res += 1
                }

                var unit:String = ""
                 if key == "1w"{
                    unit = "w"
                }
                if key == "2d"{
                    unit = "d"
                }
                if key == "3h"{
                    unit = "h"
                }
                if key == "4m"{
                    unit = "m"
                }
                if key == "5s"{
                    unit = "s"
                }

                resultStr += String(Int(res)) + unit
                break
            }
        }

        if flagCount == 2{
            break;
        }
    }

    return resultStr
}

var min = 7263

print(solution(min))



