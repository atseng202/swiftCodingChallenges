//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 52: Sum an array of numbers
// Tricky
// Accepts: an array of numbers (which can contain all Ints, all Doubles, or all Floats)

func challenge52<T: Numeric>(numbers: [T]) -> T {
    var sum: T = 0
 
    for num in numbers{
        sum += num
    }
    return sum
}

print(challenge52(numbers: Array<Float>([1.0, 2.0, 3.0])))

