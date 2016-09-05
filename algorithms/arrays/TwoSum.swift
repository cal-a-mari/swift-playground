//
//  TwoSum.swift
//  Test
//
//  Created by Mari Batilando on 9/5/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an array of integers, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, 
 where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=0, index2=1
 */
// O(n^2)
func twoSum(target: Int, array: [Int]) -> (Int, Int)? {
    for i in 0..<array.count - 1 {
        for j in (i + 1)..<array.count {
            if array[i] + array[j] == target {
                return (i, j)
            }
        }
    }
    
    return nil
}

// O(n) runtime and space
func twoSumOpt(target: Int, array: [Int]) -> (Int, Int)? {
    var map = [Int: Int]()
    
    for i in 0..<array.count {
        if let j = map[array[i]] {
            return (j, i)
        } else {
            map[target - array[i]] = i
        }
    }
    
    return nil
}

func twoSumTests() {
    let arr1 = [2, 7, 11, 15]
    print("Should be (0, 1): \(twoSumOpt(target: 9, array: arr1))")
    print("Should be nil: \(twoSumOpt(target: 11, array: arr1))")
    print("Should be nil: \(twoSumOpt(target: 16, array: arr1))")
    print("Should be (2, 3): \(twoSumOpt(target: 26, array: arr1))")
}
