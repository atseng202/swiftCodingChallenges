//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 49: Sum the even repeats
// Write a function that accepts a variadic array of integers
// Returns the sum of all numbers that appear an even number of times
// Time: 15 min Estimated (my solution was not efficient because of the dictionary creation)

func challenge49(_ integers: Int...) -> Int {
    var freqDictionary = [Int: Bool]()
    var sum = 0
    
    for num in integers {
        if freqDictionary[num] == nil {
            freqDictionary[num] = false
        } else {
            freqDictionary[num]! = !freqDictionary[num]!
        }
    }
    for (key, value) in freqDictionary {
        if value == true {
            sum += key
        }
    }
    
    
    return sum 
}


//assert(challenge49(1,2,2,3,3,4) == 5, "Challenge 49 failed")
assert(challenge49(5,5,5,12,12) == 12, "Challenge 49 failed")
//assert(challenge49(1,1,2,2,3,3,4,4) == 10, "Challenge 49 failed")

// MARK: - Alternative Solution: NSCountedSet
func challenge49a(numbers: Int...) -> Int {
    let counted = NSCountedSet(array: numbers)
    var sum = 0
    
    for case let item as Int in counted {
        if counted.count(for: item) % 2 == 0 {
            sum += item
        }
    }
    return sum
}

// MARK: - Slower solution converting countedSet into an array
func challenge49b(numbers: Int...) -> Int {
    let counted = NSCountedSet(array: numbers)
    let array = counted.allObjects as! [Int]
    var sum = 0
    
    for item in array {
        if counted.count(for: item) % 2 == 0 {
            sum += item
        }
    }
    return sum
}
