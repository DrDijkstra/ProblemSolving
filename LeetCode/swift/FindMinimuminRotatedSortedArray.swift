import Foundation

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var res:Int = 5001


        let _ = nums.count

        var left:Int = 0
        var right:Int =  nums.count - 1

       
      


            //inflection
        while(left <= right){
            let mid = (left + right)/2

             print("mid", mid, left, right)
            //res = nums[mid + 1]

            //count += 1



            if (nums[left] <= nums[right]){
                //print("afddasf")
                //if array is sorted
                res = nums[left];
                break
            }

           if (nums[mid] < nums[left] && nums[mid] < nums[right]){
                if(nums[mid] < nums[mid + 1] && nums[mid] < nums[mid - 1]){
                    // if  middle number is the minimum number
                    res = nums[mid];
                    break;
                }
           }


            if (nums[mid] < nums[left]){
                right = mid - 1
            }else{
                left = mid + 1;
            }


        }
        
        




        return res;
        

    }
}


var sol = Solution()
let arr:[Int] = [1, 2]
//               0   1   2   3  4  5
print(sol.findMin( arr))
