//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

// MARK: - Challenge 38: Find N smallest
// Write an extension for all collections that returns the N smallest-elements as an array,sorted smallest first, where N is an integer parameter.
// Easy: 9 min

extension Collection where Iterator.Element: Comparable {
    func challenge38(count: Int) -> [Iterator.Element] {
        
        var array = self
        var sorted = array.sorted { (item1, item2) -> Bool in
            return item1 < item2
        }
        var countdown = Swift.min(count, sorted.count)
        
        var final: [Iterator.Element] = []
        
        while countdown > 0 {
            final.append(sorted.removeFirst())
            countdown -= 1
        }
        
        return final
    }
    
    func cleanChallenge38(count: Int) -> [Iterator.Element] {
        var sorted = self.sorted()
        return Array(sorted.prefix(count))
    }
}


print([1,2,3,4].challenge38(count: 3))
print(["q", "f", "k"].challenge38(count: 10))
print([256, 16].challenge38(count: 3))
print([String]().challenge38(count: 3))

print([256, 16].cleanChallenge38(count: 3))


