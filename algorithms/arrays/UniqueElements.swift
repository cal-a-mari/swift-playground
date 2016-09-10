//
//  UniqueElements.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    //O(n)
    var numberOfUniqueElements: Int {
        var dupeCount = 0
        
        for i in 0..<self.count - 1 {
            if self[i] == self[i + 1] {
                dupeCount += 1
            }
        }
        
        return self.count - dupeCount
    }
    
}

// O(n) runtime and space
func removedDuplicates(fromSortedArray array: [Int]) -> [Int] {
    if array.isEmpty {
        return []
    }
    
    if array.count == 1 {
        return array
    }
    
    var res = [Int]()
    res.append(array[0])
    
    for i in 1..<array.count {
        if array[i - 1] != array[i] {
            res.append(array[i])
        }
    }
    
    return res
}

func testRemovedDupes() {
    let arr1 = [1, 2, 3]
    assert(arr1 == removedDuplicates(fromSortedArray: arr1))
    
    let arr2 = [1, 1, 2, 2, 3]
    let res2 = [1, 2, 3]
    assert(res2 == removedDuplicates(fromSortedArray: arr2))
    
    let arr3 = [1]
    assert(arr3 == removedDuplicates(fromSortedArray: arr3))
    
    print("Tests done")
}
