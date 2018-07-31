//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 37: Count the numbers

// Write an extension for collections of integers that returns the number of times a specific digit appears in any of its numbers

// Brute force
extension Collection where Iterator.Element == Int {
    func challenge37(count: Int) -> Int {
        
        var answer = 0
        
        for num in self {
            let numString = String(num)
//            print(numString)
            for char in numString {
                
                if String(char) == String(count) {
                    answer += 1
                }
            }
        }
        
        return answer
    }
}


assert([5, 15, 55, 515].challenge37(count: 5) == 6, "Challenge 37 failed")
assert([5, 15, 55, 515].challenge37(count: 1) == 2, "Challenge 37 failed")
assert([55555].challenge37(count: 5) == 5, "Challenge 37 failed")
assert([55555].challenge37(count: 1) == 0, "Challenge 37 failed")
