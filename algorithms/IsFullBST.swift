//
//  IsFullBST.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    var isFull: Bool {
        var stack = Stack<BinaryTreeNode<T>>()
        stack.push(element: self)
        
        while !stack.isEmpty {
            let popped = stack.pop()
            
            guard popped.hasNoChildren || popped.hasTwoChildren else {
                return false
            }
            
            if let right = popped.right {
                stack.push(element: right)
            }
            
            if let left = popped.left {
                stack.push(element: left)
            }
        }
        
        return true
    }
    
    var hasTwoChildren: Bool {
        return (self.left != nil) && (self.right != nil)
    }
    
    var hasNoChildren: Bool {
        return (self.left == nil) && (self.right == nil)
    }
    
}
