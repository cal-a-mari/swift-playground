//
//  UniqueRows.swift
//  Test
//
//  Created by Mari Batilando on 9/17/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

private final class MatrixTrieNode {
    var children = [MatrixTrieNode]()
    var key: Int?
    
    init(key: Int?) {
        self.key = key
    }
}

private final class MatrixTrie {
    var root = MatrixTrieNode(key: nil)
    
    /// Returns true if row didn't exist in the trie before
    func insert(row: [Int]) -> Bool {
        var currNode = self.root
        var isUnique = false
        
        for element in row {
            if let i = (currNode.children.index { $0.key == element }) {
                currNode = currNode.children[i]
                isUnique = false
            } else {
                let newNode = MatrixTrieNode(key: element)
                currNode.children.append(newNode)
                currNode = newNode
                isUnique = true
            }
        }
        
        return isUnique
    }
    
}
// O(m * n) runtime and space
func uniqueRows(inMatrix matrix: [[Int]]) -> [[Int]] {
    if matrix.isEmpty {
        return []
    }
    
    if matrix.first!.isEmpty {
        return []
    }
    
    let m = matrix.count
    let trie = MatrixTrie()
    var res = [[Int]]()

    for i in 0..<m {
        if trie.insert(row: matrix[i]) {
            res.append(matrix[i])
        }
    }
    
    return res
}

func uniqueRowsTests() {
    let matrix1 = [[0, 1, 0, 0, 1],
                   [1, 0, 1, 1, 0],
                   [0, 1, 0, 0, 1],
                   [1, 0, 1, 0, 0]]
    let res1 = [[0, 1, 0, 0, 1],
                [1, 0, 1, 1, 0],
                [1, 0, 1, 0, 0]]
    let actualRes1 = uniqueRows(inMatrix: matrix1)
    print(actualRes1)
//    assert(actualRes1 == res1)
    
    let matrix2 = [[0, 1, 0, 0, 1]]
    let res2 = [[0, 1, 0, 0, 1]]
    let actualRes2 = uniqueRows(inMatrix: matrix2)
    print(actualRes2)
//    assert(actualRes2 == res2)
}
