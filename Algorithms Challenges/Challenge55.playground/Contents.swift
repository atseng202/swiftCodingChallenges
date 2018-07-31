//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 55: Bubble Sort
// Easy
// Write an extension for arrays that sorts them using the bubble sort algorithm
// A bubble sort repeatedly loops over the items in an array, comparing items that are next to each other and swapping them if they aren't sorted. This looping continues until all items are in their correct order.
// 25 min Total

extension Array where Iterator.Element: Comparable {
    func challenge55() -> Array {
        guard self.count > 1 else { return [] }
        var newArray = self
        var sorted = false
        while !sorted {
            for i in 0...self.count - 2 {
                if newArray[i] > newArray[i + 1] {
                    newArray.swapAt(i, i+1)
                }
            }
            if newArray.isSorted() {
                sorted = true
            }
            print(newArray)
        }
        return newArray
    }
    
    fileprivate func isSorted() -> Bool {
        for index in 0...self.count - 2 {
            if self[index] > self[index + 1] {
                return false
            }
        }
        return true
    }
    
    // Optimization From HWS
    func challenge55a() -> [Element] {
        guard count > 1 else { return self }
        
        var newArray = self
        var swapsMade: Bool = true
        
        while swapsMade == true  {
            swapsMade = false
            for index in 0 ..< newArray.count - 1 {
                if newArray[index] > newArray[index + 1] {
                    newArray.swapAt(index, index + 1)
                    swapsMade = true
                }
            }
        }
        return newArray
    }
    
    // Optimization to only sort to the Nth index after each loop
    func challenge55b() -> [Element] {
        guard count > 0 else { return [] }
        var returnValue = self
        var highestSortedIndex = count
        
        while highestSortedIndex != 0 {
            var lastSwapIndex = 0
            
            for index in 0 ..< highestSortedIndex - 1 {
                if returnValue[index] > returnValue[index + 1] {
                    print("Before: \(returnValue)")
                    returnValue.swapAt(index, index + 1)
                    print("After: \(returnValue)")
                    lastSwapIndex = index + 1
                }
            }
            highestSortedIndex = lastSwapIndex
        }
        return returnValue
    }
}

//print([12, 5, 4, 9, 3, 2, 1].challenge55())
print([12, 5, 4, 9 , 3, 2, 1].challenge55a())
print([12,5,4,9,3,2,1].challenge55b())
