//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 47: Recreate min()
// Tricky
// Reimplement the min() method in collections

extension Collection where Iterator.Element: Comparable {
    func challenge47() -> Self.Element? {
        if self.isEmpty { return nil }
        
        let sorted = self.sorted { (s1, s2) -> Bool in
            return s1 < s2
        }
        return sorted.first
    }
    
    // MARK: - Better solutions
    func challenge47a() -> Iterator.Element? {
        guard var lowest = self.first else { return nil }
        
        
        for item in self {
            if item < lowest {
                lowest = item
            }
        }
        return lowest
    }
    
    // MARK: - Using Iterator
    func challenge47b() -> Iterator.Element? {
        var it = makeIterator()
        guard var lowest = it.next() else { return nil }
        
        while let item = it.next() {
            if item < lowest {
                lowest = item
            }
        }
        return lowest 
    }
    
    
}

print([String]().challenge47())



