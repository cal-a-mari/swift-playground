//
//  BinaryTreeNodeClass.swift
//
//
//  Created by Mari Batilando on 6/20/16.
//
//

import Foundation

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
    
    var recursiveInOrderTraversal: [T] {
        return self.recursiveInOrderTraversalHelper(tree: self, values: [])
    }
    
    private func recursiveInOrderTraversalHelper(tree: BinaryTreeNode, values: [T]) -> [T] {
        var values = values
        
        if let left = self.left {
            values = self.recursiveInOrderTraversalHelper(tree: left, values: values)
        }
        
        values.append(value)
        
        if let right = self.right {
            values = self.recursiveInOrderTraversalHelper(tree: right, values: values)
        }
        
        return values
    }
    
}

extension BinaryTreeNode {
    
    var iterativeInOrderTraversal: [T] {
        guard !self.isLeaf else {
            return [self.value]
        }
        
        var result = [T]()
        var stack = [BinaryTreeNode]()
        var current: BinaryTreeNode? = self
        
        while current != nil || !stack.isEmpty {
            while let currNode = current {
                stack.append(currNode)
                current = current?.left
            }
            
            let poppedElement = stack.removeLast()
            result.append(poppedElement.value)
            current = poppedElement.right
        }
        
        return result
    }
    
}

let node1 = BinaryTreeNode(value: 1, parent: nil)
let node2 = BinaryTreeNode(value: 2, parent: node1)
let node3 = BinaryTreeNode(value: 3, parent: node1)
node1.left = node2
node1.right = node3

let node4 = BinaryTreeNode(value: 4, parent: node2)
let node5 = BinaryTreeNode(value: 5, parent: node2)
node2.left = node4
node2.right = node5

let node6 = BinaryTreeNode(value: 6, parent: node3)
let node7 = BinaryTreeNode(value: 7, parent: node4)
node3.left = node6
node3.right = node7

node1.iterativeInOrderTraversal
