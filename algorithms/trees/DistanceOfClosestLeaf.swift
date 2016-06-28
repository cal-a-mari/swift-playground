//
//  DistanceOfClosestLeaf.swift
//  Test
//
//  Created by Mari Batilando on 6/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    func calculateDistanceOfClosestLeaf(fromNodeWithValue value: T) -> Int {
        let node = self.get(nodeWithValue: value)! // O(n)
        let ancestors = self.getAncestors(ofNodeWithValue: node.value) // O(n)
        let minAncestorDistance = ancestors.map { return self.distanceOfClosestLeaf(fromRoot: $0) }.min() ?? Int.max // O(n * k)
        let leafDistanceInSubtree = self.distanceOfClosestLeaf(fromRoot: node) // O(n)
        
        return min(minAncestorDistance, leafDistanceInSubtree)
    }
    
    func getAncestors(ofNodeWithValue value: T) -> [BinaryTreeNode] {
        var ancestors = [BinaryTreeNode]()
        let _ = self.getAncestorsHelper(node: self, value: value, ancestors: &ancestors)
        
        return ancestors
    }
    
    private func getAncestorsHelper(node: BinaryTreeNode, value: T, ancestors: inout [BinaryTreeNode]) -> Bool {
        if (node.left?.value == value) || (node.right?.value == value) {
            ancestors.append(node)
            return true
        } else if let left = node.left where self.getAncestorsHelper(node: left, value: value, ancestors: &ancestors) {
            ancestors.insert(node, at: 0)
        } else if let right = node.right where self.getAncestorsHelper(node: right, value: value, ancestors: &ancestors) {
            ancestors.insert(node, at: 0)
        }
        
        return false
    }
    
    func distanceOfClosestLeaf(fromRoot root: BinaryTreeNode) -> Int {
        return self.distanceOfClosestLeafHelper(node: root, counter: 0)
    }
    
    private func distanceOfClosestLeafHelper(node: BinaryTreeNode, counter: Int) -> Int {
        if node.isLeaf {
            return counter
        }
        
        var leftDistance = Int.max
        if let left = node.left {
            leftDistance = self.distanceOfClosestLeafHelper(node: left, counter: counter + 1)
        }
        
        var rightDistance = Int.max
        if let right = node.right {
            rightDistance = self.distanceOfClosestLeafHelper(node: right, counter: counter + 1)
        }
        
        return min(leftDistance, rightDistance)
    }
    
    func get(nodeWithValue value: T) -> BinaryTreeNode? {
        var stack = Stack<BinaryTreeNode<T>>()
        stack.push(element: self)
        
        while !stack.isEmpty {
            let pop = stack.pop()
            
            if pop.value == value {
                return pop
            }
            
            if let right = pop.right {
                stack.push(element: right)
            }
            
            if let left = pop.left {
                stack.push(element: left)
            }
        }
        
        return nil
    }
    
}
