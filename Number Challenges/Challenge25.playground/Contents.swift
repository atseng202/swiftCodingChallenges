//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 25: Calculate square root by hand
// Parameters: Accepts a positive Int
// Returns: The square root of the input, rounded down to the nearest Int without using sqrt()
// Difficulty: Taxing
// 7 min total

func challenge25(input: Int) -> Int {
    var halfOfInput = input / 2
    var potentialAnswer = 0
    for num in 0...halfOfInput {
        if (num * num) <= input {
            potentialAnswer = num
        } else {
            break
        }
    }
    return potentialAnswer
}

print(challenge25(input: 16777216))

assert(challenge25(input: 9) == 3, "Challenge 25 failed")
assert(challenge25(input: 16777216) == 4096, "Challenge 25 failed")
assert(challenge25(input: 16) == 4, "Challenge 25 failed")
assert(challenge25(input: 15) == 3, "Challenge 25 failed")


// Binary Search approach
func challenge25a(input: Int) -> Int {
    let halved = input / 2
    
    var midpoint = (halved) / 2
    while true {
        if (midpoint * midpoint) < input {
            midpoint = (halved - midpoint) / 2
        } else if (midpoint * midpoint) > input {
            midpoint = midpoint / 2
        } else {
            return midpoint
        }
        
    }
}

print(challenge25a(input: 16777216))
