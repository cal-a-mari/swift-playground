//
//  Island.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a 2-d grid map of '1's (land) and '0's (water), count the number of islands.
 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
 You may assume all four edges of the grid are all surrounded by water.
 */
// O(m*n)
func numberOfIslands(inMatrix matrix: [[Int]]) -> Int {
    var count = 0
    var matrix = matrix
    let m = matrix.count
    let n = matrix.first!.count
    
    for i in 0..<m {
        for j in 0..<n {
            if matrix[i][j] == 1 {
                count += 1
                merge(matrix: &matrix, i: i, j: j)
            }
        }
    }
    
    return count
}

private func merge(matrix: inout [[Int]], i: Int, j: Int) {
    let m = matrix.count
    let n = matrix.first!.count
    
    guard (i >= 0) && (i < m) && (j >= 0) && (j < n) && (matrix[i][j] == 1) else {
        return
    }
    
    matrix[i][j] = -1
    merge(matrix: &matrix, i: i - 1, j: j)
    merge(matrix: &matrix, i: i + 1, j: j)
    merge(matrix: &matrix, i: i, j: j - 1)
    merge(matrix: &matrix, i: i, j: j + 1)
}
