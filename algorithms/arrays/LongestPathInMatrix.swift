//
//  LongestPathInMatrix.swift
//  Test
//
//  Created by Mari Batilando on 7/30/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func longestIncrementingPath(inMatrix matrix: [[Int]]) -> Int {
    var values = Array(repeatElement(Array(repeatElement(-1, count: matrix.count)), count: matrix.count))
    
    for i in 0..<matrix.count {
        for j in 0..<matrix.count {
            let _  = longestIncrementingPath(inMatrix: matrix, i: i, j: j, values: &values)
        }
    }
    
    return values.flatMap { $0 }.max()!
}

private func longestIncrementingPath(inMatrix matrix: [[Int]], i: Int, j: Int, values: inout [[Int]]) -> Int {
    if values[i][j] != -1 {
        return values[i][j]
    }
    
    let nextValue = matrix[i][j] + 1
    
    if (i > 0) && (matrix[i - 1][j] == nextValue) {
        values[i][j] = 1 + longestIncrementingPath(inMatrix: matrix, i: i - 1, j: j, values: &values)
    } else if (i < matrix.count - 1) && (matrix[i + 1][j] == nextValue) {
        values[i][j] = 1 + longestIncrementingPath(inMatrix: matrix, i: i + 1, j: j, values: &values)
    } else if (j > 0) && (matrix[i][j - 1] == nextValue) {
        values[i][j] = 1 + longestIncrementingPath(inMatrix: matrix, i: i, j: j - 1, values: &values)
    } else if (j < matrix.count - 1) && (matrix[i][j + 1] == nextValue) {
        values[i][j] = 1 + longestIncrementingPath(inMatrix: matrix, i: i, j: j + 1, values: &values)
    } else {
        values[i][j] = 1
    }
    
    return values[i][j]
}
