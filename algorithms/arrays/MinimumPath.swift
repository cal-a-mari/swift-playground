//
//  MinimumPath.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a cost matrix cost[][] and a position (m, n) in cost[][], write a function that returns cost of minimum cost path to reach (m, n) from (0, 0). Each cell of the matrix represents a cost to traverse through that cell. Total cost of a path to reach (m, n) is sum of all the costs on that path (including both source and destination). You can only traverse down, right and diagonally lower cells from a given cell
 */

func minPath(matrix: [[Int]]) -> Int {
    return minPath(matrix: matrix, i: 0, j: 0)
}

// O(3^n)
private func minPath(matrix: [[Int]], i: Int, j: Int) -> Int {
    let m = matrix.count
    let n = matrix.first!.count
    
    if (i == m - 1) && (j == n - 1) {
        return matrix[i][j]
    }
    
    var diagonal = Int.max
    if (i < m - 1) && (j < n - 1) {
        diagonal = matrix[i][j] + minPath(matrix: matrix, i: i + 1, j: j + 1)
    }
    
    var down = Int.max
    if i < m - 1 {
        down = matrix[i][j] + minPath(matrix: matrix, i: i + 1, j: j)
    }
    
    var right = Int.max
    if j < n - 1 {
        right = matrix[i][j] + minPath(matrix: matrix, i: i, j: j + 1)
    }
    
    return min(diagonal, down, right)
}

func optMinPath(matrix: [[Int]]) -> Int {
    var values = Array(repeatElement(Array(repeatElement(0, count: matrix.first!.count)), count: matrix.count))
    values[0][0] = matrix[0][0]
    
    let m = matrix.count
    let n = matrix.first!.count
    
    // First Column
    for i in 1..<m {
        values[i][0] = matrix[i][0] + values[i - 1][0]
    }
    
    // First row
    for j in 1..<n {
        values[0][j] = matrix[0][j] + values[0][j - 1]
    }
    
    
    for i in 1..<matrix.count {
        for j in 1..<matrix.first!.count {
            let up = values[i - 1][j]
            let left = values[i][j - 1]
            let diag = values[i - 1][j - 1]
            
            values[i][j] = matrix[i][j] + min(up, left, diag)
        }
    }
    
    return values[m - 1][n - 1]
}























