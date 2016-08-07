//
//  LargestContiguousSubarray.swift
//  Test
//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an array of distinct integers, find length of the longest subarray which contains numbers that can be arranged in a continuous sequence.
 */
func longestContiguousSubarray(array: [Int]) -> Int {
    var maxLen = 1
    
    for i in 0..<array.count - 1 {
        var minVal = array[i]
        var maxVal = array[i]
        
        for j in i + 1..<array.count {
            minVal = min(minVal, array[j])
            maxVal = max(maxVal, array[j])
            
            /*
             If all elements are distinct, then a subarray has contiguous elements if and only if the difference between maximum
             and minimum elements in subarray is equal to the difference between last and first indexes of subarray
             */
            if maxVal - minVal == j - i {
                maxLen = max(maxLen, maxVal - minVal + 1)
            }
        }
    }
    
    return maxLen
}
