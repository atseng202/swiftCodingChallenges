//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 6: Removing duplicate letters from a string
// Parameters: Accepts one input string
// Returns: A String with the duplicate letters removed from the input String

// Easy method, took 7 min
func challenge6(inputString: String) -> String {
    var word = ""
    
    for character in inputString {
        if !word.contains(String(character)) {
            word += String(character)
        }
    }
    
    return word
}
print(challenge6(inputString: "Mississippi"))

assert(challenge6(inputString: "wombat") == "wombat", "Challenge 6 failed")
assert(challenge6(inputString: "hello") == "helo", "Challenge 6 failed")
assert(challenge6(inputString: "Mississippi") == "Misp", "Challenge 6 failed")

// Another method using NSOrderedSet

func challenge6a(inputString: String) -> String {
    let array = inputString.map { String($0) }
    let set = NSOrderedSet(array: array)
    let orderedArray = Array(set) as! Array<String>
    return orderedArray.joined()
    
}

print(challenge6a(inputString: "Mississippi"))
