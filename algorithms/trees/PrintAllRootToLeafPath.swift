//
//  PrintAllRootToLeafPath.swift
//  Test
//
//  Created by Mari Batilando on 6/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    static func allPathsToLeaves(root: BinaryTreeNode) -> [[BinaryTreeNode]] {
        var allPaths = [[BinaryTreeNode]]()
        self.allPathsToLeaves(currNode: root, currPath: [BinaryTreeNode](), allPaths: &allPaths)
        return allPaths
    }
    
    static func allPathsToLeaves(currNode: BinaryTreeNode, currPath: [BinaryTreeNode], allPaths: inout [[BinaryTreeNode]]) {
        var newPath = currPath
        newPath.append(currNode)
        
        guard !currNode.isLeaf else {
            allPaths.append(newPath)
            return
        }
        
        if let left = currNode.left {
            self.allPathsToLeaves(currNode: left, currPath: newPath, allPaths: &allPaths)
        }
        
        if let right = currNode.right {
            self.allPathsToLeaves(currNode: right, currPath: newPath, allPaths: &allPaths)
        }
    }
    
}
