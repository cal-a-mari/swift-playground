//
//  BubbleSort.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    mutating func bubbleSort() {
        guard self.count > 1 else {
            return
        }
        
        var didSwap = true
        
        repeat {
            didSwap = false
            
            var ptr1 = self.startIndex
            var ptr2 = self.startIndex + 1
            
            while ptr2 < self.endIndex {
                if self[ptr1] > self[ptr2] {
                    swap(&self[ptr1], &self[ptr2])
                    didSwap = true
                }
                
                ptr1 += 1
                ptr2 += 1
            }
        } while didSwap
    }
    
}
