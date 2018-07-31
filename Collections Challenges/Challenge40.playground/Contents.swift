//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 40: Missing numbers in array
// Accepts an array of unsorted numbers from 1 to 100 where 0 or more numbers might be missing
// Returns an array of the missing numbers

func challenge40(inputArray: [Int]) -> [Int] {
    
    var arrayToHundred = Array(1...100)
    var sortedInput = inputArray.sorted()
    
    for num in sortedInput {
        if arrayToHundred.contains(num) {
            arrayToHundred.remove(at: arrayToHundred.index(of: num)!)
        }
    }
    
    return arrayToHundred
}


var test = Array(1...100)
test.remove(at: 25)
test.remove(at: 20)
test.remove(at: 6)

print(challenge40(inputArray: test))


func fasterChallenge40(inputArr: [Int]) -> [Int] {
    
    var numbersSet = Set(1...100)
    var output = Set(inputArr)
    
    return Array(numbersSet.symmetricDifference(output))
}

func redoingChallnege40(input: [Int]) -> [Int] {
    
    let allNums = Array(1...100)
    var inputSet = Set(input)
    var missingNumbers = [Int]()
    
    for num in allNums {
        if !inputSet.contains(num) {
            missingNumbers.append(num)
        }
    }
    return missingNumbers
}

print(fasterChallenge40(inputArr: test))
print(redoingChallnege40(input: test))
