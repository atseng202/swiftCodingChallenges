//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// MARK: - Challenge 1
// Are the letters unique?

func challenge1(input: String) -> Bool {
    var dictionaryOfUniqueLetters = [Character: Int]()
    
    for character in input {
        if dictionaryOfUniqueLetters.keys.contains(character) {
            dictionaryOfUniqueLetters[character]! += 1
        } else {
            dictionaryOfUniqueLetters[character] = 1
        }
    }
    
    for value in dictionaryOfUniqueLetters.values {
        if value != 1 {
            return false
        }
    }
    return true
}

// MARK: - Challenge 1 Tests
assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")


print(challenge1(input: "No duplicates"))
print(challenge1(input: "abcdefghijklmnopqrstuvwxyz"))
print(challenge1(input: "AaBbCc"))
print(challenge1(input: "Hello, world"))

// MARK: - Challenge 1 Optimal solution
func challenge1b(input: String) -> Bool {
    return Set(input).count == input.count
}





