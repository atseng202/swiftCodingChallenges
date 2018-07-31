//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 10: Vowels and consonants
// Parameters: Accepts a String (English)
// Returns: A tuple containing the number of vowels and consonants
// Total time: 7 min

func challenge10(input: String) -> (vowelCount: Int, consonantsCount: Int) {
    var vowelCount = 0
    var consonantsCount = 0
    let lowercasedInput = input.lowercased()
    let consonants = "bcdfghjklmnpqrstvwxyz"
    
    for character in lowercasedInput {
        if "aeiou".contains(character) {
            vowelCount += 1
        } else if consonants.contains(character) {
            consonantsCount += 1
        }
    }
    return (vowelCount: vowelCount, consonantsCount: consonantsCount)
}

print(challenge10(input: "Swift Coding Challenges"))

assert(challenge10(input: "Swift Coding Challenges") == (vowelCount: 6, consonantsCount: 15), "Challenge 10 failed")
assert(challenge10(input: "Mississippi") == (vowelCount: 4, consonantsCount: 7), "Challenge 10 failed")


//extension String {
//    func isTrue() -> Bool {
//        return true
//    }
//}
//
//print(!"Hi".isTrue())

