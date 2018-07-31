//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Challenge 12: Find longest prefix
// Parameters: Accepts a String of words with a similar prefix, separated by spaces.
// Returns: The longest substring that prefixes all words.
// Total time: 30 min + 5 min set up

func challenge12(input: String) -> String {
    let array = Array(input)
    var dictionaryOfCounts = [Character: Int]()

    let arrayOfSeparatedWords = input.components(separatedBy: " ")
    var finalString = ""
    
//    if arrayOfSeparatedWords.count == 1 { return arrayOfSeparatedWords[0] }
    
    for letter in array {
        if dictionaryOfCounts[letter] == nil {
            dictionaryOfCounts[letter] = 1
        } else {
            dictionaryOfCounts[letter]! += 1
        }
    }
    
    // ASSUMING there is at least 1 word in this array based on the question rules
    for letter in arrayOfSeparatedWords[0] {
        if dictionaryOfCounts[letter]! == arrayOfSeparatedWords.count {
            finalString += String(letter)
        } else {
            break
        }
    }
    
    
    return finalString
}

print(challenge12(input: "swift switch swill swim"))

assert(challenge12(input: "swift switch swill swim") == "swi", "Challenge 12 failed")
assert(challenge12(input: "flip flap flop") == "fl", "Challenge 12 failed")

// MARK: - Better and simpler solution: Using hasPrefix (although this is O(n^2))
func challenge12a(input: String) -> String {
    
    let array = input.components(separatedBy: " ")
    
    guard let first = array.first else { return "" }
    
    var currentPrefix = ""
    var bestPrefix = ""

    for letter in first {
        currentPrefix.append(letter)
        
        for word in array {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }
    return bestPrefix
    
}

print(challenge12a(input: "swift switch swill swim"))










