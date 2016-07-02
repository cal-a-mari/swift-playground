//
//  MergeSort.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    func mergeSorted() -> [Element] {
        return self.mergeSortHelper(array: self)
    }
    
    private func mergeSortHelper(array: [Element]) -> [Element] {
        if array.count == 1 {
            return array
        }
        
        let leftPart = self.mergeSortHelper(array: Array(array[0..<array.middleIndex]))
        let rightPart = self.mergeSortHelper(array: Array(array[array.middleIndex..<array.endIndex]))
        return self.merge(arrayA: leftPart, arrayB: rightPart)
    }
    
    private func merge(arrayA: [Element], arrayB: [Element]) -> [Element] {
        var result = [Element]()
        var i = 0
        var j = 0
        
        while (i < arrayA.count) && (j < arrayB.count) {
            if arrayA[i] <= arrayB[i] {
                result.append(arrayA[i])
                i += 1
            } else {
                result.append(arrayB[j])
                j += 1
            }
        }
        
        while i < arrayA.count {
            result.append(arrayA[i])
            i += 1
        }
        
        while j < arrayB.count {
            result.append(arrayB[j])
            j += 1
        }
        
        return result
    }
    
}
