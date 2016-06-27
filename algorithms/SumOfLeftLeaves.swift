//
//  SumOfLeftLeaves.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    /// Assumes that T is an Int
    var sumOfLeftLeaves: Int {
        var stack = Stack<BinaryTreeNode>()
        stack.push(element: self)
        
        var sum = 0
        
        while !stack.isEmpty {
            let popped = stack.pop()
            
            if let right = popped.right {
                stack.push(element: right)
            }
            
            if let left = popped.left {
                if left.isLeaf {
                    sum += left.value as! Int
                } else {
                    stack.push(element: left)
                }
            }
        }
        
        return sum
    }
    
}
