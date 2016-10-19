//
//  CombinationsTarget.swift
//  Test
//
//  Created by Mari Batilando on 10/18/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func combinations(target: Int) -> [[Int]] {
    var res = [[Int]]()
    combinations(target: target, i: 1, curr: [Int](), res: &res)
    return res
}

private func combinations(target: Int, i: Int, curr: [Int], res: inout [[Int]]) {
    if target == 0 {
        res.append(curr)
        return
    }
    
    if target < 0 {
        return
    }
    
    if i > target {
        return
    }
    
    for j in i...target {
        if j <= target {
            var new = curr
            new.append(j)
            combinations(target: target - j, i: j, curr: new, res: &res)
        }
    }
}

func combinationsTests() {
    let t1 = 5
    let actualRes1 = combinations(target: t1)
    let res1 = [[1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 3], [1, 2, 2], [1, 4], [2, 3], [5]]
    assert(actualRes1 == res1)
    
    let t2 = 3
    let actualRes2 = combinations(target: t2)
    let res2 = [[1, 1, 1], [1, 2], [3]]
    assert(actualRes2 == res2)
    
    print(combinations(target: 50))
}
