//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 32: Word Frequency
// Parameters: Accepts a filename on disk
// Returns: Load the filename into a string and returns the frequency of a word in the string taking letter case into account
// TRICKY (I technically passed except for checking for what defines a word)
func wordFrequencyChallenge32(filename: String, wordToCheck: String) -> Int {
    guard let contents = try? String(contentsOfFile: filename) else { return 0 }
    var count = 0
    
    var nonletters = CharacterSet.letters.inverted
    nonletters.remove("'")
    let array = contents.components(separatedBy: nonletters)
   
    // Less efficient method
//    for word in array {
//        if word == wordToCheck {
//            count += 1
//        }
//    }
//    return count
    
    let set = NSCountedSet(array: array)
    return set.count(for: wordToCheck)

}

print(wordFrequencyChallenge32(filename: "SampleWordFrequencyText", wordToCheck: "a"))



func challenge32a(pathName: String, wordToCheck: String) -> Int {
    guard let contents = (try? String(contentsOfFile: pathName)) else { return 0 }
    
    var nonLetters = CharacterSet.letters.inverted
    nonLetters.remove("'")
    let array = contents.components(separatedBy: nonLetters)
    let countedSet = NSCountedSet(array: array)
    return countedSet.count(for: wordToCheck)
}

// MARK: - Redoing Challenge 32

// Accept filename on disk. load it into string, return frequency of word in string with letter case into account

func wordFrequency(in filename: String, wordToCheck: String) -> Int {
    
    let directoryURL = URL(fileURLWithPath: filename)
    guard let contentsOfUrl = try? String(contentsOf: directoryURL) else { return 0 }
    
    var nonLetters = CharacterSet.letters.inverted
    // removing apostrophes bc they are part of words
    nonLetters.remove("'")
    
    var count = 0
    var wordsArray = contentsOfUrl.components(separatedBy: nonLetters)
    for word in wordsArray {
        if word == wordToCheck {
            count += 1
        }
    }
    
    return count
}










































