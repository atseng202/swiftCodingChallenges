//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 43: Linked list

// Create a linked list of lowercase English alphabet letters, along with a method that traverses all nodes and prints their letters on a single line separated by spaces

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    var first: LinkedListNode<T>?
    
    func printNodes() {
        
        var currentNode = first
        
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
    }
    
    func reverseNodes() {
        var previous: LinkedListNode<T>?
        var next: LinkedListNode<T>?
        
        var currentNode = first
        
        while currentNode != nil {
            if currentNode?.next == nil {
                first = currentNode
            }
            next = currentNode?.next
            currentNode?.next = previous
            
            previous = currentNode
            currentNode = next
        }
        
    }

}


var linkedList = LinkedList<Character>()
var previousNode: LinkedListNode<Character>? = nil

for letter in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkedListNode(value: letter)
    
    if let previousNode = previousNode {
        previousNode.next = node
    } else {
        linkedList.first = node
    }
    
    previousNode = node
}

print(linkedList.printNodes())
//linkedList.reverseNodes()

print(linkedList.printNodes())


//linkedList.printNodes()

// MARK: - Challenge 44: Linked list Midpoint
// Extend the linked list class with a new method that returns the node at the mid point of the linked list using no more than one loop
// Easy

// If the linked list oontains an even number of items, returning the one before or the one after the center is okay

extension LinkedList {
    func challenge44() -> LinkedListNode<T>? {

        var fastNode = first
        var halfwayNode = first
        
        while fastNode != nil && fastNode?.next != nil  {
            halfwayNode = halfwayNode?.next
            fastNode = fastNode?.next?.next
        }
            // First check the halfway node count

            
            // Next set up next node in list

        
        return halfwayNode
    }
    
}

var list = LinkedList<Character>()
var previous: LinkedListNode<Character>? = nil

for num in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkedListNode(value: num)
    if let previous = previous {
        previous.next = node
    } else {
        list.first = node
    }
    previous = node
}

print(list.challenge44()?.value)
// print(list.challenge44()?.value)

