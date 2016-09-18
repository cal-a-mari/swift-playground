//
//  RotateMatrix2.swift
//  Test
//
//  Created by Mari Batilando on 9/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func ==(lhs: [[Int]], rhs: [[Int]]) -> Bool {
    if lhs.count != rhs.count {
        return false
    }
    
    for (i, arr) in lhs.enumerated() {
        if rhs[i] != arr {
            return false
        }
    }
    
    return true
}

/*
     Given a matrix, clockwise rotate elements in it.
 */
// O(m * n)
func clockwiseRotateElements(matrix: inout [[Int]]) {
    if matrix.isEmpty {
        return
    }
    
    if matrix.first!.isEmpty {
        return
    }
    
    var rowStart = 0
    var rowEnd = matrix.count
    var colStart = 0
    var colEnd = matrix.first!.count
    
    while rowStart < rowEnd && colStart < colEnd {
        if rowStart + 1 == rowEnd || colStart + 1 == colEnd {
            return
        }
        
        // Store the first element of next row, this
        // element will replace first element of current
        // row
        var prev = matrix[rowStart + 1][colStart]
        
        var i = colStart
        while i < colEnd {
            let curr = matrix[rowStart][i]
            matrix[rowStart][i] = prev
            prev = curr
            i += 1
        }
        
        rowStart += 1
        
        i = rowStart
        while i < rowEnd {
            let curr = matrix[i][colEnd - 1]
            matrix[i][rowEnd - 1] = prev
            prev = curr
            i += 1
        }
        
        colEnd -= 1
        
        if rowStart < rowEnd {
            var i = colEnd - 1
            
            while i >= colStart {
                let curr = matrix[rowEnd - 1][i]
                matrix[rowEnd - 1][i] = prev
                prev = curr
                i -= 1
            }
        }
        
        rowEnd -= 1
        
        if colStart < colEnd {
            var i = rowEnd - 1
            
            while i >= rowStart {
                let curr = matrix[i][colStart]
                matrix[i][colStart] = prev
                prev = curr
                i -= 1
            }
        }
        
        colStart += 1
    }
    
}

func rotateMatrix2Tests() {
    var matrix1 = [[1, 2, 3, 4],
                   [5, 6, 7, 8],
                   [9, 10, 11, 12],
                   [13, 14, 15, 16]]
    let res1 = [[5, 1, 2, 3],
                [9, 10, 6, 4],
                [13, 11, 7, 8],
                [14, 15, 16, 12]]
    clockwiseRotateElements(matrix: &matrix1)
    assert(res1 == matrix1)
}
