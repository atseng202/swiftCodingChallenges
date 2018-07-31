//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 11: Three different letters
// Parameters: Accepts two Strings
// Returns: Boolean indicating True if they are identical in length but have no more than three different letters, taking case and string order into account.
// Total time: 15 min (+ set up of Tests)

func challenge11(input1: String, input2: String) -> Bool {
    
    if input1.count != input2.count { return false }
    
    var differenceCount = 0
    let array1 = input1.map { String($0) }
    let array2 = input2.map { String($0) }
    
    for index in 0..<array1.count {
        if array1[index] != array2[index] {
            differenceCount += 1
            if differenceCount > 3 {
                return false
            }
        }
    }
    
    return (differenceCount <= 3 ? true : false)
}

print(challenge11(input1: "Clamp", input2: "maple"))

assert(challenge11(input1: "Clamp", input2: "Cramp") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Crams") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Grams") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Grans") == false, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Clam") == false, "Challenge 11 failed")
assert(challenge11(input1: "clamp", input2: "maple") == false, "Challenge 11 failed")

