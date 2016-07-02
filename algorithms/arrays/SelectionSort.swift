//
//  SelectionSort.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    mutating func selectionSort() {
        var minIndex = self.startIndex
        
        for i in 0..<self.count {
            minIndex = i
            
            for j in (i + 1)..<self.count {
                if self[j] < self[minIndex] {
                    minIndex = j
                }
            }
            
            if minIndex != i {
                swap(&self[minIndex], &self[i])
            }
        }
    }
    
}
