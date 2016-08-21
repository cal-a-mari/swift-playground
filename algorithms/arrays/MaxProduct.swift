//
//  MaxProduct.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Find the contiguous subarray within an array (containing at least one number) which has the largest product.
 
 For example, given the array [2,3,-2,4], the contiguous subarray [2,3] has the largest product = 6.
 */
//O(n)
func maxProduct(inArray array: [Int]) -> Int {
    guard array.count > 0 else {
        return 0
    }
    
    var maxArr = Array(repeatElement(0, count: array.count))
    var minArr = Array(repeatElement(0, count: array.count))
    
    maxArr[0] = array[0]
    minArr[0] = array[0]
    
    var result = array.first!
    
    for i in 1..<array.count {
        if array[i] > 0 {
            maxArr[i] = max(maxArr[i - 1] * array[i], array[i])
            minArr[i] = min(minArr[i - 1] * array[i], array[i])
        } else {
            maxArr[i] = max(minArr[i - 1] * array[i], array[i])
            minArr[i] = min(maxArr[i - 1] * array[i], array[i])
        }
        
        result = max(maxArr[i], result)
    }
    
    return result
}
