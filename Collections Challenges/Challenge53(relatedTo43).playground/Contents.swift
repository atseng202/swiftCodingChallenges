//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 53: Linked Lists with a loop
// Write a method for our linked list that returns the node at the start of its loop (the one that is linked back to)

class Node<T>: Hashable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var hashValue: Int

    var value: T
    var next: Node?
    
    init(value: T, hashValue: Int) {
        self.value  = value
        self.hashValue = hashValue
    }
    
}

class LinkedList<T> {
    var start: Node<T>?
    
    private var uniqueHashValue = 0
    
    func getUniqueHashValue() -> Int {
        uniqueHashValue += 1
        return uniqueHashValue
    }
    
    
    func printAllNodes() {
        var startingPoint = start
        while let currentNode = startingPoint {
            print(currentNode.value, terminator: " ")
            startingPoint = startingPoint?.next
        }
    }
    
    func findLoopStart() -> Node<T>? {
        var current = start
        var seen = Set<Node<T>>()
        while let currentNode = current {
            if seen.contains(currentNode) {
               return currentNode
            } else {
                seen.insert(currentNode)
            }
            current = current?.next
        }
        return nil
    }
}

var list = LinkedList<UInt32>()
var previousNode: Node<UInt32>? = nil
var linkBackNode: Node<UInt32>? = nil

var linkBackPoint = Int(arc4random_uniform(1000))

for i in 1...1000 {
    let node = Node(value: arc4random(), hashValue: list.getUniqueHashValue())
    
    if i == linkBackPoint { linkBackNode = node }
    
    if let predecessor = previousNode {
        predecessor.next = node
    } else {
        list.start = node
    }
    
    previousNode = node
}

previousNode?.next = linkBackNode

print(linkBackNode?.value)

let node = list.findLoopStart()
print(node?.value)
//print(list.printAllNodes())


