//
//  BinaryTree.swift
//  
//
//  Created by Mari Batilando on 6/20/16.
//
//

import Foundation

indirect enum BinaryTree<T where T: Comparable, T: Equatable> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

extension BinaryTree: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .empty:
            return ""
        case .node(let left, let value, let right):
            return "value: \(value), left = [" + left.description + "], right = ["
                + right.description + "]"
        }
    }
    
}

extension BinaryTree {
    
    var recursiveInOrderTraversal: [T] {
        return self.recursiveInOrderTraversalHelper(tree: self, values: [])
    }
    
    private func recursiveInOrderTraversalHelper(tree: BinaryTree, values: [T]) -> [T] {
        var values = values
        
        switch tree {
        case .empty:
            return values
            
        case .node(let left, let value, let right):
            switch left {
            case .node:
                values = self.recursiveInOrderTraversalHelper(tree: left, values: values)
            default:
                break
            }
            
            values.append(value)
            
            switch right {
            case .node:
                values = self.recursiveInOrderTraversalHelper(tree: right, values: values)
            default:
                break
            }
        }
        
        return values
    }
    
}

let node7 = BinaryTree<Int>.node(.empty, 7, .empty)
let node6 = BinaryTree<Int>.node(.empty, 6, .empty)
let node5 = BinaryTree<Int>.node(.empty, 5, .empty)
let node4 = BinaryTree<Int>.node(.empty, 4, .empty)

let node3 = BinaryTree<Int>.node(node6, 3, node7)
let node2 = BinaryTree<Int>.node(node4, 2, node5)

let node1 = BinaryTree<Int>.node(node2, 1, node3)

node1.recursiveInOrderTraversal
