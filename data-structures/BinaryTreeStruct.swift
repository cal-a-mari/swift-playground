//
//  BinaryTreeStruct.swift
//  
//
//  Created by Mari Batilando on 6/20/16.
//
//

import Foundation

indirect enum BinaryTreeStruct<T where T: Comparable, T: Equatable> {
    case empty
    case node(BinaryTreeStruct<T>, T, BinaryTreeStruct<T>)
}

extension BinaryTreeStruct: CustomStringConvertible {
    
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

extension BinaryTreeStruct {
    
    var recursiveInOrderTraversal: [T] {
        return self.recursiveInOrderTraversalHelper(tree: self, values: [])
    }
    
    private func recursiveInOrderTraversalHelper(tree: BinaryTreeStruct, values: [T]) -> [T] {
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

let node7 = BinaryTreeStruct<Int>.node(.empty, 7, .empty)
let node6 = BinaryTreeStruct<Int>.node(.empty, 6, .empty)
let node5 = BinaryTreeStruct<Int>.node(.empty, 5, .empty)
let node4 = BinaryTreeStruct<Int>.node(.empty, 4, .empty)

let node3 = BinaryTreeStruct<Int>.node(node6, 3, node7)
let node2 = BinaryTreeStruct<Int>.node(node4, 2, node5)

let node1 = BinaryTreeStruct<Int>.node(node2, 1, node3)

node1.recursiveInOrderTraversal
