class MyCircularQueue {

    private var queue: [Int]
    private var head: Int
    private var tail: Int
    private var size: Int
    private var capacity: Int

    init(_ k: Int) {
        self.capacity = k
        self.queue = Array(repeating: 0, count: k)
        self.head = 0
        self.tail = 0
        self.size = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        queue[tail] = value
        tail = (tail + 1) % capacity
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        head = (head + 1) % capacity
        size -= 1
        return true
    }
    
    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        return queue[head]
    }
    
    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        let rearIndex = (tail - 1 + capacity) % capacity
        return queue[rearIndex]
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
