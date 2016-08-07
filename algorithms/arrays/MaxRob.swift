//
//  MaxRob.swift
//  Test
//
//  Created by Mari Batilando on 8/7/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func maxRob(array: [Int]) -> Int {
    return maxRob(array: array, n: array.count - 1)
}

private func maxRob(array: [Int], n: Int) -> Int {
    if n < 0 {
        return 0
    }
    
    return max(maxRob(array: array, n: n - 2) + array[n],
               maxRob(array: array, n: n - 1))
}

func tabularMaxRob(array: [Int]) -> Int {
    var values = [Int](repeatElement(0, count: array.count + 1))
    values[0] = 0
    values[1] = array[0]
    
    for i in 2...array.count {
        // values[i] contains the maximum you can get if you only had houses 0...i
        values[i] = max(values[i - 1],
                        values[i - 2] + array[i - 1])
    }
    
    return values[values.count - 1]
}
