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
        
    static func findAllFrequenciesOfElements(array: [Element]) -> [Element: Int] {
        var frequencies = [Element: Int]()
        self.findAllFrequenciesOfElements(array: array, min: array.startIndex, max: array.endIndex - 1, frequencies: &frequencies)
        return frequencies
    }
    
    static func findAllFrequenciesOfElements(array: [Element], min: Index, max: Index, frequencies: inout [Element: Int]) {
        if array[min] == array[max] {
            let freq = frequencies[array[min]] ?? 0
            frequencies[array[min]] = freq + (max - min + 1)
        } else {
            let mid = (min + max) / 2
            self.findAllFrequenciesOfElements(array: array, min: min, max: mid, frequencies: &frequencies)
            self.findAllFrequenciesOfElements(array: array, min: mid + 1, max: max, frequencies: &frequencies)
        }
    }    
}







