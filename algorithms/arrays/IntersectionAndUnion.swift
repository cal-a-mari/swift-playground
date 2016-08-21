//
//  IntersectionAndUnion.swift
//  Test
//
//  Created by Mari Batilando on 8/21/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    // O(nlogn + mlogm)
    func intersection(withArray array: [Element]) -> [Element] {
        let arr1 = self.sorted { $0 < $1 } // O(nlogn)
        let arr2 = array.sorted { $0 < $1 } // O(mlogm)
        
        var i = 0
        var j = 0
        var res = [Element]()
        
        //O(m + n)
        while i < arr1.count && j < arr2.count {
            if arr1[i] == arr2[j] {
                res.append(arr1[i])
                i += 1
                j += 1
            } else if arr1[i] < arr2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        
        return res
    }
    
    // O(nlogn + mlogm)
    func union(withArray array: [Element]) -> [Element] {
        let arr1 = self.sorted { $0 < $1 }
        let arr2 = array.sorted { $0 < $1 }
        
        var i = 0
        var j = 0
        var res = [Element]()
        
        while (i < arr1.count) && (j < arr2.count) {
            if arr1[i] < arr2[j] {
                res.append(arr1[i])
                i += 1
            } else if arr1[i] > arr2[j] {
                res.append(arr2[j])
                j += 1
            } else {
                res.append(arr1[i])
                i += 1
                j += 1
            }
        }
        
        while i < arr1.count {
            res.append(arr1[i])
            i += 1
        }
        
        while j < arr2.count {
            res.append(arr2[j])
            j += 1
        }
        
        return res
    }
    
}
