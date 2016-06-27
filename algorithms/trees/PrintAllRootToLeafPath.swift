//
//  PrintAllRootToLeafPath.swift
//  Test
//
//  Created by Mari Batilando on 6/25/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    func printAllRootToLeafPaths() {
        self.allRootToLeafPathHelper(node: self, values: [T]())
    }
    
    private func allRootToLeafPathHelper(node: BinaryTreeNode, values: [T]) {
        var values = values
        values.append(node.value)
        
        guard !node.isLeaf else {
            print(values)
            return
        }
        
        if let left = node.left {
            self.allRootToLeafPathHelper(node: left, values: values)
        }
        
        if let right = node.right {
            self.allRootToLeafPathHelper(node: right, values: values)
        }
        
    }
    
}
