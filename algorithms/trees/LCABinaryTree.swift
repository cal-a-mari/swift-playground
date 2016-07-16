//
//  LCABinaryTree.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    func leastCommonAncestor(ofNodeWithValueA valueA: T, andNodeWithValueB valueB: T) -> BinaryTreeNode? {
        let valueAPath = self.path(toValue: valueA)
        let valueBPath = self.path(toValue: valueB)
        
        guard !valueAPath.isEmpty && !valueBPath.isEmpty else {
                return nil
        }
        
        var lca: BinaryTreeNode?
        
        for i in 0..<min(valueAPath.count, valueBPath.count) {
            if valueAPath[i].value != valueBPath[i].value {
                return lca
            } else {
                lca = valueAPath[i]
            }
        }
        
        return lca
    }
    
    func path(toValue value: T) -> [BinaryTreeNode] {
        var path = [BinaryTreeNode]()
        let _ = self.path(toValue: value, node: self, currPath: &path)
        return path
    }
    
    private func path(toValue value: T, node: BinaryTreeNode, currPath: inout [BinaryTreeNode]) -> Bool {
        if node.value == value {
            currPath.insert(node, at: 0)
            return true
        } else if let left = node.left where self.path(toValue: value, node: left, currPath: &currPath) {
            currPath.insert(node, at: 0)
            return true
        } else if let right = node.right where self.path(toValue: value, node: right, currPath: &currPath) {
            currPath.insert(node, at: 0)
            return true
        } else {
            return false
        }
    }
}
