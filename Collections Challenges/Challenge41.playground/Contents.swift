//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 41: Find the median
// Write an extension to collections that accepts an array of Int and returns the median average, or nil if there are no values
// Easy

// Tip: The mean avg is the sum of some numbers divided by how many items available. The median is the middle of the sorted list, or the mean of the two middle values if the list is even.

extension Collection where Iterator.Element == Int {
    
    func challenge41() -> Double? {
        guard self.count > 0 else { return nil }
        
        let sortedCollection = self.sorted()
        let count = sortedCollection.count
        
        if count % 2 != 0 {
            // odd number, has 1 median
            let medianIndex = count / 2
            return Double(sortedCollection[medianIndex])
            
        } else {
            // even number, get mean of middle two digits
            let upperIndex = sortedCollection.count / 2
            let lowerIndex = upperIndex - 1
            let mean = Double((sortedCollection[upperIndex] + sortedCollection[lowerIndex])) / Double(2)
            return mean
        }
    }
}


assert([1,2,3].challenge41() == 2, "Challenge 41 failed")
assert([1,2,9].challenge41() == 2, "Challenge 41 failed")
assert([1,3,5,7,9].challenge41() == 5, "Challenge 41 failed")
assert([1,2,3,4].challenge41() == 2.5, "Challenge 41 failed")
assert([Int]().challenge41() == nil, "Challenge 41 failed")

