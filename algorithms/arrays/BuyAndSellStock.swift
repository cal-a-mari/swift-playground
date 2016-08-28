//
//  BuyAndSellStock.swift
//  Test
//
//  Created by Mari Batilando on 8/28/16.
//  Copyright © 2016 Mari Batilando. All rights reserved.
//

import Foundation

/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 */
//O(n)
func buyAndSellStock(price: [Int]) -> Int {
    if price.isEmpty || price.count == 1{
        return 0
    }
    
    var minPrice = price[0]
    var maxProfit = 0
    
    for i in 1..<price.count {
        maxProfit = max(maxProfit, price[i] - minPrice)
        minPrice = min(minPrice, price[i])
    }
    
    return maxProfit
}

/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 */
func buyAndSellStock2(price: [Int]) -> Int {
    var profit = 0
    
    for i in 1..<price.count {
        let diff = price[i] - price[i - 1]
        if diff > 0 {
            profit += diff
        }
    }
    
    return profit
}













