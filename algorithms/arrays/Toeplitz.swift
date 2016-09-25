//
//  Toeplitz.swift
//  Test
//
//  Created by Mari Batilando on 9/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func isToeplitz(matrix: [[Int]]) -> Bool {
    if matrix.isEmpty {
        return false
    }
    
    if matrix.first!.isEmpty {
        return false
    }
    
    let m = matrix.count
    let n = matrix.first!.count
    
    for i in 0..<m {
        for j in 0..<n {
            let diagRow = i + 1
            let diagCol = j + 1
            
            if diagRow < m && diagCol < n {
                if matrix[i][j] != matrix[diagRow][diagCol] {
                    return false
                }
            }
        }
    }
    
    return true
}

func isToeplitzTests() {
    let matrix1 = [[6, 7, 8],
                   [4, 6, 7],
                   [1, 4, 6]]
    let res1 = true
    let actualRes1 = isToeplitz(matrix: matrix1)
    assert(res1 == actualRes1)
    
    let matrix2 = [[6, 7, 8],
                   [4, 6, 4],
                   [1, 4, 6]]
    let res2 = false
    let actualRes2 = isToeplitz(matrix: matrix2)
    assert(res2 == actualRes2)
    
    let matrix3 = [[6, 7, 8, 9],
                   [4, 6, 7, 8],
                   [1, 4, 6, 7],
                   [0, 1, 4, 6],
                   [2, 0, 1, 4]]
    let res3 = true
    let actualRes3 = isToeplitz(matrix: matrix3)
    assert(res3 == actualRes3)
}
