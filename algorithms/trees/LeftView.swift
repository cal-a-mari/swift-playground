//
//  LeftView.swift
//  Kata
//
//  Created by Mari Batilando on 8/30/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

func leftView(ofTree tree: BinaryTreeNode<Int>) -> [Int] {
	var nodes = [Int]()
	var maxLevel = -1
	leftView(node: tree, currLevel: 0, maxLevel: &maxLevel, values: &nodes)
	return nodes
}

private func leftView(node: BinaryTreeNode<Int>, currLevel: Int, maxLevel: inout Int, values: inout [Int]) {
	if currLevel > maxLevel {
		values.append(node.value)
		maxLevel = currLevel
	}
	
	if let left = node.left {
		leftView(node: left, currLevel: currLevel + 1, maxLevel: &maxLevel, values: &values)
	}
	
	if let right = node.right {
		leftView(node: right, currLevel: currLevel + 1, maxLevel: &maxLevel, values: &values)
	}
}
