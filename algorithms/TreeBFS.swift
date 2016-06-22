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

class BinaryTreeNode<T where T: Comparable, T: Equatable, T:Hashable> {
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
    
}
