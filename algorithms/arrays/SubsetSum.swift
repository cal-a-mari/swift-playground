//
//  SubsetSum.swift
//  Test
//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given a set of non-negative integers, and a value sum, determine if there is a subset of the given set with sum equal to given sum.
 Examples: let set = [3, 34, 4, 12, 5, 2], sum = 9
 Output:  True  //There is a subset (4, 5) with sum 9.
 */
func set(_ set: [Int], includesSubsetWithSum sum: Int) -> Bool {
    return setHelper(set, sum: sum, n: set.count - 1)
}

private func setHelper(_ set: [Int], sum: Int, n: Int) -> Bool {
    if sum == 0 {
        return true
    } else if (n == 0) && (sum != 0) {
        return false
    }
    
    return setHelper(set, sum: sum - set[n], n: n - 1) || setHelper(set, sum: sum, n: n - 1)
}

func tabularSet(_ set: [Int], includesSubsetWithSum sum: Int) -> Bool {
    // values[i][j] is true if there is a subset in set[0...j-1] that is equal to i
    var values = Array(repeatElement(Array(repeatElement(false, count: set.count + 1)), count: sum + 1))
    
    // If the sum is 0 then there is a subset
    for j in 0...set.count {
        values[0][j] = true
    }
    
    for i in 1...sum {
        for j in 1...set.count { // We start at 1 b/c a non-zero sum with a non-empty set is already false
            values[i][j] = values[i][j - 1]
            
            if i >= set[j - 1] {
                values[i][j] =  values[i][j] || values[i - set[j - 1]][j - 1]
            }
            
        }
    }
    
    return values[sum][set.count]
}
