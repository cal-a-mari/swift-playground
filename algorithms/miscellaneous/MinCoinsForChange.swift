//
//  MinCoinsForChange.swift
//  Test
//
//  Created by Mari Batilando on 8/13/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

func minCoins(forValue value: Int, coins: [Int]) -> Int {
    return minCoinsHelper(value: value, coins: coins)
}

private func minCoinsHelper(value: Int, coins: [Int]) -> Int {
    if value == 0 {
        return 0
    }
    
    var res = Int.max
    
    for coin in coins {
        if coin <= value {
            let subRes = minCoins(forValue: value - coin, coins: coins)
            
            if (subRes != Int.max) && (subRes + 1 < res) {
                res = subRes + 1
            }
        }
    }
    
    return res
}

func optMinCoins(forValue value: Int, coins: [Int]) -> Int {
    // values[i] contains the minimum number of coins for value i
    var values = [Int](repeatElement(Int.max, count: value + 1))
    values[0] = 0
    
    for i in 1...value {
        for coin in coins {
            if coin <= i {
                let subRes = values[i - coin]
                if (subRes != Int.max) && (subRes + 1 < values[i]) {
                    values[i] = subRes + 1
                }
            }
        }
    }
    
    return values[value]
}
