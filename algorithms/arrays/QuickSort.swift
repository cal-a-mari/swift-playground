//
//  QuickSort.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    mutating func quickSorted() -> [Element] {
        var copy = self
        self.quickSortHelper(array: &copy, start: self.startIndex, end: self.endIndex - 1)
        return copy
    }
    
    private mutating func quickSortHelper(array: inout [Element], start: Index, end: Index) {
        if start < end {
            let partitionIndex = self.partition(array: &array , start: start, end: end)
            self.quickSortHelper(array: &array, start: start, end: partitionIndex - 1)
            self.quickSortHelper(array: &array, start: partitionIndex + 1, end: end)
        }
    }
    
    private mutating func partition(array: inout [Element], start: Index, end: Index) -> Index {
        let pivotIndex = (start + end) / 2
        var start = start
        var end = end
        
        while start < end {
            while array[start] <= array[pivotIndex] {
                start += 1
            }
            
            while array[end] > array[pivotIndex] {
                end -= 1
            }
            
            if start <= end {
                if start != end {
                    swap(&array[start], &array[end])
                }
                start += 1
                
                if end > 0 {
                    end -= 1
                }
            }
        }
        
        return pivotIndex
    }
    
    func lomutoQuickSorted() -> [Element] {
        var copy = self
        self.lomutoQuickSortHelper(array: &copy, low: self.startIndex, high: self.endIndex - 1)
        return copy
        
    }
    
    private func lomutoQuickSortHelper(array: inout [Element], low: Index, high: Index) {
        if low < high {
            let partitionIndex = self.lomutoPartition(array: &array, low: low, high: high)
            self.lomutoQuickSortHelper(array: &array, low: low, high: partitionIndex - 1)
            self.lomutoQuickSortHelper(array: &array, low: partitionIndex + 1, high: high)
        }
    }
    
    private func lomutoPartition(array: inout [Element], low: Index, high: Index) -> Index {
        let pivot = array[high]
        var i  = low
        
        for j in low..<high {
            if array[j] <= pivot {
                if i != j {
                    swap(&array[i], &array[j])
                }
                i += 1
            }
        }
        
        if i != high {
            swap(&array[i], &array[high])
        }
        
        return i
    }
    
    func hoareQuickSorted() -> [Element] {
        var copy = self
        self.hoareQuickSortedHelper(array: &copy, low: copy.startIndex, high: copy.endIndex - 1)
        return copy
    }
    
    private func hoareQuickSortedHelper(array: inout [Element], low: Index, high: Index) {
        if low < high {
            let partitionIndex = self.hoarePartition(array: &array, low: low, high: high)
            self.hoareQuickSortedHelper(array: &array, low: low, high: partitionIndex)
            self.hoareQuickSortedHelper(array: &array, low: partitionIndex + 1, high: high)
        }
    }
    
    private func hoarePartition(array: inout [Element], low: Index, high: Index) -> Index {
        let pivot = array[low]
        var i = low
        var j = high
        
        while true {
            while array[i] < pivot {
                i += 1
            }
            
            while array[j] > pivot {
                j -= 1
            }
            
            if i < j {
                if i != j {
                    swap(&array[i], &array[j])
                }
            } else {
                return j
            }
        }
    }
    
}








