//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node<T> {
    var key: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(key: T) {
        self.key = key
    }
    
    func traverseInOrder(process: (Node<T>) -> Void) {
        left?.traverseInOrder(process: process)
        process(self)
        right?.traverseInOrder(process: process)
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
//        return output
    }
    
    func isBalanced() -> Bool {
        
        func minDepth(from node: Node<T>?) -> Int {
            
            guard let node = node else { return 0 }
            let returnValue = 1 + min(minDepth(from: node.left), minDepth(from: node.right))
            print("Got min depth \(returnValue) for \(node.key)")
            return returnValue
        }
        
        func maxDepth(from node: Node<T>?) -> Int {
            guard let node = node else { return 0 }
            let returnValue = 1 + max(maxDepth(from: node.left), maxDepth(from: node.right))
            print("Got max depth \(returnValue) for \(node.key)")
            return returnValue
        }
        
        guard let root = root else { return true }
        
        let difference = maxDepth(from: root) - minDepth(from: root)
        return difference <= 1
    }
    
    func search(key: T) -> Node<T>? {
        if let rootNode = root {
            var tracker: Node<T>? = rootNode
            var found = false
            
            while tracker != nil {
                if key < tracker!.key {
                    tracker = tracker!.left
                } else if key > tracker!.key {
                    tracker = tracker!.right
                } else {
                    found = true
                    return tracker
                }
            }
            if found == false { return nil }
        } else {
            return nil
        }
    }
    
}



let a = [5,1,7,6,2,1,9,1,3]
let bst = BinarySearchTree(array: a)
print(bst.description)

//print(bst.search(key: 5))
let node = bst.search(key: 25)
print("Node value: \(node?.key ?? -1)")

bst.root?.traverseInOrder(process: { (node) in
    print(node.key)
})
