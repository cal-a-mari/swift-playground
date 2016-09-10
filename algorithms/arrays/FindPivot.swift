//
//  FindPivot.swift
//  Test
//
//  Created by Mari Batilando on 9/10/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func findPivotIndex(inArray array: [Int]) -> Int? {
    if array.isEmpty {
        return 0
    }
    
    if array.count == 1 {
        return 0
    }
    
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        if array[start] <= array[end] {
            return start
        }
        let mid = (start + end) / 2
        let next = (mid + 1) % array.count
        let prev = (mid - 1) % array.count
        
        if array[mid] <= array[next] && array[mid] <= array[prev] {
            return mid
        }
        
        if array[mid] <= array[end] {
            end = mid - 1
        } else if array[mid] >= array[start] {
            start = mid + 1
        }
    }
    
    return nil
}

func findPivotIndexTests() {
    let arr1 = [3, 4, 1, 2]
    assert(findPivotIndex(inArray: arr1)! == 2)
    
    let arr2 = [1, 2, 3, 4]
    assert(findPivotIndex(inArray: arr2) == 0)
    
    print("Done")
}
