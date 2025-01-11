class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        // Sort the people's weights in ascending order
        let sortedPeople = people.sorted()
        
        var left = 0
        var right = sortedPeople.count - 1
        var boats = 0
        
        // Use two pointers to find pairs of people that can share a boat
        while left <= right {
            // If the lightest and heaviest person can share a boat
            if sortedPeople[left] + sortedPeople[right] <= limit {
                left += 1
            }
            // Whether or not they can share a boat, the heaviest person needs a boat
            right -= 1
            boats += 1
        }
        
        return boats
    }
}
