//
//  FlattenBinaryTree.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// Given a binary tree, flatten it to a linked list in-place.
// O(n)
func flatten(root: BinaryTreeNode<Int>) {
    var stack = Stack<BinaryTreeNode<Int>>()
    var currNode: BinaryTreeNode? = root
    
    while !stack.isEmpty || currNode != nil {
        if let right = currNode!.right {
            stack.push(element: right)
        }
        
        if let left = currNode!.left {
            currNode!.right = left
            currNode!.left = nil
        } else if !stack.isEmpty {
            let popped = stack.pop()
            currNode!.right = popped
        }
        
        currNode = currNode!.right
    }
}
