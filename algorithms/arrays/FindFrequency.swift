//
//  FindFrequency.swift
//  Test
//
//  Created by Mari Batilando on 7/10/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable, Element: Hashable {
    
    func findFrequency(element: Element) -> Int {
        var elementToFrequency = [Element: Int]()
        
        for value in self {
            if elementToFrequency[value] != nil {
                elementToFrequency[value]! += 1
            } else {
                elementToFrequency[value] = 1
            }
        }
        
        return elementToFrequency[element] ?? 0
    }
    
    static func findFrequencyOfAllElements(inSortedArray array: [Element]) -> [Element: Int] {
        var dict = [Element: Int]()
        self.findFrequency(array: array, min: array.startIndex, max: array.endIndex - 1, elementToFrequency: &dict)
        return dict
    }
    
    static func findFrequency(array: [Element], min: Index, max: Index, elementToFrequency: inout [Element: Int]) {
        if array[min] == array[max] {
            
            if elementToFrequency[array[min]] != nil {
                elementToFrequency[array[min]]! += max - min + 1
            } else {
                elementToFrequency[array[min]] = max - min + 1
            }
            
        } else {
            let mid = (min + max) / 2
            self.findFrequency(array: array, min: min, max: mid, elementToFrequency: &elementToFrequency)
            self.findFrequency(array: array, min: mid + 1, max: max, elementToFrequency: &elementToFrequency)
        }
    }
    
}







