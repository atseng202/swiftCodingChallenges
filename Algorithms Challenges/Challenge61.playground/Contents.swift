//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 61: Find Prime numbers
// Tricky
// Write a function that returns an array of prime numbers from 2 up to but excluding N, taking care to be as efficient as possible
// 15 minutes


func challenge61(upTo number: Int) -> [Int] {
    var primes = [Int]()
    
    for number in 2..<number {
        if isPrime(number) {
            primes.append(number)
        }
    }
    return primes
}

private func isPrime(_ n: Int) -> Bool {
    guard n > 1 else { return false }
    if n == 2 || n == 3 { return true }
    if n % 2 == 0 { return false }
    
    let root = Int(Double(n).squareRoot())
    print(root)
    for i in stride(from: 3, to: root + 1, by: 2) {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}

// My solution is not efficient, instead use the Sieve of Eratosthenes (assume all numbers are prime up to N and remove numbers that are not)
// multiples of 2, multiples of 3, multiples of 5, then 7.
func challenge61a(upTo max: Int) -> [Int] {
    guard max > 1 else { return [] }
    var sieve = Array(repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    
    for number in 2 ..< max {
        if sieve[number] == true {
            for multiple in stride(from: number * number, to: sieve.count, by: number) {
                sieve[multiple] = false
            }
        }
    }
    
    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}


print(challenge61a(upTo: 105))


//print(challenge61(upTo: 12))
