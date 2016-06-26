//
//  ReverseLevelOrderTraversal.swift
//  Test
//
//  Created by Mari Batilando on 6/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinarySearchTreeNode {
    
    var reverseLevelOrderTraversal: [T]  {
        var queue = Queue<BinarySearchTreeNode<T>>()
        var stack = Stack<BinarySearchTreeNode<T>>()
        
        queue.enqueue(self)
        
        while !queue.isEmpty {
            let dequeuedNode = queue.dequeue()
            stack.push(element: dequeuedNode)
            
            if let right = dequeuedNode.right {
                queue.enqueue(right)
            }
            
            if let left = dequeuedNode.left {
                queue.enqueue(left)
            }
            
        }
        
        var values = [T]()
        
        while !stack.isEmpty {
            values.append(stack.pop().value)
        }
        
        return values
    }
    
}
