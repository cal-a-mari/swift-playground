//
//  TreeBFS.swift
//  Test
//
//  Created by Mari Batilando on 6/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

struct Stack<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.last
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    mutating func pop() -> T {
        return self.array.removeLast()
    }
    
    mutating func push(element: T) {
        self.array.append(element)
    }
    
}

struct Queue<T> {
    private var array = [T]()
    
    var peek: T? {
        return self.array.first
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    mutating func dequeue() -> T {
        return self.array.removeFirst()
    }
    
    mutating func enqueue(_ element: T) {
        self.array.append(element)
    }
    
}

final class BinaryTreeNode<T where T: Comparable, T: Equatable, T:Hashable> {
    var value: T
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var parent: BinaryTreeNode?
    
    var isRoot: Bool {
        return self.parent == nil
    }
    
    var isLeaf: Bool {
        return self.left == nil && self.right == nil
    }
    
    init(value: T, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil, parent: BinaryTreeNode?) {
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
    
}

extension BinaryTreeNode: CustomStringConvertible {
    
    var description: String {
        return String(describing: self.value)
    }
    
}

extension BinaryTreeNode {
    
    var breadthFirstTraversal: [T] {
        guard !self.isLeaf else {
            return [self.value]
        }
        
        var results = [T]()
        var queue = Queue<BinaryTreeNode>()
        queue.enqueue(self)
        
        while !queue.isEmpty {
            let node = queue.dequeue()
            results.append(node.value)
            
            if let left = node.left {
                queue.enqueue(left)
            }
            
            if let right = node.right {
                queue.enqueue(right)
            }
        }
        
        return results
    }
    
    var inOrderTraversal: [T] {
        var stack = Stack<BinaryTreeNode>()
        stack.push(element: self)
        
        var currNode: BinaryTreeNode? = self
        var result = [T]()
        
        while !stack.isEmpty {
            while let left = currNode?.left {
                stack.push(element: left)
                currNode = currNode!.left
            }
            
            let popped = stack.pop()
            result.append(popped.value)
            
            if let right = popped.right {
                stack.push(element: right)
                currNode = right
            }
            
        }
        
        return result
    }
    
    var preOrderTraversal: [T] {
        var stack = Stack<BinaryTreeNode>()
        stack.push(element: self)
        var result = [T]()
        
        while !stack.isEmpty {
            let popped = stack.pop()
            result.append(popped.value)
            
            if let right = popped.right {
                stack.push(element: right)
            }
            
            if let left = popped.left {
                stack.push(element: left)
            }
        }
        
        return result
    }
    
    
}
