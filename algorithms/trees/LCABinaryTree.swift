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
        guard let pathToA = self.path(toNodeWithValue: valueA), pathToB = self.path(toNodeWithValue: valueB) else {
            return nil
        }
        
        var lca: BinaryTreeNode?
        
        for i in 0..<min(pathToA.count, pathToB.count) {
            let a = pathToA[i].value
            let b = pathToB[i].value
            
            if a != b {
                return lca
            } else {
                lca = pathToA[i]
            }
        }
        
        return lca
    }
    
    private func path(toNodeWithValue value: T) -> [BinaryTreeNode]? {
        return self.pathHelper(value: value, node: self, path: [BinaryTreeNode]())
    }
    
    private func pathHelper(value: T, node: BinaryTreeNode, path: [BinaryTreeNode]) -> [BinaryTreeNode]? {
        if node.value == value {
            var path = path
            path.append(node)
            return path
        }
        
        var leftPath: [BinaryTreeNode]?
        if let left = node.left {
            var lPath = path
            lPath.append(node)
            leftPath = self.pathHelper(value: value, node: left, path: lPath)
        }
        
        var rightPath: [BinaryTreeNode]?
        if let right = node.right {
            var rPath = path
            rPath.append(node)
            rightPath = self.pathHelper(value: value, node: right, path: rPath)
        }
        
        return leftPath ?? rightPath
    }
}
