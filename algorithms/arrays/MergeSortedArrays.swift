//
//  MergeSortedArrays.swift
//  Test
//
//  Created by Mari Batilando on 8/19/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation


func <(lhs: ArrayContainer, rhs: ArrayContainer) -> Bool {
    return lhs.array[lhs.index] < rhs.array[rhs.index]
}

func >(lhs: ArrayContainer, rhs: ArrayContainer) -> Bool {
    return lhs.array[lhs.index] > rhs.array[rhs.index]
}

func <=(lhs: ArrayContainer , rhs: ArrayContainer) -> Bool {
    return lhs.array[lhs.index] <= rhs.array[rhs.index]
}

func >=(lhs: ArrayContainer, rhs: ArrayContainer) -> Bool {
    return lhs.array[lhs.index] >= rhs.array[rhs.index]
}

func ==(lhs: ArrayContainer, rhs: ArrayContainer) -> Bool {
    return lhs.array[lhs.index] == rhs.array[rhs.index]
}

struct ArrayContainer: Comparable, Equatable {
    let array: [Int]
    let index: Int
}

func mergeSortedArrays(_ arrays: [[Int]]) -> [Int] {
    var heap = Heap<ArrayContainer>(ascending: true)
    
    for arr in arrays {
        heap.push(ArrayContainer(array: arr, index: 0))
    }
    
    var res = [Int]()
    
    //O(m)
    while !heap.isEmpty {
        // O(log k)
        let ac = heap.pop()!
        res.append(ac.array[ac.index])
        
        // O(log k)
        if ac.index < ac.array.count - 1 {
            heap.push(ArrayContainer(array: ac.array, index: ac.index + 1))
        }
    }
    
    return res
}
