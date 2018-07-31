//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 18: Recreate the pow() function (Easy)
// Parameters: Accepts two positives Ints
// Returns: An Int that raises the first Int to the power of the second Int
// 10 min with setup

func myPowChallenge18(base: Int, power: Int) -> Int {
    var power = power
    var answer = 1
    
    while power > 0 {
        answer *= base
        power -= 1
    }
    return answer
}

print(myPowChallenge18(base: 2, power: 8))
assert(Double(myPowChallenge18(base: 4, power: 3)) == pow(4, 3), "Challenge 18 failed")
assert(Double(myPowChallenge18(base: 2, power: 8)) == pow(2, 8), "Challenge 18 failed")

