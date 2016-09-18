//
//  LongestIncreasingSubsequence.swift
//  Test
//
//  Created by Mari Batilando on 7/17/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    var longestIncreasingSubsequence: Int {
        return type(of: self).longestIncreasingSubsequence(array: self)
    }
    
    private static func longestIncreasingSubsequence(array: [Element]) -> Int {
        var values = [Int](repeatElement(1, count: array.count))
        
        for i in 0..<values.count {
            for j in 0..<i {
                if (array[j] < array[i]) && (values[i] < values[j] + 1) {
                    values[i] = values[j] + 1
                }
            }
        }
        
        return values.max()!
    }
    
}
