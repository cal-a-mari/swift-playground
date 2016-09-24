//
//  CombinationSum.swift
//  Test
//
//  Created by Mari Batilando on 9/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a set of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T. The same repeated number may be chosen from C unlimited number of times.
 
 Note: All numbers (including target) will be positive integers. Elements in a combination (a1, a2, ... , ak) must be in non-descending order. (ie, a1 <= a2 <= ... <= ak). The solution set must not contain duplicate combinations. For example, given candidate set 2,3,6,7 and target 7, A solution set is:
 */
func combinationSum(target: Int, numbers: [Int]) -> [[Int]] {
    var res = [[Int]]()
    let numbers = numbers.sorted { $0 < $1 }
    combinationSum(target: target, numbers: numbers, i: 0, curr: [Int](), res: &res)
    return res
}

private func combinationSum(target: Int, numbers: [Int], i: Int, curr: [Int], res: inout [[Int]]) {
    if target == 0 {
        res.append(curr)
        return
    }
    
    if target < 0 {
        return
    }
    
    for j in i..<numbers.count {
        if numbers[j] <= target {
            var newCurr = curr
            newCurr.append(numbers[j])
            combinationSum(target: target - numbers[j], numbers: numbers, i: j, curr: newCurr, res: &res)
        }
    }
}

func combinationSumTests() {
    let target1 = 7
    let numbers1 = [2, 3, 6, 7]
    let res1 = [[2, 2, 3], [7]]
    let actualRes1 = combinationSum(target: target1, numbers: numbers1)
    assert(res1 == actualRes1)
    
    let target2 = 10
    let res2 = [[2, 2, 2, 2, 2], [2, 2, 3, 3], [2, 2, 6], [3, 7]]
    let actualRes2 = combinationSum(target: target2, numbers: numbers1)
    assert(res2 == actualRes2)
    
    let target3 = 1
    let res3 = [[Int]]()
    let actualRes3 = combinationSum(target: target3, numbers: numbers1)
    assert(res3 == actualRes3)
}
