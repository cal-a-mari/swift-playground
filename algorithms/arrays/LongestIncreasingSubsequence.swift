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
        return self.dynamicType.longestIncreasingSubsequence(array: self)
    }
    
    private static func longestIncreasingSubsequence(array: [Element]) -> Int {
        var lis = [Int](repeating: 1, count: array.count)
        
        for i in 1..<array.count {
            for j in 0..<i {
                if (array[j] < array[i]) && (lis[i] < lis[j] + 1) {
                    lis[i] = lis[j] + 1
                }
            }
        }
        
        var max = 0
        
        for longest in lis {
            if longest > max {
                max = longest
            }
        }
        
        return max
    }
    
}
