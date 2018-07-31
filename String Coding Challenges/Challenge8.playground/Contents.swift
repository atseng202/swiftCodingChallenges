//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 8: String is rotated
// Parameters: Accepts two strings
// Returns: Boolean indicating true if one string is a rotation of the other, taking letter case into account

// Examples: "swift" is rotated by two characters to become "ftswi"

func challenge8(input1: String, input2: String) -> Bool {
    if input1.count != input2.count { return false }
    
    let combined = input1 + input1
    print(combined)
    return combined.contains(input2)
}


assert(challenge8(input1: "abcde", input2: "eabcd") == true, "Challenge 8 failed")
assert(challenge8(input1: "abcde", input2: "cdeab") == true, "Challenge 8 failed")
assert(challenge8(input1: "abcde", input2: "abced") == false, "Challenge 8 failed")
assert(challenge8(input1: "abc", input2: "a") == false, "Challenge 8 failed, not a String rotation")
