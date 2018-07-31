//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: MARK: - Challenge 57: Isomorphic values
// Easy
// Write a function accepting two values
// Returns true if they are isomorphic (each part of the value must map precisely to one other, but might also be itself
// "tort" -> "pump"
// 1231 -> 4564
// [1, 2, 1] -> [4, 8, 4]
// Not isomorphic examples:
// "carry" -> "daddy" c r r became " d d d"
func challenge57Isomorphic<T: Any>(input1: T, input2: T) -> Bool {
    let string1 = String(describing: input1)
    let string2 = String(describing: input2)
    
    let numbersAndLettersSet = "abcdefghijklmnopqrstuvwxyz0123456789"
    let filteredString1 = string1.filter { return numbersAndLettersSet.contains($0) }
    
    let filteredString2 = string2.filter { return numbersAndLettersSet.contains($0) }
    
    let array1 = Array(filteredString1)
    let array2 = Array(filteredString2)
    
    guard array1.count == array2.count else { return false  }
    
    var charMap = [Character: Character]()
    
    for i in 0 ... array1.count - 1 {
        let currentCharacter = array1[i]
        let currentValue = array2[i]
        
        if charMap[currentCharacter] == nil {
            if charMap.values.contains(currentValue) {
                return false
            } else {
                charMap[currentCharacter] = currentValue
            }
        } else {
            // the key has been used before, so a value exists
            let expectedCharacter = charMap[currentCharacter]!
            if currentValue != expectedCharacter {
                return false
            }
        }
        
    }
    return true
}

// If the dictionary has no key, I have to check if the value has been used before
// if it isn't, i can update the dictionary to have a new key-value pair
// if the value was used before, I return false

assert(challenge57Isomorphic(input1: "clap", input2: "slap") == true)
assert(challenge57Isomorphic(input1: "rum", input2: "mud") == true, "Wrong")
assert(challenge57Isomorphic(input1: [1, 2, 1, 2, 3], input2: [4, 5, 4, 5, 6]) == true, "Challenge 57 failed")

//print(challenge57Isomorphic(input1: "cream", input2: "lapse"))
//print(challenge57Isomorphic(input1: 3.14159, input2: 2.03048))
//print(challenge57Isomorphic(input1: [1, 2, 1, 2, 3], input2: [4, 5, 4, 5, 6]))

// Cleaner Solution
func challenge57a(first firstValue: Any, second secondValue: Any) -> Bool {
    let first = String(describing: firstValue)
    let second = String(describing: secondValue)
    
    guard first.count == second.count else { return false }
    
    var characterMap = [Character: Character]()
    let firstArray = Array(first)
    print(firstArray)
    let secondArray = Array(second)
    
    for (index, character) in firstArray.enumerated() {
        let otherCharacter = secondArray[index]
        
        if let currentMapping = characterMap[character] {
            if currentMapping != otherCharacter {
                return false
            }
        } else {
            if characterMap.values.contains(otherCharacter) {
                return false
            }
            characterMap[character] = otherCharacter
        }
    }
    return true
}

print(challenge57a(first: [1, 2, 1, 2, 3], second: [4, 5, 4, 5, 6]))


