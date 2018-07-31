//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// MARK: - Challenge 21: Counting binary ones
// Parameters: Accepts any positive Int
// Returns: The next highest and next lowest number that has the same number of ones in its binary representation
// Difficulty: Tricky
// Total Time: 12 min

func challenge21(input: Int) -> (highest: Int?, lowest: Int?) {
    // first convert to binary
    // then find the next highest number in binary that has same # of 1s
    // lasr find the next lowest number in binary with the same # of 1s
    // if not possible return nil
    let input = input
    guard input > 0 else { return (highest: nil, lowest: nil) }
    
    var highestNumber = input + 1
    while highestNumber.nonzeroBitCount != input.nonzeroBitCount {
        highestNumber += 1
    }
    
    var lowestNumber = input - 1
    while lowestNumber.nonzeroBitCount != input.nonzeroBitCount {
        if lowestNumber > 0 {
            lowestNumber -= 1
        } else {
            return (highest: nil, lowest: nil)
        }
    }
    
    return (highest: highestNumber, lowest: lowestNumber)
}

print(challenge21(input: 12))
print(challenge21(input: 28))
//assert(challenge21(input: 12) == (highest: 17, lowest: 10), "Challenge 21 failed")

func challenge21a(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    let binaryString = String(number, radix: 2)
    let targetOnes = binaryString.filter { (char) -> Bool in char == "1" }
    let targetOnesCount = targetOnes.count
    
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil
    
    for i in number + 1 ... Int.max {
        let currentBinary = String(i, radix: 2)
        let currentOnes = currentBinary.filter({ (char) -> Bool in
            char  == "1"
        })
        let currentOnesCount = currentOnes.count
        if targetOnesCount == currentOnesCount {
            nextHighest = i
            break
        }
    }
    
    for i in (0..<number).reversed() {
        let currentBinary = String(i, radix: 2)
        let currentOnes = currentBinary.filter({ (char) -> Bool in
            char == "1"
        })
        if targetOnesCount == currentOnes.count {
            nextLowest = i
            break
        }
    }
    
    return (nextHighest, nextLowest)
}


print(challenge21a(number: 12))






