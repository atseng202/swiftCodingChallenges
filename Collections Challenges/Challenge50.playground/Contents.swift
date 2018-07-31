//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 50: Count the largest range
// Tricky
// Accepts an array of positive and negative numbers
// Returns a closed range containing the position of the contiguous positive numbers that sum to the highest value, or nil if nothing was found
func challenge50(_ numbers: [Int]) -> CountableClosedRange<Int>? {
    var numbersVar = numbers
    guard numbersVar.count > 0 else { return nil }
    var sumRangeDict = [Int:CountableClosedRange<Int>]()
    
    var sum = 0
    var startIndex = 0
    var endIndex = 0
    
    for (index, item) in numbersVar.enumerated() {
        print("\(index) : item \(item)")
        if item > 0 {
            sum += item
            endIndex = index
            if index == numbersVar.endIndex - 1 {
                // do something
                if sumRangeDict[sum] == nil {
                    sumRangeDict[sum] = startIndex...index
                }
            }
        } else {
            if sumRangeDict[sum] == nil {
                sumRangeDict[sum] = startIndex...endIndex
            }
            startIndex = index + 1
            endIndex = startIndex
            sum = 0
        }
    }
    
    var biggestSum: Int = 0
    for key in sumRangeDict.keys {
        if key > biggestSum {
            biggestSum = key
        }
    }
    print(biggestSum)
    print(sumRangeDict)
    return sumRangeDict[biggestSum]
}

//print(challenge50([0,1,1,-1,2,3,1]))
//print(challenge50([10, 20, 30, -10, -20, 10, 20]))
//print(challenge50([2, 0, 2, 0, 2]))
//print(challenge50([Int]()))

// 0. Return nil if array is empty
// 1. set a start and end index var at the first item in array
// 2. Keep a count of the current sum, if it decreases, store the sum and the range of sum from startIndex to endIndex and move pointer to endIndex + 1

// MARK: - HWS Cleaner Solution than mine (still brute force)
func challenge50a(_ numbers: [Int]) -> CountableClosedRange<Int>? {
    var bestRange: CountableClosedRange<Int>? = nil
    var bestSum = 0
    
    var currentStart: Int? = nil
    var currentSum = 0
    
    for (index, num) in numbers.enumerated() {
        if num > 0 {
            currentStart = currentStart ?? index
            currentSum += num
            
            if currentSum > bestSum {
                bestRange = currentStart! ... index
                bestSum = currentSum
            }
        } else {
            currentSum = 0
            currentStart = nil
        }
    }
    return bestRange
    
}

