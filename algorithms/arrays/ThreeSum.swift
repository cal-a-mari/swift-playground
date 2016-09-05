//
//  ThreeSum.swift
//  Test
//
//  Created by Mari Batilando on 9/5/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Find a triplet that sum to a given value
 Given an array and a value, find if there is a triplet in array whose sum is equal to the given value. 
 If there is such a triplet present in array, then print the triplet and return true. 
 Else return false. For example, if the given array is {12, 3, 4, 1, 6, 9} and given sum is 24, 
 then there is a triplet (12, 3 and 9) present in array whose sum is 24
 */
// O(n^3)
func threeSumExists(target: Int, array: [Int]) -> Bool {
    for i in 0..<array.count - 2 {
        for j in i..<array.count - 1 {
            for k in j..<array.count {
                if array[i] + array[j] + array[k] == target {
                    return true
                }
            }
        }
    }
    
    return false
}

// O(n^2)
func threeSumExistsOpt(target: Int, array: [Int]) -> Bool {
    if array.count < 3 {
        return false
    }
    
    let sorted = array.sorted { $0 < $1 }
    
    // Fix the first element
    for i in 0..<sorted.count - 2 {
        var l = i + 1
        var r = sorted.count - 1
        
        // Find the 2nd and 3rd element
        while l < r {
            let sum = sorted[i] + sorted[l] + sorted[r]
            if sum == target {
                return true
            } else if sum < target {
                l += 1
            } else {
                r -= 1
            }
        }
    }
    
    return false
}

func threeSumExistsTests() {
    let arr1 = [12, 3, 4, 1, 6, 9]
    print("Should be true: \(threeSumExistsOpt(target: 24, array: arr1))")
    print("Should be false: \(threeSumExistsOpt(target: 100, array: arr1))")
    print("Should be false: \(threeSumExistsOpt(target: 1, array: arr1))")
    
    let arr2 = [Int]()
    print("Should be false: \(threeSumExistsOpt(target: 1, array: arr2))")
    
    let arr3 = [1, 2]
    print("Should be false: \(threeSumExistsOpt(target: 1, array: arr3))")
    
    let arr4 = [1, 2, 3]
    print("Should be true: \(threeSumExistsOpt(target: 6, array: arr4))")
}
