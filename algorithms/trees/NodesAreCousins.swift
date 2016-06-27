//
//  NodesAreCousins.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    func nodesAreCousins(nodeWithValue valueA: T, _ valueB: T) -> Bool {
        let levelA = self.level(ofNodeWithValue: valueA) // O(n)
        let levelB = self.level(ofNodeWithValue: valueB) // (O(n)
        
        guard levelA == levelB else {
            return false
        }
        
        let parentOfNodeA = self.parent(ofNodeWithValue: valueA) // O(n)
        return (parentOfNodeA?.left?.value != valueB) && (parentOfNodeA?.right?.value != valueB)
    }
    
    private func level(ofNodeWithValue value: T) -> Int? {
        return self.levelHelper(node: self, value: value, level: 0)
    }
    
    private func levelHelper(node: BinaryTreeNode, value: T, level: Int) -> Int? {
        if value == node.value {
            return level
        }
        
        var leftValue: Int? = nil
        if let left = node.left {
            leftValue = self.levelHelper(node: left, value: value, level: level + 1)
        }
        
        var rightValue: Int? = nil
        if let right = node.right {
            rightValue = self.levelHelper(node: right, value: value, level: level + 1)
        }
        
        return leftValue ?? rightValue
    }
    
    private func parent(ofNodeWithValue value: T) -> BinaryTreeNode? {
        var stack = Stack<BinaryTreeNode>()
        stack.push(element: self)
        
        while !stack.isEmpty {
            let dequeued = stack.pop()
            
            if (dequeued.left?.value == value) || (dequeued.right?.value == value) {
                return dequeued
            }
            
            if let right = dequeued.right {
                stack.push(element: right)
            }
            
            if let left = dequeued.left {
                stack.push(element: left)
            }
        }
        
        return nil
    }
    
}
