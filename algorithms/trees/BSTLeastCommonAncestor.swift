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
        let minVal = min(valueA, valueB)
        let maxVal = max(valueA, valueB)
        
        var currNode: BinarySearchTreeNode? = self
        while let node = currNode {
            if (node.value > minVal) && (node.value < maxVal) {
                return node
            } else if node.value < minVal {
                currNode = node.right
            } else if node.value > maxVal {
                currNode = node.left
            } else if (node.value == minVal) || (node.value == maxVal) {
                return currNode
            }
        }
        
        return nil
    }
    
}
