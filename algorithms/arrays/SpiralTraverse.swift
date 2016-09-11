//
//  SpiralTraverse.swift
//  Test
//
//  Created by Mari Batilando on 8/13/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func printSpiral(matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty {
        return []
    }
    
    if matrix.first!.isEmpty {
        return []
    }
    
    var res = [Int]()
    
    var rowStart = 0
    var rowEnd = matrix.count
    
    var colStart = 0
    var colEnd = matrix.first!.count
    
    while rowStart < rowEnd && colStart < colEnd {
        var i = colStart
        while i < colEnd {
            res.append(matrix[rowStart][i])
            i += 1
        }
        
        rowStart += 1
        
        i = rowStart
        while i < rowEnd {
            res.append(matrix[i][colEnd - 1])
            i += 1
        }
        
        colEnd -= 1
        
        if rowStart < rowEnd {
            i = colEnd - 1
            while i >= colStart {
                res.append(matrix[rowEnd - 1][i])
                i -= 1
            }
            
            rowEnd -= 1
        }
        
        if colStart < colEnd {
            i = rowEnd - 1
            while i >= rowStart {
                res.append(matrix[i][colStart])
                i -= 1
            }
            
            colStart += 1
        }
    }
    
    return res
}

func spiralTraverseTests() {
    let matrix1 = [[1, 2, 3, 4],
                   [5, 6, 7, 8],
                   [9, 10, 11, 12],
                   [13, 14, 15, 16]]
    let res1 = [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
    let actualRes1 = printSpiral(matrix: matrix1)
    assert(actualRes1 == res1)
    
    let matrix2 = [[1, 2, 3, 4, 5, 6],
                   [7, 8, 9, 10, 11, 12],
                   [13, 14, 15, 16, 17, 18]]
    let res2 = [1, 2, 3, 4, 5, 6, 12, 18, 17, 16, 15, 14, 13, 7, 8, 9, 10, 11]
    let actualRes2 = printSpiral(matrix: matrix2)
    assert(actualRes2 == res2)
}
