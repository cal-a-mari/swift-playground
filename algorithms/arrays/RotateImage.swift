//
//  RotateImage.swift
//  Test
//
//  Created by Mari Batilando on 9/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 */
func rotate(matrix: inout [[Int]]) {
    if matrix.isEmpty {
        return
    }
    
    if matrix.first!.isEmpty {
        return
    }
    
    let n = matrix.count
    
    // By using the relation "matrix[i][j] = matrix[n-1-j][i]", we can loop through the matrix.
    for i in 0..<n / 2 {
        for j in 0...n / 2 {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[n - 1 - j][i]
            matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j]
            matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i]
            matrix[j][n - 1 - i] = temp
        }
    }
}

func rotateTests() {
    var matrix1 = [[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]]
    let _ = [[7, 4, 1],
             [8, 5, 2],
             [9, 6, 3]]
    print(rotate(matrix: &matrix1))
}
