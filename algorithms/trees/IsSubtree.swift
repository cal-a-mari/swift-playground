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
        return self.dynamicType.tree(self, isSubtreeOfAnotherTree: tree)
    }
    
    private static func tree(_ tree: BinaryTreeNode?, isSubtreeOfAnotherTree anotherTree: BinaryTreeNode?) -> Bool {
        if tree == nil {
            return true
        }
        
        if anotherTree == nil {
            return false
        }
        
        if self.tree(tree, isIdenticalTo: anotherTree) {
            return true
        }
        
        return self.tree(tree, isSubtreeOfAnotherTree: anotherTree?.left) || self.tree(tree, isSubtreeOfAnotherTree: anotherTree)
    }
    
    private static func tree(_ tree: BinaryTreeNode<T>?, isIdenticalTo otherTree: BinaryTreeNode<T>?) -> Bool {
        if tree == nil && otherTree == nil {
            return true
        }
        
        let rootIsIdentical = tree?.value == otherTree?.value
        
        return rootIsIdentical && self.tree(tree?.left, isIdenticalTo: otherTree?.left) && self.tree(tree?.right, isIdenticalTo: otherTree?.right)
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
