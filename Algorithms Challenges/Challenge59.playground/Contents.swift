//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 59: Quicksort
// TRICKY
// Create an extension for arrays that sorts them using quick-sort
// Quicksort picks an item from its array to use as the pivot point, then splits itself into either two parts (less than or greater than) or three (less, greater, or equal). These parts then repeat the pivot and split until the entire array has been split, then gets rejoined so that less, equal, and greater are in order.
// Tip #2: Quicksort fully optimized is complex and requires careful thinking

extension Array where Iterator.Element: Comparable {
    func challenge59QuickSort() -> [Element] {
        guard self.count > 1 else { return self }
        
        var returnArray = self
        
        let randomNumber = Int(arc4random_uniform(UInt32(count)))
        let randomPivot = returnArray[randomNumber]
        let lessArr =  returnArray.filter { $0 < randomPivot }
        let equalArr = returnArray.filter { $0 == randomPivot }
        let greaterArr = returnArray.filter { $0 > randomPivot }
        
        return lessArr.challenge59QuickSort() + equalArr + greaterArr.challenge59QuickSort()
    }
    // 25x faster in-place method
    mutating func challenge59c(left: Int, right: Int) {
        guard left < right else { return }
        let pivot = self[right]
        
        // sedgewick set the partitioning element to be left but here pivot is the right
        var splitPoint = left
        
        for i in left ..< right {
            if self[i] < pivot {
                (self[i], self[splitPoint]) = (self[splitPoint], self[i])
                splitPoint += 1
            }
        }
        
        (self[right], self[splitPoint]) = (self[splitPoint], self[right])
        challenge59c(left: left, right: splitPoint - 1)
        challenge59c(left: splitPoint + 1, right: right)
    }
}

//print([12, 5, 4, 9, 3, 2, 1].challenge59QuickSort())

var arr = [12, 5, 4, 9, 3, 2, 1]
arr.challenge59c(left: 0, right: arr.count - 1)
print(arr)
