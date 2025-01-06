class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        
        for asteroid in asteroids {
            var destroyed = false
            
            while let top = stack.last, top > 0, asteroid < 0 {
                if abs(top) == abs(asteroid) {
                    // Both asteroids are destroyed
                    stack.removeLast()
                    destroyed = true
                    break
                } else if abs(top) > abs(asteroid) {
                    // The incoming asteroid is destroyed
                    destroyed = true
                    break
                } else {
                    // The top of the stack is destroyed
                    stack.removeLast()
                }
            }
            
            if !destroyed {
                stack.append(asteroid)
            }
        }
        
        return stack
    }
}
