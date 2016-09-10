//
//  IsSubArray.swift
//  Test
//
//  Created by Mari Batilando on 9/9/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

// O(m * n)
func array(_ array: [Int], isSubarrayOfArray largerArray: [Int]) -> Bool {
    if array.isEmpty || largerArray.isEmpty {
        return false
    }
    
    if largerArray.count < array.count {
        return false
    }
    
    let limit = largerArray.count - array.count
    
    for i in 0..<limit {
        var isSubarray = true
        
        for j in 0..<array.count {
            if array[j] != largerArray[i + j] {
                isSubarray = false
                break
            }
            
        }
        
        if isSubarray {
            return true
        }
    }
    
    return false
}

func subarrayTests() {
    let arr1 = [1, 2]
    let arr2 = [1, 2, 3, 4]
    assert(array(arr1, isSubarrayOfArray: arr2))
    
    let arr3 = [5]
    assert(!array(arr3, isSubarrayOfArray: arr2))
    
    let arr4 = [3, 4, 5]
    assert(!array(arr4, isSubarrayOfArray: arr2))
    
    let arr5 = [1, 2]
    assert(!array(arr2, isSubarrayOfArray: arr5))
    
    print("done")
}
