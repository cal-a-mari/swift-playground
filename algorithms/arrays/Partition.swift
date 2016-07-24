//
//  Partition.swift
//  Test
//
//  Created by Mari Batilando on 7/24/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == Int {
    
    /// Returns true if the array can be divided into 2 arrays with equal sum
    var partitionable: Bool {
        let sum = self.reduce(0) { return $0 + $1 }
        
        guard sum % 2 == 0 else {
            return false
        }
        
        let lastIndex = self.index(self.endIndex, offsetBy: -1)
        
        return self.partition(sum: sum / 2, index: lastIndex)
    }
    
    private func partition(sum: Int, index: Index) -> Bool {
        if index == self.startIndex {
            return sum == 0
        }
        
        let nextIndex = self.index(index, offsetBy: -1)
        let included = self.partition(sum: sum - self[index], index: nextIndex)
        let excluded = self.partition(sum: sum, index: nextIndex)

        return included || excluded
    }
    
}
