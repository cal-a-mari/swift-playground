//
//  IsSubtree.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    func isSubtree(ofTree tree: BinaryTreeNode) -> Bool {
        return self.dynamicType.isSubtreeHelper(tree: tree, currentNode: self)
    }
    
    private static func isSubtreeHelper(tree: BinaryTreeNode?, currentNode node: BinaryTreeNode?) -> Bool {
        if node == nil {
            return true
        }
        
        if tree == nil {
            return false
        }
        
        if tree!.value == node!.value {
            return true
        }
        
        let left = self.isSubtreeHelper(tree: tree!.left, currentNode: node!.left)
        let right = self.isSubtreeHelper(tree: tree!.right, currentNode: node!.right)
        
        return left || right
    }
    
    func optIsSubtree(ofTree tree: BinaryTreeNode) -> Bool {
        // Trick: A tree is uniquely identifiable with its In-Order traversal + (Pre/Post/Level) order traversal
        let treeInOrder = tree.inOrderTraversal
        let treePreOrder = tree.preOrderTraversal
        
        let nodeInOrder = self.inOrderTraversal
        let nodePreOrder = self.preOrderTraversal
        
        let inOrderIsSame = Array.array(nodeInOrder, isSubarrayofArray: treeInOrder)
        let preOrderIsSame = Array.array(nodePreOrder, isSubarrayofArray: treePreOrder)
        
        return inOrderIsSame && preOrderIsSame
    }
    
}

extension Array where Element: Comparable {
    
    static func array(_ array: [Element], isSubarrayofArray anotherArray: [Element]) -> Bool {
        
        for i in anotherArray {
            var isSubarray = true
            
            for j in array {
                if i != j {
                    isSubarray = false
                }
            }
            
            if isSubarray {
                return true
            }
        }
        
        return false
    }
    
}
