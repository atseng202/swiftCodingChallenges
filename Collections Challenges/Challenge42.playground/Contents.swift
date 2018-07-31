//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 42: Recreate index(of:)
// Easy

// Write an extension for all collections that reimplements the index(of:) method
// Tip: Very easy standard library method to reimplement, so give i ta good try without hints!

extension Collection where Iterator.Element: Equatable {
    func challenge42(indexOf element: Iterator.Element) -> Self.Index? {
        
        let count = self.count
        for index in self.indices {
            if self[index] == element {
                return index
            }
        }
        
        return nil
    }
    
    // Method the book uses
    func bookChallenge42(indexOf element: Iterator.Element) -> Int? {
        
        for item in self.enumerated() {
            if element == item.element {
                return item.offset
            }
        }
        return nil
    }
}

let a = ["a", "b", "C"]
print(a.index(of: "a"))


print([1, 2, 3].challenge42(indexOf: 3))
print([1, 2, 3].challenge42(indexOf: 5))

print([1, 2, 3].bookChallenge42(indexOf: 5))


