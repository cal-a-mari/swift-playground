//
//  CommonNodesBST.swift
//  Test
//
//  Created by Mari Batilando on 6/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinarySearchTreeNode {
    
    static func commonNodes(withRoot rootA: BinarySearchTreeNode, andOtherRoot rootB: BinarySearchTreeNode) -> [T] {
        let inOrderA = rootA.iterativeInOrderTraversal
        let inOrderB = rootB.iterativeInOrderTraversal
        return self.intersection(ofSortedArrayA: inOrderA, andSortedArrayB: inOrderB)
    }
    
    static func intersection(ofSortedArrayA arrayA: [T], andSortedArrayB arrayB: [T]) -> [T] {
        var i = 0
        var j = 0
        var result = [T]()
        
        while i < arrayA.count && j < arrayB.count {
            let elemA = arrayA[i]
            let elemB = arrayB[j]
            
            if elemA == elemB {
                result.append(elemA)
                j += 1
                i += 1
            } else if elemA > elemB {
                j += 1
            } else {
                i += 1
            }
        }
        
        return result
    }
    
    var iterativeInOrderTraversal: [T] {
        var stack = Stack<BinarySearchTreeNode<T>>()
        var values = [T]()
        var currentNode: BinarySearchTreeNode? = self
        
        while currentNode != nil || !stack.isEmpty {
            while let currNode = currentNode {
                stack.push(element: currNode)
                currentNode = currentNode?.left
            }
            
            let popped = stack.pop()
            values.append(popped.value)
            currentNode = popped.right
        }
        
        return values
    }
    
}
