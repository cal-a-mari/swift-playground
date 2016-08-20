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
    
    // Remove dupes in a sorted array
    // O(n)
    func removedDuplicates() -> [Element] {
        var j = 0
        var res = self
        
        for i in 1..<res.count {
            if res[i] == res[j] {
                continue
            } else {
                j += 1
                res[j] = res[i]
            }
        }
        
        var copy = [Element]()
        
        for k in 0...j {
            copy.append(res[k])
        }
        
        return copy
    }
    
}
