//
//  SortedArrayToBST.swift
//  Test
//
//  Created by Mari Batilando on 8/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 */

func sortedArrayToBST(_ array: [Int]) -> BinaryTreeNode<Int>? {
    guard !array.isEmpty else {
        return nil
    }
    
    return sortedArrayToBST(array: array, i: 0, j: array.count - 1)
}

private func sortedArrayToBST(array: [Int], i: Int, j: Int) -> BinaryTreeNode<Int>? {
    if i > j {
        return nil
    }
    
    let mid = (i + j) / 2
    let node = BinaryTreeNode(value: array[mid], parent: nil)
    
    node.left = sortedArrayToBST(array: array, i: i, j: mid - 1)
    node.right = sortedArrayToBST(array: array, i: mid + 1, j: j)
    
    return node
}
