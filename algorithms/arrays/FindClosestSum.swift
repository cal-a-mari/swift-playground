//
//  FindClosestSum.swift
//  Test
//
//  Created by Mari Batilando on 7/31/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == Int {
    
    func closestPair(toSum sum: Int) -> (Int, Int) {
        let lastIndex = self.index(self.startIndex, offsetBy: self.count - 1)
        
        guard self.count > 2 else {
            return (self[self.startIndex], self[lastIndex])
        }
        
        var l = self.startIndex
        var r = lastIndex
        
        var closestPair = (self[l], self[r])
        
        while l < r {
            let currSum = self[l] + self[r]
            let oldSum = closestPair.0 + closestPair.1
            
            if currSum == sum {
                return (self[l], self[r])
            } else if abs(sum - currSum) < abs(sum - oldSum) {
                closestPair = (self[l], self[r])
            }
            
            if currSum > sum {
                r = self.index(r, offsetBy: -1)
            } else {
                l = self.index(l, offsetBy: 1)
            }
        }
        
        return closestPair
    }
    
}
