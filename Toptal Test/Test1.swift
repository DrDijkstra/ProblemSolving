import Foundation
// import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

func binarySearch<T:Comparable>(_ inputArr:Array<T>, _ searchItem: T) -> Int? {
    var lowerIndex = 0
    var upperIndex = inputArr.count - 1

    while (true) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(inputArr[currentIndex] == searchItem) {
            return currentIndex
        } else if (lowerIndex > upperIndex) {
            return nil
        } else {
            if (inputArr[currentIndex] > searchItem) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
}

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    A.sort()
    var number = 1
    let count = A.count
    for i in 0 ..< count {
        if A[i] <= 0{
            continue;
        } 
        else{
            if  number < A[i]{
                break
            }
            else{
                if i + 1 < count{
                    if A[i] != A[i + 1]{
                        number += 1
                    }
                    
                }else if (i == count - 1){
                    number += 1;
                }
                
            }

        }
    }
    //print(A)
    
    


    return number;
}


var arr:[Int]  = [-1,-2,1,1,2,3,4]
print(solution(&arr))
