//
//  InvertBinaryTree.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a binary tree, invert the binary tree and return it.
 Look at the example for more details.
 
 Example :
 Given binary tree
 
      1
    /   \
   2     3
  / \   / \
 4   5 6   7
 invert and return
 
      1
    /   \
   3     2
  / \   / \
 7   6 5   4
 */

func invertBinaryTree(root: BinaryTreeNode<Int>) {
    invertBinaryTree(node: root)
}

private func invertBinaryTree(node: BinaryTreeNode<Int>) {
    if node.isLeaf {
        return
    }
    
    let temp = node.left
    
    node.left = node.right
    node.right = temp
    
    if let left = node.left {
        invertBinaryTree(node: left)
    }
    
    if let right = node.right {
        invertBinaryTree(node: right)
    }
}

func iterInvertBinaryTree(root: BinaryTreeNode<Int>) {
    var queue = Queue<BinaryTreeNode<Int>>()
    queue.enqueue(root)
    
    while !queue.isEmpty {
        let dq = queue.dequeue()
        if let left = dq.left {
            queue.enqueue(left)
        }
        
        if let right = dq.right {
            queue.enqueue(right)
        }
        
        let temp = dq.right
        dq.right = dq.left
        dq.left = temp
    }
    
}




