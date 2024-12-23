class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        
        func backtrack(_ current: String, _ open: Int, _ close: Int) {
            // যদি current string এর দৈর্ঘ্য 2 * n হয়, সেটি যোগ করি
            if current.count == n * 2 {
                result.append(current)
                return
            }
            
            // যদি আরো '(' যোগ করা সম্ভব হয়
            if open < n {
                backtrack(current + "(", open + 1, close)
            }
            
            // যদি আরো ')' যোগ করা সম্ভব হয়
            if close < open {
                backtrack(current + ")", open, close + 1)
            }
        }
        
        backtrack("", 0, 0)
        return result
    }
}
