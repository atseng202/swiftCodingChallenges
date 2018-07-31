//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Chapter 2: Numbers
// MARK: - Challenge 16: Fizz Buzz

// Parameters: None
// Returns: Void, prints numbers from 1 to 100 inclusive, printing "Fizz" when the counter is evenly divisible by 3, "Buzz" if by 5, and "Fizz Buzz" if divisible by 3 and 5, or the counter number for all other cases.
// Total time: 5 min

func challenge16FizzBuzz() {
    for int in 1...100 {
        var statement = ""
        if int % 3 == 0, int % 5 == 0 {
            print("Fizz Buzz")
        } else if int % 3 == 0 {
            print("Fizz")
        } else if int % 5 == 0 {
            print("Buzz")
        } else {
            print(int)
        }
    }
}

let _ = challenge16FizzBuzz()


// Slightly improved Efficiency so as not to evaluate the modulus twice 
func challenge16a() {
    
    for int in 1...100 {
        if int % 3 == 0 {
            if int % 5 == 0 {
                print("Fizz Buzz")
            } else {
                print("Fizz")
            }
        } else if int % 5 == 0 {
            print("Buzz")
        } else {
            print(int)
        }
    }
}
