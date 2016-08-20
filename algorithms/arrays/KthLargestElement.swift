//
//  KthLargestElement.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    // O(n log n + k log n)
    func kthLargestElement(_ k: Int) -> Element? {
        var heap = Heap<Element>(ascending: false)
        
        // O(n log n)
        for element in self {
            heap.push(element)
        }
        
        // O(k log n)
        for _ in 0..<k - 1 {
            let _ = heap.pop()
        }
        
        return heap.pop()
    }
    
}
