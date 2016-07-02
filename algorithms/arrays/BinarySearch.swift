//
//  BinarySearch.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable, Element: Equatable {
    
    var middleIndex: Index {
        return Int(floor(Double(self.count) / 2.0))
    }
    
    func recursiveBinarySearch(value: Element) -> Element? {
        return self.recursiveBinarySearchHelper(array: self, value: value)
    }
    
    private func recursiveBinarySearchHelper(array: [Element], value: Element) -> Element? {
        let middle = array.middleIndex
        
        if value == array[middle] {
            return array[middle]
        } else if value < array[middle] {
            let leftSubArray = Array(array[0..<middle])
            return self.recursiveBinarySearchHelper(array: leftSubArray, value: value)
        } else if value > array[middle] {
            let rightSubArray = Array(array[middle + 1..<array.count])
            return self.recursiveBinarySearchHelper(array: rightSubArray, value: value)
        }
        
        return nil
    }
    
    func iterativeBinarySearch(value: Element) -> Element? {
        var minPtr = self.startIndex
        var maxPtr = self.endIndex - 1
        
        while minPtr != maxPtr {
            let middleIndex = Int(Double(minPtr + maxPtr) / 2.0)
            let middleElem = self[middleIndex]
            
            if middleElem == value {
                return middleElem
            } else if middleElem < self[minPtr] {
                minPtr = middleIndex
            } else {
                maxPtr = middleIndex
            }
        }
        
        return nil
    }
    
}
