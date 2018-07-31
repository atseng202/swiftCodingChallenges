//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 7: Condense whitespace
// Parameters: one input String
// Returns: a String with any consecutive spaces replaced by one single space
// Time spent: 12 min
func challenge7(inputString: String) -> String {
    var lettersArray = [String]()
    var lastCharacterIsNotSpace = true
    
    for character in inputString {
        if String(character) == " " {
            if lastCharacterIsNotSpace {
                lettersArray.append(String(character))
                lastCharacterIsNotSpace = false
            }
        } else {
            lettersArray.append(String(character))
            lastCharacterIsNotSpace = true
        }
    }
    
    return lettersArray.joined()
}

assert(challenge7(inputString: "a   b   c") == "a b c", "Challenge 7 failed")
assert(challenge7(inputString: "    a") == " a", "Challenge 7 failed")
assert(challenge7(inputString: "abc") == "abc", "Challenge 7 failed")


// Clever but failed way to remove duplicate white space and leading and trailing spaces
func failedChallengeUsingComponents(input: String) -> String {
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    
    print(components)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}
print(failedChallengeUsingComponents(input: "a  b  c"))

// Using Regular Expressions
func challenge7b(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

print(challenge7b(input: "a   b   c"))

