
class MyCalendar {
    private var events: [(start: Int, end: Int)] = []

    init() {
        
    }
    
    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        // Check if the new event overlaps with any existing events
        for event in events {
            if startTime < event.end && endTime > event.start {
                return false // There's an overlap
            }
        }
        
        // No overlap, so add the new event to the list
        events.append((startTime, endTime))
        return true
    }
}


/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(startTime, endTime)
 */