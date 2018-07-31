//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 15: Reverse the words in a string
// Parameters: one input String of words
// Returns: A String with each of the words reversed but in the original order, without using a loop
// Estimated Time: 1.5 hrs
func challenge15(input: String, currentString: String = "") -> String {
    var array = input.components(separatedBy: " ")

    if input.count == 0 {
        return currentString
    } else {

        let wordToReverse = String(array.first!.reversed())
        
        let _ = array.removeFirst()

        let newInput = array.joined(separator: " ")

        var updatedString = array.count == 0 ? currentString  + wordToReverse  : currentString + wordToReverse + " "
        
        return challenge15(input: newInput, currentString: updatedString)
    }
    
}


//let a = challenge15(input: "Swift Coding Challenges")
//print(a)
assert(challenge15(input: "Swift Coding Challenges", currentString: "") == "tfiwS gnidoC segnellahC", "Challenge 15 failed")
assert(challenge15(input: "The quick brown fox") == "ehT kciuq nworb xof", "Challenge 15 failed")
//


// MARK: - Better and cleaner method
func challenge15a(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    let reversed = parts.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
    
}

print(challenge15a(input: "The quick brown fox"))
