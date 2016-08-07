//
//  SmallestSubArray.swift
//  Test
//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an array of integers and a number x, find the smallest subarray with sum greater than the given value.
 arr[] = {1, 4, 45, 6, 0, 19}
 x  =  51
 Output: 3
 Minimum length subarray is {4, 45, 6}
 */

func smallestSubArray(withSumGreaterThanValue value: Int, array: [Int]) -> Int {
    return smallestSubArray(value: value, array: array)
}

private func smallestSubArray(value: Int, array: [Int]) -> Int {
    var minLen = array.count + 1
    
    for start in 0..<array.count {
        var currSum = array[start]
        
        if currSum > value {
            return 1
        }
        
        for end in start + 1..<array.count {
            currSum += array[end]
            
            if (currSum > value) && (end - start + 1 < minLen) {
                minLen = end - start + 1
            }
        }
    }
    
    if minLen == array.count + 1 {
        assertionFailure("Did not find subarray that is greater than value: \(value)")
    }
    
    return minLen
}
