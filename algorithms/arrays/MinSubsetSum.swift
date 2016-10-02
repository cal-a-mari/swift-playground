//
//  MinSubsetSum.swift
//  Test
//
//  Created by Mari Batilando on 10/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
     Given a set of integers, the task is to divide it into two sets S1 and S2 such that the absolute difference between their sums is minimum.
 */
func subsetWithMinDifference(arr: [Int]) -> Int {
    let total = arr.reduce(0) { $0 + $1 }
    return subsetWithMinDifference(arr: arr, i: arr.count - 1, sum: 0, total: total)
}

private func subsetWithMinDifference(arr: [Int], i: Int, sum: Int, total: Int) -> Int {
    if i < 0 {
        return abs((total - sum) - sum)
    }
    
    return min(subsetWithMinDifference(arr: arr, i: i - 1, sum: sum + arr[i], total: total),
               subsetWithMinDifference(arr: arr, i: i - 1, sum: sum, total: total))
}

func optSubsetWithMinDifference(arr: [Int]) -> Int {
    let sum = arr.reduce(0) { $0 + $1 }
    var vals = Array(repeating: Array(repeating: false, count: sum + 1), count: arr.count + 1)
    
    // 0 sum is possible with all elements
    for i in 0...arr.count {
        vals[i][0] = true
    }
    
    for i in 1...arr.count {
        for j in 1...sum {
            // If i'th element is excluded
            vals[i][j] = vals[i - 1][j]
            
            // If i'th element is included
            if j >= arr[i - 1] {
                vals[i][j] = vals[i - 1][j] || vals[i - 1][j - arr[i - 1]]
            }
        }
    }
    
    // Find the largest j
    for j in (0...sum / 2).reversed() {
        if vals[arr.count][j] {
            return sum - 2 * j
        }
    }
    
    return Int.max
}

func subsetWithMinDiffTests() {
    let arr1 = [3, 1, 4, 2, 2, 1]
    let res1 = 1
    let actualRes1 = optSubsetWithMinDifference(arr: arr1)
    assert(res1 == actualRes1)
    
    let arr2 = [1, 6, 11, 5]
    let res2 = 1
    let actualRes2 = optSubsetWithMinDifference(arr: arr2)
    assert(res2 == actualRes2)
    
    print("Done")
}
