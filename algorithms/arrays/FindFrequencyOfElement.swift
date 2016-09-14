//
//  FindFrequencyOfElement.swift
//  Test
//
//  Created by Mari Batilando on 7/27/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    func frequencyOfElementInSortedArray(element: Element) -> Int {
        guard let firstIndex = self.findFirstIndex(ofElement: element, start: self.startIndex, end: self.endIndex - 1),
                  lastIndex = self.findLastIndex(ofElement: element, start: firstIndex, end: self.endIndex - 1) else {
            return 0
        }
        
        return lastIndex - firstIndex + 1
    }
    
    private func findFirstIndex(ofElement element: Element, start: Index, end: Index) -> Index? {
        guard start <= end else {
            return nil
        }
        
        let midIndex = (start + end) / 2
        
        if ((midIndex == 0) || (element > self[midIndex - 1])) && (self[midIndex] == element) {
            return midIndex
        } else if element > self[midIndex] {
            return self.findFirstIndex(ofElement: element, start: midIndex + 1, end: end)
        } else {
            return self.findFirstIndex(ofElement: element, start: start, end: midIndex - 1)
        }
    }
    
    private func findLastIndex(ofElement element: Element, start: Index, end: Index) -> Index? {
        guard start <= end else {
            return nil
        }
        
        let midIndex = (start + end) / 2
        
        if (midIndex == self.endIndex - 1) || (element < self[midIndex + 1]) && self[midIndex] == element {
            return midIndex
        } else if element > self[midIndex] {
            return self.findLastIndex(ofElement: element, start: midIndex + 1, end: end)
        } else {
            return self.findLastIndex(ofElement: element, start: start, end: midIndex - 1)
        }
    }
    
}

func findFreq(array: [Int], target: Int) -> Int {
    if array.isEmpty {
        return 0
    }
    
    return findFreq(array: array, target: target, start: 0, end: array.count - 1)
}

private func findFreq(array: [Int], target: Int, start: Int, end: Int) -> Int {
    if start <= end {
        if start == end {
            if array[start] == target {
                return end - start + 1
            }
            
            return 0
        }
        
        let mid = (start + end) / 2
        
        if array[mid] <= target {
            let left = findFreq(array: array, target: target, start: start, end: mid)
            let right = findFreq(array: array, target: target, start: mid + 1, end: end)
            return left + right
        }
        
        if array[mid] > target {
            return findFreq(array: array, target: target, start: start, end: mid)
        }
        
        if array[mid] < target {
            return findFreq(array: array, target: target, start: mid + 1, end: end)
        }
    }
    
    return 0
}

func findFreqTests() {
    let arr1 = [1, 2, 2, 2, 3]
    let res1 = 3
    let actualRes1 = findFreq(array: arr1, target: 2)
    assert(res1 == actualRes1)
    
    let arr2 = [1, 2, 3]
    let res2 = 1
    let actualRes2 = findFreq(array: arr2, target: 2)
    assert(res2 == actualRes2)
    
    let arr3 = [1, 3]
    let res3 = 0
    let actualRes3 = findFreq(array: arr3, target: 2)
    assert(res3 == actualRes3)
    
    let arr4 = [Int]()
    let res4 = 0
    let actualRes4 = findFreq(array: arr4, target: 2)
    assert(res4 == actualRes4)
    
    let arr5 = [1]
    let res5 = 0
    let actualRes5 = findFreq(array: arr5, target: 2)
    assert(res5 == actualRes5)
}
