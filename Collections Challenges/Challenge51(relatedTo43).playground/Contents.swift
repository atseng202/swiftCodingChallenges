//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// MARK: - Challenge 51: reversing linked lists
// Tricky
// Expand linked list so that it has a reversed() method that returns a copy of itself in reverse
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
    
    // Strategy:
    // 1. keep a reference to the previous node (starts out nil since start node has no preceding node
    // 2. iterate through all the nodes from the start to the last node (via next)
    // 3. make it so the current nodes's next node is the previous node
    func copyCurrentList() -> LinkedList<T>? {
        let newList = LinkedList<T>()
        
        var previousNode: Node<T>?
        var originalCurrentNode = start
        
        while originalCurrentNode != nil {
            let currentNodeCopy = Node(value: originalCurrentNode!.value)
    
            if previousNode == nil {
               newList.start = currentNodeCopy
            } else {
                // list node initialized
                previousNode?.next = currentNodeCopy
            }
            previousNode = currentNodeCopy
            originalCurrentNode = originalCurrentNode?.next
        }
        
        return newList
        
    }
    func reversed() -> LinkedList<T>? {
        // Reverses the start node
        var listToReverse = copyCurrentList()

        var previous: Node<T>?
        var currentNode = listToReverse?.start
        
        while let current = currentNode {
            let next = current.next
            current.next = previous
            
            previous = current
            currentNode = next
        }
        
        listToReverse?.start = previous
        return listToReverse
    }
    
    // MARK: - All in one solution
    func reversedInOneSolution() -> LinkedList<T> {
        let copy = LinkedList<T>()
        
        if let startNode = start {
            // we have a startNode
            var previousCopyNode = Node(value: startNode.value)
            var currentNode = startNode.next
            
            while let node = currentNode {
                let currentCopyNode = Node(value: node.value)
                
                currentCopyNode.next = previousCopyNode
                
                previousCopyNode = currentCopyNode
                currentNode = currentNode?.next
            }
            copy.start = previousCopyNode
        }
        
        return copy
    }
    
    // MARK: - Making a copy method (HWS way)
    func copy() -> LinkedList<T> {
        let copy = LinkedList<T>()
        
        if let startNode = start {
            copy.start = Node(value: startNode.value)
            
            var previousCopyNode = copy.start
            var currentNode = start?.next
            
            while let node = currentNode {
                let copyNode = Node(value: node.value)
                
                previousCopyNode?.next = copyNode
                
                previousCopyNode = copyNode
                currentNode = currentNode?.next
            }
        }
        return copy
    }
    
    // MARK: - Then reverse a linked list in place
    func reverse() {
        var currentNode = start
        var newNext: Node<T>? = nil
        
        while let node = currentNode {
            let next = node.next
            node.next = newNext
            newNext = node
            
            currentNode = currentNode?.next
        }
        start = newNext
    }
    
    func reversedUsingCopyAndReverse() -> LinkedList<T> {
        let copy = self.copy()
        copy.reverse()
        return copy 
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

//list.printAllNodes()
//print(list.reversed()!.printAllNodes())

print(list.printAllNodes())

print(list.reversed()!.printAllNodes())


print(list.reversedInOneSolution().printAllNodes())
