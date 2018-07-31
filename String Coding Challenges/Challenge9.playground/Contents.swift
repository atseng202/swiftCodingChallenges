//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 9: Find pangrams
// Parameters: Accepts a String
// Returns: A Boolean indicating true if the String is an English pangram, ignoring letter case
// **Note: A pangram is a string that contains every letter of the alphabet at least once
// Total time: 10 min (including Unit tests)
func challenge9(input: String) -> Bool {
    var letterDictionary = [Character: Int]()
    let lowercasedInput = input.lowercased()
    
    for character in lowercasedInput {
        if letterDictionary[character] == nil {
            letterDictionary[character] = 1
        } else {
            letterDictionary[character]! += 1
        }
    }
    letterDictionary[" "] = nil
    
    print(letterDictionary)
    if letterDictionary.keys.count < 26 {
        return false
    }
    return true
}

assert(challenge9(input: "The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed, String is a pangram")
assert(challenge9(input: "The quick brown box jumped over the lazy dog") == false, "Challenge 9 failed")


