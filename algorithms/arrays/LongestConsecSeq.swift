//
//  LongestConsecSeq.swift
//  Test
//
//  Created by Mari Batilando on 8/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Given an array of integers, find the length of the longest sub-sequence such that elements in the subsequence are consecutive integers, the consecutive numbers can be in any order.
 
 Input: arr[] = {1, 9, 3, 10, 4, 20, 2};
 Output: 4
 The subsequence 1, 3, 4, 2 is the longest subsequence
 of consecutive elements
 
 Input: arr[] = {36, 41, 56, 35, 44, 33, 34, 92, 43, 32, 42}
 Output: 5
 The subsequence 36, 35, 33, 34, 32 is the longest subsequence
 of consecutive elements.
 */

// O(n) runtime and space
func longestConsecutiveSequence(array: [Int]) -> Int {
    var set = Set<Int>()
    var longest = 0
    
    array.forEach { set.insert($0) }
    
    for i in 0..<array.count {
        if !set.contains(array[i] - 1) {
            var j = array[i]
            
            while set.contains(j) {
                j += 1
            }
            
            longest = max(longest, j - array[i])
        }
    }
    
    return longest
}
