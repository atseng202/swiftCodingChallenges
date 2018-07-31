//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 3: Do two strings contain the same characters?
// Parameters: 2 Strings
// Returns: True if they contain the same characters in any order

func challenge3(input1: String, input2: String) -> Bool {
    var input1Dict = [Character:Int]()
    var input2Dict = [Character:Int]()
    
    for character in input1 {
        if character != " ",input1Dict[character] != nil {
            input1Dict[character]! += 1
        } else if character != " ", input1Dict[character] == nil {
            input1Dict[character] = 1
        }
    }
    
    for character in input2 {
        if character != " ", input2Dict[character] != nil {
            input2Dict[character]! += 1
        } else if character != " ", input2Dict[character] == nil {
            input2Dict[character] = 1
        }
    }
    
    for key in (input1Dict.count > input2Dict.count ? input1Dict.keys : input2Dict.keys) {
        if input2Dict[key] == nil {
            return false
        } else if input2Dict[key] != nil, input1Dict[key] != input2Dict[key] {
            return false
        }
    }

    return true
}



assert(challenge3(input1: "abca", input2: "abca") == true, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "cba") == true, "Challenge 3 failed")
assert(challenge3(input1: " a1 b2", input2: "b1 a2") == true, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "abca") == false, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "Abc") == false, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "cbAa") == false, "Challenge 3 failed")

