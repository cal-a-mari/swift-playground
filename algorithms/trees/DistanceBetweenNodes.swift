//
//  DistanceBetweenNodes.swift
//  Test
//
//  Created by Mari Batilando on 6/26/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension BinaryTreeNode {
    
    func distanceBetween(nodeWithValueA valueA: T, andNodeWithValueB valueB: T) -> Int? {
        guard let lca = self.leastCommonAncestor(ofNodeWithValueA: valueA, andNodeWithValueB: valueB) else {
            return nil
        }
        
        let distanceToA = self.distance(fromNode: lca, toNodeWithValue: valueA)
        let distanceToB = self.distance(fromNode: lca, toNodeWithValue: valueB)
        
        return distanceToA + distanceToB
    }
    
    private func distance(fromNode node: BinaryTreeNode, toNodeWithValue value: T) -> Int {
        return self.distanceHelper(node: node, valueToSearch: value, counter: 0)
    }
    
    private func distanceHelper(node: BinaryTreeNode, valueToSearch value: T, counter: Int) -> Int {
        if node.value == value {
            return counter
        }
        
        var leftCounter = Int.max
        if let left = node.left {
            leftCounter = self.distanceHelper(node: left, valueToSearch: value, counter: counter + 1)
        }
        
        var rightCounter = Int.max
        if let right = node.right {
            rightCounter = self.distanceHelper(node: right, valueToSearch: value, counter: counter + 1)
        }
        
        return min(leftCounter, rightCounter)
    }
    
}
