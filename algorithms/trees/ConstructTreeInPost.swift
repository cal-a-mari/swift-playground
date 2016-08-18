//
//  ConstructTreeInPost.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
	Given inorder and postorder traversal of a tree, construct the binary tree.
*/

func constructTree(inOrder: [Int], postOrder: [Int]) -> BinaryTreeNode<Int>? {
	var postIndex = postOrder.endIndex - 1
	return constructTree(inOrder: inOrder,
	                     postOrder: postOrder,
	                     inStart: inOrder.startIndex,
	                     inEnd: inOrder.endIndex - 1,
	                     postIndex: &postIndex)
}

private func constructTree(inOrder: [Int], postOrder: [Int], inStart: Int, inEnd: Int, postIndex: inout Int) -> BinaryTreeNode<Int>? {
	guard inStart <= inEnd else {
		return nil
	}
	
	let rootValue = postOrder[postIndex]
	let root = BinaryTreeNode(value: rootValue, parent: nil)
	postIndex -= 1
	
	if inStart == inEnd {
		return root
	}
	
	var rootIndex: Int!
	for i in inStart...inEnd {
		if inOrder[i] == rootValue {
			rootIndex = i
			break
		}
	}
	
	root.right = constructTree(inOrder: inOrder,
	                           postOrder: postOrder,
	                           inStart: rootIndex + 1,
	                           inEnd: inEnd,
	                           postIndex: &postIndex)
	
	root.left = constructTree(inOrder: inOrder,
	                          postOrder: postOrder,
	                          inStart: inStart,
	                          inEnd: rootIndex - 1,
	                          postIndex: &postIndex)
	
	return root
}
