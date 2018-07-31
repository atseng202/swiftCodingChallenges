//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 4: Does one string contain another?
// Parameters: an input String
// Returns: A boolean indicating if the input String is found in the String class

extension String {
    
    func fuzzyContains(_ input: String) -> Bool {
        let lowercaseSelf = self.lowercased()
        print(lowercaseSelf)
        let lowercaseInput = input.lowercased()
        print(lowercaseInput)
        
        if lowercaseSelf.count > lowercaseInput.count {
            return lowercaseSelf.range(of: lowercaseInput) != nil
        } else {
            return lowercaseInput.range(of: lowercaseSelf) != nil
        }
    }
    
}

//assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
//assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
//assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")

let answer = "Hi".fuzzyContains("HI  ")

