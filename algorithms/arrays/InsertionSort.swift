//
//  InsertionSort.swift
//  Test
//
//  Created by Mari Batilando on 7/9/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    static func safeSwap(arr: inout [Element], a: Index, b: Index) {
        if a != b {
            swap(&arr[a], &arr[b])
        }
    }
    
    mutating func insertionSort() {
            guard self.count > 1 else {
            return
        }
        
        for i in 0..<self.count {
            var j = i
            while j > 0 && self[j] < self[j - 1] {
                type(of: self).safeSwap(arr: &self, a: j, b: j - 1)
                j -= 1
            }
        }
    }
    
}
