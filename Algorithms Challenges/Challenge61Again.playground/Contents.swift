//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func challenge61(upTo max: Int) -> [Int] {
    guard max > 1 else { return [] }
    
    var sieve = [Bool](repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    
    for number in 2 ..< max {
        if sieve[number] == true {
            for multiple in stride(from: number * number, to: sieve.count, by: number) {
                sieve[multiple] = false
            }
        }
    }
    print(sieve)
    let a = sieve.enumerated()
    var primes  = [Int]()
    for (index, value) in a {
        if value == true {
            primes.append(index)
        }
    }
    return primes
}

print(challenge61(upTo: 13))

print([Bool](repeating: true, count: 13))

func isPrime(_ number: Int) -> Bool {
    guard number > 1 else { return false }
    if number == 2 || number == 3 { return true }
    
    for factor in 2 ... Int(Double(number).squareRoot()) {
        if number % factor == 0 {
            return false
        }
    }
    
    return true
}

print(isPrime(6))

