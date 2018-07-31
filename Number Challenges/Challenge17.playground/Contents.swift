//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 17: Generating a random number in a range
// Parameters: Accepts a positive minimum and maximum Int
// Returns: a random Int between those two bounds inclusive

func challenge17(lowerBound: Int, upperBound: Int) -> Int {

    return Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1))) + lowerBound
  
}

print(challenge17(lowerBound: 12, upperBound: 13))

print("abc")
