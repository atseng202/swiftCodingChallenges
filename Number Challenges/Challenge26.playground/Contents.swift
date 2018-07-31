//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 26: Subtract without subtract
// Parameters: Two positive Ints
// Returns: An Int subtracting the first input from the second input, without using "-"
// Taxing

func challenge26(subtract: Int, from: Int) -> Int {
    
    return abs(-1 * from + subtract)
}

assert(challenge26(subtract: 5, from: 9) == 4, "Challenge 26 failed")
assert(challenge26(subtract: 10, from: 30) == 20, "Challenge 26 failed")

// Success, but I did not know about bitwise operators
// Bitwise method (~)

// 11111111 = -1 while 00000000 = 0 (Flipping all the bits is the same as adding 1 and reversing the sign)
func challenge26a(subtract: Int, from: Int) -> Int {
    return from + (~subtract + 1)
}

print(challenge26(subtract: 50, from: 60))
