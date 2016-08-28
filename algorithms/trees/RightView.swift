//
//  RightView.swift
//  Test
//
//  Created by Mari Batilando on 8/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation
/*
    Given a Binary Tree, print Right view of it. Right view of a Binary Tree is set of nodes visible when tree is visited from Right side.
 */
func rightView(ofTree tree: BinaryTreeNode<Int>) -> [Int] {
    var values = [Int]()
    var maxLevel = 0
    rightView(node: tree, level: 1, maxLevel: &maxLevel, values: &values)
    return values
}

private func rightView(node: BinaryTreeNode<Int>, level: Int, maxLevel: inout Int, values: inout [Int]) {
    if maxLevel < level {
        values.append(node.value)
        maxLevel = level
    }
    
    if let right = node.right {
        rightView(node: right, level: level + 1, maxLevel: &maxLevel, values: &values)
    }
    
    if let left = node.left {
        rightView(node: left, level: level + 1, maxLevel: &maxLevel, values: &values)
    }
}
