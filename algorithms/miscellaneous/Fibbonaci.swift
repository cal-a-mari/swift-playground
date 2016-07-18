//
//  Fibbonaci.swift
//  Test
//
//  Created by Mari Batilando on 7/17/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func recursiveFibonacci(n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return recursiveFibonacci(n: n - 1) + recursiveFibonacci(n: n - 2)
    }
}

func memoizedRecursiveFib(n: Int) -> Int {
    var lookup = [Int: Int]()
    return memoizedRecursiveFib(n: n, lookup: &lookup)
}

private func memoizedRecursiveFib(n: Int, lookup: inout [Int: Int]) -> Int {
    if let memoizedValue = lookup[n] {
        return memoizedValue
    } else if n <= 1 {
        lookup[n] = n
        return n
    } else {
        let newValue = memoizedRecursiveFib(n: n - 1, lookup: &lookup) + memoizedRecursiveFib(n: n - 2, lookup: &lookup)
        lookup[n] = newValue
        return newValue
    }
}

func tabularFib(n: Int) -> Int {
    var arr = Array(repeating: 0, count: n + 1)
    arr[0] = 0
    arr[1] = 1
    
    for i in 2..<arr.count {
        arr[i] = arr[i - 1] + arr[i - 2]
    }
    
    return arr[n]
}





