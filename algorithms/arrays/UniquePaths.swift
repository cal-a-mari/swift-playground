//
//  UniquePaths.swift
//  Test
//
//  Created by Mari Batilando on 8/14/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func numberOfUniquePaths(m: Int, n: Int) -> Int {
    return numberOfUniquePaths(m: m, n: n, i: 0, j: 0)
}

private func numberOfUniquePaths(m: Int, n: Int, i: Int, j: Int) -> Int {
    if (i == m - 1) && (j == n - 1) {
        return 1
    }
    
    // Move down
    var downPath = 0
    if i < m - 1 {
        downPath = numberOfUniquePaths(m: m, n: n, i: i + 1, j: j)
    }
    
    // Move right
    var rightPath = 0
    if j < n - 1 {
        rightPath = numberOfUniquePaths(m: m, n: n, i: i, j: j + 1)
    }
    
    return downPath + rightPath
}

func optNumberOfUniquePaths(m: Int, n: Int) -> Int {
    if m == 0 || n == 0 {
        return 0
    } else if m == 1 || n == 1 {
        return 1
    }
    
    // values[i][j] contains the number of unique paths to reach i, j
    var values = Array(repeatElement(Array(repeatElement(0, count: n)), count: m))
    
    for i in 0..<m {
        values[i][0] = 1
    }
    
    for j in 0..<n {
        values[0][j] = 1
    }
    
    for i in 1..<m {
        for j in 1..<n {
            values[i][j] = values[i - 1][j] + values[i][j - 1]
        }
    }
    
    return values[m - 1][n - 1]
}
