//
//  BSTLeastCommonAncestor.swift
//  Test
//
//  Created by Mari Batilando on 6/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinarySearchTreeNode {
    
    func leastCommonAncestor(ofNodeAWithValue valueA: T, andNodeBWithValue valueB: T) -> BinarySearchTreeNode? {
        var currentNode: BinarySearchTreeNode? = self
        let minVal = min(valueA, valueB)
        let maxVal = max(valueA, valueB)
        
        while let current = currentNode {
            // If the value of the current node is both less than min and max, then go left
            if (current.value < minVal) && (current.value < maxVal) {
                currentNode = currentNode?.right
                // If both are greater then go right
            } else if (current.value > minVal) && (current.value > maxVal) {
                currentNode = currentNode?.left
            } else {
                // If the value is between min and max then return the node
                return current
            }
        }
        
        return currentNode
    }
    
}
