//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 20: Number is prime
// Parameters: A function that accepts an Int
// Returns: True if Int is prime, false otherwise
// Difficulty: Tricky
// Time: 8 min
func challenge20IsPrime(number: Int) -> Bool {
    if number <= 1 { return false }
    guard number != 2 else { return true }
    let max = Int(ceil(sqrt(Double(number))))
    
    for num in 2...max {
        if number % num == 0 {
            print(num)
            return false
        }
    }
    return true
}

print(challenge20IsPrime(number: 13))
//assert(challenge20IsPrime(number: 11) == true, "Challenge 20 failed")
//assert(challenge20IsPrime(number: 13) == true, "Challenge 20 failed")
//assert(challenge20IsPrime(number: 4) == false, "Challenge 20 failed")
//assert(challenge20IsPrime(number: 9) == false, "Challenge 20 failed")
//assert(challenge20IsPrime(number: 16777259) == true, "Challenge 20 failed")


