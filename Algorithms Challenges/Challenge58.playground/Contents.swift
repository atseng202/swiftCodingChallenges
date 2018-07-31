//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 58: Balanced brackets
// Write a function that accepts a string containing the characters (, [. {. < and their pairs.
// Returns true if the brackets are opened and closed in the correct order, and if all the brackets are closed
// any other input is false

func challenge58(input: String) -> Bool {
    var allowedSet = "([{<>}])"
    var leftSideSet = "([{<"
    var rightSideSet = ">}])"
    
    var leftSideStack = [Character]()

    for letter in input {
        if !allowedSet.contains(letter) { return false }
        if leftSideSet.contains(letter) {
            leftSideStack.append(letter)
        } else {
            let poppedLeftItem = leftSideStack.popLast()
            if let poppedLeftItem = poppedLeftItem {
                if poppedLeftItem == "(" && letter != ")" {
                    return false
                } else if poppedLeftItem == "[" && letter != "]" {
                    return false
                } else if poppedLeftItem == "{" && letter != "}" {
                    return false
                } else if poppedLeftItem == "<" && letter != ">" {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    if leftSideStack.count > 0 { return false }
    return true
}


//print(challenge58(input: "()"))
//print(challenge58(input: "[<<<{}>>]"))
//print(challenge58(input: "hello"))
//print(challenge58(input: "([]{}<[{}]>)"))
print(challenge58(input: "(["))
print(challenge58(input: "([])"))


// Slightly Prettier Solution
func challenge58a(input: String) -> Bool {
    let validBrackets = "([{<>}])"
    let validCharacterSet = CharacterSet(charactersIn: validBrackets).inverted
    guard input.rangeOfCharacter(from: validCharacterSet) == nil else { return false }
    
    let matchingBrackets: [Character: Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
    var leftSideStack = [Character]()
    
    for bracket in input {
        if matchingBrackets.keys.contains(bracket) {
            leftSideStack.append(bracket)
        } else {
            // closing bracket
            if let previousLeftBracket = leftSideStack.popLast() {
                if matchingBrackets[previousLeftBracket] != bracket {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return leftSideStack.count == 0
}

