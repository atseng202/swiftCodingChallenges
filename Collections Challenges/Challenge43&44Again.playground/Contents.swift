//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Create a linked list of English lowercase alphabet letters with a method that traverses all nodes and prints their letters on a single line separated by spaces.

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value  = value
    }
    
}

class LinkedList<T> {
    var start: Node<T>?
    
    func printAllNodes() {
        var startingPoint = start
        while let currentNode = startingPoint {
            print(currentNode.value, terminator: " ")
            startingPoint = startingPoint?.next
        }
    }
    
    
}

let list = LinkedList<Character>()
var previousNode: Node<Character>?
for letter in "abcdefghijklmnopqrstuvwxyz" {
    let currentNode = Node(value: letter)
    
    if let previousNode = previousNode {
        previousNode.next = currentNode
    } else {
        list.start = currentNode
    }
    previousNode = currentNode
    
}

//print(list.printAllNodes())

// MARK: - Challenge 44: Extend the linked list to return the node at the mid point using no more than one loop

extension LinkedList {
    func getMidPoint() -> Node<T>? {
        var slow = start
        var fastPointer = start
        
        while fastPointer?.next?.next != nil {
            slow = slow?.next
            fastPointer = fastPointer?.next?.next
        }
        return slow
    }
}

//print(list.getMidPoint()?.value)

let numList = LinkedList<Int>()
var prev: Node<Int>?
for num in 1...4 {
    let current = Node(value: num)
    if let prev = prev { prev.next = current }
    else { numList.start = current }
    prev = current
}

print(numList.getMidPoint()?.value)

