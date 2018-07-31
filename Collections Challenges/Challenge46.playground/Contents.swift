//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 46: Recreate map()
// Write an extension to all collections that reimplements the map() method

extension Collection  {
    func challenge46<T>(body: (Iterator.Element) throws -> T) rethrows -> [T] {
        var array = [T]()
        for item in self {
           array.append(try body(item))
        }
        return array
    }
}



print([1,2,3].challenge46(body: { String($0)
}))
