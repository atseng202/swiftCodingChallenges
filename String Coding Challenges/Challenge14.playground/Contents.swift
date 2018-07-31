//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 14: String permutations
// Parameters: A given input String
// Returns: An array of all possible permutations of a given input String
// FAILED
func challenge14(input: String, currentString: String = "")  {
    var array = Array(input)
    var currentString = currentString
    
    if input.count == 0 {
        print(currentString)
        print("********")
    } else {
         print(currentString)
        
        for i in 0..<input.count {
            let left = String(array[0..<i])
            let right = String(array[i+1..<input.count])
            
            challenge14(input: left + right, currentString: currentString + String(array[i]))
        }
        
        
    }
    

}

let a = challenge14(input: "abc")

//assert(challenge14(input: "a") , "Challenge 14 failed")
//assert(challenge14(input: "ab") == "ab\nba", "Challenge 14 failed")
//assert(challenge14(input: "abc") == "abc\nacb\nbac\nbca\ncab\ncba", "Challenge 14 failed")

