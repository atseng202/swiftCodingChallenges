//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 23: Integer disguised as string
// Parameters: Accepts a string
// Returns: True if it contains only numbers, i.e., the digits 0 through 9
// Time: 7 min

func challenge23(input:  String) -> Bool {
    if input.count == 0 { return false }
    
    for char in input {
        if Int(String(char)) == nil {
            return false
        }
    }
    return true
}

print(challenge23(input: ""))

assert(challenge23(input: "01010101") == true, "Challenge 23 failed")
assert(challenge23(input: "123456789") == true, "Challenge 23 failed")
assert(challenge23(input: "9223372036854775808") == true, "Challenge 23 failed")
assert(challenge23(input: "1.01") == false, ". is not a number")

// Interesting alternatives
func challenge32a(input: String) -> Bool {
    return UInt(input) != nil
}

func challenge32b(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}
