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


//extension Array {
//    
//    static func closestPair(toSum sum: Int, inSortedArray array: [Int]) -> (Int, Int) {
//        guard array.count > 2 else {
//            return (array[array.startIndex], array[array.endIndex - 1])
//        }
//
//        var l = array.startIndex
//        var r = array.endIndex - 1
//        
//        var closestPair = (array[l], array[r])
//        
//        while l < r {
//            let currSum = array[l] + array[r]
//            let oldSum = closestPair.0 + closestPair.1
//            
//            if array[l] + array[r] == sum {
//                return (array[l], array[r])
//            } else if abs(sum - currSum) < abs(sum - oldSum) {
//                closestPair = (array[l], array[r])
//            }
//            
//            if array[l] + array[r] > sum {
//                r -= 1
//            } else {
//                l += 1
//            }
//        }
//        
//        return closestPair
//    }
//    
//}
