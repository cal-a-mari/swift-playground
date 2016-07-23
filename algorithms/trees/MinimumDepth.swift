//
//  MinimumDepth.swift
//  Test
//
//  Created by Mari Batilando on 7/23/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    static func minimumDepth(root: BinaryTreeNode) -> Int {
        return self.minimumDepth(currNode: root, counter: 1)
    }
    
    private static func minimumDepth(currNode: BinaryTreeNode, counter: Int) -> Int {
        guard !currNode.isLeaf else {
            return counter
        }
        
        var leftDepth = Int.max
        if let left = currNode.left {
            leftDepth = self.minimumDepth(currNode: left, counter: counter + 1)
        }
        
        var rightDepth = Int.max
        if let right = currNode.right {
            rightDepth = self.minimumDepth(currNode: right, counter: counter + 1)
        }
        
        return min(leftDepth, rightDepth)
    }
    
}
