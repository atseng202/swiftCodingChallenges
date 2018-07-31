//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Swift Coding Challenge 2
// Is a string a palindrome?
// Input: String
// Returns: True if the string reads the same when reversed, false otherwise

func challenge2(input: String) -> Bool {
    var input = input.lowercased()
    
    let firstIndex = input.startIndex
    let lastIndex = input.index(before: input.endIndex)
    
    if firstIndex == lastIndex {
        return true
    } else if input[firstIndex] == input[lastIndex] {
        let substring = input.dropFirst()
        input = String(substring)
        let substring2 = input.dropLast()
        input = String(substring2)

        return challenge2(input: input)
    } else {
        return false
    }
    
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
assert(challenge2(input: "Hello world") == false, "Challenge 2 failed")


print(challenge2(input: "Rats live on no evil star"))
print(challenge2(input: "Never odd or even"))
print(challenge2(input: "Hello world"))

// MARK: - Optimal Challenge 2 Solution
func challenge2a(input: String) -> Bool {
    return input == String(input.reversed())
}

print(challenge2(input: "Never odd or even"))
