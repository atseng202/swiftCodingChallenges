//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Linked List Loop Again

class Node<T>: Hashable {
    var hashValue: Int
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    let value: T
    var next: Node<T>?
    
    init(value: T, hashValue: Int) {
        self.value = value
        self.hashValue = hashValue
    }
}

class LinkedList<T> {
    var head: Node<T>?
    
    private var uniqueHashValue = 0
    
    func getUniqueHashValue() -> Int {
        uniqueHashValue += 1
        return uniqueHashValue
    }
    
    func printNodes() {
        var current = head
        
        while let currentNode = current {
            print(currentNode.value, terminator: " -> ")
            current = current?.next
        }
    }
    
    func isCycle() -> Bool {
        var slow = head
        var fast = head
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow == fast { return true }
        }
        return false
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
        list.head = node
    }
    
    previousNode = node
}

previousNode?.next = linkBackNode

print(list.isCycle())
