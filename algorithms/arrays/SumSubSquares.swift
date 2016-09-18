//
//  SumSubSquares.swift
//  Test
//
//  Created by Mari Batilando on 9/17/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an n x n square matrix, find sum of all sub-squares of size k x k where k is smaller than or equal to n.
 */
// O(k^2 * n^2)
func sum(ofAllSubsquares k: Int, inMatrix matrix: [[Int]]) -> [Int] {
    if k > matrix.count {
        return []
    }
    
    let n = matrix.count
    var sum = [Int]()
    
    for i in 0..<n - k + 1 {
        for j in 0..<n - k + 1 {
            var currSum = 0
            
            for l in i..<i + k {
                for m in j..<j + k {
                    currSum += matrix[l][m]
                }
            }
            
            sum.append(currSum)
        }
    }
    
    return sum
}
/*
 The idea is to preprocess the given square matrix.
 In the preprocessing step, calculate sum of all vertical strips of size k x 1 in a temporary
 square matrix stripSum[][]. Once we have sum of all vertical strips, we can calculate sum 
 of first sub-square in a row as sum of first k strips in that row, and for remaining 
 sub-squares, we can calculate sum in O(1) time by removing the leftmost strip of
 previous subsquare and adding the rightmost strip of new square.
 
 */
// O(n^2) runtime
func optSum(ofAllSubsquares k: Int, inMatrix matrix: [[Int]]) -> [Int] {
    if k > matrix.count {
        return []
    }
    
    let n = matrix.count
    
    var preProcess = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for j in 0..<n {
        var sum = 0
        
        for i in 0..<k {
            sum += matrix[i][j]
        }
        
        preProcess[0][j] = sum
        
        for i in 1..<(n - k + 1) {
            sum += matrix[i + k - 1][j] - matrix[i - 1][j]
            preProcess[i][j] = sum
        }
    }
    
    var res = [Int]()
    
    for i in 0..<n - k + 1 {
        var sum = 0
        
        for j in 0..<k {
            sum += preProcess[i][j]
        }
        
        res.append(sum)
        
        for j in 1..<n - k + 1 {
            sum += preProcess[i][j + k - 1] - preProcess[i][j - 1]
            res.append(sum)
        }
    }
    
    return res
}

func subsquareTests() {
    let matrix1 = [[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]]
    let res1 = [12, 16, 24, 28]
    let actualRes1 = optSum(ofAllSubsquares: 2, inMatrix: matrix1)
    assert(actualRes1 == res1)
    
    let matrix2 = [[1, 1, 1],
                   [1, 1, 1]]
    let res2 = []
    let actualRes2 = optSum(ofAllSubsquares: 3, inMatrix: matrix2)
    assert(actualRes2 == res2)
}
