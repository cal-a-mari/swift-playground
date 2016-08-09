//
//  Knapsack.swift
//  Test
//
//  Created by Mari Batilando on 8/6/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

typealias KnapsackItem = (value: Int, weight: Int)

func knapsack(capacity: Int, weights: [KnapsackItem]) -> Int {
    return knapsack(capacity: capacity, weights: weights, n: weights.count)
}

private func knapsack(capacity: Int, weights: [KnapsackItem], n: Int) -> Int {
    if n == 0 || capacity == 0 {
        return 0
    }
    
    let item = weights[n - 1]
    
    if item.weight > capacity {
        return knapsack(capacity: capacity, weights: weights, n: n - 1)
    }
    
    return max(knapsack(capacity: capacity, weights: weights, n: n - 1),
               knapsack(capacity: capacity - item.weight, weights: weights, n: n - 1) + item.value)
}

func tabularKnapsack(capacity: Int, items: [KnapsackItem]) -> Int {
    var values = Array(repeatElement(Array(repeatElement(0, count: capacity + 1)), count: items.count + 1))
    
    for i in 1...items.count {
        for j in 1...capacity {
            let item = items[i - 1]
            
            if item.weight > j {
                values[i][j] = values[i - 1][j]
            } else {
                values[i][j] = max(values[i - 1][j],
                                   values[i - 1][j - item.weight] + item.value)
            }
        }
    }
    
    return values[items.count][capacity]
}
