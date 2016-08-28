//
//  ClosestBSTValue.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
 */

//O(logn)
func closestValue(inBST root: BinarySearchTreeNode<Int>, value: Int) -> Int {
    var min = Int.max
    closestValue(root: root, value: value, minVal: &min)
    return min
}

private func closestValue(root: BinarySearchTreeNode<Int>, value: Int, minVal: inout Int) {
    if root.value == value {
        minVal = root.value
        return
    }
    
    let diff = abs(value - root.value)
    
    if diff < abs(value - minVal) {
        minVal = root.value
    }
    
    if let left = root.left where value < root.value {
        closestValue(root: left, value: value, minVal: &minVal)
    }
    
    if let right = root.right where value > root.value {
        closestValue(root: right, value: value, minVal: &minVal)
    }
}
