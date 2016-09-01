//
//  LargestSubarray.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example, given the array [−2,1,−3,4,−1,2,1,−5,4], the contiguous subarray [4,−1,2,1] has the largest sum = 6.
 */
// O(n)
func largestSum(inArray array: [Int]) -> Int {
    guard array.count > 0 else {
        return 0
    }
    
    var values = Array(repeatElement(0, count: array.count))
    values[0] = array[0]
    
    for i in 1..<array.count {
        values[i] = max(array[i] + values[i - 1], array[i])
    }
    
    return values.max()!
}

//O(n) but O(1) space
func optLargestSum(inArray array: [Int]) -> Int {
    guard array.count > 0 else {
        return 0
    }
    
    var newSum = array.first!
    var maxSum = array.first!
    
    for i in 1..<array.count {
        newSum = max(array[i], array[i] + newSum)
        maxSum = max(maxSum, newSum)
    }
    
    return maxSum
}

func largestSumTests() {
    let arr1 = [-2, 1, -3, 4, -1, 2, 1, -5 ,4]
    print("Should be 6: \(largestSum(inArray: arr1))")
    print("Should be 6: \(optLargestSum(inArray: arr1))")
    
    let arr2 = [1, 2, -10]
    print("Should be 3: \(largestSum(inArray: arr2))")
    print("Should be 3: \(optLargestSum(inArray: arr2))")
}




