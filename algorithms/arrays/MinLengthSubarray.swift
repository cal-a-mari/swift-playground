//
//  MinLengthSubarray.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 
 Given an array of integers and a number x, find the smallest subarray with sum greater than the given value.
 
 Examples:
 arr[] = {1, 4, 45, 6, 0, 19}
 x  =  51
 Output: 3
 Minimum length subarray is {4, 45, 6}
 
 arr[] = {1, 10, 5, 2, 7}
 x  = 9
 Output: 1
 Minimum length subarray is {10}
 
 arr[] = {1, 11, 100, 1, 0, 200, 3, 2, 1, 250}
 x = 280
 Output: 4
 Minimum length subarray is {100, 1, 0, 200}
 
 */
func minLengthSubarray(greaterThanSum sum: Int, array: [Int]) -> Int? {
    var minLength = array.count
    var exists = false
    
    for i in 0..<array.count {
        var currSum = array[i]
        
        if currSum > sum {
            exists = true
            minLength = 1
            break
        }
        
        for j in i + 1..<array.count {
            currSum += array[j]
            
            if currSum > sum {
                exists = true
                minLength = min(minLength, j - i + 1)
            }
        }
    }
    
    return exists ? minLength : nil
}


// O(n)
func optMinLengthSubarray(greaterThanSum sum: Int, array: [Int]) -> Int? {
    var currSum = 0
    var minLength = array.count
    var l = 0
    var r = 0
    var exists = false
    
    while r < array.count {
        while (currSum <= sum) && (r < array.count) {
            currSum += array[r]
            r += 1
        }
        
        while (currSum > sum) && (l < array.count) {
            exists = true
            minLength = min(minLength, r - l)
            currSum -= array[l]
            l += 1
        }
    }
    
    return exists ? minLength : nil
}
