//
//  MatrixCountZeroes.swift
//  Test
//
//  Created by Mari Batilando on 9/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
     Given a N x N binary matrix (elements in matrix can be either 1 or 0) where
     each row and column of the matrix is sorted in ascending order, count number of 0s present in it.
 */
// O(m + n)
func countZeroes(inMatrix matrix: [[Int]]) -> Int {
    if matrix.isEmpty {
        return 0
    }
    
    if matrix.first!.isEmpty {
        return 0
    }
    
    let m = matrix.first!.count
    let n = matrix.count
    
    var currRow = n - 1
    var currCol = 0
    var count = 0
    
    while currCol < m {
        while matrix[currRow][currCol] != 0 {
            currRow -= 1
            
            if currRow < 0 {
                return count
            }
        }
        
        count += currRow + 1
        currCol += 1
    }
    
    return count
}

func matrixCountZeroesTests() {
    let matrix1 = [[0, 0, 0, 0, 1],
                   [0, 0, 0, 1, 1],
                   [0, 1, 1, 1, 1],
                   [1, 1, 1, 1, 1],
                   [1, 1, 1, 1, 1]]
    let res1 = 8
    let actualRes1 = countZeroes(inMatrix: matrix1)
    assert(res1 == actualRes1)
    
    let matrix2 = [[0, 1, 1],
                   [1, 1, 1]]
    let res2 = 1
    let actualRes2 = countZeroes(inMatrix: matrix2)
    assert(res2 == actualRes2)
    
    let matrix3 = [[1, 1, 1],
                   [1, 1, 1]]
    let res3 = 0
    let actualRes3 = countZeroes(inMatrix: matrix3)
    assert(res3 == actualRes3)
}
