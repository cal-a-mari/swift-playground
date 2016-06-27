//
//  IsValidBST.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinarySearchTreeNode {
    
    /// Returns true if it's a valid BST
    /// Note: Assumes T is an Int
    var isValid: Bool {
        return self.isValidBSTHelper(node: self, min: Int.min, max: Int.max)
    }
    
    private func isValidBSTHelper(node: BinarySearchTreeNode, min: Int, max: Int) -> Bool {
        let nodeValue = node.value as! Int
        
        var leftIsValid = true
        if let left = node.left {
            leftIsValid = self.isValidBSTHelper(node: left, min: min, max: nodeValue)
        }
        
        var rightIsValid = true
        if let right = node.right {
            rightIsValid = self.isValidBSTHelper(node: right, min: nodeValue, max: max)
        }
        
        let nodeIsValid = (nodeValue > min) && (nodeValue < max)
        return nodeIsValid && rightIsValid && leftIsValid
    }
    
}
