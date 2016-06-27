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
    
    var recursivePostOrderTraversal: [T] {
        return self.recursivePostOrderTraversal(node: self, values: [])
    }
    
    private func recursivePostOrderTraversal(node: BinaryTreeNode, values: [T]) -> [T] {
        var values = values
        
        if let left = node.left {
            values = self.recursivePostOrderTraversal(node: left, values: values)
        }
        
        if let right = node.right {
            values = self.recursivePostOrderTraversal(node: right, values: values)
        }
        
        values.append(node.value)
        
        return values
    }
    
}

extension BinaryTreeNode {
    
    /// The trick is in realizing that the post order traversal is the reverse order of a preorder traversal that visits the right child first
    var iterativePostOrderTraversal: [T] {
        var stack1 = [BinaryTreeNode]()
        var stack2 = [T]()
        
        stack1.append(self)
        
        while !stack1.isEmpty {
            let poppedElement = stack1.removeLast()
            stack2.append(poppedElement.value)
            
            if let left = poppedElement.left {
                stack1.append(left)
            }
            
            if let right = poppedElement.right {
                stack1.append(right)
            }
        }
        
        return stack2.reversed()
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

node1.recursivePostOrderTraversal
node1.iterativePostOrderTraversal
