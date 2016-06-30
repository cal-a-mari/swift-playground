//
//  BinarySearchTreeNode.swift
//  Test
//
//  Created by Mari Batilando on 6/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

final class BinarySearchTreeNode<T where T: Comparable, T: Equatable> {
    var value: T
    private(set) var left: BinarySearchTreeNode?
    private(set) var right: BinarySearchTreeNode?
    
    var isLeaf: Bool {
        return (self.left == nil) && (self.right == nil)
    }
    
    var hasOneChild: Bool {
        return (self.left != nil && self.right == nil) || (self.left == nil && self.right != nil)
    }
    
    init(value: T) {
        self.value = value
    }
    
    func insert(value: T) {
        var currentNode: BinarySearchTreeNode? = self
        
        while let currNode = currentNode {
            guard value != currNode.value else {
                return
            }
            
            if value < currNode.value {
                if currNode.left == nil {
                    currNode.left = BinarySearchTreeNode<T>(value: value)
                    return
                } else {
                    currentNode = currentNode?.left
                }
            } else {
                if currNode.right == nil {
                    currNode.right = BinarySearchTreeNode<T>(value: value)
                    return
                } else {
                    currentNode = currentNode?.right
                }
            }
        }
    }
    
    private func hasImmediateChild(withValue value: T) -> Bool {
        return self.left?.value == value || self.right?.value == value
    }
    
    func deleteNodeWithValue(value: T) {
        guard let theParentNode = self.searchParentNode(forNodeWithValue: value) else {
            return
        }
        
        let nodeToDelete = theParentNode.left?.value == value ? theParentNode.left! : theParentNode.right!
        
        // Case 1: If node is leaf then just remove the reference
        if nodeToDelete.isLeaf {
            if value < theParentNode.value {
                theParentNode.left = nil
            } else {
                theParentNode.right = nil
            }
            
            return
        }
        
        // Case 2: If node has 1 child then just move the parent's pointer to it
        if nodeToDelete.hasOneChild {
            let newNode = nodeToDelete.left ?? nodeToDelete.right
            
            if value < theParentNode.value {
                theParentNode.left = newNode
            } else {
                theParentNode.right = newNode
            }
            
            return
        }
        
        // Case 3: If node has 2 children then get the smallest node in its subtree
        var parentOfSmallestNode = nodeToDelete
        while let left = parentOfSmallestNode.left where left.left != nil {
            parentOfSmallestNode = left
        }
        
        nodeToDelete.value = parentOfSmallestNode.left!.value
        parentOfSmallestNode.left = nil
    }
    
    func searchParentNode(forNodeWithValue value: T) -> BinarySearchTreeNode? {
        var currNode: BinarySearchTreeNode? = self
        var parentNode: BinarySearchTreeNode?
        
        while let currentNode = currNode {
            guard currentNode.hasImmediateChild(withValue: value) else {
                currNode = value < currentNode.value ? currNode?.left : currNode?.right
                continue
            }
            
            parentNode = currentNode
            break
        }
        
        return parentNode
    }
    
    
    func searchNode(withValue value: T) -> BinarySearchTreeNode? {
        var currentNode: BinarySearchTreeNode? = self
        
        while let currNode = currentNode {
            if value == currNode.value {
                break
            }
            
            currentNode = value < currNode.value ? currentNode?.left : currentNode?.right
        }
        
        return currentNode
    }
}
