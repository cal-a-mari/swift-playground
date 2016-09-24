//
//  RangeNumberCombinations.swift
//  Test
//
//  Created by Mari Batilando on 9/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
     Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 */

func rangeCombinations(n: Int, k: Int) -> [[Int]] {
    if k > n || n <= 0 {
        return []
    }
    
    var res = [[Int]]()
    combinations(n: n, k: k, i: 1, curr: [Int](), res: &res)
    return res
}

private func combinations(n: Int, k: Int, i: Int, curr: [Int], res: inout [[Int]]) {
    if curr.count == k {
        res.append(curr)
        return
    }
    
    if i > n {
        return
    }
    
    for j in i...n {
        var newCurr = curr
        newCurr.append(j)
        combinations(n: n, k: k, i: j + 1, curr: newCurr, res: &res)
    }
}

func rangeCombinationsTests() {
    let n1 = 4
    let k1 = 2
    let res1 = [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
    let actualRes1 = rangeCombinations(n: n1, k: k1)
    assert(res1 == actualRes1)
}
