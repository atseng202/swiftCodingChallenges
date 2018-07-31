//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 5: Count the Characters
// Parameters: one input String
// Returns: An Int indicating how many times a specific character appears, taking case into account

extension String {
    
    func challenge5AppearsIn(inputString: String) -> Int {
        var lowercasedInputString = inputString.lowercased()
        let lowercasedSelf = self.lowercased()
        
        var numberOfTimes = 0
        while lowercasedInputString.range(of: lowercasedSelf) != nil {
            if let index = lowercasedInputString.index(of: Character(lowercasedSelf)) {
                lowercasedInputString.remove(at: index)
                numberOfTimes += 1
            } else { break }
        }
        return numberOfTimes
    }
}


assert("a".challenge5AppearsIn(inputString: "The rain in Spain") == 2, "Challenge 5 failed")
assert("i".challenge5AppearsIn(inputString: "Mississippi") == 4, "Challenge 5 failed")
assert("i".challenge5AppearsIn(inputString: "Hacking with Swift") == 3, "Challenge 5 failed")

print("a".challenge5AppearsIn(inputString: "The rain in Spain"))
print("i".challenge5AppearsIn(inputString: "Mississippi"))

// MARK: - Performant but easy for-loop solution

func challenge5a(inputString: String, count: Character) -> Int {
    var letterCount = 0
    
    for character in inputString {
        if character == count {
            letterCount += 1
        }
    }
    
    return letterCount
}

