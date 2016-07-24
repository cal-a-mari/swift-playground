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
    
    var tabularPartitionable: Bool {
        let sum = self.reduce(0) { return $0 + $1 }
        
        guard sum % 2 == 0 else {
            return false
        }
        
        let count = self.count as! Int
        var values = Array(repeatElement(Array(repeatElement(false, count: count + 1)), count: (sum / 2) + 1))
        
        for i in 0...count {
            values[0][i] = true
        }
        
        for i in 1...(sum / 2) {
            for j in 1...count {
                values[i][j] = values[i][j - 1]
                let anIndex = self.index(j as! Index, offsetBy: -1)
                
                if i >= self[anIndex] {
                    let someIndex = self.index(self.startIndex, offsetBy: (j - 1) as! IndexDistance)
                    values[i][j] = values[i][j] || values[i - self[someIndex]][j - 1]
                }
            }
        }
        
        return values[sum / 2][self.count as! Int]
    }
    
}
