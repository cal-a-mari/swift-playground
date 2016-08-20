//
//  TopKFrequentElements.swift
//  Test
//
//  Created by Mari Batilando on 8/20/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func <(lhs: CountElement, rhs: CountElement) -> Bool {
    return lhs.element < rhs.element
}

func >(lhs: CountElement, rhs: CountElement) -> Bool {
    return lhs.element > rhs.element
}

func <=(lhs: CountElement, rhs: CountElement) -> Bool {
    return lhs.element <= rhs.element
}

func >=(lhs: CountElement, rhs: CountElement) -> Bool {
    return lhs.element >= rhs.element
}

func ==(lhs: CountElement, rhs: CountElement) -> Bool {
    return lhs.element == rhs.element
}

struct CountElement: Comparable {
    let count: Int
    let element: Int
}

func topKFrequentElements(array: [Int], k: Int) -> [Int] {
    var elemToFreq = [Int: Int]()
    
    for element in array {
        let currCount = elemToFreq[element] ?? 0
        elemToFreq[element] = currCount + 1
    }
    
    var minHeap = Heap<CountElement>(ascending: true)
    
    //O(n log k)
    for (key, value) in elemToFreq {
        if minHeap.count >= k {
            let _ = minHeap.pop()
        }
        
        minHeap.push(CountElement(count: value, element: key))
    }
    
    var res = [Int]()
    
    while !minHeap.isEmpty {
        res.append((minHeap.pop()!).element)
    }
    
    return res.reversed()
}

