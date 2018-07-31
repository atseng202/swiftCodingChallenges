//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 13: Run-length encoding (Difficulty: Taxing)
// Parameters: Accepts a String as input
// Returns: String indicating how often each letter is repeated in a single run, taking case into account
// Total Time: 50 min

func challenge13(input: String) -> String {
    if input.count == 0 { return "" }
    
    let array = Array(input)
    
    var finalString = ""
    var individualLetterCount = 1
    var index = 0

    for nextIndex in (index + 1)..<array.count {
        print(nextIndex)
        
        if array[index] == array[nextIndex] {
            individualLetterCount += 1
            
        } else if array[index] != array[nextIndex] {
            finalString += "\(array[index])\(individualLetterCount)"
            index += individualLetterCount
            individualLetterCount = 1
        }
        
        if nextIndex == array.count - 1 {
            finalString += "\(array[index])\(individualLetterCount)"
            return finalString
        }
    }
    

    return finalString
}

print(challenge13(input: "aabbcc"))
//print(challenge13(input: "aaAAaa"))
//print(challenge13(input: "aaabaaabaaa"))

//assert(challenge13(input: "aabbcc") == "a2b2c2", "Challenge 13 failed")
//assert(challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed")
//assert(challenge13(input: "aaAAaa") == "a2A2a2", "Challenge 13 failed")

