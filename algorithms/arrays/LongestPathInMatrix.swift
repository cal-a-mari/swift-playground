//
//  LongestPathInMatrix.swift
//  Test
//
//  Created by Mari Batilando on 7/30/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func longestPath(inMatrix matrix: [[Int]]) -> Int {
    var values = [Int: [Int: Int]]()
    
    for i in 0..<matrix.endIndex {
        for j in 0..<matrix.endIndex {
            let _ = longestPathOfCell(inMatrix: matrix, i: i, j: j, values: &values)
        }
    }
    
    let pathTuples = values.flatMap { return $1 }
    let pathVals = pathTuples.map { return $1 }
    
    return pathVals.max()!
}

private func longestPathOfCell(inMatrix matrix: [[Int]], i: Int, j: Int, values: inout [Int: [Int: Int]]) -> Int {
    if i < 0 || j < 0 || i >= matrix.count || j >= matrix.count {
        return 0
    }
    
    if let memoizedValue = values[i]?[j] {
        return memoizedValue
    } else {
        let nextNumber = matrix[i][j] + 1
        values[i] = [j: 1]
        
        if (i > 0) && (matrix[i - 1][j] == nextNumber) {
            values[i]![j] = 1 + longestPathOfCell(inMatrix: matrix, i: i - 1, j: j, values: &values)
        } else if (i < matrix.count - 1) && (matrix[i + 1][j] == nextNumber) {
            values[i]![j] = 1 + longestPathOfCell(inMatrix: matrix, i: i + 1, j: j, values: &values)
        } else if (j > 0) && (matrix[i][j - 1] == nextNumber) {
            values[i]![j] = 1 + longestPathOfCell(inMatrix: matrix, i: i, j: j - 1, values: &values)
        } else if (j < matrix.count - 1) && (matrix[i][j + 1] == nextNumber) {
            values[i]![j] = 1 + longestPathOfCell(inMatrix: matrix, i: i, j: j + 1, values: &values)
        }
        
        return values[i]![j]!
    }
}
