//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 48 - Implement a deque DS
// Create a data type that models a double-ended queue using generics
// You should be able to push items to the front or back, pop from the front or back, and get the number of items
// Total time: about 10-15 min (did extra work that was unnecessary)
struct deque<T> {
    var queue: [T]
    var first: T?
    var last: T?
    
    init() {
        self.queue = [T]()
    }
    
    var count: Int {
        return queue.count
    }
    
    mutating func pushBack(value: T) {
        if queue.count == 0 {
            queue.append(value)
            first = value
            last = first
        } else {
            queue.append(value)
            last = value
        }
    }
    
    mutating func pushFront(value: T) {
        queue.insert(value, at: 0)
    }
    
    mutating func popBack() -> T? {
        guard queue.count > 0 else { return nil }
        
        return queue.popLast()
    }
    
    mutating func popFront() -> T? {
        guard queue.count > 0 else { return nil }
        return queue.removeFirst()
    }
}
