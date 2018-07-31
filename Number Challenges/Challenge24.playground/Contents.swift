//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 24: Add numbers inside a String
// Parameters: Accepts a string containing both letters and numbers
// Returns: an Int of all the numbers in the input, returning their sum
// Tricky

func challenge24(input: String) -> Int {
    var sum = 0
    var tempInt = ""
    for char in input {
        if Int(String(char)) != nil {
            tempInt += String(char)
        } else {
//            print(tempInt)
            sum += (Int(tempInt) ?? 0)
            tempInt = ""
        }
    }
    
    if tempInt.count > 0 {
        sum += Int(tempInt) ?? 0
    }
    
    return sum
}

print(challenge24(input: "a1b2c3"))
print(challenge24(input: "a10b20c30"))
print(challenge24(input: "h8ers"))

//assert(challenge24(input: "a10b20c30") == 60, "Challenge 24 failed")

