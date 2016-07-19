//
//  BubbleSort.swift
//  Test
//
//  Created by Mari Batilando on 7/2/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    static func bubbleSort(array: inout [Element]) {
        var didSwap = false
        
        repeat {
            didSwap = false
            
            for i in 1..<array.count {
                let j = i - 1
                if array[j] > array[i] {
                    swap(&array[j], &array[i])
                    didSwap = true
                }
            }
        } while didSwap
    }
    
}
