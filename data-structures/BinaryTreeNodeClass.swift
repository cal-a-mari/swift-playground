//
//  BinaryTreeNodeClass.swift
//  
//
//  Created by Mari Batilando on 6/20/16.
//
//

import Foundation

class BinaryTreeNode<T where T: Comparable, T: Equatable> {
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
