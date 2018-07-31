//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 56: Insertion sort
// Easy
// Write extension for arrays that sorts them using the insertion sort algorithm
// An insertion sort creates a new sorted array by removing items individually from the input array and placing them into the correct position in the new array.

extension Array where Iterator.Element: Comparable {
    func challenge56() -> [Element] {
        guard count > 0 else { return [] }
        
        var copyArray = self
        var returnArray = [Element]()
    
        while copyArray.count > 0 {
            var smallestValue = copyArray.first!
            var smallestIndex = 0
            for index in 0 ..< copyArray.count {
                let item = copyArray[index]
                if item < smallestValue {
                    smallestValue = item
                    smallestIndex = index
                }
            }
            returnArray.append(copyArray.remove(at: smallestIndex))
        }
        return returnArray
    }
    
    // Optimization to not copy the array
    func challenge56a() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = [Element]()
        
        for unsorted in self {
            if returnValue.count == 0 {
                returnValue.append(unsorted)
            } else {
                var placed = false
                
                for (index, sorted) in returnValue.enumerated() {
                    if unsorted < sorted {
                        returnValue.insert(unsorted, at: index)
                        placed = true
                        break
                    }
                }
                if !placed {
                    returnValue.append(unsorted)
                }
            }
        }
        return returnValue
    }
    // Retrying unoptimized insertion sort
    func insertionSortBad() -> [Element] {
        guard count > 1 else { return self }
        var returnValue = [Element]()
        
        for unsortedItem in self {
            if returnValue.count == 0 {
                returnValue.append(unsortedItem)
            } else {
                var placed = false
                
                for (index, item) in returnValue.enumerated() {
                    if unsortedItem < item {
                        returnValue.insert(unsortedItem, at: index)
                        placed = true
                        break
                    }
                }
                if !placed {
                    returnValue.append(unsortedItem)
                }
            }
        }
        return returnValue
    }
    // Retrying Optimized Insertion sort
    func insertionSort() -> [Element] {
        guard self.count > 1 else { return self }
        
        var returnValue = self
        for index in 1 ..< count {
            
            var itemToPlace = returnValue[index]
            var currentItemIndex = index
            
            while currentItemIndex > 0 && itemToPlace < returnValue[currentItemIndex - 1] {
                returnValue[currentItemIndex] = returnValue[currentItemIndex - 1]
                currentItemIndex -= 1
            }
            returnValue[currentItemIndex] = itemToPlace
        }
        return returnValue
    }
    
    // In-place Insertion Sort
    func challenge56b() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = self
        
        for i in 1 ..< count {
            var currentItemIndex = i
            
            let itemToPlace = returnValue[currentItemIndex]
            while currentItemIndex > 0 && itemToPlace < returnValue[currentItemIndex - 1] {
                returnValue[currentItemIndex] = returnValue[currentItemIndex - 1]
                currentItemIndex -= 1
            }
            returnValue[currentItemIndex] = itemToPlace
        }
        return returnValue
    }
    
    // Insertion Sort 2 days later (I may be wrong)
    mutating func attemptedInsertionSort() {
        guard count > 1 else { return }
        
        for i in 1 ..< count {
            var currentItemIndex = i
            var itemToPlace = self[currentItemIndex]
            
            while currentItemIndex > 0  && itemToPlace < self[currentItemIndex - 1] {
                self[currentItemIndex] = self[currentItemIndex - 1]
                currentItemIndex -= 1
            }
            self[currentItemIndex] = itemToPlace
        }
    }
}


//print([12, 5, 4, 9, 3, 2, 1].challenge56())
//print(["f", "a", "b"].challenge56())
//print([12, 5, 4, 9, 3, 2, 1].challenge56b())
//print([12, 5, 4, 9, 3, 2, 1].insertionSort())
//print([12, 5, 4, 9, 3, 2, 1].insertionSortBad())

var arr = [12, 5, 4, 9, 3, 2, 1]
arr.attemptedInsertionSort()
print(arr)
