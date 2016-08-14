//
//  ConstructTreeInPost.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    static func constructTree(inOrder: [T], postOrder: [T]) -> BinaryTreeNode {
        return self.constructTree(inOrder: inOrder,
                                  inStart: inOrder.startIndex,
                                  inEnd: inOrder.endIndex - 1,
                                  postOrder: postOrder,
                                  postStart: postOrder.startIndex,
                                  postEnd: postOrder.endIndex - 1)!
    }
    
    private static func constructTree(inOrder: [T], inStart: Int, inEnd: Int, postOrder: [T], postStart: Int, postEnd: Int) -> BinaryTreeNode? {
        if inStart > inEnd || postStart > postEnd {
            return nil
        }
        
        let root = BinaryTreeNode(value: postOrder[postEnd], parent: nil)
        let rootIndex = inOrder.index { $0 == postOrder[postEnd] }!
        
        root.left = self.constructTree(inOrder: inOrder,
                                       inStart: inStart,
                                       inEnd: rootIndex - 1,
                                       postOrder: postOrder,
                                       postStart: postStart,
                                       postEnd: postStart + rootIndex - (inStart + 1))
        
        root.right = self.constructTree(inOrder: inOrder,
                                        inStart: rootIndex + 1,
                                        inEnd: inEnd,
                                        postOrder: postOrder,
                                        postStart: postStart + rootIndex - inStart,
                                        postEnd: postEnd - 1)
        
        return root
    }
    
}
