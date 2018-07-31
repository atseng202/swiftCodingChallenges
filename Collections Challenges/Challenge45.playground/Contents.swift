//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Challenge 45 - Traversing the Tree
// Accepts a closure with a node as input
// Traverses the binary search tee in order and runs the closure on each node

class Node<T> {
    var key: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(key: T) {
        self.key = key
    }
    
    func traverseInOrder(body: (Node<T>) -> Void) {
        left?.traverseInOrder(body: body)
        body(self)
        right?.traverseInOrder(body: body)
    }
}

class BinarySearchTree<T: Comparable>: CustomStringConvertible {
    var root: Node<T>?
    
    init(array: [T]) {
        for item in array {
            var keySet = false
            
            if let rootNode = root {
                var tracker = rootNode
                
                while keySet == false {
                    if item <= tracker.key {
                        if tracker.left == nil {
                            let node = Node(key: item)
                            tracker.left = node
                            
                            keySet = true
                        }
                        tracker = tracker.left!
                    } else if item > tracker.key {
                        if tracker.right == nil {
                            let node = Node(key: item)
                            tracker.right = node
                            
                            keySet = true
                        }
                        tracker = tracker.right!
                    }
                    
                }
            } else {
                root = Node(key: item)
            }
        }
    }
    
    var description: String {
        guard let first = root else { return "(EMPTY)"}
        var output = ""
        var queue = [Node<T>]()
        queue.append(first)
        
        while queue.count > 0 {
            var nodesAtCurrentLevel = queue.count
            
            while nodesAtCurrentLevel > 0 {
                let node = queue.removeFirst()
                output += "\(node.key) "
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                
                nodesAtCurrentLevel -= 1
            }
            output += "\n"
        }
        
        return output
    }
        //        return output
}
