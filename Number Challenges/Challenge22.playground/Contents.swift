//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 22: Binary Reverse
// Parameters: Accepts an unsigned 8-bit integer
// Returns: the U8-Int's binary reverse so that it holds precisely eight binary digits

func challenge22(input: UInt8) -> Int {
    // First convert to binary
    var inputToBinary = String(input, radix: 2)
    
    // Next pad zeros until we have 8 binary digits
    while inputToBinary.count < 8 {
        inputToBinary = "0" + inputToBinary
    }

    
    // Finally reverse the binary digits
//    var reversedBinary = ""
//    while inputToBinary.count > 0 {
//        reversedBinary += String(inputToBinary.removeLast())
//    }
    let reversedBinary = String(inputToBinary.reversed())

    // Return the Int of that binary digit
    guard let output = Int(reversedBinary, radix: 2) else { return 0 }
    return output
}

print(challenge22(input: 148))

assert(challenge22(input: 32) == 4, "Challenge 22 failed")
assert(challenge22(input: 41) == 148, "Challenge 22 failed")
assert(challenge22(input: 4) == 32, "Challenge 22 failed")

