//
//  SpiralTraverse.swift
//  Test
//
//  Created by Mari Batilando on 8/13/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func spiralTraverse(matrix: [[Int]], m: Int, n: Int) -> [Int] {
    var result = [Int]()
    var m = m
    var n = n
    var k = 0 // row index
    var l = 0 // col index
    
    while (k < m) && (l < n) {
        // print start of remaining rows
        for i in l..<n {
            result.append(matrix[k][i])
        }
        
        k += 1
        
        // print last of remaining columns
        for i in k..<m {
            result.append(matrix[i][n - 1])
        }
        
        n -= 1
        
        // print last of remaining rows
        if k < m {
            var i = n - 1
            
            while i >= l {
                result.append(matrix[m - 1][i])
                i -= 1
            }
            
            m -= 1
        }
        
        // print first of remaining columns
        if l < n {
            var i = m - 1
            
            while i >= k {
                result.append(matrix[i][l])
                i -= 1
            }
            
            l += 1
        }
    }
    
    return result
}
