//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 39: Sort a string array by length
// Extend collections with a function that returns an array of strings sorted by their lengths, longest first (descending)
// Easy: 12 min 

extension Collection where Iterator.Element == String {
    
    func challenge39() -> [String] {
        let array =  self.sorted { (s1, s2) -> Bool in
            return s1.count > s2.count
        }
        return array
    }
}

//assert(["a", "ab", "abc"].challenge39() == ["abc", "ab", "a"], "Challenge 39 Failed")
assert(["paul", "taylor", "adele"].challenge39() == ["taylor", "adele", "paul"], "Challenge 39 failed")
//assert([String]().challenge39() == [], "Challenge 39 failed")

