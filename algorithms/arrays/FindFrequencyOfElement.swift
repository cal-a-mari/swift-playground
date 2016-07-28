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
