//
//  MaxRobTree.swift
//  Test
//
//  Created by Mari Batilando on 9/1/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func maxRob(tree: BinaryTreeNode<Int>) -> Int {
    let result = maxRobHelper(tree: tree)
    return max(result.0, result.1)
}

typealias RobResult = (selectedValue: Int, excludedValue: Int)

// O(n)
private func maxRobHelper(tree: BinaryTreeNode<Int>) -> RobResult {
    
    var leftResult = (0, 0)
    if let left = tree.left {
        leftResult = maxRobHelper(tree: left)
    }
    
    var rightResult = (0, 0)
    if let right = tree.right {
        rightResult = maxRobHelper(tree: right)
    }
    
    let includedRoot = tree.value + leftResult.1 + rightResult.1
    let excludedRoot = max(leftResult.0, leftResult.1) + max(rightResult.0, rightResult.1)
    
    return (includedRoot, excludedRoot)
}

func maxRobTreeTests() {
    let tree1 = constructBT1()
    print("Should be 7: \(maxRob(tree: tree1))")
    
    let tree2 = constructBT2()
    print("Should be 9: \(maxRob(tree: tree2))")
}

private func constructBT1() -> BinaryTreeNode<Int> {
    let node1 = BinaryTreeNode(value: 3, parent: nil)
    let node2 = BinaryTreeNode(value: 2, parent: node1)
    let node3 = BinaryTreeNode(value: 3, parent: node1)
    node1.left = node2
    node1.right = node3
    
    let node4 = BinaryTreeNode(value: 3, parent: node2)
    let node5 = BinaryTreeNode(value: 1, parent: node2)
    node2.right = node4
    node3.right = node5
    
    return node1
}

private func constructBT2() -> BinaryTreeNode<Int> {
    let node1 = BinaryTreeNode(value: 3, parent: nil)
    let node2 = BinaryTreeNode(value: 4, parent: node1)
    let node3 = BinaryTreeNode(value: 5, parent: node1)
    node1.left = node2
    node1.right = node3
    
    let node4 = BinaryTreeNode(value: 1, parent: node2)
    let node5 = BinaryTreeNode(value: 3, parent: node2)
    node2.left = node4
    node2.right = node5
    
    let node6 = BinaryTreeNode(value: 1, parent: node2)
    node3.right = node6
    
    return node1
}
